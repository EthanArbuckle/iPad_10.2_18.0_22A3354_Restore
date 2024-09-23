void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_6_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return NSRequestConcreteImplementation();
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_2_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_1_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return NSRequestConcreteImplementation();
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

double OUTLINED_FUNCTION_10()
{
  return CFAbsoluteTimeGetCurrent();
}

uint64_t _appleIDsDidChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_appleIDsDidChange");
}

void onKeybagLockStatusChange()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint8_t v3[16];

  AXLogPunctuationStorage();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1AF5CC000, v0, OS_LOG_TYPE_INFO, "Keybag lock status changed", v3, 2u);
  }

  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_initializeDatabaseStartup");

  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCloudKitHelpers");

}

void sub_1AF5CFC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
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

void sub_1AF5D01B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5D082C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5D0BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5D102C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5D23BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5D254C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5D2B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5D2D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *AXSSAccessibilityDescriptionForSymbolName(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(v3, "containsString:", CFSTR("wifi")) && MGGetBoolAnswer())
    {
      objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("wifi"), CFSTR("WLAN"));
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v6;
    }
    AXNSLocalizedStringForLocale();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "length") || objc_msgSend(v7, "isEqual:", CFSTR("__--__")))
    {
      AXNSLocalizedStringForLocale();
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "length") && (objc_msgSend(v7, "isEqual:", CFSTR("__--__")) & 1) == 0)
    v9 = v7;
  else
    v9 = &stru_1E5F9A110;

  return v9;
}

void AXSSLuminanceForColor(CGColor *a1)
{
  uint64_t i;
  double v2;
  double v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    AXSSColorGetRGBAComponents(a1, (uint64_t)v4);
    for (i = 0; i != 4; ++i)
    {
      v2 = *(double *)&v4[i];
      if (v2 <= 0.03928)
        v3 = v2 / 12.92;
      else
        v3 = pow((v2 + 0.055) / 1.055, 2.4);
      *(double *)&v4[i] = v3;
    }
  }
}

__n64 AXSSColorGetRGBAComponents(CGColor *a1, uint64_t a2)
{
  CGColorSpace *v4;
  CGContext *v5;
  __n64 result;
  uint64_t i;
  _BYTE data[4];
  CGRect v9;

  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v5 = CGBitmapContextCreate(data, 1uLL, 1uLL, 8uLL, 4uLL, v4, 5u);
  CGContextSetFillColorWithColor(v5, a1);
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 1.0;
  v9.size.height = 1.0;
  CGContextFillRect(v5, v9);
  CGContextRelease(v5);
  CGColorSpaceRelease(v4);
  for (i = 0; i != 4; ++i)
  {
    result.n64_u8[0] = data[i];
    result.n64_f64[0] = (float)((float)result.n64_u32[0] / 255.0);
    *(double *)(a2 + 8 * i) = result.n64_f64[0];
  }
  return result;
}

void AXSSContrastRatioForColor(CGColor *a1, CGColor *a2)
{
  AXSSLuminanceForColor(a1);
  AXSSLuminanceForColor(a2);
}

void AXSSRecommendedColorForColors(CGColor *a1, CGColor *a2, uint64_t a3, CFTypeRef *a4, CFTypeRef *a5, double a6)
{
  CFTypeRef *v7;
  CGColor *RecommendedColorIfNeeded;
  CGColor *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGColor *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33[5];

  v7 = a4;
  v33[4] = *(double *)MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (!a3 && a4)
  {
    RecommendedColorIfNeeded = (CGColor *)_findRecommendedColorIfNeeded(a1, a2, a6);
    if (!RecommendedColorIfNeeded)
      return;
    v12 = RecommendedColorIfNeeded;
    AXSSLuminanceForColor(RecommendedColorIfNeeded);
    v14 = v13;
    AXSSLuminanceForColor(a2);
    if (v15 <= v14)
      v16 = (v14 + 0.05) / (v15 + 0.05);
    else
      v16 = 1.0 / ((v14 + 0.05) / (v15 + 0.05));
    if (v16 < a6)
      goto LABEL_46;
    goto LABEL_20;
  }
  if (a3 == 1 && a5)
  {
    v17 = _findRecommendedColorIfNeeded(a2, a1, a6);
    if (!v17)
      return;
    v12 = (CGColor *)v17;
    AXSSLuminanceForColor(a1);
    v19 = v18;
    AXSSLuminanceForColor(v12);
    if (v20 <= v19)
      v21 = (v19 + 0.05) / (v20 + 0.05);
    else
      v21 = 1.0 / ((v19 + 0.05) / (v20 + 0.05));
    v7 = a5;
    if (v21 < a6)
      goto LABEL_46;
LABEL_20:
    *v7 = CGColorCreateCopy(v12);
LABEL_46:
    CFRelease(v12);
    return;
  }
  if (a3 == 2 && a4 && a5)
  {
    v12 = (CGColor *)_findRecommendedColorIfNeeded(a1, a2, a6);
    *v7 = CGColorCreateCopy(v12);
    AXSSLuminanceForColor(a2);
    v23 = v22;
    AXSSLuminanceForColor(v12);
    if (v24 <= v23)
      v25 = (v23 + 0.05) / (v24 + 0.05);
    else
      v25 = 1.0 / ((v23 + 0.05) / (v24 + 0.05));
    if (v25 < a6)
    {
      v26 = (CGColor *)_findRecommendedColorIfNeeded(a2, v12, a6);
      *a5 = CGColorCreateCopy(v26);
      AXSSLuminanceForColor(v26);
      v28 = v27;
      AXSSLuminanceForColor(v12);
      if (v29 <= v28)
        v30 = (v28 + 0.05) / (v29 + 0.05);
      else
        v30 = 1.0 / ((v28 + 0.05) / (v29 + 0.05));
      if (v30 <= a6)
      {
        if (*v7)
          CFRelease(*v7);
        if (*a5)
          CFRelease(*a5);
        AXSSColorGetRGBAComponents(v26, (uint64_t)v33);
        if (v33[0] >= 0.2)
          v31 = 1.0;
        else
          v31 = 0.0;
        if (v33[0] >= 0.2)
          v32 = 0.0;
        else
          v32 = 1.0;
        *a5 = CGColorCreateGenericGray(v31, 1.0);
        *v7 = CGColorCreateGenericGray(v32, 1.0);
      }
      if (v26)
        CFRelease(v26);
    }
    if (v12)
      goto LABEL_46;
  }
}

