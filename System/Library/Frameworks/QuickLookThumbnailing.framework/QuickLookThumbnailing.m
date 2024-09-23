id _log()
{
  void *v0;

  v0 = (void *)qword_1ED10E720;
  if (!qword_1ED10E720)
  {
    QLTInitLogging();
    v0 = (void *)qword_1ED10E720;
  }
  return v0;
}

id _log_0()
{
  void *v0;

  v0 = (void *)qltLogHandles;
  if (!qltLogHandles)
  {
    QLTInitLogging();
    v0 = (void *)qltLogHandles;
  }
  return v0;
}

id _log_1()
{
  void *v0;

  v0 = (void *)qword_1ED10E718;
  if (!qword_1ED10E718)
  {
    QLTInitLogging();
    v0 = (void *)qword_1ED10E718;
  }
  return v0;
}

id _log_2()
{
  void *v0;

  v0 = (void *)qword_1ED10E738;
  if (!qword_1ED10E738)
  {
    QLTInitLogging();
    v0 = (void *)qword_1ED10E738;
  }
  return v0;
}

CGImageRef QLImageCreateForDefaultThumbnailGenerationFromData(void *a1)
{
  id v1;
  void *v2;
  const __CFData *v3;
  CGDataProvider *v4;
  size_t v5;
  size_t v6;
  size_t v7;
  size_t v8;
  size_t v9;
  CGColorSpace *v10;
  CGImageRef v11;
  size_t v12;
  size_t v13;
  size_t v14;
  size_t v15;
  size_t v16;
  CGColorSpace *v17;
  size_t v18;
  size_t v19;
  size_t v20;
  size_t v21;
  size_t v22;
  CGColorSpace *v23;

  v1 = a1;
  objc_msgSend(v1, "format");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "data");
  v3 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  v4 = CGDataProviderCreateWithCFData(v3);
  v5 = objc_msgSend(v2, "width");
  v6 = objc_msgSend(v2, "height");
  v7 = objc_msgSend(v2, "bitsPerComponent");
  v8 = objc_msgSend(v2, "bitsPerPixel");
  v9 = objc_msgSend(v2, "bytesPerRow");
  v10 = (CGColorSpace *)objc_msgSend(v2, "colorSpace");
  if (!v10)
    v10 = CGColorSpaceCreateDeviceRGB();
  v11 = CGImageCreate(v5, v6, v7, v8, v9, v10, objc_msgSend(v2, "bitmapInfo"), v4, 0, 1, kCGRenderingIntentDefault);
  if (!v11)
  {
    v12 = objc_msgSend(v2, "width");
    v13 = objc_msgSend(v2, "height");
    v14 = objc_msgSend(v2, "bitsPerComponent");
    v15 = objc_msgSend(v2, "bitsPerPixel");
    v16 = objc_msgSend(v2, "bytesPerRow");
    v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D900]);
    v11 = CGImageCreate(v12, v13, v14, v15, v16, v17, objc_msgSend(v2, "bitmapInfo"), v4, 0, 1, kCGRenderingIntentDefault);
    if (!v11)
    {
      v18 = objc_msgSend(v2, "width");
      v19 = objc_msgSend(v2, "height");
      v20 = objc_msgSend(v2, "bitsPerComponent");
      v21 = objc_msgSend(v2, "bitsPerPixel");
      v22 = objc_msgSend(v2, "bytesPerRow");
      v23 = CGColorSpaceCreateDeviceGray();
      v11 = CGImageCreate(v18, v19, v20, v21, v22, v23, objc_msgSend(v2, "bitmapInfo"), v4, 0, 1, kCGRenderingIntentDefault);
    }
  }
  if (v4)
    CGDataProviderRelease(v4);

  return v11;
}

void QLTInitLogging()
{
  if (QLTInitLogging_once != -1)
    dispatch_once(&QLTInitLogging_once, &__block_literal_global_11);
}

void sub_1AE3F7A44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE3F8074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3F8308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t QLTSandboxWrapperForParentURLOf()
{
  return 0;
}

void sub_1AE3F9E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFPSandboxingURLWrapperClass()
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
  v0 = (void *)getFPSandboxingURLWrapperClass_softClass;
  v7 = getFPSandboxingURLWrapperClass_softClass;
  if (!getFPSandboxingURLWrapperClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getFPSandboxingURLWrapperClass_block_invoke;
    v3[3] = &unk_1E5D7C1B8;
    v3[4] = &v4;
    __getFPSandboxingURLWrapperClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AE3F9F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id QLTImageClassWithError(_QWORD *a1)
{
  if (QLTImageClassWithError_once != -1)
    dispatch_once(&QLTImageClassWithError_once, &__block_literal_global_5);
  if (!QLTImageClassWithError_ImageClass)
  {
    NSLog(CFSTR("[QL ERROR] You need to load UIKit in your process to access the thumbnail URL properties"));
    if (a1)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 103, 0);
      *a1 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return (id)QLTImageClassWithError_ImageClass;
}

void sub_1AE3FC0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1AE3FC608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE3FCD04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void setErrorWrappingUnderlyingError(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  if (a4)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    if (v7)
    {
      v11 = *MEMORY[0x1E0CB3388];
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v8, a3, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)

  }
}

Class __getFPSandboxingURLWrapperClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  FileProviderLibrary();
  result = objc_getClass("FPSandboxingURLWrapper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFPSandboxingURLWrapperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getFPSandboxingURLWrapperClass_block_invoke_cold_1();
    return (Class)__98__QLThumbnailGenerator_generateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke(v3);
  }
  return result;
}

uint64_t FileProviderLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = FileProviderLibraryCore_frameworkLibrary;
  v6 = FileProviderLibraryCore_frameworkLibrary;
  if (!FileProviderLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E5D7CDE8;
    v8 = *(_OWORD *)&off_1E5D7CDF8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    FileProviderLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AE3FD15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t FileProviderLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = FileProviderLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1AE3FDC14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t QLCompareVersion(const __CFString *a1, const __CFString *cf)
{
  CFTypeID v4;
  CFTypeID v5;
  CFTypeID TypeID;
  BOOL v8;
  uint64_t v9;
  CFIndex Length;
  uint64_t v11;
  uint64_t v12;
  UniChar *v13;
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFIndex v20;
  uint64_t v21;
  uint64_t v22;
  UniChar *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int16 *v29;
  uint64_t v30;
  int v31;
  int v32;
  unsigned __int16 *v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  UniChar v38[100];
  uint64_t v39;
  CFRange v40;
  CFRange v41;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v8 = cf == 0;
    v9 = 1;
    goto LABEL_9;
  }
  if (!cf)
    return 1;
  v4 = CFGetTypeID(cf);
  v5 = CFGetTypeID(cf);
  TypeID = CFStringGetTypeID();
  if (v4 != TypeID)
  {
    v8 = v5 == TypeID;
    v9 = -1;
LABEL_9:
    if (v8)
      return v9;
    else
      return -v9;
  }
  if (v5 != v4)
    return 1;
  if (CFEqual(a1, cf))
    return 0;
  Length = CFStringGetLength(a1);
  if ((unint64_t)(Length - 101) < 0xFFFFFFFFFFFFFF9CLL)
  {
    v11 = 0;
LABEL_25:
    v16 = 0;
    goto LABEL_26;
  }
  v12 = Length;
  v13 = v38;
  v40.location = 0;
  v40.length = Length;
  CFStringGetCharacters(a1, v40, v38);
  v11 = 0;
  while (1)
  {
    v14 = *v13;
    if (v14 - 58 < 0xFFFFFFF6)
      break;
    v11 = v14 - 48 + 10 * v11;
    ++v13;
    v15 = v12-- <= 1;
    if (v15)
      goto LABEL_25;
  }
  if (v14 == 46)
  {
    if ((unint64_t)v12 < 2)
      goto LABEL_25;
    v16 = 0;
    ++v13;
    while (1)
    {
      v17 = v12 - 1;
      v14 = *v13;
      if (v14 - 58 < 0xFFFFFFF6)
        break;
      v16 = v14 - 48 + 10 * v16;
      ++v13;
      --v12;
      if ((unint64_t)(v17 + 1) <= 2)
        goto LABEL_26;
    }
    if (v14 == 46)
    {
      if ((unint64_t)v12 < 3)
      {
LABEL_26:
        v18 = 0;
LABEL_27:
        v14 = 0;
        goto LABEL_28;
      }
      v18 = 0;
      v12 -= 2;
      ++v13;
      while (1)
      {
        v14 = *v13;
        if (v14 - 58 < 0xFFFFFFF6)
          break;
        v18 = v14 - 48 + 10 * v18;
        ++v13;
        v15 = v12-- <= 1;
        if (v15)
          goto LABEL_27;
      }
    }
    else
    {
      v18 = 0;
      --v12;
    }
  }
  else
  {
    v18 = 0;
    v16 = 0;
  }
  if (v12 < 2)
  {
LABEL_28:
    v19 = 0;
    goto LABEL_29;
  }
  v19 = 0;
  v29 = v13 + 1;
  v30 = v12 + 1;
  do
  {
    v32 = *v29++;
    v31 = v32;
    if ((v32 - 58) < 0xFFFFFFF6)
      break;
    v19 = (v31 - 48) + 10 * v19;
    --v30;
  }
  while (v30 > 2);
LABEL_29:
  v20 = CFStringGetLength(cf);
  if ((unint64_t)(v20 - 101) < 0xFFFFFFFFFFFFFF9CLL)
  {
    v21 = 0;
LABEL_42:
    v25 = 0;
    goto LABEL_43;
  }
  v22 = v20;
  v23 = v38;
  v41.location = 0;
  v41.length = v20;
  CFStringGetCharacters(cf, v41, v38);
  v21 = 0;
  while (1)
  {
    v24 = *v23;
    if (v24 - 58 < 0xFFFFFFF6)
      break;
    v21 = v24 - 48 + 10 * v21;
    ++v23;
    v15 = v22-- <= 1;
    if (v15)
      goto LABEL_42;
  }
  if (v24 == 46)
  {
    if ((unint64_t)v22 < 2)
      goto LABEL_42;
    v25 = 0;
    ++v23;
    while (1)
    {
      v26 = v22 - 1;
      v24 = *v23;
      if (v24 - 58 < 0xFFFFFFF6)
        break;
      v25 = v24 - 48 + 10 * v25;
      ++v23;
      --v22;
      if ((unint64_t)(v26 + 1) <= 2)
        goto LABEL_43;
    }
    if (v24 == 46)
    {
      if ((unint64_t)v22 < 3)
      {
LABEL_43:
        v27 = 0;
LABEL_44:
        v24 = 0;
        goto LABEL_45;
      }
      v27 = 0;
      v22 -= 2;
      ++v23;
      while (1)
      {
        v37 = *v23;
        if ((v37 - 58) < 0xFFFFFFF6)
          break;
        v27 = (v37 - 48) + 10 * v27;
        ++v23;
        v15 = v22-- <= 1;
        if (v15)
          goto LABEL_44;
      }
      v24 = *v23;
    }
    else
    {
      v27 = 0;
      --v22;
    }
  }
  else
  {
    v27 = 0;
    v25 = 0;
  }
  if (v22 >= 2)
  {
    v28 = 0;
    v33 = v23 + 1;
    v34 = v22 + 1;
    do
    {
      v36 = *v33++;
      v35 = v36;
      if ((v36 - 58) < 0xFFFFFFF6)
        break;
      v28 = (v35 - 48) + 10 * v28;
      --v34;
    }
    while (v34 > 2);
    goto LABEL_46;
  }
LABEL_45:
  v28 = 0;
LABEL_46:
  if (v11 > v21)
    return 1;
  if (v11 < v21)
    return -1;
  if (v16 > v25)
    return 1;
  if (v16 < v25)
    return -1;
  if (v18 > v27)
    return 1;
  if (v18 < v27)
    return -1;
  if (v14 > v24)
    return 1;
  if (v14 < v24)
    return -1;
  if (v19 > v28)
    return 1;
  if (v19 >= v28)
    return 0;
  else
    return -1;
}

