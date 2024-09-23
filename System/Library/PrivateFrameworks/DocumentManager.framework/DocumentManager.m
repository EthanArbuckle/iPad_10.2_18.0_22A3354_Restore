uint64_t DOCIsInternalBuild()
{
  if (DOCIsInternalBuild_onceToken != -1)
    dispatch_once(&DOCIsInternalBuild_onceToken, &__block_literal_global_28);
  return DOCIsInternalBuild__isInternal;
}

CGFloat DOCAdaptSizeToRect(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8)
{
  double v13;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double Width;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  if (a6 == 0.0 || a7 == 0.0)
    return a2;
  v13 = a8;
  if (a8 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayScale");
    v13 = v18;

    if (v13 == 0.0)
      v13 = 1.0;
  }
  v27.origin.x = a2;
  v27.origin.y = a3;
  v27.size.width = a4;
  v27.size.height = a5;
  v19 = CGRectGetWidth(v27) / a6;
  v28.origin.x = a2;
  v28.origin.y = a3;
  v28.size.width = a4;
  v28.size.height = a5;
  v20 = CGRectGetHeight(v28) / a7;
  if (a1 == 1)
  {
    v21 = fmax(v19, v20);
  }
  else
  {
    v21 = 1.0;
    if (!a1)
      v21 = fmin(v19, v20);
  }
  v23 = ceil(v13 * (a6 * v21)) / v13;
  v24 = ceil(v13 * (a7 * v21)) / v13;
  v29.origin.x = a2;
  v29.origin.y = a3;
  v29.size.width = a4;
  v29.size.height = a5;
  Width = CGRectGetWidth(v29);
  v30.origin.x = a2;
  v30.origin.y = a3;
  v30.size.width = v23;
  v30.size.height = v24;
  v22 = a2 + floor(v13 * ((Width - CGRectGetWidth(v30)) * 0.5)) / v13;
  v31.origin.x = a2;
  v31.origin.y = a3;
  v31.size.width = a4;
  v31.size.height = a5;
  CGRectGetHeight(v31);
  v32.origin.x = v22;
  v32.origin.y = a3;
  v32.size.width = v23;
  v32.size.height = v24;
  CGRectGetHeight(v32);
  return v22;
}

BOOL DOCUsePadIdiomForTraits(void *a1)
{
  return !DOCUsePhoneIdiomForTraits(a1);
}

BOOL DOCUsePhoneIdiomForTraits(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v2, "userInterfaceIdiom") == -1)
  {
    objc_msgSend(v2, "traitCollectionByModifyingTraits:", &__block_literal_global_162);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v2;
  }
  v5 = v4;

  v6 = objc_msgSend(v5, "userInterfaceIdiom") == 0;
  return v6;
}

BOOL DOCScreenSizePad12_9()
{
  if (_DOCMainScreenClass__DOCMainScreenClass_OnceToken != -1)
    dispatch_once(&_DOCMainScreenClass__DOCMainScreenClass_OnceToken, &__block_literal_global_18_0);
  return _DOCMainScreenClass__DOCMainScreenClass == 11;
}

void sub_209056DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
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