uint64_t _findRecommendedColorIfNeeded(CGColor *a1, CGColor *a2, double a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  void (**v10)(double, double);
  uint64_t *v11;
  CGColorRef Copy;
  const void *v13;
  uint64_t v14;
  _QWORD v16[9];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  AXSSLuminanceForColor(a1);
  v7 = v6;
  AXSSLuminanceForColor(a2);
  if (v8 <= v7)
    v9 = (v7 + 0.05) / (v8 + 0.05);
  else
    v9 = 1.0 / ((v7 + 0.05) / (v8 + 0.05));
  if (v9 >= a3)
    return 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ___findRecommendedColor_block_invoke;
  v16[3] = &unk_1E5F98E30;
  v16[6] = a1;
  v16[7] = a2;
  *(double *)&v16[8] = a3;
  v16[4] = &v17;
  v16[5] = &v21;
  v10 = (void (**)(double, double))MEMORY[0x1B5DF9920](v16);
  v10[2](1.0, 1.0);
  ((void (*)(void (**)(double, double), double, double))v10[2])(v10, -1.0, 0.0);
  ((void (*)(void (**)(double, double), double, double))v10[2])(v10, -1.0, -1.0);
  ((void (*)(void (**)(double, double), double, double))v10[2])(v10, 1.0, 0.0);
  ((void (*)(void (**)(double, double), double, double))v10[2])(v10, 0.0, 1.0);
  ((void (*)(void (**)(double, double), double, double))v10[2])(v10, 0.0, -1.0);
  v11 = v18;
  if (!v18[3])
  {
    Copy = CGColorCreateCopy((CGColorRef)v22[3]);
    v11 = v18;
    v18[3] = (uint64_t)Copy;
  }
  v13 = (const void *)v22[3];
  if (v13)
  {
    CFRelease(v13);
    v11 = v18;
  }
  v14 = v11[3];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v14;
}

void sub_1AF5D77E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

double *AXSSRgb2hsv(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;

  if (a4 >= a5)
    v6 = a5;
  else
    v6 = a4;
  if (a4 <= a5)
    v7 = a5;
  else
    v7 = a4;
  if (v6 >= a6)
    v6 = a6;
  if (v7 <= a6)
    v7 = a6;
  *a3 = v7;
  v8 = v7 - v6;
  if (v8 >= 0.00001)
  {
    if (v7 <= 0.0)
    {
      *a2 = 0.0;
      v9 = NAN;
    }
    else
    {
      *a2 = v8 / v7;
      if (v7 <= a4)
      {
        v12 = (a5 - a6) / v8;
      }
      else
      {
        v10 = v7 > a5;
        v11 = (a4 - a5) / v8 + 4.0;
        v12 = (a6 - a4) / v8 + 2.0;
        if (v10)
          v12 = v11;
      }
      v9 = v12 * 60.0;
      if (v9 < 0.0)
        v9 = v9 + 360.0;
    }
  }
  else
  {
    *a2 = 0.0;
    v9 = 0.0;
  }
  *result = v9;
  return result;
}

