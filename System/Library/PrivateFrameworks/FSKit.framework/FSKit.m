void sub_23B2A8B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_23B2AAD14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2AC25C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2ACC70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2ACF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_23B2AD45C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_23B2AD838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_23B2AD984(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2ADD5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2AE06C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_23B2AE528(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_23B2AE904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_23B2AEA50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2AF0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_23B2AF644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B2AFB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B2AFFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_23B2B0850(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_14(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id OUTLINED_FUNCTION_20(id a1)
{
  return a1;
}

void sub_23B2B20AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  void *v17;

  objc_sync_exit(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_23B2B2230(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2B3B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_23B2B5BE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2B5D04(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id fskit_std_log()
{
  if (fskit_std_log_once != -1)
    dispatch_once(&fskit_std_log_once, &__block_literal_global_4);
  return (id)fskit_std_log_logger;
}

void __fskit_std_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FSKit", "default");
  v1 = (void *)fskit_std_log_logger;
  fskit_std_log_logger = (uint64_t)v0;

}

uint64_t fs_errorForPOSIXError(int a1)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a1, 0);
}

uint64_t fs_errorForCocoaError(int a1)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], a1, 0);
}

uint64_t fs_errorForMachError(int a1)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], a1, 0);
}

id FSKitLocalizedStringWithKeyAndVariant(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = v11;
  v15 = v12;
  v16 = v13;
  objc_msgSend(0, "stringByAppendingString:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17
    || (objc_msgSend(v15, "stringByAppendingString:", CFSTR(".f")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        _FSKitLocalizedStringNoFallbackWithKeyAndVariant(v17, v18, v16),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        !v19)
    && (_FSKitLocalizedStringNoFallbackWithKeyAndVariant(v17, v15, v16),
        (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(".f"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _FSKitLocalizedStringWithKeyAndVariant(v14, v20, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      _FSKitLocalizedStringWithKeyAndVariant(v14, v15, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        FSKitLocalizedErrorStringForKey(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v19, &a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v21, &stru_250C33628);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id _FSKitLocalizedStringNoFallbackWithKeyAndVariant(void *a1, void *a2, void *a3)
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
    || (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@(%@)"), v5, v6, v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        FSKitLocalizedErrorStringForKey(v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@(*)"), v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FSKitLocalizedErrorStringForKey(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

id _FSKitLocalizedStringWithKeyAndVariant(void *a1, void *a2, void *a3)
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
  _FSKitLocalizedStringNoFallbackWithKeyAndVariant(v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && !v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@(%@)"), v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FSKitLocalizedErrorStringForKey(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6 && !v9)
  {
    if ((objc_msgSend(v6, "isEqualToString:", &stru_250C33628) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v5, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      FSKitLocalizedErrorStringForKey(v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

id fskitLocalizationBundle()
{
  if (fskitLocalizationBundle_onceToken != -1)
    dispatch_once(&fskitLocalizationBundle_onceToken, &__block_literal_global_7);
  return (id)fskitLocalizationBundle_bundle;
}

void __fskitLocalizationBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fskitLocalizationBundle_bundle;
  fskitLocalizationBundle_bundle = v0;

}

id FSKitLoc(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  FSKitLocvImpl(a1, CFSTR("FSKit"), 0, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id FSKitLocv(void *a1, uint64_t a2)
{
  return FSKitLocvImpl(a1, CFSTR("FSKit"), 0, a2);
}

id FSKitLocvImpl(void *a1, void *a2, int a3, uint64_t a4)
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
  fskitLocalizationBundle();
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
      fskit_std_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        FSKitLocvImpl_cold_1((uint64_t)v7, (uint64_t)v8, v14);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("KEY_MISSING(%@)"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "initWithFormat:locale:arguments:", v10, v13, a4);

  }
  return v11;
}

id FSKitLocalizedErrorStringForKeyLiteral(void *a1, uint64_t a2)
{
  return FSKitLocvImpl(a1, CFSTR("Errors"), 1, a2);
}

id FSKitLocalizedErrorStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v7;

  v1 = a1;
  fskitLocalizationBundle();
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
    fskit_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      FSKitLocalizedErrorStringForKey_cold_1((uint64_t)v1, v7);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("KEY_MISSING(%@)"), v1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v4 = 0;
LABEL_10:

  return v4;
}

void sub_23B2B8958(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_23B2BB130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_23B2BB370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  void *v19;

  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_23B2BB5C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_23B2BB800(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2BB978(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_23B2BBBB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2BD428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
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

void deviceNotificationCallback(void *a1, io_registry_entry_t a2, int a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const void *Value;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (a1 && a3 == -536870896)
  {
    fskit_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      deviceNotificationCallback_cold_6(v5, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(a1, "resource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fskit_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      deviceNotificationCallback_cold_5(v13, v14);

    properties = 0;
    if (IORegistryEntryCreateCFProperties(a2, &properties, 0, 0))
    {
      fskit_std_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        deviceNotificationCallback_cold_4(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    else
    {
      Value = CFDictionaryGetValue(properties, CFSTR("BSD Name"));
      if (Value)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", Value);
        v15 = objc_claimAutoreleasedReturnValue();
        fskit_std_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          deviceNotificationCallback_cold_3();

        objc_msgSend(v13, "BSDName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[NSObject isEqualToString:](v15, "isEqualToString:", v33);

        if (v34)
        {
          objc_msgSend(v13, "stopUsingResource:", CFSTR("serviceTerminated"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v35)
          {
            fskit_std_log();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v13, "getResourceID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v47 = "deviceNotificationCallback";
              v48 = 2112;
              v49 = v37;
              _os_log_impl(&dword_23B2A6000, v36, OS_LOG_TYPE_INFO, "%s: resource (%@) closed for kernel", buf, 0x16u);

            }
          }
          objc_msgSend(v13, "terminate");

        }
      }
      else
      {
        fskit_std_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          deviceNotificationCallback_cold_2(v15, v38, v39, v40, v41, v42, v43, v44);
      }
    }

    fskit_std_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      deviceNotificationCallback_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);

  }
}

void sub_23B2BE3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B2BE66C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_23B2BFC6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2C063C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void sub_23B2C1004(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_23B2C11E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2C1478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
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

void sub_23B2C1670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_23B2C2B5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2C3384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  void *v0;

  return objc_msgSend(v0, "taskState");
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_23B2C5F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&location, 8);
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

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_23B2C6E54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23B2C6EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
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

void sub_23B2C7984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_23B2C7FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B2C997C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_23B2C9BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B2C9DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_23B2CA95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_23B2CACD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_23B2CCEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23B2CD004(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23B2CD2E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23B2CD3C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23B2CD7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

uint64_t OUTLINED_FUNCTION_10_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "code");
}

void OUTLINED_FUNCTION_15_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_17_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_18_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_23B2D1BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
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

void __60__stolenUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__stolenUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_23B2D1F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_23B2D2234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_23B2D2A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 192), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_6_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t sub_23B2D3A1C(uint64_t __src, uint64_t a2)
{
  if (__src)
  {
    if (a2)
    {
      if (a2 <= 14)
      {
        return sub_23B2D3B9C((_BYTE *)__src, (_BYTE *)(__src + a2));
      }
      else
      {
        sub_23B2DC344();
        swift_allocObject();
        sub_23B2DC338();
        if ((unint64_t)a2 >= 0x7FFFFFFF)
        {
          sub_23B2DC350();
          __src = swift_allocObject();
          *(_QWORD *)(__src + 16) = 0;
          *(_QWORD *)(__src + 24) = a2;
        }
        else
        {
          return a2 << 32;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return __src;
}

uint64_t sub_23B2D3AD4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

id _sSo10FSFileNameC5FSKitE7cStringABSRys4Int8VG_tcfC_0(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = sub_23B2D3A1C(a1, a2);
  v7 = v6;
  v8 = (void *)sub_23B2DC35C();
  sub_23B2D3AD4(v5, v7);
  v9 = objc_msgSend(v4, sel_initWithData_, v8);

  return v9;
}

uint64_t sub_23B2D3B9C(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

FSKitUtils __swiftcall FSKitUtils.init()()
{
  return (FSKitUtils)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id FSKitUtils.init()()
{
  objc_super v1;

  v1.super_class = (Class)FSKitUtils;
  return objc_msgSendSuper2(&v1, sel_init);
}

_QWORD *sub_23B2D3E00(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A09D18);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A09D20);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t _sSo10FSKitUtilsC0A0E6string16withFormatString6locale9argumentsS2S_10Foundation6LocaleVSaySo8NSObjectCGtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  unint64_t v32;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A09D08);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a4 >> 62))
  {
    v10 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v10)
      goto LABEL_3;
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    v22 = sub_23B2DC398();
    v23 = *(_QWORD *)(v22 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v9, a3, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v9, 0, 1, v22);
    v24 = sub_23B2DC3BC();
    swift_bridgeObjectRelease();
    sub_23B2D435C((uint64_t)v9);
    return v24;
  }
  swift_bridgeObjectRetain();
  result = sub_23B2DC3E0();
  v10 = result;
  if (!result)
    goto LABEL_20;
LABEL_3:
  if (v10 >= 1)
  {
    v26 = a3;
    v27 = v9;
    v28 = a1;
    v29 = a2;
    if ((a4 & 0xC000000000000001) != 0)
    {
      v12 = 0;
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        v14 = (id)MEMORY[0x23B8617CC](v12, a4);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v13 = sub_23B2D3E00(0, v13[2] + 1, 1, v13);
        v16 = v13[2];
        v15 = v13[3];
        if (v16 >= v15 >> 1)
          v13 = sub_23B2D3E00((_QWORD *)(v15 > 1), v16 + 1, 1, v13);
        ++v12;
        v31 = sub_23B2D4274(0, &qword_256A09D00);
        v32 = sub_23B2D42EC();
        *(_QWORD *)&v30 = v14;
        v13[2] = v16 + 1;
        sub_23B2D4344(&v30, (uint64_t)&v13[5 * v16 + 4]);
        swift_unknownObjectRelease();
      }
      while (v10 != v12);
    }
    else
    {
      v17 = 0;
      v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        v19 = *(id *)(a4 + 8 * v17 + 32);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v18 = sub_23B2D3E00(0, v18[2] + 1, 1, v18);
        v21 = v18[2];
        v20 = v18[3];
        if (v21 >= v20 >> 1)
          v18 = sub_23B2D3E00((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
        ++v17;
        v31 = sub_23B2D4274(0, &qword_256A09D00);
        v32 = sub_23B2D42EC();
        *(_QWORD *)&v30 = v19;
        v18[2] = v21 + 1;
        sub_23B2D4344(&v30, (uint64_t)&v18[5 * v21 + 4]);

      }
      while (v10 != v17);
    }
    swift_bridgeObjectRelease();
    a3 = v26;
    v9 = v27;
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FSKitUtils(uint64_t a1)
{
  return sub_23B2D4274(a1, qword_256A09EF8);
}

uint64_t sub_23B2D4274(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B861F04]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23B2D42EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A09D10;
  if (!qword_256A09D10)
  {
    v1 = sub_23B2D4274(255, &qword_256A09D00);
    result = MEMORY[0x23B861F10](MEMORY[0x24BEE5BE8], v1);
    atomic_store(result, (unint64_t *)&qword_256A09D10);
  }
  return result;
}

uint64_t sub_23B2D4344(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_23B2D435C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A09D08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t FSModuleIdentity.id.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_bundleIdentifier);
  v2 = sub_23B2DC3B0();

  return v2;
}

uint64_t sub_23B2D43F4()
{
  return MEMORY[0x24BEE0D10];
}

void sub_23B2D4400(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*v1, sel_bundleIdentifier);
  v4 = sub_23B2DC3B0();
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

void FilesystemExtension.configuration.getter(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  sub_23B2D44A8(a1, type metadata accessor for _FSKitFilesystemExtensionConfiguration, &OBJC_IVAR____TtC5FSKit38_FSKitFilesystemExtensionConfiguration_ourExtension, a2);
}

id sub_23B2D4468(void *a1)
{
  return sub_23B2D4584(a1, &OBJC_IVAR____TtC5FSKit38_FSKitFilesystemExtensionConfiguration_ourExtension);
}

uint64_t type metadata accessor for _FSKitFilesystemExtensionConfiguration()
{
  return objc_opt_self();
}

void UnaryFilesystemExtension.configuration.getter(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  sub_23B2D44A8(a1, type metadata accessor for _FSKitUnaryFilesystemExtensionConfiguration, &OBJC_IVAR____TtC5FSKit43_FSKitUnaryFilesystemExtensionConfiguration_ourExtension, a2);
}

void sub_23B2D44A8(uint64_t a1@<X1>, uint64_t (*a2)(void)@<X2>, _QWORD *a3@<X3>, _QWORD *a4@<X8>)
{
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  objc_super v15;

  v7 = (void *)(*(uint64_t (**)(void))(a1 + 24))();
  v8 = (objc_class *)a2();
  v9 = objc_allocWithZone(v8);
  v10 = (void *)objc_opt_self();
  v11 = (char *)v9;
  v12 = objc_msgSend(v10, sel_moduleExtensionForAppex_, v7);
  *(_QWORD *)&v11[*a3] = v12;
  v13 = v12;
  objc_msgSend(v13, sel_didFinishLaunching);

  v15.receiver = v11;
  v15.super_class = v8;
  v14 = objc_msgSendSuper2(&v15, sel_init);

  *a4 = v14;
}

id sub_23B2D4578(void *a1)
{
  return sub_23B2D4584(a1, &OBJC_IVAR____TtC5FSKit43_FSKitUnaryFilesystemExtensionConfiguration_ourExtension);
}

id sub_23B2D4584(void *a1, _QWORD *a2)
{
  objc_class *v2;
  id v5;
  void *v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v5 = objc_allocWithZone(v2);
  v6 = (void *)objc_opt_self();
  v7 = (char *)v5;
  v8 = objc_msgSend(v6, sel_moduleExtensionForAppex_, a1);
  *(_QWORD *)&v7[*a2] = v8;
  v9 = v8;
  objc_msgSend(v9, sel_didFinishLaunching);

  v12.receiver = v7;
  v12.super_class = v2;
  v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

uint64_t type metadata accessor for _FSKitUnaryFilesystemExtensionConfiguration()
{
  return objc_opt_self();
}

id sub_23B2D4660(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC5FSKit38_FSKitFilesystemExtensionConfiguration_ourExtension), sel_shouldAcceptConnection_, a1);
}

id sub_23B2D46B8()
{
  return sub_23B2D4774(type metadata accessor for _FSKitFilesystemExtensionConfiguration);
}

uint64_t sub_23B2D46D4()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x78))() & 1;
}

id sub_23B2D4710(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC5FSKit43_FSKitUnaryFilesystemExtensionConfiguration_ourExtension), sel_shouldAcceptConnection_, a1);
}

id sub_23B2D4768()
{
  return sub_23B2D4774(type metadata accessor for _FSKitUnaryFilesystemExtensionConfiguration);
}

id sub_23B2D4774(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t dispatch thunk of FilesystemExtension.filesystem.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_23B2D47BC()
{
  return sub_23B2D4814(&qword_256A09DF0, type metadata accessor for _FSKitFilesystemExtensionConfiguration, (uint64_t)&unk_23B2E0200);
}

uint64_t sub_23B2D47E8()
{
  return sub_23B2D4814(&qword_256A09DF8, type metadata accessor for _FSKitUnaryFilesystemExtensionConfiguration, (uint64_t)&unk_23B2E0228);
}

uint64_t sub_23B2D4814(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2();
    result = MEMORY[0x23B861F10](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t FSVolume.id.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_volumeID);
  v2 = FSEntityIdentifier.id.getter();

  return v2;
}

void sub_23B2D48AC(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*v1, sel_volumeID);
  v4 = FSEntityIdentifier.id.getter();
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

uint64_t FSEntityIdentifier.id.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v8;

  v1 = sub_23B2DC380();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, sel_uuid);
  sub_23B2DC374();

  v6 = sub_23B2DC368();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

uint64_t sub_23B2D49B4@<X0>(uint64_t *a1@<X8>)
{
  id *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v3 = sub_23B2DC380();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(*v1, sel_uuid);
  sub_23B2DC374();

  v8 = sub_23B2DC368();
  v10 = v9;
  result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  *a1 = v8;
  a1[1] = v10;
  return result;
}

void FSBlockDeviceResource.read(into:startingAt:length:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD, id), uint64_t a6)
{
  sub_23B2D4B30(a1, a2, a3, a4, a5, a6, (uint64_t)&block_descriptor, (SEL *)&selRef_readInto_startingAt_length_replyHandler_);
}

void sub_23B2D4A7C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void FSBlockDeviceResource.synchronousRead(into:startingAt:length:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD, id), uint64_t a6)
{
  sub_23B2D4B30(a1, a2, a3, a4, a5, a6, (uint64_t)&block_descriptor_3, (SEL *)&selRef_synchronousReadInto_startingAt_length_replyHandler_);
}

void FSBlockDeviceResource.write(from:startingAt:length:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD, id), uint64_t a6)
{
  sub_23B2D4B30(a1, a2, a3, a4, a5, a6, (uint64_t)&block_descriptor_6, (SEL *)&selRef_writeFrom_startingAt_length_replyHandler_);
}

void FSBlockDeviceResource.synchronousWrite(from:startingAt:length:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD, id), uint64_t a6)
{
  sub_23B2D4B30(a1, a2, a3, a4, a5, a6, (uint64_t)&block_descriptor_9, (SEL *)&selRef_synchronousWriteFrom_startingAt_length_replyHandler_);
}

void sub_23B2D4B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD, id), uint64_t a6, uint64_t a7, SEL *a8)
{
  void *v8;
  void *v14;
  id v15;
  _QWORD aBlock[6];

  if (a1)
  {
    aBlock[4] = a5;
    aBlock[5] = a6;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23B2D4A7C;
    aBlock[3] = a7;
    v14 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v8, *a8, a1, a3, a4, v14);
    _Block_release(v14);
  }
  else
  {
    v15 = (id)fs_errorForPOSIXError(22);
    a5(0, v15);

  }
}

void FSBlockDeviceResource.synchronousMetadataRead(into:startingAt:length:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  sub_23B2D4E0C(a1, a2, a3, a4, a5, a6, (uint64_t)&block_descriptor_12, (SEL *)&selRef_synchronousMetadataReadInto_startingAt_length_replyHandler_);
}

void sub_23B2D4C48(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void FSBlockDeviceResource.synchronousMetadataRead(into:startingAt:length:readAheadExtents:readAheadCount:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void), uint64_t a9)
{
  void *v9;
  void *v16;
  id v17;
  _QWORD aBlock[6];

  if (a1 && a5)
  {
    aBlock[4] = a8;
    aBlock[5] = a9;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23B2D4C48;
    aBlock[3] = &block_descriptor_15;
    v16 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_synchronousMetadataReadInto_startingAt_length_readAheadExtents_readAheadCount_replyHandler_, a1, a3, a4, a5, a7, v16);
    _Block_release(v16);
  }
  else
  {
    v17 = (id)fs_errorForPOSIXError(22);
    a8();

  }
}

void FSBlockDeviceResource.metadataWrite(from:startingAt:length:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  sub_23B2D4E0C(a1, a2, a3, a4, a5, a6, (uint64_t)&block_descriptor_18, (SEL *)&selRef_metadataWriteFrom_startingAt_length_replyHandler_);
}

void FSBlockDeviceResource.synchronousMetadataWrite(from:startingAt:length:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  sub_23B2D4E0C(a1, a2, a3, a4, a5, a6, (uint64_t)&block_descriptor_21, (SEL *)&selRef_metadataWriteFrom_startingAt_length_replyHandler_);
}

void FSBlockDeviceResource.delayedMetadataWrite(from:startingAt:length:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  sub_23B2D4E0C(a1, a2, a3, a4, a5, a6, (uint64_t)&block_descriptor_24, (SEL *)&selRef_delayedMetadataWriteFrom_startingAt_length_replyHandler_);
}

void sub_23B2D4E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6, uint64_t a7, SEL *a8)
{
  void *v8;
  void *v14;
  id v15;
  _QWORD aBlock[6];

  if (a1)
  {
    aBlock[4] = a5;
    aBlock[5] = a6;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23B2D4C48;
    aBlock[3] = a7;
    v14 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v8, *a8, a1, a3, a4, v14);
    _Block_release(v14);
  }
  else
  {
    v15 = (id)fs_errorForPOSIXError(22);
    a5();

  }
}