void sub_1AE3FF52C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE3FF5BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE3FF62C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE3FF898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AE3FF964(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE3FFAC8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

Class __getFPItemIDClass_block_invoke(uint64_t a1)
{
  Class result;

  FileProviderLibrary();
  result = objc_getClass("FPItemID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFPItemIDClass_block_invoke_cold_1();
  getFPItemIDClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

Class __getFPItemClass_block_invoke(uint64_t a1)
{
  Class result;

  FileProviderLibrary();
  result = objc_getClass("FPItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFPItemClass_block_invoke_cold_1();
  getFPItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1AE40171C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1AE401C14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE4020AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_1AE402EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AE403044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1AE403D54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE404258(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t ql_external_thumbnail_cache_create_tables_initial(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if (objc_msgSend(v3, "execute:", CFSTR("CREATE TABLE thumbnails( fpitemId TEXT NOT NULL, versionId BLOB NOT NULL, last_hit_date INTEGER NOT NULL, size INTEGER NOT NULL, file_extension TEXT NOT NULL, PRIMARY KEY (fpitemId))"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX last_hit_date ON thumbnails (last_hit_date)")))
  {
    v4 = objc_msgSend(v3, "setUserVersion:", 1);
    if (!a2)
      goto LABEL_8;
  }
  else
  {
    v4 = 0;
    if (!a2)
      goto LABEL_8;
  }
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v3, "lastError");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v4;
}

void sub_1AE404C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE404F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE4050E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE405228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE405390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE4055BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1AE405960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE405DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_1AE4065FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE40674C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE406938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1AE406B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1AE407238(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE40751C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE4075EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1AE4088AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t QLIconAutoDisplayExtension(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = QLIconAutoDisplayExtension_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&QLIconAutoDisplayExtension_onceToken, &__block_literal_global_5);
  v3 = QLSetContainsContentType((void *)QLIconAutoDisplayExtension_autoDisplayExtensionUTIs, v2);

  return v3;
}

void sub_1AE4099A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE409B10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE409FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1AE40AA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE40BF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1AE40CAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
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

void sub_1AE40CDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AE40CFC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE40DEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CloudDocsLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CloudDocsLibraryCore_frameworkLibrary)
    CloudDocsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CloudDocsLibraryCore_frameworkLibrary;
  if (!CloudDocsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1AE40F584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose((const void *)(v17 - 176), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE410094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _QLCopyResourcePropertyForKey(void *a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _log_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = a1;
    _os_log_impl(&dword_1AE3F5000, v8, OS_LOG_TYPE_INFO, "Getting NSURL thumbnails property for %@", buf, 0xCu);
  }

  v9 = a2;
  v10 = *MEMORY[0x1E0C99AB8];
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C99AB8]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("QLUnsupportedURLKey"), CFSTR("QuickLook only handles NSURLThumbnailDictionaryKey and, on OS X, NSURLThumbnailKey"), 0);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_exception_throw(v21);
  }
  v22 = 0;
  +[QLThumbnailAddition thumbnailsDictionaryForURL:error:](QLThumbnailAddition, "thumbnailsDictionaryForURL:error:", a1, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;
  if (a3)
  {
    v13 = v11;
    if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) == 0)
    {
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0C998A8]);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v14;
    }
    *a3 = v13;
  }
  if (v11)
    goto LABEL_9;
  if (!v12)
  {
    _log_0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = a1;
      _os_log_impl(&dword_1AE3F5000, v20, OS_LOG_TYPE_INFO, "Returning empty thumbnails dictionary for %@", buf, 0xCu);
    }

LABEL_9:
    v15 = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v12, "code") == 2
    && (objc_msgSend(v12, "domain"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB2FE0]),
        v17,
        v18))
  {
    _log_0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v12;
      v25 = 2112;
      v26 = a1;
      _os_log_impl(&dword_1AE3F5000, v19, OS_LOG_TYPE_INFO, "Hit error %@ retrieving the thumbnails property for %@. This is expected if this is a logical URL corresponding to a sidefault.", buf, 0x16u);
    }
  }
  else
  {
    _log_0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      _QLCopyResourcePropertyForKey_cold_1();
  }

  v15 = 0;
  if (a4)
    *a4 = v12;
LABEL_10:

  return v15;
}

BOOL _QLSetResourcePropertyForKey(uint64_t a1, void *a2, const void *a3, _QWORD *a4)
{
  NSObject *v8;
  id v9;
  CFTypeID v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _log_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = a1;
    _os_log_impl(&dword_1AE3F5000, v8, OS_LOG_TYPE_INFO, "Setting NSURL thumbnails property for %@", buf, 0xCu);
  }

  v9 = a2;
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C99AB8]))
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = CFSTR("QLUnsupportedURLKey");
    v17 = CFSTR("QuickLook only handles NSURLThumbnailsKey");
    goto LABEL_12;
  }
  if (a3)
  {
    if ((const void *)*MEMORY[0x1E0C9B0D0] != a3)
    {
      v10 = CFGetTypeID(a3);
      if (v10 != CFDictionaryGetTypeID())
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = CFSTR("QLThumbnailInvalidFormat");
        v17 = CFSTR("The value for the NSURL thumbnails key should be a dictionary where keys are dimensions and values are NSImage / UIImage instances");
LABEL_12:
        objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v17, 0);
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_exception_throw(v18);
      }
    }
  }
  v19 = 0;
  v11 = +[QLThumbnailAddition setThumbnailsDictionary:forURL:error:](QLThumbnailAddition, "setThumbnailsDictionary:forURL:error:", a3, a1, &v19);
  v12 = v19;
  v13 = v12;
  if (a4)
    *a4 = v12;

  return v11;
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

const __CFString *QLThumbnailRepresentationTypeToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Icon");
  if (a1 == 1)
    v1 = CFSTR("LowQualityThumbnail");
  if (a1 == 2)
    return CFSTR("Thumbnail");
  else
    return v1;
}