double *AXSSHsv2rgb(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (a5 <= 0.0)
  {
    *a3 = a6;
    *a2 = a6;
    *result = a6;
  }
  else
  {
    v6 = a4 / 60.0;
    v7 = vcvtmd_s64_f64(v6);
    v8 = v6 - (double)v7;
    v9 = (1.0 - a5) * a6;
    v10 = (1.0 - a5 * v8) * a6;
    v11 = (1.0 - a5 * (1.0 - v8)) * a6;
    switch(v7)
    {
      case 0:
        *result = a6;
        *a2 = v11;
        goto LABEL_7;
      case 1:
        *result = v10;
        *a2 = a6;
LABEL_7:
        *a3 = v9;
        return result;
      case 2:
        *result = v9;
        *a2 = a6;
        *a3 = v11;
        return result;
      case 3:
        *result = v9;
        *a2 = v10;
        goto LABEL_11;
      case 4:
        *result = v11;
        *a2 = v9;
LABEL_11:
        *a3 = a6;
        break;
      default:
        *result = a6;
        *a2 = v9;
        *a3 = v10;
        break;
    }
  }
  return result;
}

void ___findRecommendedColor_block_invoke(uint64_t a1, double a2, double a3)
{
  CGColor *v6;
  CGColorRef v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  const __CFString *v13;
  double v14;
  uint64_t i;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGColorSpace *v21;
  CGColorSpace *v22;
  double v23;
  double v24;
  double v25;
  CGColorRef Copy;
  uint64_t v27;
  CGColor *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGColor *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  const void *v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return;
  v6 = *(CGColor **)(a1 + 56);
  v39 = *(double *)(a1 + 64);
  AXSSColorGetRGBAComponents(*(CGColor **)(a1 + 48), (uint64_t)&v49);
  v47 = v50;
  v48 = v49;
  v40 = v52;
  v46 = v51;
  v44 = 0.0;
  v45 = 0.0;
  v43 = 0.0;
  AXSSRgb2hsv(&v45, &v44, &v43, v49, v50, v51);
  v7 = 0;
  v9 = v43;
  v8 = v44;
  v10 = 1.0;
  v11 = 1.0 - v44;
  if (a3 <= 0.0)
    v11 = v44;
  v42 = v11 / 70.0;
  v12 = 1.0 - v43;
  if (a2 <= 0.0)
    v12 = v43;
  v13 = (const __CFString *)*MEMORY[0x1E0C9DA10];
  v14 = 0.0;
  v41 = v12 / 70.0;
  for (i = 69; i; --i)
  {
    v8 = v8 + a3 * v42;
    v9 = v9 + a2 * v41;
    v43 = v9;
    v44 = v8;
    if (v9 < 0.0 || v9 > v10)
      break;
    if (v8 < 0.0 || v8 > v10)
      break;
    if (v7)
    {
      CFRelease(v7);
      v9 = v43;
      v8 = v44;
    }
    AXSSHsv2rgb(&v48, &v47, &v46, v45, v8, v9);
    v19 = v47;
    v18 = v48;
    v20 = v46;
    v21 = CGColorSpaceCreateWithName(v13);
    if (v21)
    {
      v22 = v21;
      components[0] = v18;
      components[1] = v19;
      components[2] = v20;
      components[3] = v40;
      v7 = CGColorCreate(v21, components);
      CFRelease(v22);
      if (v7)
      {
        AXSSLuminanceForColor(v7);
        v24 = v23;
        AXSSLuminanceForColor(v6);
        v10 = 1.0;
        if (v25 <= v24)
          v14 = (v24 + 0.05) / (v25 + 0.05);
        else
          v14 = 1.0 / ((v24 + 0.05) / (v25 + 0.05));
        if (v14 >= v39)
          goto LABEL_30;
        continue;
      }
    }
    else
    {
      v7 = 0;
    }
    v10 = 1.0;
  }
  if (!v7)
    return;
LABEL_30:
  if (v14 > *(double *)(a1 + 64))
  {
    Copy = CGColorCreateCopy(v7);
    v27 = *(_QWORD *)(a1 + 32);
    goto LABEL_43;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v28 = *(CGColor **)(a1 + 56);
    AXSSLuminanceForColor(v7);
    v30 = v29;
    AXSSLuminanceForColor(v28);
    if (v31 <= v30)
      v32 = (v30 + 0.05) / (v31 + 0.05);
    else
      v32 = 1.0 / ((v30 + 0.05) / (v31 + 0.05));
    v33 = *(CGColor **)(a1 + 56);
    AXSSLuminanceForColor(*(CGColor **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v35 = v34;
    AXSSLuminanceForColor(v33);
    if (v36 <= v35)
      v37 = (v35 + 0.05) / (v36 + 0.05);
    else
      v37 = 1.0 / ((v35 + 0.05) / (v36 + 0.05));
    if (v32 > v37)
    {
      v38 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v38)
        CFRelease(v38);
      goto LABEL_42;
    }
  }
  else
  {
LABEL_42:
    Copy = CGColorCreateCopy(v7);
    v27 = *(_QWORD *)(a1 + 40);
LABEL_43:
    *(_QWORD *)(*(_QWORD *)(v27 + 8) + 24) = Copy;
  }
  CFRelease(v7);
}

void sub_1AF5D8104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
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

void sub_1AF5D84F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5D86A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5D8FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
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

void sub_1AF5DB73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVMediaTypeMetadataObject()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAVMediaTypeMetadataObjectSymbolLoc_ptr;
  v7 = getAVMediaTypeMetadataObjectSymbolLoc_ptr;
  if (!getAVMediaTypeMetadataObjectSymbolLoc_ptr)
  {
    v1 = (void *)AVFoundationLibrary();
    v0 = (id *)dlsym(v1, "AVMediaTypeMetadataObject");
    v5[3] = (uint64_t)v0;
    getAVMediaTypeMetadataObjectSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

Class __getAVCaptureDeviceClass_block_invoke(uint64_t a1)
{
  Class result;

  AVFoundationLibrary();
  result = objc_getClass("AVCaptureDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAVCaptureDeviceClass_block_invoke_cold_1();
    return (Class)AVFoundationLibrary();
  }
  return result;
}

uint64_t AVFoundationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AVFoundationLibraryCore_frameworkLibrary)
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AVFoundationLibraryCore_frameworkLibrary;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1AF5DE468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

__CFString *AXSSLanguageConvertToCanonicalForm(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  CFArrayRef v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;

  v1 = AXSSLanguageToLocales_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&AXSSLanguageToLocales_onceToken, &__block_literal_global_119);
  v3 = (id)AXSSLanguageToLocales_LanguageToLangLocale;
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasPrefix:", CFSTR("zh")))
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Hant-"), &stru_1E5F9A110);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Hans-"), &stru_1E5F9A110);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_32;
    v8 = objc_msgSend(v4, "rangeOfString:", CFSTR("-"));
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
      goto LABEL_18;
    }
    v9 = v8;
    objc_msgSend(v4, "substringToIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", v9 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uppercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("-%@"), v12);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_32:
      if ((!objc_msgSend(v6, "isEqualToString:", CFSTR("zh"))
         || (-[__CFString hasPrefix:](v7, "hasPrefix:", CFSTR("zh")) & 1) == 0)
        && (!objc_msgSend(v6, "isEqualToString:", CFSTR("pt"))
         || (-[__CFString hasPrefix:](v7, "hasPrefix:", CFSTR("pt")) & 1) == 0)
        && (!objc_msgSend(v6, "isEqualToString:", CFSTR("fr"))
         || !-[__CFString hasPrefix:](v7, "hasPrefix:", CFSTR("fr"))))
      {
        goto LABEL_28;
      }
    }