id DOCFocusGroupIdentifierBrowserFromConfiguration(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "sceneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%@"), CFSTR("DOCFocusGroupIdentifierBrowser"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL DOCDebugMenuEnabled()
{
  if (DOCIsInternalBuild_onceToken != -1)
    dispatch_once(&DOCIsInternalBuild_onceToken, &__block_literal_global_28);
  if (!DOCIsInternalBuild__isInternal)
    return 0;
  if (DOCDebugMenuEnabled_onceToken != -1)
    dispatch_once(&DOCDebugMenuEnabled_onceToken, &__block_literal_global_30);
  return DOCDebugMenuEnabled__debugMenuEnabled != 0;
}

void sub_209059B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

id DOCFrameworkBundle()
{
  if (DOCFrameworkBundle_onceToken != -1)
    dispatch_once(&DOCFrameworkBundle_onceToken, &__block_literal_global_9);
  return (id)DOCFrameworkBundle_DOCBundle;
}

void sub_20905B4FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20905B5FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20905BDC8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20905C4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20905CB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20905CC1C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20905D240(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20905D32C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20905D688(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_20905E5A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20905EFD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20905F0A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20905F8FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_20905FBFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_2090603EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209060934(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209061140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20906120C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2090612D4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209061D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209063140(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_209063488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209063828(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

void sub_209066630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_209068328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t QuickLookThumbnailingLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = QuickLookThumbnailingLibraryCore_frameworkLibrary;
  v6 = QuickLookThumbnailingLibraryCore_frameworkLibrary;
  if (!QuickLookThumbnailingLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24C0F1370;
    v8 = *(_OWORD *)&off_24C0F1380;
    v1 = _sl_dlopen();
    v4[3] = v1;
    QuickLookThumbnailingLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_209069198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t QuickLookThumbnailingLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = QuickLookThumbnailingLibraryCore();
  if (!result)
    QuickLookThumbnailingLibrary_cold_1(&v1);
  return result;
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
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getQLThumbnailAdditionClass_block_invoke;
    v3[3] = &unk_24C0F1398;
    v3[4] = &v4;
    __getQLThumbnailAdditionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2090692A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getQLThumbnailAdditionClass_block_invoke(uint64_t a1)
{
  Class result;

  QuickLookThumbnailingLibrary();
  result = objc_getClass("QLThumbnailAddition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getQLThumbnailAdditionClass_block_invoke_cold_1();
  getQLThumbnailAdditionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_209069FDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20906A2B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_209071324(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t doc_smartfolder_create_tables_initial(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if (objc_msgSend(v3, "execute:", CFSTR("CREATE TABLE filenames( fp_folder_id TEXT NOT NULL, fp_folder_item BLOB NOT NULL, file_name TEXT NOT NULL, last_hit_date DOUBLE NOT NULL, frecency_at_last_hit_date DOUBLE NOT NULL)"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX filename_index ON filenames (fp_folder_id)"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX filename_last_hit_date_index ON filenames (last_hit_date)"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE TABLE filetypes( fp_folder_id TEXT NOT NULL, fp_folder_item BLOB NOT NULL, file_type TEXT NOT NULL, last_hit_date DOUBLE NOT NULL, frecency_at_last_hit_date DOUBLE NOT NULL)"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX filetype_index ON filetypes (fp_folder_id)"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX filetype_last_hit_date_index ON filetypes (last_hit_date)"))&& objc_msgSend(v3,
                       "execute:",
                       CFSTR("CREATE TABLE hotfolders( app_bundle_id TEXT NOT NULL, fp_folder_id TEXT NOT NULL, fp_folder_item BLOB NOT NULL, event_type INTEGER NOT NULL, last_hit_date DOUBLE NOT NULL, frecency_at_last_hit_date DOUBLE NOT NULL)"))
    && objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX app_identifier ON hotfolders (app_bundle_id)"))
    && objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX _last_hit_date_index ON hotfolders (last_hit_date)")))
  {
    v4 = objc_msgSend(v3, "setUserVersion:", 1);
  }
  else
  {
    v4 = 0;
  }
  if (a2 && (v4 & 1) == 0)
  {
    objc_msgSend(v3, "lastError");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void sub_209071CAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_209072B64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id OUTLINED_FUNCTION_14(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_19(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2, void *a3)
{
  return a3;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  void *v0;

  return objc_msgSend(v0, "count");
}

id OUTLINED_FUNCTION_11_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_16_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void sub_209077314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20907829C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20907871C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_209078A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

CGFloat DOCCenterSizeInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  CGFloat v9;
  CGRect v11;

  v9 = CGRectGetMidX(*(CGRect *)&a1) - a5 * 0.5;
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectGetMidY(v11);
  return v9;
}

id DOCErrorNoLocationAvailableError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)MEMORY[0x24BDD17C8];
  _DocumentManagerBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v1)
  {
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("No location available to save “%@”."), CFSTR("No location available to save “%@”."), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", v5, v1);
  }
  else
  {
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("No location available to save this document."), CFSTR("No location available to save this document."), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", v5, 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Enable at least one location to be able to save documents."), CFSTR("Enable at least one location to be able to save documents."), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD1540];
  v10 = *MEMORY[0x24BDD0FF0];
  v14[0] = *MEMORY[0x24BDD0FC8];
  v14[1] = v10;
  v15[0] = v6;
  v15[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DocumentManager"), 2, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t _DOCMainScreenClass()
{
  if (_DOCMainScreenClass__DOCMainScreenClass_OnceToken != -1)
    dispatch_once(&_DOCMainScreenClass__DOCMainScreenClass_OnceToken, &__block_literal_global_18_0);
  return _DOCMainScreenClass__DOCMainScreenClass;
}

double _DOCMainScreenSize()
{
  if (_DOCMainScreenSize__DOCMainScreenSize_OnceToken != -1)
    dispatch_once(&_DOCMainScreenSize__DOCMainScreenSize_OnceToken, &__block_literal_global_21);
  return *(double *)&_DOCMainScreenSize__DOCMainScreenSize_0;
}

BOOL DOCScreenSizeSEPhone()
{
  if (_DOCMainScreenClass__DOCMainScreenClass_OnceToken != -1)
    dispatch_once(&_DOCMainScreenClass__DOCMainScreenClass_OnceToken, &__block_literal_global_18_0);
  return _DOCMainScreenClass__DOCMainScreenClass == 5;
}

BOOL DOCScreenSizePad()
{
  return !DOCUsePhoneIdiomForTraits(0);
}

BOOL DOCSizeIsFullScreenSize(double a1, double a2)
{
  double v4;
  double v5;

  v4 = _DOCMainScreenSize();
  return a1 * a2 == v4 * v5;
}

uint64_t DOCDeviceHasHomeButton()
{
  if (DOCDeviceHasHomeButton_onceToken != -1)
    dispatch_once(&DOCDeviceHasHomeButton_onceToken, &__block_literal_global_23);
  return DOCDeviceHasHomeButton_hasHomeButton;
}

uint64_t DOCAssertWithIntenalBuildAlert(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject **v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((a1 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FC8];
    v29[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DocumentManager"), 1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (NSObject **)MEMORY[0x24BE2DFF0];
    v19 = *MEMORY[0x24BE2DFF0];
    if (!*MEMORY[0x24BE2DFF0])
    {
      DOCInitLogging();
      v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      DOCAssertWithIntenalBuildAlert_cold_1(v19, v17);
    if (DOCIsInternalBuild_onceToken != -1)
      dispatch_once(&DOCIsInternalBuild_onceToken, &__block_literal_global_28);
    if (DOCIsInternalBuild__isInternal)
    {
      v20 = v14;
      if (!v20)
      {
        +[DOCUISession keyWindow](DOCUISession, "keyWindow");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "rootViewController");
        v20 = (id)objc_claimAutoreleasedReturnValue();

      }
      v25 = v17;
      v26 = v11;
      v27 = v13;
      v22 = v20;
      DOCRunInMainThread();

      v23 = v25;
    }
    else
    {
      if (!a2)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL DOCAssertWithIntenalBuildAlert(BOOL, BOOL, NSString *__strong _Nonnull, NSString *__strong _Nonnull, NSString *__strong _Nonnull, UIViewController * _Nullable __strong)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("DOCUtilities.m"), 221, v13);
    }

    goto LABEL_15;
  }
LABEL_16:

  return a1;
}

void DOCPresentAlertForErrorWithForceHandler(void *a1, void *a2, void *a3, int a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v31;

  v31 = a1;
  v13 = a2;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  +[DOCErrorStore augmentedErrorForError:](DOCErrorStore, "augmentedErrorForError:", v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v19 = v18;
  else
    v19 = v31;
  v20 = v19;

  if (v13)
  {
    v21 = v13;
  }
  else
  {
    objc_msgSend(v20, "localizedDescription");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;
  objc_msgSend(v20, "localizedFailureReason");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(v20, "localizedRecoverySuggestion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!v13 || v26)
    {
      v28 = v26;
    }
    else
    {
      objc_msgSend(v20, "localizedDescription");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v28;

  }
  DOCPresentAlert(v22, v25, a4, a5, v17, v16, v15, v14);

}

id DOCIgnoringExceptionsWhileTrying(void *a1)
{
  void (**v1)(void);

  v1 = a1;
  v1[2]();

  return 0;
}

void sub_20907B3A8(void *a1)
{
  id v1;

  v1 = objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x20907B394);
}

void DOCPresentAlert(void *a1, void *a2, int a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject **v37;
  NSObject *v38;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;

  v14 = a2;
  v41 = a5;
  v15 = a7;
  v16 = a8;
  v17 = a6;
  v18 = a1;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v40 = v14;
  +[DOCAlertController alertControllerWithTitle:message:preferredStyle:](DOCAlertController, "alertControllerWithTitle:message:preferredStyle:", v18, v14, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __DOCPresentAlert_block_invoke;
  v49[3] = &unk_24C0F06E8;
  v21 = v16;
  v50 = v21;
  v22 = (void *)MEMORY[0x20BD0CEF0](v49);
  v23 = (void *)MEMORY[0x24BEBD3A8];
  _DocumentManagerBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a3)
  {
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v20;
    v47[1] = 3221225472;
    v47[2] = __DOCPresentAlert_block_invoke_2;
    v47[3] = &unk_24C0F1D58;
    v27 = &v48;
    v48 = v22;
    v28 = v47;
    v29 = v23;
    v30 = v26;
    v31 = 1;
  }
  else
  {
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v20;
    v45[1] = 3221225472;
    v45[2] = __DOCPresentAlert_block_invoke_3;
    v45[3] = &unk_24C0F1D58;
    v27 = &v46;
    v46 = v22;
    v28 = v45;
    v29 = v23;
    v30 = v26;
    v31 = 0;
  }
  objc_msgSend(v29, "actionWithTitle:style:handler:", v30, v31, v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v32);

  if (v15 && objc_msgSend(v41, "length"))
  {
    v33 = (void *)MEMORY[0x24BEBD3A8];
    v42[0] = v20;
    v42[1] = 3221225472;
    v42[2] = __DOCPresentAlert_block_invoke_4;
    v42[3] = &unk_24C0F1D80;
    v43 = v15;
    v44 = v22;
    objc_msgSend(v33, "actionWithTitle:style:handler:", v41, a4, v42);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v34);

    v35 = v43;
  }
  else
  {
    objc_msgSend(v19, "actions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "lastObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPreferredAction:", v36);

  }
  v37 = (NSObject **)MEMORY[0x24BE2DFF0];
  v38 = *MEMORY[0x24BE2DFF0];
  if (!*MEMORY[0x24BE2DFF0])
  {
    DOCInitLogging();
    v38 = *v37;
  }
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    DOCPresentAlert_cold_1((uint64_t)v40, v38);
  objc_msgSend(v17, "presentViewController:animated:completion:", v19, 1, 0);

}

void DOCPresentAlertForError(void *a1, void *a2)
{
  DOCPresentAlertForErrorWithForceHandler(a1, 0, 0, 0, 0, a2, 0, 0);
}

BOOL DOCIsNetworkReachable()
{
  void *v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  NSObject **v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x24BDE07E8], "sharedDefaultEvaluator");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "status");

  v3 = v2 & 0xFFFFFFFFFFFFFFFDLL;
  if ((v2 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    v4 = (NSObject **)MEMORY[0x24BE2DF90];
    v5 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_209052000, v5, OS_LOG_TYPE_DEFAULT, "Network is not reachable", v7, 2u);
    }
  }
  return v3 == 1;
}

void DOCAlertUserTheNetworkIsNotReachable(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = a1;
  _DocumentManagerBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("You’re Offline"), CFSTR("You’re Offline"), CFSTR("Localizable"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Check your Internet connection, then try again."), CFSTR("Check your Internet connection, then try again."), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  DOCPresentAlert(v5, v4, 0, 0, 0, v1, 0, 0);
}

void DOCAlertUserTrashedFileCanNotBeOpened(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = a1;
  _DocumentManagerBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("The document “%@” can’t be opened because it’s in Recently Deleted."), CFSTR("The document “%@” can’t be opened because it’s in Recently Deleted."), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v7, v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  _DocumentManagerBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("To use this item, tap and hold on the item and choose Recover."), CFSTR("To use this item, tap and hold on the item and choose Recover."), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  DOCPresentAlert(v12, v11, 0, 0, 0, v4, 0, 0);
}

void DOCAlertItemIsNotReadable(void *a1, int a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  v7 = a1;
  _DocumentManagerBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a2)
    v10 = CFSTR("The folder “%@” can’t be opened because you don’t have permission to see its contents.");
  else
    v10 = CFSTR("The document “%@” can’t be opened because you don’t have permission to see its contents.");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, v10, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v11, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  DOCPresentAlert(0, v12, 0, 0, 0, v6, 0, 0);
}

uint64_t DOCFirstResponderIsKeyInput()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "targetWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "conformsToProtocol:", &unk_2545C5588);
  return v3;
}

void sub_20907C080(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20907C6B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20907CD5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20907CED0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20907D1EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20907D5C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20907D8CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20907DBFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void QuickLookThumbnailingLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *QuickLookThumbnailingLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("DOCDocumentManagerSoftLinking.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
}

void __getQLThumbnailAdditionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getQLThumbnailAdditionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DOCDocumentManagerSoftLinking.m"), 13, CFSTR("Unable to find class %s"), "QLThumbnailAddition");

  __break(1u);
}

void DOCAssertWithIntenalBuildAlert_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_209052000, v3, OS_LOG_TYPE_FAULT, "Error: %@", (uint8_t *)&v5, 0xCu);

}

void DOCPresentAlert_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "void DOCPresentAlert(NSString *__strong, NSString * _Nullable __strong, BOOL, UIAlertActionStyle, NSString * _Nul"
       "lable __strong, UIViewController *__strong, void (^ _Nullable __strong)(void), void (^ _Nullable __strong)(void))";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_209052000, a2, OS_LOG_TYPE_DEBUG, "%s: prompting user with message: %@", (uint8_t *)&v2, 0x16u);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9058](idst, isrc, index, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t DOCInitLogging()
{
  return MEMORY[0x24BE2DE58]();
}

uint64_t DOCLocalizedDisplayName()
{
  return MEMORY[0x24BE2DE68]();
}

uint64_t DOCNodeFromCoder()
{
  return MEMORY[0x24BE2DE70]();
}

uint64_t DOCProviderDomainIDIsDefaultSharedServer()
{
  return MEMORY[0x24BE2DE78]();
}

uint64_t DOCProviderDomainIDIsRemovable()
{
  return MEMORY[0x24BE2DE88]();
}

uint64_t DOCRunInMainThread()
{
  return MEMORY[0x24BE2DEA0]();
}

uint64_t DOCTagFromFPTag()
{
  return MEMORY[0x24BE2DEB0]();
}

uint64_t FPDocumentURLFromBookmarkableString()
{
  return MEMORY[0x24BDC8028]();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return MEMORY[0x24BDC80E0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BEBDE48]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _DocumentManagerBundle()
{
  return MEMORY[0x24BE2DF48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE4D0](a1, a2, a3, *(_QWORD *)&a4);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x24BDAFBE0]();
}

uint64_t sandbox_extension_update_file()
{
  return MEMORY[0x24BDAFC28]();
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