void sub_1AE411E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE412038(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id errorWithCodeAndUnderlyingError(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  if (a2)
  {
    v9 = *MEMORY[0x1E0CB3388];
    v10[0] = a2;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a2;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("QLExternalThumbnailCache"), a1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("QLExternalThumbnailCache"), a1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void sub_1AE414250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL QLGetRealPath(const char *a1, _BYTE *a2)
{
  int v3;
  int v4;
  NSObject *v6;
  NSObject *v7;

  v3 = open(a1, 0x8000, 0);
  if (v3 < 0)
  {
    _log_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      QLGetRealPath_cold_1();

  }
  else
  {
    v4 = v3;
    if (fcntl(v3, 50, a2) != -1)
    {
      close(v4);
      return *a2 != 0;
    }
    _log_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      QLGetRealPath_cold_2();

    close(v4);
  }
  return 0;
}

uint64_t QLTPrefersExtendedRange()
{
  if (QLTPrefersExtendedRange_onceToken != -1)
    dispatch_once(&QLTPrefersExtendedRange_onceToken, &__block_literal_global_10);
  return QLTPrefersExtendedRange_supportsDeepColor;
}

uint64_t _QLComputeValuesForCGContextCreationWithSizeAndScale(_DWORD *a1, _DWORD *a2, int *a3, _DWORD *a4, int *a5, _QWORD *a6, CGColorSpaceRef space, double a8, double a9, double a10)
{
  int NumberOfComponents;
  _BOOL4 v21;
  _BOOL4 v22;
  int v23;
  int Type;
  BOOL v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t result;
  int v33;

  NumberOfComponents = CGColorSpaceGetNumberOfComponents(space);
  v21 = CGColorSpaceUsesExtendedRange(space);
  v22 = v21;
  v23 = 16;
  if (NumberOfComponents != 1 || !v21)
  {
    if (CGColorSpaceIsWideGamutRGB(space))
      v23 = 16;
    else
      v23 = 8;
  }
  *a1 = vcvtpd_s64_f64(a8 * a10);
  *a2 = vcvtpd_s64_f64(a9 * a10);
  *a3 = v23;
  Type = CGColorSpaceGetType();
  v27 = (Type == 6 || Type == 10) && NumberOfComponents == 4 || NumberOfComponents == 1;
  v28 = !v27;
  if (v27)
    v29 = NumberOfComponents;
  else
    v29 = NumberOfComponents + 1;
  if (Type == 2)
    v30 = 0;
  else
    v30 = v28;
  if (Type == 2)
    v31 = NumberOfComponents;
  else
    v31 = v29;
  *a4 = *a3 * v31;
  result = CGBitmapGetAlignedBytesPerRow();
  *a6 = result;
  if (v22)
    v33 = 4352;
  else
    v33 = 0;
  *a5 = v30 | v33;
  return result;
}

CGContext *QLTCreateCGContext(int a1, int a2, int a3, size_t *a4, double a5, double a6, double a7)
{
  uint64_t *v12;

  if (!a1)
    goto LABEL_9;
  if (!a2)
    goto LABEL_6;
  if (QLTPrefersExtendedRange_onceToken != -1)
    dispatch_once(&QLTPrefersExtendedRange_onceToken, &__block_literal_global_10);
  if (QLTPrefersExtendedRange_supportsDeepColor)
  {
LABEL_6:
    if (ExtendedSRGBColorSpace_onceToken != -1)
      dispatch_once(&ExtendedSRGBColorSpace_onceToken, &__block_literal_global_14);
    v12 = &ExtendedSRGBColorSpace_extendedSRGBColorSpace;
  }
  else
  {
LABEL_9:
    if (StandardSRGBColorSpace_onceToken != -1)
      dispatch_once(&StandardSRGBColorSpace_onceToken, &__block_literal_global_15);
    v12 = &StandardSRGBColorSpace_standardSRGBColorSpace;
  }
  return QLTCreateCGContextWithSize((CGColorSpaceRef)*v12, a3, a4, a5, a6, a7);
}

CGContext *QLTCreateCGContextWithSize(CGColorSpaceRef a1, int a2, size_t *a3, double a4, double a5, double a6)
{
  CGColorSpace *v9;
  uint64_t *v12;
  size_t v13;
  size_t v14;
  NSObject *v16;
  CGContext *v17;
  size_t v18;
  size_t v19;
  void *v20;
  CGContext *v21;
  size_t v23;
  uint32_t bitmapInfo;
  size_t bitsPerComponent;
  uint64_t v26;
  CGRect v27;

  v9 = a1;
  if (!a1)
  {
    if (QLTPrefersExtendedRange_onceToken != -1)
      dispatch_once(&QLTPrefersExtendedRange_onceToken, &__block_literal_global_10);
    if (QLTPrefersExtendedRange_supportsDeepColor)
    {
      if (ExtendedSRGBColorSpace_onceToken != -1)
        dispatch_once(&ExtendedSRGBColorSpace_onceToken, &__block_literal_global_14);
      v12 = &ExtendedSRGBColorSpace_extendedSRGBColorSpace;
    }
    else
    {
      if (StandardSRGBColorSpace_onceToken != -1)
        dispatch_once(&StandardSRGBColorSpace_onceToken, &__block_literal_global_15);
      v12 = &StandardSRGBColorSpace_standardSRGBColorSpace;
    }
    v9 = (CGColorSpace *)*v12;
  }
  if (CGColorSpaceUsesITUR_2100TF(v9))
  {
    if (DisplayP3_onceToken != -1)
      dispatch_once(&DisplayP3_onceToken, &__block_literal_global_16);
    v9 = (CGColorSpace *)DisplayP3_displayP3ColorSpace;
  }
  bitsPerComponent = 0;
  v26 = 0;
  bitmapInfo = 0;
  v23 = 0;
  _QLComputeValuesForCGContextCreationWithSizeAndScale((_DWORD *)&v26 + 1, &v26, (int *)&bitsPerComponent + 1, &bitsPerComponent, (int *)&bitmapInfo, &v23, v9, a4, a5, a6);
  v14 = v26;
  v13 = HIDWORD(v26);
  if (SHIDWORD(v26) < 1 || (int)v26 <= 0)
  {
    _log_0();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      QLTCreateCGContextWithSize_cold_1(v13, v14, v16);

    return 0;
  }
  else
  {
    v18 = v23;
    if (a2)
    {
      v19 = (*MEMORY[0x1E0C85AD8] + v23 * v26 - 1) & -*MEMORY[0x1E0C85AD8];
      *a3 = v19;
      v20 = mmap(0, v19, 3, 4097, 1627389952, 0);
    }
    else
    {
      v20 = 0;
      if (a3)
        *a3 = v23 * v26;
    }
    v21 = CGBitmapContextCreate(v20, v13, v14, SHIDWORD(bitsPerComponent), v18, v9, bitmapInfo);
    v17 = v21;
    if (v21)
    {
      v27.size.width = (double)(int)v13;
      v27.size.height = (double)(int)v14;
      v27.origin.x = 0.0;
      v27.origin.y = 0.0;
      CGContextClearRect(v21, v27);
    }
  }
  return v17;
}

id QLTGetDefaultCacheLocation()
{
  void *v0;
  void *v1;
  void *v2;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectAtIndexedSubscript:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("com.apple.QuickLook.thumbnailcache"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

CGImage *QLCGImageRefPNGRepresentation(CGImage *a1)
{
  CGImage *v1;
  __CFData *v2;
  __CFString *v3;
  CGImageDestination *v4;
  _BOOL4 v5;
  __CFData *v6;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v2 = (__CFData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v4 = CGImageDestinationCreateWithData(v2, v3, 1uLL, 0);

    if (v4)
    {
      CGImageDestinationAddImage(v4, v1, 0);
      v5 = CGImageDestinationFinalize(v4);
      CFRelease(v4);
      if (v5)
        v6 = v2;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v1 = v6;

  }
  return v1;
}

void QLTRunInMainThreadAsync(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (!v1)
    QLTRunInMainThreadAsync_cold_1();
  block = v1;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void QLTRunInMainThreadSync(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (!v1)
    QLTRunInMainThreadSync_cold_1();
  block = v1;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    block[2]();
  else
    dispatch_sync(MEMORY[0x1E0C80D38], block);

}

uint64_t QLSetContainsContentType(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    pthread_mutex_lock(&QLSetContainsContentType_lock);
    if ((objc_msgSend(v3, "containsObject:", v5) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "allObjects");
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v8 = *(_QWORD *)v12;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v7);
            if (objc_msgSend(v5, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
            {
              if ((objc_msgSend(v5, "isDynamic") & 1) == 0)
                objc_msgSend(v3, "addObject:", v5);
              v6 = 1;
              goto LABEL_17;
            }
          }
          v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_17:

    }
    pthread_mutex_unlock(&QLSetContainsContentType_lock);
  }

  return v6;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t AVFoundationLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = AVFoundationLibraryCore_frameworkLibrary;
  v6 = AVFoundationLibraryCore_frameworkLibrary;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E5D7CDA8;
    v8 = *(_OWORD *)&off_1E5D7CDB8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    AVFoundationLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AE415FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AVFoundationLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = AVFoundationLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t UIKitLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = UIKitLibraryCore_frameworkLibrary;
  v6 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E5D7CDC8;
    v8 = *(_OWORD *)&off_1E5D7CDD8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    UIKitLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AE4160F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = UIKitLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getUIImageClass()
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
  v0 = (void *)getUIImageClass_softClass;
  v7 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getUIImageClass_block_invoke;
    v3[3] = &unk_1E5D7C1B8;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AE416200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  UIKitLibrary();
  result = objc_getClass("UIImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getUIImageClass_block_invoke_cold_1();
    return (Class)getUIGraphicsBeginImageContextWithOptionsSymbolLoc(v3);
  }
  return result;
}

void *getUIGraphicsBeginImageContextWithOptionsSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  v6 = getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  if (!getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary();
    v0 = dlsym(v1, "UIGraphicsBeginImageContextWithOptions");
    v4[3] = (uint64_t)v0;
    getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AE4162E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIGraphicsBeginImageContextWithOptions(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t (*UIGraphicsBeginImageContextWithOptionsSymbolLoc)(uint64_t, double, double, double);
  uint64_t v10;

  UIGraphicsBeginImageContextWithOptionsSymbolLoc = (uint64_t (*)(uint64_t, double, double, double))getUIGraphicsBeginImageContextWithOptionsSymbolLoc();
  if (UIGraphicsBeginImageContextWithOptionsSymbolLoc)
    return UIGraphicsBeginImageContextWithOptionsSymbolLoc(a1, a2, a3, a4);
  v10 = +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.1();
  return getUIGraphicsGetCurrentContextSymbolLoc(v10);
}

void *getUIGraphicsGetCurrentContextSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  v6 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  if (!getUIGraphicsGetCurrentContextSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary();
    v0 = dlsym(v1, "UIGraphicsGetCurrentContext");
    v4[3] = (uint64_t)v0;
    getUIGraphicsGetCurrentContextSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AE4163CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIGraphicsGetCurrentContext()
{
  uint64_t (*CurrentContextSymbolLoc)(void);
  uint64_t v2;

  CurrentContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsGetCurrentContextSymbolLoc();
  if (CurrentContextSymbolLoc)
    return CurrentContextSymbolLoc();
  v2 = +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.1();
  return getUIGraphicsEndImageContextSymbolLoc(v2);
}

void *getUIGraphicsEndImageContextSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getUIGraphicsEndImageContextSymbolLoc_ptr;
  v6 = getUIGraphicsEndImageContextSymbolLoc_ptr;
  if (!getUIGraphicsEndImageContextSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary();
    v0 = dlsym(v1, "UIGraphicsEndImageContext");
    v4[3] = (uint64_t)v0;
    getUIGraphicsEndImageContextSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AE416478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *_UIGraphicsEndImageContext()
{
  uint64_t (*UIGraphicsEndImageContextSymbolLoc)(void);

  UIGraphicsEndImageContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsEndImageContextSymbolLoc();
  if (UIGraphicsEndImageContextSymbolLoc)
    return (void *)UIGraphicsEndImageContextSymbolLoc();
  +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.1();
  return getUIGraphicsPushContextSymbolLoc();
}

void *getUIGraphicsPushContextSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getUIGraphicsPushContextSymbolLoc_ptr;
  v6 = getUIGraphicsPushContextSymbolLoc_ptr;
  if (!getUIGraphicsPushContextSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary();
    v0 = dlsym(v1, "UIGraphicsPushContext");
    v4[3] = (uint64_t)v0;
    getUIGraphicsPushContextSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AE416524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIGraphicsPushContext(uint64_t a1)
{
  uint64_t (*UIGraphicsPushContextSymbolLoc)(uint64_t);
  uint64_t v4;

  UIGraphicsPushContextSymbolLoc = (uint64_t (*)(uint64_t))getUIGraphicsPushContextSymbolLoc();
  if (UIGraphicsPushContextSymbolLoc)
    return UIGraphicsPushContextSymbolLoc(a1);
  v4 = +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.1();
  return getUIGraphicsPopContextSymbolLoc(v4);
}

void *getUIGraphicsPopContextSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getUIGraphicsPopContextSymbolLoc_ptr;
  v6 = getUIGraphicsPopContextSymbolLoc_ptr;
  if (!getUIGraphicsPopContextSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary();
    v0 = dlsym(v1, "UIGraphicsPopContext");
    v4[3] = (uint64_t)v0;
    getUIGraphicsPopContextSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AE4165E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *_UIGraphicsPopContext()
{
  uint64_t (*UIGraphicsPopContextSymbolLoc)(void);

  UIGraphicsPopContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsPopContextSymbolLoc();
  if (UIGraphicsPopContextSymbolLoc)
    return (void *)UIGraphicsPopContextSymbolLoc();
  +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.1();
  return getFPIsCloudDocsWithFPFSEnabledSymbolLoc();
}

void *getFPIsCloudDocsWithFPFSEnabledSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getFPIsCloudDocsWithFPFSEnabledSymbolLoc_ptr;
  v6 = getFPIsCloudDocsWithFPFSEnabledSymbolLoc_ptr;
  if (!getFPIsCloudDocsWithFPFSEnabledSymbolLoc_ptr)
  {
    v1 = (void *)FileProviderLibrary();
    v0 = dlsym(v1, "FPIsCloudDocsWithFPFSEnabled");
    v4[3] = (uint64_t)v0;
    getFPIsCloudDocsWithFPFSEnabledSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AE416690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _FPIsCloudDocsWithFPFSEnabled()
{
  uint64_t (*FPIsCloudDocsWithFPFSEnabledSymbolLoc)(void);
  uint64_t v2;

  FPIsCloudDocsWithFPFSEnabledSymbolLoc = (uint64_t (*)(void))getFPIsCloudDocsWithFPFSEnabledSymbolLoc();
  if (FPIsCloudDocsWithFPFSEnabledSymbolLoc)
    return FPIsCloudDocsWithFPFSEnabledSymbolLoc();
  v2 = +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.1();
  return getFPURLMightBeInFileProviderSymbolLoc(v2);
}

void *getFPURLMightBeInFileProviderSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getFPURLMightBeInFileProviderSymbolLoc_ptr;
  v6 = getFPURLMightBeInFileProviderSymbolLoc_ptr;
  if (!getFPURLMightBeInFileProviderSymbolLoc_ptr)
  {
    v1 = (void *)FileProviderLibrary();
    v0 = dlsym(v1, "FPURLMightBeInFileProvider");
    v4[3] = (uint64_t)v0;
    getFPURLMightBeInFileProviderSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AE41673C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

QLFileThumbnailRequest *_FPURLMightBeInFileProvider(uint64_t a1)
{
  uint64_t (*FPURLMightBeInFileProviderSymbolLoc)(uint64_t);
  QLFileThumbnailRequest *v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  CGSize v11;

  FPURLMightBeInFileProviderSymbolLoc = (uint64_t (*)(uint64_t))getFPURLMightBeInFileProviderSymbolLoc();
  if (FPURLMightBeInFileProviderSymbolLoc)
    return (QLFileThumbnailRequest *)FPURLMightBeInFileProviderSymbolLoc(a1);
  v4 = (QLFileThumbnailRequest *)+[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.1();
  return -[QLFileThumbnailRequest initWithItem:maximumSize:minimumSize:scale:options:generationData:](v4, v5, v6, v11, v9, v10, v7, v8);
}

void sub_1AE4173D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

CGImageRef QLCreateCGImageWithData(const __CFData *a1, CGColorSpaceRef space, double a3, double a4, double a5)
{
  NSObject *v8;
  CGDataProvider *v9;
  CGImageRef v10;
  size_t bytesPerRow;
  CGBitmapInfo v13;
  uint64_t v14;
  int v15;
  int v16;

  v16 = 0;
  v15 = 0;
  v14 = 0;
  v13 = 0;
  bytesPerRow = 0;
  _QLComputeValuesForCGContextCreationWithSizeAndScale(&v16, &v15, (int *)&v14 + 1, &v14, (int *)&v13, &bytesPerRow, space, a3, a4, a5);
  if (v16 < 1 || v15 <= 0)
  {
    v8 = qword_1ED10E738;
    if (!qword_1ED10E738)
    {
      QLTInitLogging();
      v8 = qword_1ED10E738;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      QLCreateCGImageWithData_cold_1(&v16, &v15, v8);
    return 0;
  }
  else
  {
    v9 = CGDataProviderCreateWithCFData(a1);
    v10 = CGImageCreate(v16, v15, SHIDWORD(v14), (int)v14, bytesPerRow, space, v13, v9, 0, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v9);
    CGColorSpaceRelease(space);
  }
  return v10;
}

CGImageRef QLCreateCGImageWithDataAndFormat(const __CFData *a1, void *a2)
{
  id v3;
  CGDataProvider *v4;
  size_t v5;
  size_t v6;
  size_t v7;
  size_t v8;
  size_t v9;
  CGColorSpace *v10;
  CGBitmapInfo v11;
  CGImageRef v12;

  v3 = a2;
  v4 = CGDataProviderCreateWithCFData(a1);
  v5 = objc_msgSend(v3, "width");
  v6 = objc_msgSend(v3, "height");
  v7 = objc_msgSend(v3, "bitsPerComponent");
  v8 = objc_msgSend(v3, "bitsPerPixel");
  v9 = objc_msgSend(v3, "bytesPerRow");
  v10 = (CGColorSpace *)objc_msgSend(v3, "colorSpace");
  v11 = objc_msgSend(v3, "bitmapInfo");

  v12 = CGImageCreate(v5, v6, v7, v8, v9, v10, v11, v4, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v4);
  return v12;
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_1AE4195B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE419A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

Class __getFPItemClass_block_invoke_0(uint64_t a1)
{
  Class result;

  FileProviderLibrary();
  result = objc_getClass("FPItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFPItemClass_block_invoke_cold_1();
  getFPItemClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ThumbnailExtension.configuration.getter(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  objc_super v20;

  v6 = type metadata accessor for ThumbnailExtensionConfiguration(0, a1, a2, a3);
  v8 = (char *)objc_allocWithZone((Class)type metadata accessor for ThumbnailExtensionConfiguration(0, *(_QWORD *)(v6 + 80), *(_QWORD *)(v6 + 88), v7));
  v9 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v10 = (_QWORD *)(*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v8);
  *(_QWORD *)&v8[v10[12]] = 0;
  v11 = v10[10];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(&v8[*(_QWORD *)((*v9 & *(_QWORD *)v8) + 0x68)], v4, v11);
  v13 = (objc_class *)type metadata accessor for ThumbnailExtensionConfiguration(0, v11, v10[11], v12);
  v20.receiver = v8;
  v20.super_class = v13;
  v19 = objc_msgSendSuper2(&v20, sel_init);
  v14 = objc_allocWithZone((Class)QLThumbnailConnectionHandler);
  v15 = v19;
  v16 = objc_msgSend(v14, sel_initWithPrincipalObject_, sub_1AE424F38());

  swift_unknownObjectRelease();
  v17 = *(_QWORD *)((*v9 & *v15) + 0x60);
  v18 = *(void **)((char *)v15 + v17);
  *(_QWORD *)((char *)v15 + v17) = v16;

  *a4 = v15;
}

uint64_t type metadata accessor for ThumbnailExtensionConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ThumbnailExtensionConfiguration);
}

uint64_t static ThumbnailProviderBuilder.buildBlock(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v10 = MEMORY[0x1E0DEE9D8];
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v5 = a1 + 32;
    swift_bridgeObjectRetain();
    do
    {
      v5 += 24;
      v6 = swift_bridgeObjectRetain();
      sub_1AE41DE14(v6);
      --v4;
    }
    while (v4);
    v7 = v10;
  }
  else
  {
    swift_bridgeObjectRetain();
    v7 = MEMORY[0x1E0DEE9D8];
  }
  v8 = sub_1AE41FA5C(v7);
  swift_bridgeObjectRelease();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *a2 = v8;
  a2[1] = (uint64_t)&unk_1EED8D5E8;
  a2[2] = result;
  return result;
}

double ThumbnailRequest.Options.maximumSize.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double ThumbnailRequest.Options.minimumSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double ThumbnailRequest.Options.scale.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

uint64_t ThumbnailRequest.Options.wantsLowQuality.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t ThumbnailRequest.Options.interpolationQuality.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 44);
}

uint64_t ThumbnailRequest.Options.iconFlavor.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 48);
}

uint64_t ThumbnailRequest.Options.iconCorner.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 52);
}

uint64_t ThumbnailRequest.Options.thirdPartyVideoDecodersAllowed.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t sub_1AE41A0C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>)
{
  __CFString *v14;
  unint64_t v15;
  char v16;
  char v17;
  __CFString *v18;
  unint64_t v19;
  char v20;
  char v21;
  __CFString *v22;
  unint64_t v23;
  char v24;
  unsigned int v25;
  __CFString *v26;
  unint64_t v27;
  char v28;
  uint64_t result;
  unsigned int v30;
  unsigned int v31;
  __int128 v32;
  __int128 v33;

  if (!*(_QWORD *)(a1 + 16))
  {
    v32 = 0u;
    v33 = 0u;
    goto LABEL_9;
  }
  v14 = CFSTR("WantsLowQuality");
  v15 = sub_1AE41F2CC((uint64_t)v14);
  if ((v16 & 1) == 0)
  {
    v32 = 0u;
    v33 = 0u;

    goto LABEL_9;
  }
  sub_1AE420A10(*(_QWORD *)(a1 + 56) + 32 * v15, (uint64_t)&v32);

  if (!*((_QWORD *)&v33 + 1))
  {
LABEL_9:
    sub_1AE420FEC((uint64_t)&v32, &qword_1EED8D0E0);
LABEL_10:
    v17 = 0;
    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_6;
    goto LABEL_11;
  }
  if (!swift_dynamicCast())
    goto LABEL_10;
  v17 = v31;
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_6:
    v32 = 0u;
    v33 = 0u;
LABEL_18:
    sub_1AE420FEC((uint64_t)&v32, &qword_1EED8D0E0);
    goto LABEL_19;
  }
LABEL_11:
  v18 = CFSTR("ThirdPartyVideoDecodersAllowed");
  v19 = sub_1AE41F2CC((uint64_t)v18);
  if ((v20 & 1) != 0)
  {
    sub_1AE420A10(*(_QWORD *)(a1 + 56) + 32 * v19, (uint64_t)&v32);
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
  }

  if (!*((_QWORD *)&v33 + 1))
    goto LABEL_18;
  if (swift_dynamicCast())
  {
    v21 = v31;
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_20;
LABEL_17:
    v32 = 0u;
    v33 = 0u;
LABEL_27:
    sub_1AE420FEC((uint64_t)&v32, &qword_1EED8D0E0);
LABEL_28:
    v25 = 0;
    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_26;
    goto LABEL_29;
  }
LABEL_19:
  v21 = 0;
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_17;
LABEL_20:
  v22 = CFSTR("InterpolationQuality");
  v23 = sub_1AE41F2CC((uint64_t)v22);
  if ((v24 & 1) != 0)
  {
    sub_1AE420A10(*(_QWORD *)(a1 + 56) + 32 * v23, (uint64_t)&v32);
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
  }

  if (!*((_QWORD *)&v33 + 1))
    goto LABEL_27;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_28;
  v25 = v31;
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_26:
    v32 = 0u;
    v33 = 0u;
    goto LABEL_33;
  }
LABEL_29:
  v26 = CFSTR("IconFlavor");
  v27 = sub_1AE41F2CC((uint64_t)v26);
  if ((v28 & 1) != 0)
  {
    sub_1AE420A10(*(_QWORD *)(a1 + 56) + 32 * v27, (uint64_t)&v32);
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
  }

LABEL_33:
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v33 + 1))
  {
    result = sub_1AE420FEC((uint64_t)&v32, &qword_1EED8D0E0);
    goto LABEL_37;
  }
  result = swift_dynamicCast();
  if (!(_DWORD)result)
  {
LABEL_37:
    v30 = 0;
    goto LABEL_38;
  }
  v30 = v31;
LABEL_38:
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(double *)(a2 + 32) = a7;
  *(_BYTE *)(a2 + 40) = v17;
  *(_DWORD *)(a2 + 44) = v25;
  *(_DWORD *)(a2 + 48) = v30;
  *(_DWORD *)(a2 + 52) = (v30 >> 8) & 7;
  *(_BYTE *)(a2 + 56) = v21;
  return result;
}

double ThumbnailRequest.options.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  int v4;
  char v5;
  __int128 v6;
  double result;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_BYTE *)(v1 + 40);
  v4 = *(_DWORD *)(v1 + 52);
  v5 = *(_BYTE *)(v1 + 56);
  v6 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = v3;
  result = *(double *)(v1 + 44);
  *(double *)(a1 + 44) = result;
  *(_DWORD *)(a1 + 52) = v4;
  *(_BYTE *)(a1 + 56) = v5;
  return result;
}

uint64_t ThumbnailRequest.contentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1AE424DAC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(*(id *)(v1 + 64), sel_contentType);
  if (!v7)
    return sub_1AE424D94();
  v8 = v7;
  sub_1AE424D88();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v6, v3);
}