LABEL_18:
    v13 = objc_msgSend(v6, "isEqualToString:", CFSTR("zh"));
    v14 = CFLocaleCopyPreferredLanguages();
    -[__CFArray firstObject](v14, "firstObject");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

      -[__CFString stringByReplacingOccurrencesOfString:withString:](v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-Hans"), &stru_1E5F9A110);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-Hant"), &stru_1E5F9A110);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if ((-[__CFString hasPrefix:](v15, "hasPrefix:", CFSTR("zh")) & 1) != 0)
      {
        v7 = v15;
LABEL_28:

        goto LABEL_29;
      }
      v7 = CFSTR("zh-CN");
    }
    else
    {

      if (v15)
      {
        -[__CFString lowercaseString](v15, "lowercaseString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          -[__CFString lowercaseString](v15, "lowercaseString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "hasPrefix:", v6);

          if (!v21)
            goto LABEL_27;
          v17 = v7;
          v7 = v15;
        }

      }
    }
LABEL_27:

    goto LABEL_28;
  }
  v7 = 0;
LABEL_29:

  return v7;
}

id AXSSLanguageCanonicalFormToGeneralLanguage(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  id v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(&unk_1E5FA87A0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(&unk_1E5FA87A0);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v1, "rangeOfString:", v6) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "rangeOfString:", v6));
          v7 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(&unk_1E5FA87A0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = v1;
LABEL_11:
  v8 = v7;

  return v8;
}

void sub_1AF5E1590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void sub_1AF5E4968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1AF5E4F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5E53D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1AF5E5874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1AF5E6888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5E7DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

