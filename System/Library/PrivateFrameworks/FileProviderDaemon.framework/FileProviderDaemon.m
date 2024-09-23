void sub_1CF561678(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56175C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF561A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF561E4C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF562B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_sync_exit(obj);
  __fp_leave_section_Notice();
  _Unwind_Resume(a1);
}

void sub_1CF56319C(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF563218(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF563338(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id indexingScheduler()
{
  if (indexingScheduler_onceToken != -1)
    dispatch_once(&indexingScheduler_onceToken, &__block_literal_global_263);
  return (id)indexingScheduler_scheduler;
}

void sub_1CF5635A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF56382C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF563B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF564028(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF564390(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF564670(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5647C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF564898(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF564AA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5655E0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5656E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t FPGetRelation(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
  {
    objc_msgSend(v3, "bundleVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleVersion");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6)
    {
      if (!v7)
      {
        fp_current_or_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] Application version for running provider not found.", (uint8_t *)&v17, 2u);
        }

        FPLogApplicationVersions(v3, v4);
        goto LABEL_19;
      }
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        fp_current_or_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          FPGetRelation_cold_1();

        v5 = 0;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isVersion:greaterThanOrEqualToVersion:", v6, v8);

      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          v17 = 138412546;
          v18 = v6;
          v19 = 2112;
          v20 = v8;
          _os_log_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] callerVersion > runningVersion, returning FPVersionRelationCallerNewer. %@ > %@", (uint8_t *)&v17, 0x16u);
        }

LABEL_19:
        v5 = 1;
LABEL_24:

        goto LABEL_25;
      }
      if (v15)
      {
        v17 = 138412546;
        v18 = v6;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] callerVersion < runningVersion, returning FPVersionRelationCallerOlder. %@ < %@", (uint8_t *)&v17, 0x16u);
      }

    }
    else
    {
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEFAULT, "[NOTICE] Application version for calling provider not found.", (uint8_t *)&v17, 2u);
      }

      FPLogApplicationVersions(v3, v4);
    }
    v5 = 2;
    goto LABEL_24;
  }
  v5 = 0;
LABEL_25:

  return v5;
}