uint64_t ThumbnailRequest.fileURL.getter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[2] = a1;
  sub_1AE424CB0();
  v2[3] = swift_task_alloc();
  v3 = sub_1AE424CBC();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v4 = sub_1AE424D40();
  v2[7] = v4;
  v2[8] = *(_QWORD *)(v4 - 8);
  v2[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D0A8);
  v5 = swift_task_alloc();
  v6 = *(_QWORD *)(v1 + 64);
  v2[10] = v5;
  v2[11] = v6;
  return swift_task_switch();
}

uint64_t sub_1AE41A59C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = objc_msgSend(*(id *)(v0 + 88), sel_fileURL);
  v2 = *(_QWORD *)(v0 + 80);
  if (!v1)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 56))(*(_QWORD *)(v0 + 80), 1, 1, *(_QWORD *)(v0 + 56));
    goto LABEL_5;
  }
  v3 = v1;
  v5 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  v6 = *(_QWORD *)(v0 + 56);
  sub_1AE424D34();

  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
  v7(v2, v4, v6);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v2, 0, 1, v6);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v2, 1, v6) == 1)
  {
LABEL_5:
    v10 = *(_QWORD *)(v0 + 40);
    v9 = *(_QWORD *)(v0 + 48);
    v11 = *(_QWORD *)(v0 + 32);
    sub_1AE420FEC(*(_QWORD *)(v0 + 80), &qword_1EED8D0A8);
    sub_1AE424CA4();
    sub_1AE41D8D0(MEMORY[0x1E0DEE9D8]);
    sub_1AE420978(&qword_1EED8D5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    sub_1AE424D10();
    sub_1AE424C98();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  v7(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t ThumbnailRequest.data.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1AE424CB0();
  v1[2] = swift_task_alloc();
  v2 = sub_1AE424CBC();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v3 = swift_task_alloc();
  v4 = *(_QWORD *)(v0 + 64);
  v1[5] = v3;
  v1[6] = v4;
  return swift_task_switch();
}

uint64_t sub_1AE41A7E4()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = objc_msgSend(*(id *)(v0 + 48), sel_fileData);
  v2 = *(_QWORD *)(v0 + 40);
  if (v1)
  {
    v3 = v1;
    v4 = sub_1AE424D58();
    v6 = v5;

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v4, v6);
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 24);
    v9 = *(_QWORD *)(v0 + 32);
    sub_1AE424CA4();
    sub_1AE41D8D0(MEMORY[0x1E0DEE9D8]);
    sub_1AE420978(&qword_1EED8D5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    sub_1AE424D10();
    sub_1AE424C98();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v8);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

BOOL ThumbnailRequest.isFileBacked.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = objc_msgSend(*(id *)(v0 + 64), sel_data);
  if (v1)
  {
    v2 = sub_1AE424D58();
    v4 = v3;

    sub_1AE41FC70(v2, v4);
  }
  return v1 == 0;
}

id ThumbnailReply.inner.getter()
{
  id *v0;

  return *v0;
}

uint64_t ThumbnailReply.extensionBadge.getter()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, sel_extensionBadge);
  v2 = sub_1AE424E3C();

  return v2;
}

void sub_1AE41A9DC(void **a1@<X0>, uint64_t *a2@<X8>)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *a1;
  v4 = a1[1];
  swift_bridgeObjectRetain();
  v5 = v3;
  v6 = objc_msgSend(v5, sel_extensionBadge);
  v7 = sub_1AE424E3C();
  v9 = v8;
  swift_bridgeObjectRelease();

  *a2 = v7;
  a2[1] = v9;
}

void sub_1AE41AA70(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_bridgeObjectRetain();
  v3 = (id)sub_1AE424E18();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setExtensionBadge_, v3);

}

void ThumbnailReply.extensionBadge.setter()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  v2 = (id)sub_1AE424E18();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setExtensionBadge_, v2);

}

void (*ThumbnailReply.extensionBadge.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  id *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  a1[2] = (uint64_t)v1;
  v3 = objc_msgSend(*v1, sel_extensionBadge);
  v4 = sub_1AE424E3C();
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
  return sub_1AE41ABB4;
}

void sub_1AE41ABB4(uint64_t a1, char a2)
{
  void *v2;
  id v3;

  v2 = **(void ***)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v3 = (id)sub_1AE424E18();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setExtensionBadge_, v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = (id)sub_1AE424E18();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setExtensionBadge_, v3);
  }

}

id ThumbnailReply.metadata.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_metadata);
}

double static ThumbnailReply.fileURL(_:contentType:)@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  double result;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D0C0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AE420F3C(a1, (uint64_t)v6, &qword_1EED8D0C0);
  v7 = (void *)sub_1AE424D28();
  v8 = sub_1AE424DAC();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_1AE424D7C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  v11 = objc_msgSend((id)objc_opt_self(), sel_replyWithFileURL_contentType_, v7, v10);

  v12 = sub_1AE41B384(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)a2 = v11;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)&result = 0x7FFFFFFFLL;
  *(_QWORD *)(a2 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a2 + 28) = 1;
  *(_QWORD *)(a2 + 32) = v12;
  return result;
}

double static ThumbnailReply.cgRenderer(size:renderer:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  double result;
  _QWORD v16[6];

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  v16[4] = sub_1AE41FCB4;
  v16[5] = v10;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1AE41AEFC;
  v16[3] = &block_descriptor;
  v11 = _Block_copy(v16);
  v12 = (void *)objc_opt_self();
  swift_retain();
  v13 = objc_msgSend(v12, sel_replyWithContextSize_drawingBlock_, v11, a4, a5);
  _Block_release(v11);
  swift_release();
  v14 = sub_1AE41B384(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)a3 = v13;
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)&result = 0x7FFFFFFFLL;
  *(_QWORD *)(a3 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a3 + 28) = 1;
  *(_QWORD *)(a3 + 32) = v14;
  return result;
}

uint64_t sub_1AE41AEFC(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

double static ThumbnailReply.currentContextRenderer(size:renderer:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  double result;
  _QWORD v16[6];

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  v16[4] = sub_1AE41FCD0;
  v16[5] = v10;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1AE41B074;
  v16[3] = &block_descriptor_12;
  v11 = _Block_copy(v16);
  v12 = (void *)objc_opt_self();
  swift_retain();
  v13 = objc_msgSend(v12, sel_replyWithContextSize_currentContextDrawingBlock_, v11, a4, a5);
  _Block_release(v11);
  swift_release();
  v14 = sub_1AE41B384(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)a3 = v13;
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)&result = 0x7FFFFFFFLL;
  *(_QWORD *)(a3 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a3 + 28) = 1;
  *(_QWORD *)(a3 + 32) = v14;
  return result;
}

uint64_t sub_1AE41B074(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  return v1 & 1;
}

double static ThumbnailReply.data(_:contentType:attachments:)@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  double result;

  sub_1AE41FD18(a1, a2);
  v8 = (void *)sub_1AE424D4C();
  v9 = (void *)sub_1AE424D7C();
  v10 = objc_msgSend((id)objc_opt_self(), sel_replyWithData_contentType_, v8, v9);

  sub_1AE41FC70(a1, a2);
  v11 = objc_msgSend(v10, sel_item);
  if (v11)
  {
    v12 = v11;
    if (a3)
    {
      sub_1AE41FD5C();
      a3 = (void *)sub_1AE424DDC();
    }
    objc_msgSend(v12, sel_setAttachments_, a3);

  }
  v13 = sub_1AE41B384(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)a4 = v10;
  *(_QWORD *)(a4 + 8) = 0;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)&result = 0x7FFFFFFFLL;
  *(_QWORD *)(a4 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a4 + 28) = 1;
  *(_QWORD *)(a4 + 32) = v13;
  return result;
}

CGColorSpace *static ThumbnailReply.cgImage(_:scale:isLowQuality:)@<X0>(CGImage *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGImage *v14;
  id v15;
  unint64_t v16;
  CGColorSpace *result;
  _QWORD v18[6];

  v8 = (double)(uint64_t)CGImageGetWidth(a1) / a4;
  v9 = (double)(uint64_t)CGImageGetHeight(a1) / a4;
  v10 = swift_allocObject();
  *(double *)(v10 + 16) = a4;
  *(_QWORD *)(v10 + 24) = a1;
  *(double *)(v10 + 32) = v8;
  *(double *)(v10 + 40) = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_1AE41FDBC;
  *(_QWORD *)(v11 + 24) = v10;
  v18[4] = sub_1AE41FCB4;
  v18[5] = v11;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 1107296256;
  v18[2] = sub_1AE41AEFC;
  v18[3] = &block_descriptor_22;
  v12 = _Block_copy(v18);
  v13 = (void *)objc_opt_self();
  v14 = a1;
  swift_retain();
  v15 = objc_msgSend(v13, sel_replyWithContextSize_drawingBlock_, v12, v8, v9);
  _Block_release(v12);
  swift_release();
  v16 = sub_1AE41B384(MEMORY[0x1E0DEE9D8]);
  swift_release();
  *(_QWORD *)a3 = v15;
  *(_QWORD *)(a3 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a3 + 28) = 1;
  *(_QWORD *)(a3 + 32) = v16;
  result = CGImageGetColorSpace(v14);
  *(_QWORD *)(a3 + 8) = result;
  *(_BYTE *)(a3 + 16) = a2;
  return result;
}