id AXSSHumanReadableDescriptionForMotionTrackingFacialExpression(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_NONE");
      goto LABEL_13;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_BROWS_UP");
      goto LABEL_13;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_JAW_OPEN");
      goto LABEL_13;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_SMILE");
      goto LABEL_13;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_TONGUE_OUT");
      goto LABEL_13;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_EYE_BLINK");
      goto LABEL_13;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_NOSE_SNEER");
      goto LABEL_13;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_MOUTH_PUCKER_CENTER");
      goto LABEL_13;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_MOUTH_PUCKER_RIGHT");
      goto LABEL_13;
    case 9:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_MOUTH_PUCKER_LEFT");
LABEL_13:
      objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

id AXSSHumanReadableExplanationForMotionTrackingFacialExpression(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_EXPLANATION_BROWS_UP");
      goto LABEL_12;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_EXPLANATION_JAW_OPEN");
      goto LABEL_12;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_EXPLANATION_SMILE");
      goto LABEL_12;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_EXPLANATION_TONGUE_OUT");
      goto LABEL_12;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_EXPLANATION_EYE_BLINK");
      goto LABEL_12;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_EXPLANATION_NOSE_SNEER");
      goto LABEL_12;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_EXPLANATION_MOUTH_PUCKER_CENTER");
      goto LABEL_12;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_EXPLANATION_MOUTH_PUCKER_RIGHT");
      goto LABEL_12;
    case 9:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_EXPLANATION_MOUTH_PUCKER_LEFT");
LABEL_12:
      objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

id AXSSHumanReadableDescriptionForMotionTrackingFacialExpressionSensitivity(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_SENSITIVITY_HIGH");
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_SENSITIVITY_MED");
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_FACIAL_EXPRESSION_SENSITIVITY_LOW");
      break;
    default:
      v4 = 0;
      return v4;
  }
  objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AXSSHumanReadableDescriptionForMotionTrackingMode(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_MODE_ABSOLUTE");
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_MODE_JOYSTICK");
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_MODE_ACCELERATION");
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("AXMT_MODE_HID");
LABEL_7:
      objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

id AXSSHumanReadableExplanationForMotionTrackingMode(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  if (a1 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    v3 = CFSTR("AXMT_MODE_EXPLANATION_ACCELERATION");
  }
  else if (a1 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    v3 = CFSTR("AXMT_MODE_EXPLANATION_JOYSTICK");
  }
  else
  {
    if (a1)
    {
      v4 = 0;
      return v4;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    v3 = CFSTR("AXMT_MODE_EXPLANATION_ABSOLUTE");
  }
  objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AXSSHumanReadableDescriptionForMotionTrackingErrorCode(uint64_t a1)
{
  return AXSSHumanReadableDescriptionForMotionTrackingErrorCodeAndTrackingType(a1, 0);
}

id AXSSHumanReadableDescriptionForMotionTrackingErrorCodeAndTrackingType(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;

  switch(a1)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      v9 = CFSTR("AXMT_FAILURE_REASON_FACE_LOST");
      break;
    case 2:
    case 3:
      if (AXSSDeviceGetType() == 3)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "usesMetricSystem");

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          if (a2 == 3)
            v9 = CFSTR("AXMT_ON_DEVICE_EYE_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_METRIC_IPAD");
          else
            v9 = CFSTR("AXMT_HEAD_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_METRIC_IPAD");
        }
        else if (a2 == 3)
        {
          v9 = CFSTR("AXMT_ON_DEVICE_EYE_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_IPAD");
        }
        else
        {
          v9 = CFSTR("AXMT_HEAD_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_IPAD");
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "usesMetricSystem");

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          if (a2 == 3)
            v9 = CFSTR("AXMT_ON_DEVICE_EYE_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_METRIC");
          else
            v9 = CFSTR("AXMT_HEAD_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_METRIC");
        }
        else if (a2 == 3)
        {
          v9 = CFSTR("AXMT_ON_DEVICE_EYE_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA");
        }
        else
        {
          v9 = CFSTR("AXMT_HEAD_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA");
        }
      }
      goto LABEL_29;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2 == 3)
        v9 = CFSTR("AXMT_ON_DEVICE_EYE_TRACKING_FAILURE_REASON_FACE_MOVED_SIGNIFICANTLY");
      else
        v9 = CFSTR("AXMT_FAILURE_REASON_FACE_MOVED_SIGNIFICANTLY");
LABEL_29:
      v6 = v5;
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      v9 = CFSTR("AXMT_FAILURE_REASON_TOO_DARK");
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      v9 = CFSTR("AXMT_FAILURE_REASON_SENSOR_COVERED");
      break;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      v9 = CFSTR("AXMT_FAILURE_REASON_CAMERA_STOLEN");
      break;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      v9 = CFSTR("AXMT_FAILURE_REASON_DEVICE_IN_MOTION");
      break;
    case 11:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      v9 = CFSTR("AXMT_FAILURE_REASON_INITIALIZING");
      break;
    case 14:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      v9 = CFSTR("AXMT_FAILURE_REASON_HID_DEVICE_CONFIGURING");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      v9 = CFSTR("AXMT_FAILURE_REASON_UNDEFINED");
      break;
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v9, &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_1AF5ED10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF5EE870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1AF5EF124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5F101C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
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

void sub_1AF5F1E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXSSDeviceGetType()
{
  if (AXSSDeviceGetType__AXSSCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&AXSSDeviceGetType__AXSSCurrentDeviceTypeOnceToken, &__block_literal_global_11);
  return AXSSDeviceGetType__AXSSDeviceType;
}

BOOL AXSSDeviceFrontCameraPhysicallyMountedUpsideDown()
{
  return MGGetSInt32Answer() == 180;
}

id __AXSSCastAsClass(NSString *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  NSClassFromString(a1);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

uint64_t AXSSIsAppleInternalBuild()
{
  return os_variant_has_internal_ui();
}

id AXSSVoiceOverAvailableTextualContextIdentifiers()
{
  _QWORD v1[9];

  v1[8] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("AXSSVoiceOverTextualContextWordProcessing");
  v1[1] = CFSTR("AXSSVoiceOverTextualContextNarrative");
  v1[2] = CFSTR("AXSSVoiceOverTextualContextMessaging");
  v1[3] = CFSTR("AXSSVoiceOverTextualContextSocialMedia");
  v1[4] = CFSTR("AXSSVoiceOverTextualContextSpreadsheet");
  v1[5] = CFSTR("AXSSVoiceOverTextualContextFileSystem");
  v1[6] = CFSTR("AXSSVoiceOverTextualContextSourceCode");
  v1[7] = CFSTR("AXSSVoiceOverTextualContextConsole");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

id AXSSVoiceOverLocalizedNameForTextualContextIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextWordProcessing")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("punctuation.context.word.processing");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextNarrative")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("punctuation.context.reading");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextMessaging")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("punctuation.context.messaging");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextSourceCode")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("punctuation.context.source.code");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextSocialMedia")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("punctuation.context.social.media");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextSpreadsheet")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("punctuation.context.spreadsheet");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextConsole")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("punctuation.context.console");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextFileSystem")))
    {
      v5 = 0;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("punctuation.context.file.system");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v5;
}