void sub_1CF565D44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF566158(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5661B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF566310(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5663EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5667C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF566D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF568160(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void addRootPathKeys(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "rootURLs", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "fp_realpathURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

void removeRootPathKeys(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3 && a2)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(a2, "rootURLs", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "fp_realpathURL");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "path");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "removeObjectForKey:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

void sub_1CF568C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF5692B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  id *v23;
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_1CF5698B8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF569B98(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF569DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF56A588(_Unwind_Exception *a1)
{
  __fp_pop_log();
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

void sub_1CF56AC68(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56AFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,id location)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56B0DC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56B338(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;
  uint64_t v3;

  objc_sync_exit(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56B610(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56B900(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56BAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56C558(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56D208(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56D8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF56DB1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF56E034(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF56E2E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF56E964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF56EAF0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF56EC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1CF56EEB0(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF56F53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14)
{
  uint64_t v14;

  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v14 - 120));
  _Unwind_Resume(a1);
}

void sub_1CF56F6C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t errorInjectionPointEnabled(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  NSObject *v11;

  result = os_variant_has_internal_content();
  if ((_DWORD)result)
  {
    if (a1 < 0)
      errorInjectionPointEnabled_cold_1();
    if (a1)
      errorInjectionPointEnabled_cold_4();
    if (a2 < 0)
      errorInjectionPointEnabled_cold_2();
    v5 = atomic_load(&errorInjectionPoints);
    if ((v5 & 0x8000000000000000) == 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error-injection.%@"), CFSTR("base"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "integerForKey:", v7);

      while (1)
      {
        v9 = __ldaxr(&errorInjectionPoints);
        if (v9 != v5)
          break;
        if (!__stlxr(v8 | 0x8000000000000000, &errorInjectionPoints))
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v10 = 0;
      __clrex();
LABEL_11:
      if (v10)
        v5 = v8 | 0x8000000000000000;
      else
        v5 = v9;
    }
    if ((a2 & ~v5) != 0)
    {
      return 0;
    }
    else
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        errorInjectionPointEnabled_cold_3(a2, v11);

      return 1;
    }
  }
  return result;
}

const __CFString *defaultsKeyForErrorInjectionCategory(uint64_t a1)
{
  if (a1)
    return 0;
  else
    return CFSTR("base");
}

uint64_t errorInjectionCategoryByName(const char *a1)
{
  if (!strcmp(a1, (const char *)objc_msgSend(CFSTR("base"), "UTF8String")))
    return 0;
  else
    return -1;
}

uint64_t errorInjectionUnknownDBVersionEnabled()
{
  return errorInjectionPointEnabled(0, 8);
}

uint64_t errorInjectionThrowOnDBQueryEnabled()
{
  return errorInjectionPointEnabled(0, 16);
}

id FPDAppStoreServiceXPCInterface()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFBBB3A0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFBA5E70);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FPSetOperationClientOnXPCInterface();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_startOperation_toFetchAppStoreIconsForAppBundleIDs_desiredSizeToScale_completionHandler_, 0, 0);

  return v0;
}

void sub_1CF56FFA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_1CF570224(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5705C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1CF570F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF571098(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1CF5711D0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CF57171C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x34u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1CF5728F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t fp_configuration_store_int_check(void *a1, void *a2, uint64_t a3, unsigned int a4, int a5)
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a2;
  objc_msgSend(a1, "levelForFactor:withNamespaceName:", v9, CFSTR("COREOS_FPFS_CONFIG"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "levelOneOfCase") == 13)
  {
    v12 = objc_msgSend(v11, "longValue");
    if (v12 >= a5)
      v13 = a5;
    else
      v13 = v12;
    if (v12 <= (int)a4)
      a3 = a4;
    else
      a3 = v13;
  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      fp_configuration_store_int_check_cold_1((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);

  }
  return a3;
}

uint64_t fp_configuration_store_BOOL_check(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "levelForFactor:withNamespaceName:", a2, CFSTR("COREOS_FPFS_CONFIG"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "levelOneOfCase") == 10)
    a3 = objc_msgSend(v5, "BOOLeanValue");

  return a3;
}

double fp_configuration_store_double_check(void *a1, uint64_t a2, double a3, double a4, double a5)
{
  void *v8;
  void *v9;
  double v10;
  double v11;

  objc_msgSend(a1, "levelForFactor:withNamespaceName:", a2, CFSTR("COREOS_FPFS_CONFIG"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "levelOneOfCase") == 15)
  {
    objc_msgSend(v9, "doubleValue");
    if (v10 >= (double)(uint64_t)a5)
      v11 = a5;
    else
      v11 = v10;
    if (v10 <= (double)(uint64_t)a4)
      a3 = a4;
    else
      a3 = v11;
  }

  return a3;
}

uint64_t fp_configuration_store_int64_check(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a2;
  objc_msgSend(a1, "levelForFactor:withNamespaceName:", v9, CFSTR("COREOS_FPFS_CONFIG"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "levelOneOfCase") == 13)
  {
    v12 = objc_msgSend(v11, "longValue");
    if (v12 >= a5)
      v13 = a5;
    else
      v13 = v12;
    if (v12 <= a4)
      a3 = a4;
    else
      a3 = v13;
  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      fp_configuration_store_int_check_cold_1((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);

  }
  return a3;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1CF574468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1CF5749E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CF574BE0(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void activityDone(_xpc_activity_s *a1)
{
  NSObject *v1;
  uint8_t v2[16];

  if (!xpc_activity_set_state(a1, 5))
  {
    fp_current_or_default_log();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1CF55F000, v1, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done", v2, 2u);
    }

  }
}

void sub_1CF574FA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF575074(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF57547C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5757C4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF575910(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF575C84(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF575E3C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57615C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5762C0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5766A8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5767F4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF576940(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF576CA4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF576DF0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF577190(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5772DC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5776B8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF577804(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF577950(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF577CDC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF577EBC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57815C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5782A8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF578650(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF578864(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF578B0C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF578C88(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF579018(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF579164(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5792B0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5795D0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57971C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF579A58(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF579C68(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF579DB4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57A168(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57A2D8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57A68C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57A7FC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57ADD0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57AF58(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57B0C0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57B6CC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57B854(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57B9BC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57BCF8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57BF20(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57C080(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57C3BC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57C5E4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57C744(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57CB08(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57D048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57D5A4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57D714(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57D87C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(float *)a3 = a1;
  *(_QWORD *)(a3 + 4) = a4;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = v4;
  *(_WORD *)(a3 + 22) = 2080;
}

#error "1CF57E4A4: call analysis failed (funcsize=34)"

#error "1CF57E710: call analysis failed (funcsize=53)"

void sub_1CF57F050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
}

void sub_1CF57F1D4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF57F5D0(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  __fp_pop_log();
  _Unwind_Resume(a1);
}

#error "1CF5805B0: call analysis failed (funcsize=55)"

#error "1CF580AE8: call analysis failed (funcsize=40)"

void OUTLINED_FUNCTION_7_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id OUTLINED_FUNCTION_9_0@<X0>(uint64_t a1@<X8>)
{
  return objc_loadWeakRetained((id *)(a1 + 8));
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void OUTLINED_FUNCTION_19(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_23(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1CF582724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11)
{
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v17 - 128));
  objc_destroyWeak((id *)(v17 - 120));
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5829CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5837FC(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF584890(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_1CF586D80(_Unwind_Exception *a1)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
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

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_8_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_9_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void sub_1CF5880A8(_Unwind_Exception *a1)
{
  __fp_leave_section_Notice();
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void sub_1CF5897FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF589DC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int *OUTLINED_FUNCTION_3_3()
{
  return __error();
}

char *OUTLINED_FUNCTION_4_0(int *a1)
{
  return strerror(*a1);
}

void sub_1CF58B218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1CF58BDD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF58C1DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF58CCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1CF58D120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1CF58E194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF58E9B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF58EF64(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void firstUnlockNotificationCallback(uint64_t a1, void *a2)
{
  _QWORD *v2;
  NSObject *v3;
  _QWORD *v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  v3 = v2[6];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __firstUnlockNotificationCallback_block_invoke;
  block[3] = &unk_1E8C75E48;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

void pastBuddyNotificationCallback(uint64_t a1, void *a2)
{
  _QWORD *v2;
  NSObject *v3;
  _QWORD *v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  v3 = v2[6];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __pastBuddyNotificationCallback_block_invoke;
  block[3] = &unk_1E8C75E48;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

void sub_1CF58F380(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF58FFD8(_Unwind_Exception *a1)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
}

uint64_t __firstUnlockNotificationCallback_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] Device was first unlocked", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_computeUnlockedStatusAndSetup");
}

uint64_t __pastBuddyNotificationCallback_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] Device setup has been run", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_computeUnlockedStatusAndSetup");
}

void sub_1CF591600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CF592E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_7_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

void OUTLINED_FUNCTION_15_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1CF593FA8(_Unwind_Exception *a1)
{
  __fp_leave_section_Error();
  _Unwind_Resume(a1);
}

void sub_1CF594334(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF594744(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5948A8(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF594954(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF594AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF595038(_Unwind_Exception *a1)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
}

void sub_1CF5951C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF595300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF59554C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF595700(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF59589C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF595AB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_7_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

id schedulers()
{
  if (schedulers_onceToken != -1)
    dispatch_once(&schedulers_onceToken, &__block_literal_global_176);
  return (id)schedulers_allSchedulers;
}

void sub_1CF596088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF5965DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF596E50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF597070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF5972DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF597A60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5981F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1D17D1C84](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void sub_1CF59888C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF5989FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF598DB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __schedulers_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)schedulers_allSchedulers;
  schedulers_allSchedulers = v0;

}

void sub_1CF5998BC(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF59A220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_1CF59B4DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF59B608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF59C61C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF59C6A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF59C720(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF59C84C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void registerClaim(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v5 = a1;
  v3 = a2;
  if (initRequestDictionary_onceToken != -1)
    dispatch_once(&initRequestDictionary_onceToken, &__block_literal_global_65);
  v4 = (id)requestPerClaimID;
  objc_sync_enter(v4);
  objc_msgSend((id)requestPerClaimID, "setObject:forKeyedSubscript:", v3, v5);
  objc_sync_exit(v4);

}

void sub_1CF59D13C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void unregisterClaim(void *a1)
{
  id v1;
  id v2;

  v2 = a1;
  if (initRequestDictionary_onceToken != -1)
    dispatch_once(&initRequestDictionary_onceToken, &__block_literal_global_65);
  v1 = (id)requestPerClaimID;
  objc_sync_enter(v1);
  objc_msgSend((id)requestPerClaimID, "setObject:forKeyedSubscript:", 0, v2);
  objc_sync_exit(v1);

}

void sub_1CF59D31C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF59DE60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __initRequestDictionary_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)requestPerClaimID;
  requestPerClaimID = v0;

}

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_1CF59E17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF59E5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF59E840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF59EF10(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF59F724(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF59F7A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF59FB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_3_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_4_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_5_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void firstUnlockNotificationCallback_0()
{
  id v0;

  +[FPDAccessControlStore sharedStore](FPDAccessControlStore, "sharedStore");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reopenDatabaseAfterUnlock");

}

void sub_1CF5A11DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF5A1490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t checkBundleRecord(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v3;
      v15 = 2112;
      v16 = v4;
      v8 = "[WARNING] containing bundle %@ for consumer %@ has no bundle identifier";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 22;
LABEL_8:
      _os_log_impl(&dword_1CF55F000, v9, v10, v8, (uint8_t *)&v13, v11);
    }
LABEL_9:

    v6 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "hasPrefix:", v5) & 1) == 0)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v13 = 138412802;
      v14 = v3;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v5;
      v8 = "[INFO] containing bundle %@ for consumer %@ has surprising bundle identifier %@";
      v9 = v7;
      v10 = OS_LOG_TYPE_INFO;
      v11 = 32;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v6 = 1;
LABEL_10:

  return v6;
}

void sub_1CF5A1B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __accessControlBaseURL_block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E98];
  if (accessControlDirectory_onceToken != -1)
    dispatch_once(&accessControlDirectory_onceToken, &__block_literal_global_77);
  v1 = (id)accessControlDirectory_dir;
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("AccessControl"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:isDirectory:", v4, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)accessControlBaseURL_url;
  accessControlBaseURL_url = v2;

}

void __accessControlDirectory_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_supportDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "path");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accessControlDirectory_dir;
  accessControlDirectory_dir = v1;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "fileExistsAtPath:isDirectory:", accessControlDirectory_dir, 0) & 1) == 0)
  {
    v8 = 0;
    v4 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", accessControlDirectory_dir, 1, 0, &v8);
    v5 = v8;
    if ((v4 & 1) == 0)
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __accessControlDirectory_block_invoke_cold_2(v5);

      fp_simulate_crash();
      fp_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __accessControlDirectory_block_invoke_cold_1();

    }
  }

}

id containingApplicationRecord(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "containingBundleRecord");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_7;

    }
    v2 = 0;
    goto LABEL_7;
  }
  v2 = v1;
LABEL_7:

  return v2;
}

void OUTLINED_FUNCTION_2_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1CF5A2358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF5A271C(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A28B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A2D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  void *v18;

  objc_sync_exit(v18);
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A2E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  objc_sync_exit(v10);
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A308C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A3444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  objc_sync_exit(obj);
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A3700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  void *v20;

  objc_sync_exit(v20);
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A40E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF5A42D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5A435C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5A53EC(_Unwind_Exception *a1)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
}

void sub_1CF5A5900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF5A5E38(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A63DC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A65F0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A672C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A6DD8(_Unwind_Exception *a1)
{
  __fp_leave_section_Notice();
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A71B0(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A7434(_Unwind_Exception *a1)
{
  __fp_leave_section_Notice();
  _Unwind_Resume(a1);
}

void sub_1CF5A74F0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A78A4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A7AF8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A7DC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5A7EB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5A7F54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5A8778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A8A2C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A8FC0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A92F4(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A96DC(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5A9984(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A9D0C(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5A9FDC(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5AA54C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5AA9AC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5AB014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void __providedItemsOperationQueue_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)providedItemsOperationQueue_operationQueue;
  providedItemsOperationQueue_operationQueue = (uint64_t)v0;

  objc_msgSend((id)providedItemsOperationQueue_operationQueue, "setMaxConcurrentOperationCount:", 1);
  v2 = objc_opt_new();
  v3 = (void *)fileCoordinationProviderByURL;
  fileCoordinationProviderByURL = v2;

}

void ___executableNameIsBlockedForMaterialization_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addSuiteNamed:", CFSTR("com.apple.fileproviderd"));
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", &unk_1E8C95D90);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_executableNameIsBlockedForMaterialization_blockedProcesses;
  _executableNameIsBlockedForMaterialization_blockedProcesses = v1;

  objc_msgSend(v0, "arrayForKey:", CFSTR("vfs-materialization.exclude.processes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend((id)_executableNameIsBlockedForMaterialization_blockedProcesses, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }
  objc_msgSend(v0, "arrayForKey:", CFSTR("vfs-materialization.include.processes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend((id)_executableNameIsBlockedForMaterialization_blockedProcesses, "removeObject:", v14);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

}

uint64_t OUTLINED_FUNCTION_10_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_22(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x2Au);
}

void sub_1CF5AE848(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5B1894(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5B1C14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B1C7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B1D2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B1E9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B2C10(_Unwind_Exception *a1)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
}

void sub_1CF5B2F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  void *v14;

  objc_sync_exit(v14);
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5B30A0(_Unwind_Exception *a1)
{
  __fp_leave_section_Notice();
  _Unwind_Resume(a1);
}

void sub_1CF5B3254(_Unwind_Exception *a1)
{
  __fp_leave_section_Notice();
  _Unwind_Resume(a1);
}

void sub_1CF5B331C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF5B35B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  __fp_leave_section_Notice();
  _Unwind_Resume(a1);
}

void sub_1CF5B389C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B3EA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  __fp_leave_section_Notice();
  _Unwind_Resume(a1);
}

void sub_1CF5B3FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF5B45DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B4ED0(_Unwind_Exception *a1)
{
  __fp_leave_section_Notice();
  _Unwind_Resume(a1);
}

void sub_1CF5B51FC(_Unwind_Exception *a1)
{
  __fp_leave_section_Notice();
  _Unwind_Resume(a1);
}

void sub_1CF5B557C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B6538(_Unwind_Exception *a1)
{
  void *v1;

  __fp_leave_section_Debug();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B6CE0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5B7C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  void *v50;
  uint64_t v51;

  objc_sync_exit(v50);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose((const void *)(v51 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1CF5B8418(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B8578(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5B8AB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B8E20(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5B9304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  void *v17;

  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_1CF5B95D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B97EC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5B9950(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B9AA8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5B9C10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5B9D4C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5B9EF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5BB464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_9_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_10_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t OUTLINED_FUNCTION_20_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void sub_1CF5BC060(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void FPLogApplicationVersions(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fp_shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fp_shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] applicationForCaller=%{public}@, applicationForRunningProvider=%{public}@", (uint8_t *)&v10, 0x16u);

  }
}

void sub_1CF5BC364(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5BCC0C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BD064(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BD1FC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BD764(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BDA38(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BDF94(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BE2D4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BE9C4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BEB28(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BEE48(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BF264(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BF3B0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BF7E4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BFCF4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5BFE58(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C0098(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C04FC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C0648(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C0794(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C0CE4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C0E54(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C0FBC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C150C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C167C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C17E4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C1A64(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C1BB0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C1E30(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C1F7C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C22F8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C24C8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C2620(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C2778(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C2B70(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C2CE0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C3514(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C37AC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C39B0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C3C18(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C404C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C44C4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C4554(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5C4A04(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C4B74(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C4CF8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C50C4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C521C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C54AC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C5B6C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C5F30(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C6140(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C6400(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C6558(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C66B0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C6818(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C6CF4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C6E64(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C6FCC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C7378(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C74D0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C7638(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C7A38(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C7B90(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C7CF8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C8128(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C82A8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C8410(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C87F8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C8944(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C8A90(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C8DDC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C94D0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C98DC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C9A50(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C9C48(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C9DA4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5C9F24(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CA08C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CA1E4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CA668(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CA7D8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CAB80(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CAF30(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CB1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF5CC880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  __fp_pop_log();
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_1CF5CCB58(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CD324(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CD4A0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CD70C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CD970(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CDC8C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CDDE8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CE218(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CE37C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CE658(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CED08(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CEE54(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CEFA0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CF370(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CF4D4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CF660(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CF7B8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CF910(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CFA88(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5CFC2C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D008C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D027C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D051C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D0720(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D0B4C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D0D3C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D0FDC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D11DC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D1590(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D176C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D1AF4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D1C58(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D2034(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D219C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D2578(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D26E0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D2B30(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D2C94(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D2DE0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D31F4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D3340(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D348C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D37BC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D3908(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D3A54(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D3EB4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D4024(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D418C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D4530(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D468C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D47EC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D4DEC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D4F5C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D5364(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D5574(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D58C4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D5A10(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D5E34(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D5FA4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D6394(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D6508(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D69DC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D6B64(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D70E0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D736C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D7774(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D7A10(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D7E9C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D8030(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D82D4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D8460(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void hasNonUploadedFiles(void *a1, void *a2)
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
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeLastObject");
    objc_msgSend(v5, "defaultBackend");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __hasNonUploadedFiles_block_invoke;
    v7[3] = &unk_1E8C78298;
    v9 = v4;
    v8 = v3;
    objc_msgSend(v6, "hasNonUploadedFilesWithCompletionHandler:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void sub_1CF5D86B0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D8FA4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D90F0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D9328(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D9670(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5D9F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

void sub_1CF5DA114(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DA230(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5DA334(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5DA6DC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DABE8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DAD4C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DAE98(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DB21C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DB368(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DB4B4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DB7F8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DBB60(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DBF20(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DC088(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DC1E0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DC5D0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DC734(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DCBFC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DCEDC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DD180(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DD8C0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DDA54(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DDC04(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DDFE0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DE3AC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DE510(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DE7A4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DE8F0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DED74(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DEEC0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DF158(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DF2A4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DF6E8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DF8A4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DFDC4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5DFF4C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E0234(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E0380(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E066C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E07B8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E08AC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E0B9C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E0CE8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E0F48(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E1094(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E14D8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E15F0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E17D8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E1A10(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E1C0C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E1D58(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E1F40(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E20A8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E2508(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E2678(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E27E0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E2C40(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E2DB0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E2F18(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E3378(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E34E8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E3650(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E39B0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E3AFC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E3C48(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E3FA8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E40F4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E4240(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E45C0(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E4718(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E4950(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E50D8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E523C(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E5544(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E5BCC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E5D30(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E6038(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E66F8(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E6874(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E6A00(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E70B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  __fp_pop_log();
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

void sub_1CF5E7264(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

uint64_t __hasNonUploadedFiles_block_invoke(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return hasNonUploadedFiles(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t OUTLINED_FUNCTION_0_6(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 2080;
  return result;
}

void OUTLINED_FUNCTION_3_6(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_8_4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_9_4(uint64_t a1, uint64_t a2)
{
  __int16 v2;
  __int16 v3;
  uint64_t v4;

  *(_WORD *)(a2 + 22) = v3;
  *(_QWORD *)(a2 + 24) = v4;
  *(_WORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 34) = 0;
  *(_WORD *)(a2 + 42) = v2;
  *(_QWORD *)(a2 + 44) = 0;
}

void OUTLINED_FUNCTION_11_2(uint64_t a1, uint64_t a2)
{
  __int16 v2;
  uint64_t v3;

  *(_QWORD *)(a2 + 24) = v3;
  *(_WORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 34) = 0;
}

void OUTLINED_FUNCTION_12(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x34u);
}

void OUTLINED_FUNCTION_22_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int16 v3;

  *(_QWORD *)(a2 + 24) = v2;
  *(_WORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 34) = 0;
}

void OUTLINED_FUNCTION_27(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_1CF5E80D8(_Unwind_Exception *a1)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
}

void sub_1CF5E8390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E85E4(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E8858(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF5E8C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF5E9770(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5E99F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v15 - 56));
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void __appStoreServiceConnection_block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __appStoreServiceConnection_block_invoke_cold_1(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __appStoreServiceConnection_block_invoke_109()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  fp_current_or_default_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __appStoreServiceConnection_block_invoke_109_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void sub_1CF5E9F70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5EA06C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5EA54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1CF5EA61C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5EAD80(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CF5EBFA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void __hardcodedUUIDs_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("/System/Library/PrivateFrameworks/DocumentManagerUICore.framework");
  objc_msgSend(MEMORY[0x1E0CAAD30], "_dmIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("/System/Library/PrivateFrameworks/DesktopServicesPriv.framework");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0CAAD30], "_dsIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hardcodedUUIDs_ret;
  hardcodedUUIDs_ret = v2;

}

void sub_1CF5ED638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF5EE370(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5EE5A8(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5EEC34(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF5EF2D0(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1CF5F1DD0(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

id fileProviderDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_supportDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v1, 0) & 1) == 0)
  {
    v7 = 0;
    v3 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v7);
    v4 = v7;
    if ((v3 & 1) == 0)
    {
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        fileProviderDirectory_cold_1(v4);

    }
  }

  return v1;
}

void sub_1CF5F2CD4(_Unwind_Exception *a1)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
}

void sub_1CF5F31E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F3308(_Unwind_Exception *a1)
{
  void *v1;

  __fp_leave_section_Debug();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F3C24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F3E70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F4028(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F5858(_Unwind_Exception *a1)
{
  __fp_leave_section_Notice();
  _Unwind_Resume(a1);
}

void sub_1CF5F5B74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F5F30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F6158(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F6278(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F636C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id alternateContentsPlistURL()
{
  if (alternateContentsPlistURL_onceToken != -1)
    dispatch_once(&alternateContentsPlistURL_onceToken, &__block_literal_global_226);
  return (id)alternateContentsPlistURL_url;
}

void sub_1CF5F6EEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F6FE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F713C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id pausedSyncItemslistURL()
{
  if (pausedSyncItemslistURL_onceToken != -1)
    dispatch_once(&pausedSyncItemslistURL_onceToken, &__block_literal_global_231);
  return (id)pausedSyncItemslistURL_url;
}

void sub_1CF5F7D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF5F7FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF5F8104(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5F830C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void __alternateContentsPlistURL_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E98];
  fileProviderDirectory();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("AlternateContents.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:isDirectory:", v1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)alternateContentsPlistURL_url;
  alternateContentsPlistURL_url = v2;

}

void __pausedSyncItemslistURL_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E98];
  fileProviderDirectory();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("pausedSyncItems.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:isDirectory:", v1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)pausedSyncItemslistURL_url;
  pausedSyncItemslistURL_url = v2;

}

void sub_1CF5F91BC(_Unwind_Exception *a1)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  uint64_t v0;

  return v0;
}

void sub_1CF5FB9D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5FBAD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF5FDB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF5FE0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF5FF9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF6029E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_1CF603BD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1CF603C8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF603D38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF60412C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF6081CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF608808(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF6091C8(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF60944C(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF6096D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF6099B8(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_1CF609AEC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF609C04(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60A498(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60A5DC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60A700(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60A9B8(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60AC80(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug();
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void __indexingScheduler_block_invoke()
{
  FPDSharedScheduler *v0;
  void *v1;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80760], 0);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C8]);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808A8], 1);
  v0 = -[FPDSharedScheduler initWithLabel:criteria:]([FPDSharedScheduler alloc], "initWithLabel:criteria:", CFSTR("com.apple.fileprovider.indexing"), xdict);
  v1 = (void *)indexingScheduler_scheduler;
  indexingScheduler_scheduler = (uint64_t)v0;

}

void OUTLINED_FUNCTION_9_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_1CF60BD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CF60BE30(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60D1AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1CF60D404(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60D5EC(_Unwind_Exception *a1)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
}

void sub_1CF60DAFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF60DE20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  void *v12;

  objc_sync_exit(v12);
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60E034(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60E208(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60E364(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60E4FC(_Unwind_Exception *a1)
{
  __fp_pop_log();
  _Unwind_Resume(a1);
}

void sub_1CF60E670(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
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
    v2 = xmmword_1E8C794A0;
    v3 = 0;
    CloudDocsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudDocsLibraryCore_frameworkLibrary)
    CloudDocsLibrary_cold_1(&v1);
  return CloudDocsLibraryCore_frameworkLibrary;
}

void errorInjectionPointEnabled_cold_1()
{
  __assert_rtn("errorInjectionPointEnabled", "FPErrorInjection.m", 48, "category >= 0");
}

void errorInjectionPointEnabled_cold_2()
{
  __assert_rtn("errorInjectionPointEnabled", "FPErrorInjection.m", 50, "code < FP_ERROR_INJECTION_CATEGORY_LOADED_BIT");
}

void errorInjectionPointEnabled_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = 0;
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] FPErrInjection hit cat:%ld code:%llu", (uint8_t *)&v2, 0x16u);
}

void errorInjectionPointEnabled_cold_4()
{
  __assert_rtn("errorInjectionPointEnabled", "FPErrorInjection.m", 49, "category < FP_ERROR_INJECTION_CATEGORY_COUNT");
}

void fp_configuration_store_int_check_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1CF55F000, a2, a3, "[ERROR] Unable to load value for %{public}@", a5, a6, a7, a8, 2u);
}

#error "1CF61141C: call analysis failed (funcsize=45)"

#error "1CF61164C: call analysis failed (funcsize=48)"

#error "1CF61183C: call analysis failed (funcsize=48)"

void __accessControlDirectory_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_5(&dword_1CF55F000, v0, v1, "[SIMCRASH] Cannot create access control directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __accessControlDirectory_block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] Cannot create access control directory. Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void FPGetRelation_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] Caller version %@ is equal to running, returning FPVersionRelationSame", v2);
  OUTLINED_FUNCTION_8_0();
}

void __appStoreServiceConnection_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CF55F000, log, OS_LOG_TYPE_ERROR, "[ERROR] App Store Service connection interrupted (remote process exited or crashed.)", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __appStoreServiceConnection_block_invoke_109_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] App Store Service connection invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void fileProviderDirectory_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] Cannot create alternate contents directory: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void CloudDocsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CloudDocsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPDExtensionSession.m"), 78, CFSTR("%s"), *a1);

  __break(1u);
  APFSVolumeRole();
}

uint64_t APFSVolumeRole()
{
  return MEMORY[0x1E0CF18C8]();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x1E0D8D6F8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

uint64_t CacheDeleteCacheable()
{
  return MEMORY[0x1E0D09B30]();
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return MEMORY[0x1E0D09B80]();
}

uint64_t CacheDeleteRegister()
{
  return MEMORY[0x1E0D09B88]();
}

uint64_t CacheDeleteRegisterForProcess()
{
  return MEMORY[0x1E0D09B90]();
}

uint64_t CacheDeleteUpdatePurgeable()
{
  return MEMORY[0x1E0D09BC8]();
}

uint64_t FPClearImportCookieForDomainURL()
{
  return MEMORY[0x1E0CAA6D0]();
}

uint64_t FPClientLacksEntitlement()
{
  return MEMORY[0x1E0CAA6D8]();
}

uint64_t FPConnectionStateToPrettyString()
{
  return MEMORY[0x1E0CAA6E0]();
}

uint64_t FPDDaemonXPCInterface()
{
  return MEMORY[0x1E0CAA708]();
}

uint64_t FPDomainUnavailableError()
{
  return MEMORY[0x1E0CAA928]();
}

uint64_t FPEntitlementValueForAuditToken()
{
  return MEMORY[0x1E0CAA930]();
}

uint64_t FPExecutableNameForAuditToken()
{
  return MEMORY[0x1E0CAA938]();
}

uint64_t FPExecutableNameForProcessIdentifier()
{
  return MEMORY[0x1E0CAA940]();
}

uint64_t FPFSProviderIsDeniedForFPFS()
{
  return MEMORY[0x1E0CAA950]();
}

uint64_t FPFSProviderIsForcedForFPFS()
{
  return MEMORY[0x1E0CAA958]();
}

uint64_t FPFeatureFlagEbihilIsEnabled()
{
  return MEMORY[0x1E0CAA960]();
}

uint64_t FPFeatureFlagHelenaIsEnabled()
{
  return MEMORY[0x1E0CAA968]();
}

uint64_t FPFeatureFlagSpaceAttributionIsEnabled()
{
  return MEMORY[0x1E0CAA970]();
}

uint64_t FPFileIsAlreadyPausedError()
{
  return MEMORY[0x1E0CAA978]();
}

uint64_t FPFileMetadataCopyLastUsedDateAtURL()
{
  return MEMORY[0x1E0CAA980]();
}

uint64_t FPFileNotPausedError()
{
  return MEMORY[0x1E0CAA988]();
}

uint64_t FPFileSystemFreeBytes()
{
  return MEMORY[0x1E0CAA990]();
}

uint64_t FPGetImportCookieForURL()
{
  return MEMORY[0x1E0CAA998]();
}

uint64_t FPHumanReadableDropReason()
{
  return MEMORY[0x1E0CAA9A8]();
}

uint64_t FPInvalidParameterError()
{
  return MEMORY[0x1E0CAA9C8]();
}

uint64_t FPInvalidParameterErrorWithExpectation()
{
  return MEMORY[0x1E0CAA9D0]();
}

uint64_t FPInvalidURLError()
{
  return MEMORY[0x1E0CAA9D8]();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return MEMORY[0x1E0CAA9E8]();
}

uint64_t FPIsSpaceAttributionEnabledAndUsedByStorageUI()
{
  return MEMORY[0x1E0CAA9F0]();
}

uint64_t FPItemNotFoundError()
{
  return MEMORY[0x1E0CAAA00]();
}

uint64_t FPItemNotFoundErrorAtURL()
{
  return MEMORY[0x1E0CAAA08]();
}

uint64_t FPLoc()
{
  return MEMORY[0x1E0CAAA18]();
}

uint64_t FPNotPermittedError()
{
  return MEMORY[0x1E0CAAA20]();
}

uint64_t FPNotPermittedWriteError()
{
  return MEMORY[0x1E0CAAA28]();
}

uint64_t FPNotSupportedError()
{
  return MEMORY[0x1E0CAAA30]();
}

uint64_t FPOSVersion()
{
  return MEMORY[0x1E0CAAA38]();
}

uint64_t FPPathComponentsForFPItems()
{
  return MEMORY[0x1E0CAAA48]();
}

uint64_t FPPerformWithPersona()
{
  return MEMORY[0x1E0CAAA50]();
}

uint64_t FPPluginOperationFailedError()
{
  return MEMORY[0x1E0CAAA58]();
}

uint64_t FPPopLogSectionForBlock()
{
  return MEMORY[0x1E0CAAA60]();
}

uint64_t FPProviderNewerVersionFoundError()
{
  return MEMORY[0x1E0CAAA68]();
}

uint64_t FPProviderNotFoundError()
{
  return MEMORY[0x1E0CAAA70]();
}

uint64_t FPProviderNotFoundErrorForURL()
{
  return MEMORY[0x1E0CAAA78]();
}

uint64_t FPProviderNotRegistered()
{
  return MEMORY[0x1E0CAAA80]();
}

uint64_t FPProviderOlderVersionRunningError()
{
  return MEMORY[0x1E0CAAA88]();
}

uint64_t FPProviderXPCInvalidError()
{
  return MEMORY[0x1E0CAAA90]();
}

uint64_t FPProxyNotFoundError()
{
  return MEMORY[0x1E0CAAA98]();
}

uint64_t FPSetLastUsedDateAtURL()
{
  return MEMORY[0x1E0CAAAB8]();
}

uint64_t FPSetOperationClientOnXPCInterface()
{
  return MEMORY[0x1E0CAAAC0]();
}

uint64_t FPStatFSFromPath()
{
  return MEMORY[0x1E0CAAAC8]();
}

uint64_t FPSubtreeChangedError()
{
  return MEMORY[0x1E0CAAAD0]();
}

uint64_t FPUserCancelledError()
{
  return MEMORY[0x1E0CAAB08]();
}

uint64_t FPVersion()
{
  return MEMORY[0x1E0CAAB18]();
}

uint64_t FPVolumeFPFSSupported()
{
  return MEMORY[0x1E0CAAB20]();
}

uint64_t FPXVendorXPCInterface()
{
  return MEMORY[0x1E0CAAB28]();
}

uint64_t GSSetDocIDResolutionPolicy()
{
  return MEMORY[0x1E0D25D28]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

uint64_t RBSTaskStateIsRunning()
{
  return MEMORY[0x1E0D87E60]();
}

uint64_t SpotlightDaemonClientRegister()
{
  return MEMORY[0x1E0DA9C70]();
}

uint64_t WriteStackshotReportWithPID()
{
  return MEMORY[0x1E0D1BD40]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Exit(int a1)
{
  MEMORY[0x1E0C80980](*(_QWORD *)&a1);
}

uint64_t _FPRestorePersona()
{
  return MEMORY[0x1E0CAAD38]();
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

uint64_t __fp_create_section()
{
  return MEMORY[0x1E0CAAD40]();
}

uint64_t __fp_leave_section_Debug()
{
  return MEMORY[0x1E0CAAD48]();
}

uint64_t __fp_leave_section_Error()
{
  return MEMORY[0x1E0CAAD50]();
}

uint64_t __fp_leave_section_Notice()
{
  return MEMORY[0x1E0CAAD58]();
}

uint64_t __fp_pop_log()
{
  return MEMORY[0x1E0CAAD60]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
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

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1E0C82818]();
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

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1E0C832B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

uint64_t fp_current_or_default_log()
{
  return MEMORY[0x1E0CAAD68]();
}

uint64_t fp_default_log()
{
  return MEMORY[0x1E0CAAD70]();
}

uint64_t fp_dispatch_async_with_logs()
{
  return MEMORY[0x1E0CAAD78]();
}

uint64_t fp_simulate_crash()
{
  return MEMORY[0x1E0CAAD88]();
}

uint64_t fpathconf(int a1, int a2)
{
  return MEMORY[0x1E0C83470](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t fpfs_adopt_log()
{
  return MEMORY[0x1E0CAAD90]();
}

uint64_t fpfs_copy_xattrs()
{
  return MEMORY[0x1E0CAAD98]();
}

uint64_t fpfs_create_log_for_provider()
{
  return MEMORY[0x1E0CAADA0]();
}

uint64_t fpfs_fchdir()
{
  return MEMORY[0x1E0CAADB0]();
}

uint64_t fpfs_fset_metadata()
{
  return MEMORY[0x1E0CAADB8]();
}

uint64_t fpfs_fset_syncroot()
{
  return MEMORY[0x1E0CAADC0]();
}

uint64_t fpfs_get_is_ignore_root()
{
  return MEMORY[0x1E0CAADC8]();
}

uint64_t fpfs_is_dataless_fault_at()
{
  return MEMORY[0x1E0CAADD0]();
}

uint64_t fpfs_is_detached_root()
{
  return MEMORY[0x1E0CAADD8]();
}

uint64_t fpfs_lp_openat()
{
  return MEMORY[0x1E0CAADE0]();
}

uint64_t fpfs_lp_sandbox_check()
{
  return MEMORY[0x1E0CAADE8]();
}

uint64_t fpfs_make_fsevent()
{
  return MEMORY[0x1E0CAADF0]();
}

uint64_t fpfs_open()
{
  return MEMORY[0x1E0CAADF8]();
}

uint64_t fpfs_open_longpath()
{
  return MEMORY[0x1E0CAAE00]();
}

uint64_t fpfs_openat()
{
  return MEMORY[0x1E0CAAE08]();
}

uint64_t fpfs_pkg_is_demoted_at()
{
  return MEMORY[0x1E0CAAE18]();
}

uint64_t fpfs_recursive_unlinkat()
{
  return MEMORY[0x1E0CAAE28]();
}

uint64_t fpfs_root_exposure_symlink_xattr_exists()
{
  return MEMORY[0x1E0CAAE30]();
}

uint64_t fpfs_set_is_ignore_root()
{
  return MEMORY[0x1E0CAAE38]();
}

uint64_t fpfs_supports_long_paths()
{
  return MEMORY[0x1E0CAAE40]();
}

uint64_t fpfs_supports_partial_materialization()
{
  return MEMORY[0x1E0CAAE48]();
}

uint64_t fpfs_supports_sokoban()
{
  return MEMORY[0x1E0CAAE50]();
}

uint64_t fpfs_unset_evictable()
{
  return MEMORY[0x1E0CAAE58]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1E0C834E0](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

uint64_t fssync_default_log()
{
  return MEMORY[0x1E0CAAE68]();
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
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

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1E0C835B8](a1, a2, *(_QWORD *)&a3);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1E0C83670](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
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

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C83B88](path, namebuff, size, *(_QWORD *)&options);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strsignal(int __sig)
{
  return (char *)MEMORY[0x1E0C855F8](*(_QWORD *)&__sig);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return MEMORY[0x1E0C85B70]();
}

uint64_t xpc_activity_add_eligibility_changed_handler()
{
  return MEMORY[0x1E0C85D78]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

uint64_t xpc_activity_remove_eligibility_changed_handler()
{
  return MEMORY[0x1E0C85DA0]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