unint64_t sub_1AE41B384(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D690);
  v2 = sub_1AE424F14();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1AE420F3C(v6, (uint64_t)&v15, &qword_1EED8D698);
    v7 = v15;
    v8 = v16;
    result = sub_1AE41F34C(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1AE41F52C);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1AE420F28(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t static ThumbnailReply.images(_:properties:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v5;
  id v6;
  uint64_t result;

  sub_1AE41B584(a1);
  v5 = (void *)sub_1AE424E54();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend((id)objc_opt_self(), sel_replyWithImages_, v5);

  sub_1AE41B384(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a3 + 28) = 1;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(a3 + 32) = a2;
  return result;
}

uint64_t sub_1AE41B584(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1AE424F08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x1E0DEE9D8];
  result = sub_1AE41F60C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1AF44F488](i, a1);
        type metadata accessor for CGImage(0);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1AE41F60C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1AE41F60C(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_1AE420F28(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      type metadata accessor for CGImage(0);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1AE41F60C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1AE41F60C(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_1AE420F28(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

double static ThumbnailReply.imageRenderer(_:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  double result;
  _QWORD v12[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v12[4] = sub_1AE41FE48;
  v12[5] = v6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1AE41B8B8;
  v12[3] = &block_descriptor_28;
  v7 = _Block_copy(v12);
  v8 = (void *)objc_opt_self();
  swift_retain();
  v9 = objc_msgSend(v8, sel_replyWithImageRenderer_, v7);
  _Block_release(v7);
  swift_release();
  v10 = sub_1AE41B384(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)a3 = v9;
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)&result = 0x7FFFFFFFLL;
  *(_QWORD *)(a3 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a3 + 28) = 1;
  *(_QWORD *)(a3 + 32) = v10;
  return result;
}

uint64_t sub_1AE41B8B8(uint64_t a1, void *aBlock)
{
  void (*v2)(uint64_t (*)(), uint64_t);
  void *v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t (*)(), uint64_t))(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_1AE420EF8, v4);
  swift_release();
  return swift_release();
}

void *ThumbnailReply.colorSpace.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  v2 = v1;
  return v1;
}

void ThumbnailReply.colorSpace.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
}

uint64_t (*ThumbnailReply.colorSpace.modify())()
{
  return nullsub_1;
}

uint64_t ThumbnailReply.isLowQuality.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t ThumbnailReply.isLowQuality.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = result;
  return result;
}

uint64_t (*ThumbnailReply.isLowQuality.modify())()
{
  return nullsub_1;
}

uint64_t ThumbnailReply.iconFlavor.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 20);
}

uint64_t ThumbnailReply.iconFlavor.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 20) = result;
  return result;
}

uint64_t (*ThumbnailReply.iconFlavor.modify())()
{
  return nullsub_1;
}

uint64_t ThumbnailReply.iconCorner.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 24);
}

uint64_t ThumbnailReply.iconCorner.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*ThumbnailReply.iconCorner.modify())()
{
  return nullsub_1;
}

uint64_t ThumbnailReply.inlinePreviewMode.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 28);
}

uint64_t ThumbnailReply.inlinePreviewMode.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 28) = result;
  return result;
}

uint64_t (*ThumbnailReply.inlinePreviewMode.modify())()
{
  return nullsub_1;
}

uint64_t ThumbnailReply.additionalProperties.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ThumbnailReply.additionalProperties.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*ThumbnailReply.additionalProperties.modify())()
{
  return nullsub_1;
}

uint64_t sub_1AE41BA48()
{
  uint64_t v0;

  v0 = sub_1AE424DD0();
  __swift_allocate_value_buffer(v0, qword_1EED8DF68);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EED8DF68);
  return sub_1AE424DC4();
}

_QWORD *ThumbnailProvider.init<A>(for:generator:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *result;

  v10 = MEMORY[0x1AF44F2FC](a3, a4);
  v11 = sub_1AE41FA5C(v10);
  swift_bridgeObjectRelease();
  result = (_QWORD *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a1;
  result[5] = a2;
  *a5 = v11;
  a5[1] = (uint64_t)&unk_1EED8D618;
  a5[2] = (uint64_t)result;
  return result;
}

uint64_t sub_1AE41BB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  id v14;

  *(_QWORD *)(v6 + 104) = a5;
  *(_QWORD *)(v6 + 112) = a6;
  *(_QWORD *)(v6 + 88) = a3;
  *(_QWORD *)(v6 + 96) = a4;
  *(_QWORD *)(v6 + 80) = a1;
  sub_1AE424CB0();
  *(_QWORD *)(v6 + 120) = swift_task_alloc();
  v9 = sub_1AE424CBC();
  *(_QWORD *)(v6 + 128) = v9;
  *(_QWORD *)(v6 + 136) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v6 + 144) = swift_task_alloc();
  v10 = sub_1AE424DAC();
  *(_QWORD *)(v6 + 152) = v10;
  *(_QWORD *)(v6 + 160) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v6 + 168) = swift_task_alloc();
  *(_QWORD *)(v6 + 176) = swift_task_alloc();
  *(_QWORD *)(v6 + 184) = *(_QWORD *)(a5 - 8);
  v11 = swift_task_alloc();
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v6 + 200) = *(_OWORD *)a2;
  *(_QWORD *)(v6 + 192) = v11;
  *(_OWORD *)(v6 + 216) = v12;
  *(_QWORD *)(v6 + 232) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(v6 + 73) = *(_BYTE *)(a2 + 40);
  *(_DWORD *)(v6 + 76) = *(_DWORD *)(a2 + 44);
  *(_QWORD *)(v6 + 280) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(v6 + 74) = *(_BYTE *)(a2 + 56);
  v13 = *(void **)(a2 + 64);
  *(_QWORD *)(v6 + 240) = v13;
  v14 = v13;
  return swift_task_switch();
}

uint64_t sub_1AE41BC80()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v14;

  v1 = objc_msgSend(*(id *)(v0 + 240), sel_fileData);
  v2 = *(void **)(v0 + 240);
  if (v1)
  {
    v3 = v1;
    sub_1AE424D58();

    v4 = objc_msgSend(v2, sel_contentType);
    v5 = *(_QWORD *)(v0 + 176);
    if (v4)
    {
      v6 = v4;
      v8 = *(_QWORD *)(v0 + 160);
      v7 = *(_QWORD *)(v0 + 168);
      v9 = *(_QWORD *)(v0 + 152);
      sub_1AE424D88();

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v5, v7, v9);
    }
    else
    {
      sub_1AE424D94();
    }

    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 248) = v14;
    *v14 = v0;
    v14[1] = sub_1AE41BE68;
    return sub_1AE424D70();
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 136);
    v10 = *(_QWORD *)(v0 + 144);
    v12 = *(_QWORD *)(v0 + 128);
    sub_1AE424CA4();
    sub_1AE41D8D0(MEMORY[0x1E0DEE9D8]);
    sub_1AE420978(&qword_1EED8D5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    sub_1AE424D10();
    sub_1AE424C98();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1AE41BE68()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  char v4;
  int v5;
  char v6;
  uint64_t v7;
  int *v8;
  _QWORD *v9;
  int *v10;

  v2 = *v1;
  *(_QWORD *)(v2 + 256) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v2 + 200);
  v4 = *(_BYTE *)(v2 + 74);
  v5 = *(_DWORD *)(v2 + 76);
  v6 = *(_BYTE *)(v2 + 73);
  v7 = *(_QWORD *)(v2 + 232);
  v8 = *(int **)(v2 + 88);
  *(_OWORD *)(v2 + 32) = *(_OWORD *)(v2 + 216);
  *(_QWORD *)(v2 + 48) = v7;
  *(_BYTE *)(v2 + 56) = v6;
  *(_DWORD *)(v2 + 60) = v5;
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(v2 + 280);
  *(_BYTE *)(v2 + 72) = v4;
  v10 = (int *)((char *)v8 + *v8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 264) = v9;
  *v9 = v2;
  v9[1] = sub_1AE41BF54;
  return ((uint64_t (*)(_QWORD, _QWORD, uint64_t))v10)(*(_QWORD *)(v2 + 80), *(_QWORD *)(v2 + 192), v2 + 16);
}

uint64_t sub_1AE41BF54()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1AE41BFB8()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 184) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AE41C03C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AE41C0AC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 184) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ThumbnailProvider.init(contentType:generator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D0D8);
  v8 = sub_1AE424DAC();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1AE428950;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 16))(v11 + v10, a1, v8);
  v12 = sub_1AE41FA5C(v11);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = a3;
  *a4 = v12;
  a4[1] = (uint64_t)&unk_1EED8D628;
  a4[2] = result;
  return result;
}

uint64_t sub_1AE41C248(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  char v7;
  int v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t);

  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_BYTE *)(a2 + 40);
  v8 = *(_DWORD *)(a2 + 52);
  v9 = *(_BYTE *)(a2 + 56);
  v10 = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 48) = v6;
  *(_BYTE *)(v3 + 56) = v7;
  *(_QWORD *)(v3 + 60) = *(_QWORD *)(a2 + 44);
  *(_DWORD *)(v3 + 68) = v8;
  *(_BYTE *)(v3 + 72) = v9;
  *(_QWORD *)(v3 + 80) = v10;
  v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 88) = v11;
  *v11 = v3;
  v11[1] = sub_1AE41C2F4;
  return v13(a1, v3 + 16);
}

uint64_t sub_1AE41C2F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AE41C360()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AE41C36C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  *(_QWORD *)(v3 + 176) = a1;
  *(_QWORD *)(v3 + 184) = a3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 64) = v4;
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(a2 + 64);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 32) = v5;
  return swift_task_switch();
}

uint64_t sub_1AE41C39C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  int *v4;
  char v5;
  __int128 v7;
  __int128 v8;
  _QWORD *v9;
  int *v10;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 184) + 16);
  if (v1)
  {
    v2 = (_QWORD *)(swift_bridgeObjectRetain() + 48);
    while (1)
    {
      v3 = *(v2 - 2);
      *(_QWORD *)(v0 + 192) = v3;
      *(_QWORD *)(v0 + 200) = *v2;
      v4 = (int *)*(v2 - 1);
      sub_1AE420F80(v0 + 16);
      swift_bridgeObjectRetain_n();
      swift_retain();
      v5 = sub_1AE420B64(v3, v0 + 16);
      sub_1AE420FA8(v0 + 16);
      swift_bridgeObjectRelease();
      if ((v5 & 1) != 0)
        break;
      swift_bridgeObjectRelease();
      swift_release();
      v2 += 3;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    v7 = *(_OWORD *)(v0 + 16);
    *(_OWORD *)(v0 + 104) = *(_OWORD *)(v0 + 32);
    v8 = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v0 + 120) = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v0 + 136) = v8;
    *(_QWORD *)(v0 + 152) = *(_QWORD *)(v0 + 80);
    *(_OWORD *)(v0 + 88) = v7;
    v10 = (int *)((char *)v4 + *v4);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v9;
    *v9 = v0;
    v9[1] = sub_1AE41C570;
    return ((uint64_t (*)(_QWORD, uint64_t))v10)(*(_QWORD *)(v0 + 176), v0 + 88);
  }
  else
  {
LABEL_6:
    type metadata accessor for QLThumbnailError(0);
    *(_QWORD *)(v0 + 168) = 0;
    sub_1AE41D8D0(MEMORY[0x1E0DEE9D8]);
    sub_1AE420978(&qword_1EED8D6A0, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428E30);
    sub_1AE424D10();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1AE41C570()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 216) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1AE41C5D4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AE41C610()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1AE41C64C(uint64_t a1)
{
  _QWORD *v1;
  id result;

  result = *(id *)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x60));
  if (result)
    return objc_msgSend(result, sel_shouldAcceptXPCConnection_, a1);
  __break(1u);
  return result;
}

uint64_t sub_1AE41C690(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D0C8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1AE424E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_1AE424E78();
  v11 = a1;
  v12 = v3;
  swift_retain();
  v13 = sub_1AE424E6C();
  v14 = (_QWORD *)swift_allocObject();
  v15 = MEMORY[0x1E0DF06E8];
  v14[2] = v13;
  v14[3] = v15;
  v14[4] = v11;
  v14[5] = v12;
  v14[6] = a2;
  v14[7] = a3;
  sub_1AE41CEF0((uint64_t)v9, (uint64_t)&unk_1EED8D668, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_1AE41C79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[23] = a6;
  v7[24] = a7;
  v7[21] = a4;
  v7[22] = a5;
  v8 = *MEMORY[0x1E0DEEDD8];
  v7[25] = *a5;
  v7[26] = v8;
  sub_1AE424E78();
  v7[27] = sub_1AE424E6C();
  v7[28] = sub_1AE424E60();
  v7[29] = v9;
  return swift_task_switch();
}

uint64_t sub_1AE41C820()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  _QWORD *v21;
  __int128 v23;
  __int128 v24;
  _OWORD v25[2];
  uint64_t v26;
  char v27;
  uint64_t v28;
  int v29;
  char v30;

  v1 = *(_QWORD *)(v0 + 200) & *(_QWORD *)(v0 + 208);
  v2 = *(id *)(v0 + 168);
  v3 = objc_msgSend(v2, sel_item);
  *(_QWORD *)(v0 + 240) = v3;
  objc_msgSend(v2, sel_maximumSize);
  v5 = v4;
  v7 = v6;
  objc_msgSend(v2, sel_minimumSize);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v2, sel_scale);
  v13 = v12;
  v14 = objc_msgSend(v2, sel_options);
  type metadata accessor for QLFileThumbnailRequestOptions(0);
  sub_1AE420978(&qword_1EED8D0D0, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1AE428F40);
  v15 = sub_1AE424DE8();

  sub_1AE41A0C8(v15, (uint64_t)v25, v5, v7, v9, v11, v13);
  v23 = v25[1];
  v24 = v25[0];
  v16 = v26;
  LOBYTE(v14) = v27;
  LODWORD(v15) = v29;
  v17 = v30;
  v18 = v28;
  (*(void (**)(_QWORD))(*(_QWORD *)(v1 + 88) + 16))(*(_QWORD *)(v1 + 80));
  v19 = *(int **)(v0 + 136);
  v20 = *(_QWORD *)(v0 + 144);
  *(_QWORD *)(v0 + 248) = *(_QWORD *)(v0 + 128);
  *(_QWORD *)(v0 + 256) = v20;
  *(_OWORD *)(v0 + 16) = v24;
  *(_OWORD *)(v0 + 32) = v23;
  *(_QWORD *)(v0 + 48) = v16;
  *(_BYTE *)(v0 + 56) = (_BYTE)v14;
  *(_QWORD *)(v0 + 60) = v18;
  *(_DWORD *)(v0 + 68) = v15;
  *(_BYTE *)(v0 + 72) = v17;
  *(_QWORD *)(v0 + 80) = v3;
  *(_QWORD *)&v24 = (char *)v19 + *v19;
  v21 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 264) = v21;
  *v21 = v0;
  v21[1] = sub_1AE41CA40;
  return ((uint64_t (*)(uint64_t, uint64_t))v24)(v0 + 88, v0 + 16);
}