const __CFString *AXSSVoiceOverSymbolNameForTextualContextIdentifier(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextWordProcessing")) & 1) != 0)
  {
    v2 = CFSTR("doc.text");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextNarrative")) & 1) != 0)
  {
    v2 = CFSTR("book");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextMessaging")) & 1) != 0)
  {
    v2 = CFSTR("message");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextSourceCode")) & 1) != 0)
  {
    v2 = CFSTR("curlybraces");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextSocialMedia")) & 1) != 0)
  {
    v2 = CFSTR("person.2");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextSpreadsheet")) & 1) != 0)
  {
    v2 = CFSTR("tablecells");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextConsole")) & 1) != 0)
  {
    v2 = CFSTR("terminal");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("AXSSVoiceOverTextualContextFileSystem")))
  {
    v2 = CFSTR("folder");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id getAVCaptureDeviceWasConnectedNotification()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAVCaptureDeviceWasConnectedNotificationSymbolLoc_ptr;
  v7 = getAVCaptureDeviceWasConnectedNotificationSymbolLoc_ptr;
  if (!getAVCaptureDeviceWasConnectedNotificationSymbolLoc_ptr)
  {
    v1 = (void *)AVFoundationLibrary_0();
    v0 = (id *)dlsym(v1, "AVCaptureDeviceWasConnectedNotification");
    v5[3] = (uint64_t)v0;
    getAVCaptureDeviceWasConnectedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getAVCaptureDeviceWasDisconnectedNotification()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAVCaptureDeviceWasDisconnectedNotificationSymbolLoc_ptr;
  v7 = getAVCaptureDeviceWasDisconnectedNotificationSymbolLoc_ptr;
  if (!getAVCaptureDeviceWasDisconnectedNotificationSymbolLoc_ptr)
  {
    v1 = (void *)AVFoundationLibrary_0();
    v0 = (id *)dlsym(v1, "AVCaptureDeviceWasDisconnectedNotification");
    v5[3] = (uint64_t)v0;
    getAVCaptureDeviceWasDisconnectedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getAVCaptureDeviceClass()
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
  v0 = (void *)getAVCaptureDeviceClass_softClass_0;
  v7 = getAVCaptureDeviceClass_softClass_0;
  if (!getAVCaptureDeviceClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAVCaptureDeviceClass_block_invoke_0;
    v3[3] = &unk_1E5F99048;
    v3[4] = &v4;
    __getAVCaptureDeviceClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AF5F40B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVMediaTypeVideo()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAVMediaTypeVideoSymbolLoc_ptr_0;
  v7 = getAVMediaTypeVideoSymbolLoc_ptr_0;
  if (!getAVMediaTypeVideoSymbolLoc_ptr_0)
  {
    v1 = (void *)AVFoundationLibrary_0();
    v0 = (id *)dlsym(v1, "AVMediaTypeVideo");
    v5[3] = (uint64_t)v0;
    getAVMediaTypeVideoSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_1AF5F47C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCameraSymbolLoc_ptr;
  v7 = getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCameraSymbolLoc_ptr)
  {
    v1 = (void *)AVFoundationLibrary_0();
    v0 = (id *)dlsym(v1, "AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera");
    v5[3] = (uint64_t)v0;
    getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCameraSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getAVCaptureDeviceTypeBuiltInWideAngleMetadataCamera()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAVCaptureDeviceTypeBuiltInWideAngleMetadataCameraSymbolLoc_ptr;
  v7 = getAVCaptureDeviceTypeBuiltInWideAngleMetadataCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInWideAngleMetadataCameraSymbolLoc_ptr)
  {
    v1 = (void *)AVFoundationLibrary_0();
    v0 = (id *)dlsym(v1, "AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera");
    v5[3] = (uint64_t)v0;
    getAVCaptureDeviceTypeBuiltInWideAngleMetadataCameraSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getAVCaptureDeviceTypeBuiltInWideAngleCamera()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr;
  v7 = getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr)
  {
    v1 = (void *)AVFoundationLibrary_0();
    v0 = (id *)dlsym(v1, "AVCaptureDeviceTypeBuiltInWideAngleCamera");
    v5[3] = (uint64_t)v0;
    getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_1AF5F54C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVFoundationLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!AVFoundationLibraryCore_frameworkLibrary_0)
    AVFoundationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = AVFoundationLibraryCore_frameworkLibrary_0;
  if (!AVFoundationLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAVCaptureDeviceClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AVFoundationLibrary_0();
  result = objc_getClass("AVCaptureDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAVCaptureDeviceClass_block_invoke_cold_1();
    return (Class)__getAVCaptureDeviceDiscoverySessionClass_block_invoke(v3);
  }
  return result;
}

Class __getAVCaptureDeviceDiscoverySessionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  AVFoundationLibrary_0();
  result = objc_getClass("AVCaptureDeviceDiscoverySession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceDiscoverySessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getAVCaptureDeviceDiscoverySessionClass_block_invoke_cold_1();
    return (Class)+[AXSSWordDescriptionManager sharedInstance](v3, v4);
  }
  return result;
}

void sub_1AF5F59B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF5F9FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24,id *a25,id *a26,id *a27,id *a28,id *a29,id *a30,id *a31,id *a32,id *a33,id *a34,id *a35,id *a36,id *a37,id *a38,id *a39,id *a40,id *a41,id *a42,id *a43,id *a44,id *a45,id *a46,id *a47,id *a48,id *a49,id *a50,id *a51,id *a52,id *a53,id *a54,id *a55,id *a56,id *a57,id *a58,id *a59,id *a60,id *a61,id *a62,id *location)
{
  id *v63;

  objc_destroyWeak(v63);
  objc_destroyWeak(location);
  objc_destroyWeak(a61);
  objc_destroyWeak(a62);
  objc_destroyWeak(a46);
  objc_destroyWeak(a47);
  objc_destroyWeak(a48);
  objc_destroyWeak(a49);
  objc_destroyWeak(a50);
  objc_destroyWeak(a51);
  objc_destroyWeak(a52);
  objc_destroyWeak(a53);
  objc_destroyWeak(a54);
  objc_destroyWeak(a55);
  objc_destroyWeak(a56);
  objc_destroyWeak(a57);
  objc_destroyWeak(a58);
  objc_destroyWeak(a59);
  objc_destroyWeak(a60);
  objc_destroyWeak(a45);
  objc_destroyWeak(a43);
  objc_destroyWeak(a44);
  objc_destroyWeak(a23);
  objc_destroyWeak(a24);
  objc_destroyWeak(a25);
  objc_destroyWeak(a26);
  objc_destroyWeak(a27);
  objc_destroyWeak(a28);
  objc_destroyWeak(a29);
  objc_destroyWeak(a30);
  objc_destroyWeak(a31);
  objc_destroyWeak(a32);
  objc_destroyWeak(a33);
  objc_destroyWeak(a34);
  objc_destroyWeak(a35);
  objc_destroyWeak(a36);
  objc_destroyWeak(a37);
  objc_destroyWeak(a38);
  objc_destroyWeak(a39);
  objc_destroyWeak(a40);
  objc_destroyWeak(a41);
  objc_destroyWeak(a42);
  objc_destroyWeak(a22);
  objc_destroyWeak(a21);
  objc_destroyWeak(a20);
  objc_destroyWeak(a19);
  objc_destroyWeak(a18);
  objc_destroyWeak(a17);
  objc_destroyWeak(a16);
  objc_destroyWeak(a15);
  objc_destroyWeak(a14);
  objc_destroyWeak(a13);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak(a9);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)&STACK[0x1308]);
  _Unwind_Resume(a1);
}

id AXSSLogForCategory(uint64_t a1)
{
  id v1;
  id v2;

  if (a1 < 4)
  {
    if (AXSSLogForCategory_onceToken != -1)
      dispatch_once(&AXSSLogForCategory_onceToken, &__block_literal_global_15);
    v1 = (id)AXSSLogForCategory_AllLogObjects[a1];
  }
  else
  {
    v1 = (id)MEMORY[0x1E0C81028];
    v2 = MEMORY[0x1E0C81028];
  }
  return v1;
}

void sub_1AF5FD21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1AF5FDBA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  _Block_object_dispose(&a20, 8);
  _Unwind_Resume(a1);
}

Class __getHIDManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HIDLibraryCore_frameworkLibrary)
  {
    HIDLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!HIDLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HIDManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHIDManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getHIDManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AF5FFEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF600A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF600DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF6012E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF601F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCPeerIDClass_block_invoke(uint64_t a1)
{
  Class result;

  MultipeerConnectivityLibrary();
  result = objc_getClass("MCPeerID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMCPeerIDClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMCPeerIDClass_block_invoke_cold_1();
    return (Class)MultipeerConnectivityLibrary();
  }
  return result;
}

uint64_t MultipeerConnectivityLibrary()
{
  uint64_t v0;
  void *v2;

  if (!MultipeerConnectivityLibraryCore_frameworkLibrary)
    MultipeerConnectivityLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = MultipeerConnectivityLibraryCore_frameworkLibrary;
  if (!MultipeerConnectivityLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getMCSessionClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  MultipeerConnectivityLibrary();
  result = objc_getClass("MCSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMCSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getMCSessionClass_block_invoke_cold_1();
    return (Class)__getMCNearbyServiceBrowserClass_block_invoke(v3);
  }
  return result;
}

Class __getMCNearbyServiceBrowserClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  MultipeerConnectivityLibrary();
  result = objc_getClass("MCNearbyServiceBrowser");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMCNearbyServiceBrowserClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getMCNearbyServiceBrowserClass_block_invoke_cold_1();
    return (Class)__getMCNearbyServiceAdvertiserClass_block_invoke(v3);
  }
  return result;
}

void __getMCNearbyServiceAdvertiserClass_block_invoke(uint64_t a1)
{
  MultipeerConnectivityLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MCNearbyServiceAdvertiser");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMCNearbyServiceAdvertiserClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_12();
  }
}

uint64_t userAuthDidChange(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "userAuthChanged");
  return result;
}

void sub_1AF6060E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

void *__getkSBSLockStateNotifyKeySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "kSBSLockStateNotifyKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getkSBSLockStateNotifyKeySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getAVCaptureDeviceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[NSDictionary(ClassChecking) axssDecodeBoolForKey:].cold.1(v0);
}

uint64_t __getAVCaptureDeviceDiscoverySessionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXSSPunctuationEntryCloudKitHelper clearRecordsForPurging:].cold.1(v0);
}