void FSKitLocvImpl_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
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

  v14 = *MEMORY[0x24BDAC8D0];
  fskitLocalizationBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = a2;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_23B2A6000, a3, OS_LOG_TYPE_ERROR, "Localized key '%@' missing from table '%@' (bundlePath:%@)", (uint8_t *)&v8, 0x20u);

}

void FSKitLocalizedErrorStringForKey_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  fskitLocalizationBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_23B2A6000, a2, OS_LOG_TYPE_ERROR, "Localized key '%@' missing from table 'Errors' (bundlePath:%@)", (uint8_t *)&v6, 0x16u);

}

void deviceNotificationCallback_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:finish", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void deviceNotificationCallback_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: can't find BSD name", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void deviceNotificationCallback_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:service:bsdName:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void deviceNotificationCallback_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: can't find service properties", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void deviceNotificationCallback_cold_5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "BSDName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:kIOMessageServiceIsTerminated:%@", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

void deviceNotificationCallback_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:start", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_23B2DC338()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23B2DC344()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23B2DC350()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23B2DC35C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23B2DC368()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23B2DC374()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23B2DC380()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23B2DC38C()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_23B2DC398()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23B2DC3A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23B2DC3B0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23B2DC3BC()
{
  return MEMORY[0x24BDCFA58]();
}

uint64_t sub_23B2DC3C8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23B2DC3D4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23B2DC3E0()
{
  return MEMORY[0x24BEE3068]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD7EB0](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x24BDBD0F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8E8](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F0](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA900](atoken);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA908](atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA910](atoken);
}

void clearerr(FILE *a1)
{
  MEMORY[0x24BDAD9A8](a1);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
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

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return MEMORY[0x24BDAE6A8](*(_QWORD *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x24BDAEB70](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDAEC88](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x24BDB0A40](*(_QWORD *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x24BDB0A48](xfd);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x24BDB0A90]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x24BDB0A98]();
}