uint64_t sub_1AE41CA40()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1AE41CAA4()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AE41CAE4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  id v6;
  void *v7;
  void (*v8)(void *, _QWORD);
  id v9;
  void *v10;
  id v11;

  swift_release();
  v2 = *(void **)(v0 + 88);
  v1 = *(void **)(v0 + 96);
  v3 = *(unsigned __int8 *)(v0 + 104);
  v4 = *(_DWORD *)(v0 + 108);
  v5 = *(unsigned int *)(v0 + 116);
  if (v4 == 0x7FFFFFFF)
  {
    v6 = v2;
    if (!v1)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v2, sel_setIconFlavor_, v4 | ((*(_DWORD *)(v0 + 112) & 7u) << 8));
  if (v1)
LABEL_5:
    objc_msgSend(v2, sel_setColorSpace_, v1);
LABEL_6:
  v7 = *(void **)(v0 + 240);
  v8 = *(void (**)(void *, _QWORD))(v0 + 184);
  objc_msgSend(v2, sel_setIsLowQuality_, v3);
  objc_msgSend(v2, sel_setInlinePreviewMode_, v5);
  v9 = objc_msgSend(v2, sel_metadata);
  v10 = (void *)sub_1AE424DDC();
  objc_msgSend(v9, sel_setAdditionalProperties_, v10);

  v11 = v2;
  v8(v2, 0);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AE41CC50()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AE41CC90()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void (*v19)(_QWORD, void *);
  id v20;
  _QWORD *v22;
  NSObject *v23;

  v1 = *(void **)(v0 + 240);
  swift_release();

  if (qword_1EED8D950 != -1)
    swift_once();
  v2 = *(void **)(v0 + 168);
  v3 = *(void **)(v0 + 272);
  v4 = sub_1AE424DD0();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EED8DF68);
  v5 = v2;
  v6 = v3;
  v7 = v5;
  v8 = v3;
  v9 = sub_1AE424DB8();
  v10 = sub_1AE424EB4();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *(void **)(v0 + 272);
  v13 = *(void **)(v0 + 168);
  if (v11)
  {
    v14 = swift_slowAlloc();
    v22 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v14 = 138412546;
    *(_QWORD *)(v0 + 152) = v13;
    v23 = v9;
    v15 = v13;
    sub_1AE424ECC();
    *v22 = v13;

    *(_WORD *)(v14 + 12) = 2112;
    v16 = v12;
    v17 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 160) = v17;
    sub_1AE424ECC();
    v22[1] = v17;
    v9 = v23;

    _os_log_impl(&dword_1AE3F5000, v23, v10, "Generation error for request %@ : %@", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D680);
    swift_arrayDestroy();
    MEMORY[0x1AF450034](v22, -1, -1);
    MEMORY[0x1AF450034](v14, -1, -1);
  }
  else
  {

  }
  v18 = *(void **)(v0 + 272);
  v19 = *(void (**)(_QWORD, void *))(v0 + 184);

  v20 = v18;
  v19(0, v18);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AE41CEF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1AE424E90();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1AE424E84();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1AE420FEC(a1, &qword_1EED8D0C8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1AE424E60();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1AE41D03C(void *a1, int a2, void *a3, void *aBlock)
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = _Block_copy(aBlock);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = a1;
  sub_1AE41C690(v8, (uint64_t)sub_1AE420EF0, v7);

  return swift_release();
}

void sub_1AE41D0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1AE424D1C();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

void sub_1AE41D114()
{
  sub_1AE420EA0();
}

id sub_1AE41D120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for ThumbnailExtensionConfiguration(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_1AE41D16C(char *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = *MEMORY[0x1E0DEEDD8] & *(_QWORD *)a1;

  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 8))(&a1[*(_QWORD *)((*v2 & *(_QWORD *)a1) + 0x68)]);
}

unint64_t sub_1AE41D1D0(uint64_t a1)
{
  return (unint64_t)sub_1AE41C64C(a1) & 1;
}