uint64_t __getHIDManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXSSActionManager goToNextElementOfType:].cold.1(v0);
}

uint64_t __getMCPeerIDClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMCSessionClass_block_invoke_cold_1(v0);
}

uint64_t __getMCSessionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMCNearbyServiceBrowserClass_block_invoke_cold_1(v0);
}

uint64_t __getMCNearbyServiceBrowserClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1(v0);
}

id __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1()
{
  void *v0;
  SEL v1;

  v0 = (void *)abort_report_np();
  return +[AXSSDatabaseManager sharedDatabase](v0, v1);
}

uint64_t AXCPSharedResourcesDirectory()
{
  return MEMORY[0x1E0DDD460]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1E0CF31F8]();
}

uint64_t AXLogPunctuationStorage()
{
  return MEMORY[0x1E0CF3270]();
}

uint64_t AXNSLocalizedStringForLocale()
{
  return MEMORY[0x1E0DDD480]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x1E0C98790]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BC80](color);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCA0](gray, alpha);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

uint64_t FKALogCommon()
{
  return MEMORY[0x1E0CF3918]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1E0D33DE0]();
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB658](*(_QWORD *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
  MEMORY[0x1E0CBB670](*(_QWORD *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1E0CBB6C8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1E0CBB8F0](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x1E0CBB910](*(_QWORD *)&entry, plane, *(_QWORD *)&options, iterator);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t NLLanguageIdentifierConsumeString()
{
  return MEMORY[0x1E0D17080]();
}

uint64_t NLLanguageIdentifierCreate()
{
  return MEMORY[0x1E0D17088]();
}

uint64_t NLLanguageIdentifierGetTopHypotheses()
{
  return MEMORY[0x1E0D17090]();
}

uint64_t NLLanguageIdentifierReset()
{
  return MEMORY[0x1E0D170B8]();
}

uint64_t NLLanguageIdentifierSetLanguageHints()
{
  return MEMORY[0x1E0D170C8]();
}

uint64_t NLTaggerCopyTagForCurrentToken()
{
  return MEMORY[0x1E0D17248]();
}

uint64_t NLTaggerCreate()
{
  return MEMORY[0x1E0D17250]();
}

uint64_t NLTaggerEnumerateTokens()
{
  return MEMORY[0x1E0D17258]();
}

uint64_t NLTaggerSetString()
{
  return MEMORY[0x1E0D17278]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x1E0CB29B8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t SFAppleIDCommonNameForCertificate()
{
  return MEMORY[0x1E0D97498]();
}

uint64_t SFAppleIDVerifyCertificateChain()
{
  return MEMORY[0x1E0D974A0]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1E0CD6218](*(_QWORD *)&status, reserved);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1E0CD6270](identityRef, certificateRef);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x1E0CD64D8]();
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1E0CD6648](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1E0CD66E0](trust);
}

uint64_t _AXSKeyRepeatDelay()
{
  return MEMORY[0x1E0DDD9D8]();
}

uint64_t _AXSMossdeepEnabled()
{
  return MEMORY[0x1E0DDDA68]();
}

uint64_t _AppleIDAuthenticationCopyAppleIDs()
{
  return MEMORY[0x1E0CA59A0]();
}

uint64_t _AppleIDAuthenticationCopyCertificateInfo()
{
  return MEMORY[0x1E0CA59A8]();
}

uint64_t _AppleIDCopySecIdentityForAppleIDAccount()
{
  return MEMORY[0x1E0CA59B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1E0DE69E0]();
}