uint64_t sub_1AE41D1F4(uint64_t a1, uint64_t a2)
{
  return sub_1AE41D33C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1AE41D200(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1AE424E24();
  *a2 = 0;
  return result;
}

uint64_t sub_1AE41D274(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1AE424E30();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1AE41D2F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1AE424E3C();
  v2 = sub_1AE424E18();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1AE41D330(uint64_t a1, uint64_t a2)
{
  return sub_1AE41D33C(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1AE41D33C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1AE424E3C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1AE41D378()
{
  sub_1AE424E3C();
  sub_1AE424E48();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AE41D3B8()
{
  uint64_t v0;

  sub_1AE424E3C();
  sub_1AE424F80();
  sub_1AE424E48();
  v0 = sub_1AE424F8C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1AE41D428()
{
  sub_1AE420978(&qword_1EED8D6D8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428DEC);
  return sub_1AE424F68();
}

uint64_t sub_1AE41D468()
{
  sub_1AE420978(&qword_1EED8D6D8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428DEC);
  return sub_1AE424F5C();
}

uint64_t sub_1AE41D4AC()
{
  sub_1AE420978(&qword_1EED8D6A0, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428E30);
  return sub_1AE424CC8();
}

id sub_1AE41D4EC()
{
  id *v0;

  return *v0;
}

uint64_t sub_1AE41D4F4@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1AE41D4FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1AE424E3C();
  v2 = v1;
  if (v0 == sub_1AE424E3C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1AE424F44();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1AE41D584()
{
  return sub_1AE424E3C();
}

uint64_t sub_1AE41D594()
{
  sub_1AE420978(&qword_1EED8D6A0, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428E30);
  return sub_1AE424D04();
}

uint64_t sub_1AE41D5D4()
{
  sub_1AE420978(&qword_1EED8D6A0, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428E30);
  return sub_1AE424CE0();
}

uint64_t sub_1AE41D614(void *a1)
{
  id v2;

  sub_1AE420978(&qword_1EED8D6A0, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428E30);
  v2 = a1;
  return sub_1AE424CD4();
}

uint64_t sub_1AE41D678()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_1AE424EC0();

  return v2;
}

uint64_t sub_1AE41D6AC()
{
  sub_1AE420978(&qword_1EED8D6A0, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428E30);
  return sub_1AE424CF8();
}

uint64_t sub_1AE41D6FC()
{
  sub_1AE424F80();
  sub_1AE424E00();
  return sub_1AE424F8C();
}

_QWORD *sub_1AE41D758@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1AE41D768(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1AE41D774@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1AE424E18();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1AE41D7B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1AE424E3C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1AE41D7E0()
{
  sub_1AE420978(&qword_1EED8D0D0, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1AE428F40);
  sub_1AE420978(&qword_1EED8D710, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1AE428C64);
  return sub_1AE424F2C();
}

uint64_t sub_1AE41D864()
{
  sub_1AE420978(&qword_1EED8D6A0, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428E30);
  return sub_1AE424CEC();
}

BOOL sub_1AE41D8BC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1AE41D8D0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D690);
  v2 = sub_1AE424F14();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1AE420F3C(v6, (uint64_t)&v15, &qword_1EED8D698);
    v7 = v15;
    v8 = v16;
    result = sub_1AE41F34C(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1AE41DA18);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1AE420F28(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1AE41DA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1AE424F44() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1AE424F44() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_1AE424F44() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_1AE41DB5C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1AE41DBC0;
  return v6(a1);
}

uint64_t sub_1AE41DBC0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AE41DC0C(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D0D8);
  v10 = *(_QWORD *)(sub_1AE424DAC() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_1AE424EFC();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_1AE424DAC() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1AE420A4C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1AE41DE14(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  int isUniquelyReferenced_nonNull_native;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t result;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  int64_t v35;
  int64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  void (*v48)(_QWORD, _QWORD, _QWORD);
  int64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unsigned int v53;
  char *v54;
  char *v55;
  uint64_t (*v56)(unint64_t, char *, uint64_t);
  int64_t v57;
  unint64_t v58;
  int64_t v59;
  int64_t v60;
  int64_t v61;
  unint64_t v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t, uint64_t, uint64_t);
  int64_t v67;
  void (*v68)(_QWORD, _QWORD, _QWORD);
  unint64_t v69;
  unint64_t v70;
  unsigned int (*v71)(uint64_t, uint64_t, uint64_t);
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;

  v3 = sub_1AE424DAC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v76 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D0C0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v77 = (uint64_t)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v65 - v10;
  MEMORY[0x1E0C80A78](v9);
  v16 = (char *)&v65 - v15;
  v17 = *(_QWORD *)(a1 + 16);
  v18 = *v1;
  v19 = *(_QWORD *)(*v1 + 16);
  v20 = v19 + v17;
  if (__OFADD__(v19, v17))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v18;
  v75 = v11;
  if (!isUniquelyReferenced_nonNull_native || (v22 = *(_QWORD *)(v18 + 24) >> 1, v22 < v20))
  {
    if (v19 <= v20)
      v23 = v19 + v17;
    else
      v23 = v19;
    v18 = sub_1AE41DC0C(isUniquelyReferenced_nonNull_native, v23, 1, v18);
    *v1 = v18;
    v22 = *(_QWORD *)(v18 + 24) >> 1;
  }
  v24 = *(_QWORD *)(v18 + 16);
  v19 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v20 = *(_QWORD *)(v4 + 72);
  v25 = v22 - v24;
  v26 = sub_1AE41F794(&v78, v18 + v19 + v20 * v24, v22 - v24, a1);
  if (v26 < v17)
    goto LABEL_15;
  if (v26)
  {
    v28 = *(_QWORD *)(v18 + 16);
    v29 = __OFADD__(v28, v26);
    v30 = v28 + v26;
    if (v29)
    {
      __break(1u);
LABEL_20:
      v35 = a1 + 1;
      if (__OFADD__(a1, 1))
      {
        __break(1u);
      }
      else
      {
        v36 = (v27 + 64) >> 6;
        v74 = a1;
        if (v35 >= v36)
          goto LABEL_41;
        v37 = *(_QWORD *)(v18 + 8 * v35);
        if (v37)
        {
LABEL_23:
          v32 = (v37 - 1) & v37;
          v33 = __clz(__rbit64(v37)) + (v35 << 6);
          a1 = v35;
          goto LABEL_18;
        }
        v38 = a1 + 2;
        v74 = a1 + 1;
        if (a1 + 2 >= v36)
          goto LABEL_41;
        v14 = v19;
        v13 = v25;
        v12 = v17;
        v37 = *(_QWORD *)(v18 + 8 * v38);
        if (v37)
        {
LABEL_26:
          v35 = v38;
          goto LABEL_23;
        }
        v74 = a1 + 2;
        v18 = v73;
        if (a1 + 3 >= v36)
          goto LABEL_41;
        v37 = *(_QWORD *)(v73 + 8 * (a1 + 3));
        if (v37)
        {
          v35 = a1 + 3;
          goto LABEL_23;
        }
        v38 = a1 + 4;
        v74 = a1 + 3;
        v18 = v73;
        if (a1 + 4 >= v36)
          goto LABEL_41;
        v37 = *(_QWORD *)(v73 + 8 * v38);
        if (v37)
          goto LABEL_26;
        v35 = a1 + 5;
        v74 = a1 + 4;
        v18 = v73;
        if (a1 + 5 >= v36)
        {
LABEL_41:
          v66 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
          v66(v16, 1, 1, v3);
          v34 = 0;
          a1 = v74;
          goto LABEL_42;
        }
        v37 = *(_QWORD *)(v73 + 8 * v35);
        if (v37)
          goto LABEL_23;
        v74 = v36 - 1;
        v39 = a1 + 6;
        while (v36 != v39)
        {
          v37 = *(_QWORD *)(v73 + 8 * v39++);
          if (v37)
          {
            v35 = v39 - 1;
            goto LABEL_23;
          }
        }
      }
      v17 = v12;
      v25 = v13;
      v18 = v73;
      v19 = v14;
      goto LABEL_41;
    }
    *(_QWORD *)(v18 + 16) = v30;
  }
  if (v26 != v25)
    return sub_1AE420FE4();
LABEL_16:
  v25 = *(_QWORD *)(v18 + 16);
  v17 = v78;
  v18 = v79;
  v27 = v80;
  a1 = v81;
  v73 = v79;
  v70 = v80;
  if (!v82)
    goto LABEL_20;
  v32 = (v82 - 1) & v82;
  v33 = __clz(__rbit64(v82)) | (v81 << 6);
LABEL_18:
  (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v16, *(_QWORD *)(v17 + 48) + v33 * v20, v3);
  v66 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v66(v16, 0, 1, v3);
  v34 = v32;
  v18 = v73;
LABEL_42:
  v72 = v34;
  v74 = a1;
  v78 = v17;
  v79 = v18;
  v80 = v70;
  v81 = a1;
  v82 = v34;
  v40 = (uint64_t)v75;
  sub_1AE420F3C((uint64_t)v16, (uint64_t)v75, &qword_1EED8D0C0);
  v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v71(v40, 1, v3) == 1)
  {
LABEL_82:
    sub_1AE420FEC((uint64_t)v16, &qword_1EED8D0C0);
    sub_1AE420FE4();
    return sub_1AE420FEC((uint64_t)v75, &qword_1EED8D0C0);
  }
  v41 = (uint64_t)v75;
  v42 = v76;
  v67 = v19;
  while (1)
  {
    sub_1AE420FEC(v41, &qword_1EED8D0C0);
    v43 = *(_QWORD *)(*v1 + 24);
    v44 = v43 >> 1;
    if ((uint64_t)(v43 >> 1) < v25 + 1)
    {
      v50 = sub_1AE41DC0C(v43 > 1, v25 + 1, 1, *v1);
      *v1 = v50;
      v74 = v50;
      v44 = *(_QWORD *)(v50 + 24) >> 1;
    }
    else
    {
      v74 = *v1;
    }
    v45 = v77;
    sub_1AE420F3C((uint64_t)v16, v77, &qword_1EED8D0C0);
    if (v71(v45, 1, v3) != 1)
      break;
    v46 = v77;
LABEL_50:
    sub_1AE420FEC(v46, &qword_1EED8D0C0);
    v47 = v25;
LABEL_45:
    *(_QWORD *)(*v1 + 16) = v47;
    v41 = (uint64_t)v75;
    sub_1AE420F3C((uint64_t)v16, (uint64_t)v75, &qword_1EED8D0C0);
    if (v71(v41, 1, v3) == 1)
    {
      v74 = v81;
      v72 = v82;
      goto LABEL_82;
    }
  }
  v69 = v74 + v19;
  v48 = *(void (**)(_QWORD, _QWORD, _QWORD))(v4 + 32);
  if (v25 <= v44)
    v49 = v44;
  else
    v49 = v25;
  v70 = v49;
  v46 = v77;
  v68 = v48;
  while (1)
  {
    v54 = v42;
    v55 = v42;
    v56 = (uint64_t (*)(unint64_t, char *, uint64_t))v48;
    v48(v54, v46, v3);
    v47 = v70;
    if (v25 == v70)
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v55, v3);
      v25 = v47;
      v42 = v55;
      v19 = v67;
      goto LABEL_45;
    }
    sub_1AE420FEC((uint64_t)v16, &qword_1EED8D0C0);
    v74 = v25;
    result = v56(v69 + v25 * v20, v55, v3);
    v52 = v78;
    v57 = v81;
    v72 = v80;
    v73 = v79;
    if (v82)
    {
      v51 = (v82 - 1) & v82;
      v58 = __clz(__rbit64(v82)) | (v81 << 6);
      v19 = v67;
      goto LABEL_62;
    }
    v65 = v78;
    v60 = v81 + 1;
    v19 = v67;
    if (__OFADD__(v81, 1))
      break;
    v61 = (v80 + 64) >> 6;
    v59 = v81;
    if (v60 < v61)
    {
      v62 = *(_QWORD *)(v79 + 8 * v60);
      if (v62)
        goto LABEL_66;
      v63 = v81 + 2;
      v59 = v81 + 1;
      if (v81 + 2 < v61)
      {
        v62 = *(_QWORD *)(v79 + 8 * v63);
        if (v62)
          goto LABEL_69;
        v59 = v81 + 2;
        if (v81 + 3 < v61)
        {
          v62 = *(_QWORD *)(v79 + 8 * (v81 + 3));
          if (v62)
          {
            v60 = v81 + 3;
            goto LABEL_66;
          }
          v63 = v81 + 4;
          v59 = v81 + 3;
          if (v81 + 4 < v61)
          {
            v62 = *(_QWORD *)(v79 + 8 * v63);
            if (v62)
            {
LABEL_69:
              v60 = v63;
              goto LABEL_66;
            }
            v60 = v81 + 5;
            v59 = v81 + 4;
            if (v81 + 5 < v61)
            {
              v62 = *(_QWORD *)(v79 + 8 * v60);
              if (!v62)
              {
                v59 = v61 - 1;
                v64 = v81 + 6;
                do
                {
                  if (v61 == v64)
                  {
                    v19 = v67;
                    goto LABEL_57;
                  }
                  v62 = *(_QWORD *)(v79 + 8 * v64++);
                }
                while (!v62);
                v60 = v64 - 1;
                v19 = v67;
              }
LABEL_66:
              v51 = (v62 - 1) & v62;
              v58 = __clz(__rbit64(v62)) + (v60 << 6);
              v57 = v60;
              v52 = v65;
LABEL_62:
              (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v16, *(_QWORD *)(v52 + 48) + v58 * v20, v3);
              v66(v16, 0, 1, v3);
              v59 = v57;
              goto LABEL_58;
            }
          }
        }
      }
    }
LABEL_57:
    v66(v16, 1, 1, v3);
    v51 = 0;
    v52 = v65;
LABEL_58:
    v25 = v74 + 1;
    v78 = v52;
    v79 = v73;
    v80 = v72;
    v81 = v59;
    v82 = v51;
    v46 = v77;
    sub_1AE420F3C((uint64_t)v16, v77, &qword_1EED8D0C0);
    v53 = v71(v46, 1, v3);
    v42 = v76;
    v48 = v68;
    if (v53 == 1)
      goto LABEL_50;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AE41E5B4(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_1AE424DAC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_1AE420978(&qword_1EED8D0B0, v11, MEMORY[0x1E0DF0358]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_1AE424DF4();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_1AE420978(&qword_1EED8D0B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0360]);
      v21 = sub_1AE424E0C();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_1AE41EB7C((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_1AE41E810()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_1AE424DAC();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D6A8);
  v6 = sub_1AE424EE4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_1AE420978(&qword_1EED8D0B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
      result = sub_1AE424DF4();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_1AE41EB7C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_1AE424DAC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_1AE41E810();
  }
  else
  {
    if (v11 > v10)
    {
      sub_1AE41ED80();
      goto LABEL_12;
    }
    sub_1AE41EFA4();
  }
  v12 = *v3;
  sub_1AE420978(&qword_1EED8D0B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
  v13 = sub_1AE424DF4();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_1AE420978(&qword_1EED8D0B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0360]);
      v18 = sub_1AE424E0C();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_1AE424F50();
  __break(1u);
  return result;
}

void *sub_1AE41ED80()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_1AE424DAC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D6A8);
  v6 = *v0;
  v7 = sub_1AE424ED8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1AE41EFA4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_1AE424DAC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D6A8);
  v7 = sub_1AE424EE4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_1AE420978(&qword_1EED8D0B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
    result = sub_1AE424DF4();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1AE41F2CC(uint64_t a1)
{
  uint64_t v2;

  sub_1AE424E3C();
  sub_1AE424F80();
  sub_1AE424E48();
  v2 = sub_1AE424F8C();
  swift_bridgeObjectRelease();
  return sub_1AE41F3B8(a1, v2);
}

uint64_t sub_1AE41F34C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;

  sub_1AE424F80();
  sub_1AE424E48();
  v5 = sub_1AE424F8C();
  return a3(a1, a2, v5);
}

unint64_t sub_1AE41F3B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_1AE424E3C();
    v8 = v7;
    if (v6 == sub_1AE424E3C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_1AE424F44();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_1AE424E3C();
          v15 = v14;
          if (v13 == sub_1AE424E3C() && v15 == v16)
            break;
          v18 = sub_1AE424F44();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_1AE41F52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1AE424F44() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1AE424F44() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1AE41F60C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1AE41F628(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1AE41F628(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EED8D688);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1AE424F20();
  __break(1u);
  return result;
}

uint64_t sub_1AE41F794(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  _QWORD *v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = sub_1AE424DAC();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v32 - v14;
  v39 = a4;
  v18 = *(_QWORD *)(a4 + 56);
  v17 = a4 + 56;
  v16 = v18;
  v37 = v17;
  v19 = -1 << *(_BYTE *)(v17 - 24);
  if (-v19 < 64)
    v20 = ~(-1 << -(char)v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    a3 = 0;
LABEL_38:
    v31 = v37;
    *a1 = v39;
    a1[1] = v31;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v34 = -1 << *(_BYTE *)(v17 - 24);
  v35 = a1;
  v22 = 0;
  v23 = 0;
  v36 = (unint64_t)(63 - v19) >> 6;
  v33 = v36 - 1;
  v38 = a3;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    v29 = *(_QWORD *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v12, *(_QWORD *)(v39 + 48) + v29 * v25, v8);
    v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v15, v12, v8);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v15, v8);
    a3 = v38;
    if (v23 == v38)
      goto LABEL_37;
    a2 += v29;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v36)
      goto LABEL_32;
    v27 = *(_QWORD *)(v37 + 8 * v26);
    if (!v27)
      break;
LABEL_18:
    v21 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v36)
  {
    v21 = 0;
    v22 = v26;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
    goto LABEL_14;
  v28 = v26 + 2;
  if (v26 + 2 >= v36)
    goto LABEL_32;
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
    goto LABEL_17;
  v22 = v26 + 3;
  if (v26 + 3 >= v36)
  {
    v21 = 0;
    v22 = v26 + 2;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
  {
LABEL_14:
    v26 = v22;
    goto LABEL_18;
  }
  v28 = v26 + 4;
  if (v26 + 4 >= v36)
  {
LABEL_32:
    v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    v19 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
  {
LABEL_17:
    v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v26 >= v36)
    {
      v21 = 0;
      v22 = v33;
      goto LABEL_36;
    }
    v27 = *(_QWORD *)(v37 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1AE41FA5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v2 = sub_1AE424DAC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v15 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  sub_1AE420978(&qword_1EED8D0B0, v10, MEMORY[0x1E0DF0358]);
  result = sub_1AE424E9C();
  v16 = result;
  if (v9)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v14(v6, v12, v2);
      sub_1AE41E5B4((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v12 += v13;
      --v9;
    }
    while (v9);
    return v16;
  }
  return result;
}

uint64_t sub_1AE41FB84()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AE41FBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *(_QWORD *)v7 = v3;
  *(_QWORD *)(v7 + 8) = sub_1AE421304;
  *(_QWORD *)(v7 + 176) = a1;
  *(_QWORD *)(v7 + 184) = v6;
  *(_QWORD *)(v7 + 80) = *(_QWORD *)(a2 + 64);
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v7 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v7 + 64) = v8;
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v7 + 32) = v9;
  return swift_task_switch();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF44FFBC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1AE41FC70(uint64_t a1, unint64_t a2)
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

uint64_t sub_1AE41FCD0()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  return 1;
}

uint64_t sub_1AE41FD18(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

unint64_t sub_1AE41FD5C()
{
  unint64_t result;

  result = qword_1EED8D608;
  if (!qword_1EED8D608)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1EED8D608);
  }
  return result;
}

uint64_t sub_1AE41FD98()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1AE41FDBC(CGContext *a1)
{
  uint64_t v1;

  CGContextScaleCTM(a1, *(CGFloat *)(v1 + 16), *(CGFloat *)(v1 + 16));
  return sub_1AE424EA8();
}

uint64_t sub_1AE41FE24()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AE41FE48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(id (*)(), _QWORD *);
  _QWORD v5[4];

  v3 = *(uint64_t (**)(id (*)(), _QWORD *))(v2 + 16);
  v5[2] = a1;
  v5[3] = a2;
  return v3(sub_1AE420F04, v5);
}

uint64_t sub_1AE41FE80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AE41FEA4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_1AE421304;
  return sub_1AE41BB54(a1, a2, v9, v8, v6, v7);
}

uint64_t sub_1AE41FF24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1AE41FF90;
  return sub_1AE41C248(a1, a2, v6);
}

uint64_t sub_1AE41FF90()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of ThumbnailExtension.provider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for ThumbnailProviderBuilder()
{
  return &type metadata for ThumbnailProviderBuilder;
}

void destroy for ThumbnailRequest(uint64_t a1)
{

}

uint64_t initializeWithCopy for ThumbnailRequest(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  void *v4;
  id v5;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  v4 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v4;
  v5 = v4;
  return a1;
}

uint64_t assignWithCopy for ThumbnailRequest(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v3 = *(void **)(a2 + 64);
  v4 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v3;
  v5 = v3;

  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ThumbnailRequest(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  void *v4;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 44) = *(_QWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);

  return a1;
}

uint64_t getEnumTagSinglePayload for ThumbnailRequest(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 64) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailRequest()
{
  return &type metadata for ThumbnailRequest;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ThumbnailRequest.Options(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 57))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailRequest.Options(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 57) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailRequest.Options()
{
  return &type metadata for ThumbnailRequest.Options;
}

uint64_t initializeBufferWithCopyOfBuffer for ThumbnailReply(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ThumbnailReply(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ThumbnailReply(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 20) = *(_QWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v5 = v3;
  v6 = v4;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ThumbnailReply(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ThumbnailReply(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 20) = *(_QWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ThumbnailReply(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailReply(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailReply()
{
  return &type metadata for ThumbnailReply;
}

uint64_t destroy for ThumbnailProvider()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t _s21QuickLookThumbnailing17ThumbnailProviderVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ThumbnailProvider(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ThumbnailProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ThumbnailProvider(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailProvider()
{
  return &type metadata for ThumbnailProvider;
}

uint64_t sub_1AE4206E4()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_1AE420760(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for ThumbnailExtensionConfiguration(255, *a1, a1[1], a4);
  JUMPOUT(0x1AF44FFC8);
}

void type metadata accessor for QLInlinePreviewMode(uint64_t a1)
{
  sub_1AE4211C8(a1, &qword_1EED8D630);
}

void type metadata accessor for CGColorSpace(uint64_t a1)
{
  sub_1AE4211C8(a1, &qword_1EED8D638);
}

void type metadata accessor for CGInterpolationQuality(uint64_t a1)
{
  sub_1AE4211C8(a1, &qword_1EED8D640);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1AE4207D0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AE4207F0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_1AE4211C8(a1, &qword_1EED8D648);
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_1AE4211C8(a1, &qword_1EED8D650);
}

void type metadata accessor for CGContext(uint64_t a1)
{
  sub_1AE4211C8(a1, &qword_1EED8D658);
}

uint64_t sub_1AE420854()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AE420890()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = (_QWORD *)v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1AE41FF90;
  return sub_1AE41C79C((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_1AE4208F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1AE421304;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EED8D670 + dword_1EED8D670))(a1, v4);
}

void type metadata accessor for QLFileThumbnailRequestOptions(uint64_t a1)
{
  sub_1AE4211C8(a1, &qword_1ED10E458);
}

uint64_t sub_1AE420978(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1AF44FFC8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1AE420A10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1AE420A4C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_1AE424DAC() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_1AE424F20();
  __break(1u);
  return result;
}

uint64_t sub_1AE420B64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  int64_t v19;
  char *v20;
  char v21;
  void (*v22)(char *, uint64_t);
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  int64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;

  v4 = sub_1AE424DAC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v43 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v45 = (char *)&v41 - v9;
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v41 - v11;
  MEMORY[0x1E0C80A78](v10);
  v46 = (char *)&v41 - v13;
  v47 = a1;
  v14 = *(_QWORD *)(a1 + 56);
  v42 = a1 + 56;
  v15 = 1 << *(_BYTE *)(a1 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v14;
  v44 = (unint64_t)(v15 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v19 = 0;
  while (v17)
  {
    v23 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    v24 = v23 | (v19 << 6);
LABEL_24:
    v28 = v46;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v46, *(_QWORD *)(v47 + 48) + *(_QWORD *)(v5 + 72) * v24, v4);
    v29 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v29(v12, v28, v4);
    v30 = *(void **)(a2 + 64);
    sub_1AE420F80(a2);
    v31 = objc_msgSend(v30, sel_contentType);
    if (v31)
    {
      v32 = v31;
      v48 = v17;
      v33 = v4;
      v34 = v19;
      v35 = v5;
      v36 = v12;
      v37 = a2;
      v38 = v43;
      sub_1AE424D88();

      v20 = v45;
      v39 = v38;
      a2 = v37;
      v12 = v36;
      v5 = v35;
      v19 = v34;
      v4 = v33;
      v17 = v48;
      v29(v45, v39, v4);
    }
    else
    {
      v20 = v45;
      sub_1AE424D94();
    }
    sub_1AE420FA8(a2);
    v21 = sub_1AE424DA0();
    v22 = *(void (**)(char *, uint64_t))(v5 + 8);
    v22(v20, v4);
    result = ((uint64_t (*)(char *, uint64_t))v22)(v12, v4);
    if ((v21 & 1) != 0)
    {
      v40 = 1;
LABEL_28:
      swift_release();
      return v40;
    }
  }
  v25 = v19 + 1;
  if (__OFADD__(v19, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v25 >= v44)
    goto LABEL_27;
  v26 = *(_QWORD *)(v42 + 8 * v25);
  ++v19;
  if (v26)
    goto LABEL_23;
  v19 = v25 + 1;
  if (v25 + 1 >= v44)
    goto LABEL_27;
  v26 = *(_QWORD *)(v42 + 8 * v19);
  if (v26)
    goto LABEL_23;
  v19 = v25 + 2;
  if (v25 + 2 >= v44)
    goto LABEL_27;
  v26 = *(_QWORD *)(v42 + 8 * v19);
  if (v26)
    goto LABEL_23;
  v19 = v25 + 3;
  if (v25 + 3 >= v44)
    goto LABEL_27;
  v26 = *(_QWORD *)(v42 + 8 * v19);
  if (v26)
  {
LABEL_23:
    v17 = (v26 - 1) & v26;
    v24 = __clz(__rbit64(v26)) + (v19 << 6);
    goto LABEL_24;
  }
  v27 = v25 + 4;
  if (v27 >= v44)
  {
LABEL_27:
    v40 = 0;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v42 + 8 * v27);
  if (v26)
  {
    v19 = v27;
    goto LABEL_23;
  }
  while (1)
  {
    v19 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v19 >= v44)
      goto LABEL_27;
    v26 = *(_QWORD *)(v42 + 8 * v19);
    ++v27;
    if (v26)
      goto LABEL_23;
  }
LABEL_30:
  __break(1u);
  return result;
}

void sub_1AE420EA0()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1AE420ECC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1AE420EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1AE41D0BC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1AE420EF8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

id sub_1AE420F04()
{
  uint64_t v0;

  return (id)(*(uint64_t (**)(void))(v0 + 16))();
}

_OWORD *sub_1AE420F28(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1AE420F3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AE420F80(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 64);
  return a1;
}

uint64_t sub_1AE420FA8(uint64_t a1)
{

  return a1;
}

void type metadata accessor for QLThumbnailError(uint64_t a1)
{
  sub_1AE4211C8(a1, &qword_1EED8D6B0);
}

uint64_t sub_1AE420FE4()
{
  return swift_release();
}

uint64_t sub_1AE420FEC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1AF44FF98](a1, v6, a5);
}

uint64_t sub_1AE421054()
{
  return sub_1AE420978(&qword_1EED8D6B8, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1AE428C2C);
}

uint64_t sub_1AE421080()
{
  return sub_1AE420978(&qword_1EED8D6C0, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1AE428C04);
}

uint64_t sub_1AE4210AC()
{
  return sub_1AE420978(&qword_1EED8D6C8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428D04);
}

uint64_t sub_1AE4210D8()
{
  return sub_1AE420978(&qword_1EED8D6D0, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428D30);
}

uint64_t sub_1AE421104()
{
  return sub_1AE420978(&qword_1EED8D6D8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428DEC);
}

uint64_t sub_1AE421130()
{
  return sub_1AE420978(&qword_1EED8D6E0, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428DB8);
}

uint64_t sub_1AE42115C()
{
  return sub_1AE420978(&qword_1EED8D6E8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428D74);
}

uint64_t sub_1AE421188()
{
  return sub_1AE420978(&qword_1EED8D6F0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1AE428ED8);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_1AE4211C8(a1, &qword_1EED8D718);
}

void sub_1AE4211C8(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_1AE42120C()
{
  return sub_1AE420978(&qword_1EED8D6F8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1AE428E9C);
}

unint64_t sub_1AE42123C()
{
  unint64_t result;

  result = qword_1EED8D700;
  if (!qword_1EED8D700)
  {
    result = MEMORY[0x1AF44FFC8](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1EED8D700);
  }
  return result;
}

uint64_t sub_1AE421280()
{
  return sub_1AE420978(&qword_1EED8D708, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1AE428F14);
}

uint64_t sub_1AE4212AC()
{
  return sub_1AE420978(&qword_1EED8D6A0, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1AE428E30);
}

uint64_t sub_1AE4212D8()
{
  return sub_1AE420978(&qword_1ED10E410, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1AE428C94);
}

void __getFPItemIDClass_block_invoke_cold_1()
{
  abort_report_np();
  -[QLThumbnailGenerationRequest initWithFPItem:size:scale:representationTypes:].cold.1();
}

void __getFPItemClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[QLThumbnailGenerator generateBestRepresentationForRequest:completionHandler:].cold.1(v0);
}

void _QLCopyResourcePropertyForKey_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Hit error %@ retrieving the thumbnails property for %@");
  OUTLINED_FUNCTION_2();
}

void QLGetRealPath_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1AE3F5000, v1, v2, "failed to open path %s: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void QLGetRealPath_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1AE3F5000, v1, v2, "failed to get real path for %s: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void QLTCreateCGContextWithSize_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1AE3F5000, log, OS_LOG_TYPE_ERROR, "Did not create CGContext because of incorrect image size in pixels (width: %d, height: %d)", (uint8_t *)v3, 0xEu);
}

void QLTRunInMainThreadAsync_cold_1()
{
  __assert_rtn("QLTRunInMainThreadAsync", "QLTUtilities.m", 333, "block != nil");
}

void QLTRunInMainThreadSync_cold_1()
{
  __assert_rtn("QLTRunInMainThreadSync", "QLTUtilities.m", 343, "block != nil");
}

uint64_t __getUIImageClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getFPSandboxingURLWrapperClass_block_invoke_cold_1();
}

uint64_t __getFPSandboxingURLWrapperClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[NSFileManager(_QLTUtilities) _QLTRemoveTemporaryDirectoryAtURL:].cold.1(v0);
}

void QLCreateCGImageWithData_cold_1(int *a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_1AE3F5000, log, OS_LOG_TYPE_ERROR, "Did not create CGContext for thumbail extension because of incorrect image size in pixels (width: %d, height: %d)", (uint8_t *)v5, 0xEu);
}

uint64_t sub_1AE424C98()
{
  return MEMORY[0x1E0CADD40]();
}

uint64_t sub_1AE424CA4()
{
  return MEMORY[0x1E0CADDC0]();
}

uint64_t sub_1AE424CB0()
{
  return MEMORY[0x1E0CADE20]();
}

uint64_t sub_1AE424CBC()
{
  return MEMORY[0x1E0CADE48]();
}

uint64_t sub_1AE424CC8()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1AE424CD4()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1AE424CE0()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1AE424CEC()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1AE424CF8()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1AE424D04()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1AE424D10()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1AE424D1C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1AE424D28()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1AE424D34()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1AE424D40()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1AE424D4C()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1AE424D58()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1AE424D64()
{
  return MEMORY[0x1E0CA8700]();
}

uint64_t sub_1AE424D70()
{
  return MEMORY[0x1E0CA8720]();
}

uint64_t sub_1AE424D7C()
{
  return MEMORY[0x1E0DF01F8]();
}

uint64_t sub_1AE424D88()
{
  return MEMORY[0x1E0DF0220]();
}

uint64_t sub_1AE424D94()
{
  return MEMORY[0x1E0DF0290]();
}

uint64_t sub_1AE424DA0()
{
  return MEMORY[0x1E0DF0308]();
}

uint64_t sub_1AE424DAC()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_1AE424DB8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1AE424DC4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1AE424DD0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1AE424DDC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1AE424DE8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1AE424DF4()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1AE424E00()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1AE424E0C()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1AE424E18()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1AE424E24()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1AE424E30()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1AE424E3C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1AE424E48()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1AE424E54()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1AE424E60()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1AE424E6C()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1AE424E78()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1AE424E84()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1AE424E90()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1AE424E9C()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1AE424EA8()
{
  return MEMORY[0x1E0C9B900]();
}

uint64_t sub_1AE424EB4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1AE424EC0()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1AE424ECC()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1AE424ED8()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1AE424EE4()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1AE424EF0()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1AE424EFC()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1AE424F08()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1AE424F14()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1AE424F20()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1AE424F2C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1AE424F38()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1AE424F44()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1AE424F50()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1AE424F5C()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1AE424F68()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1AE424F74()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1AE424F80()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1AE424F8C()
{
  return MEMORY[0x1E0DEDF40]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
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

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x1E0C9BB48](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x1E0C9BB50](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x1E0C9BB58](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BB68](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE60](plist);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1E0C9BEF0]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF28](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF40](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF48](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF50](a1);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1E0C9C5D8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CFArrayRef CGImageDestinationCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1E0CBC328]();
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC368](idst, properties);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC588](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x1E0CB3150](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFURLCopyLogicalURLOfPromiseAtURL()
{
  return MEMORY[0x1E0C9A628]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x1E0C9A718]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1E0C9A730]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1E0C9A748]();
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1E0C83420](a1);
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

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
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

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1E0C841B0](a1, *(_QWORD *)&a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1E0C85A90](*(_QWORD *)&target_task, source_address, size, dest_address);
}

char *__cdecl xattr_name_with_flags(const char *a1, xattr_flags_t a2)
{
  return (char *)MEMORY[0x1E0C85D60](a1, a2);
}

