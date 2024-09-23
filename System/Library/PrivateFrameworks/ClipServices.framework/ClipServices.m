uint64_t CPSClipsFeatureEnabled()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (!_os_feature_enabled_impl())
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getMCProfileConnectionClass_softClass_1;
  v9 = getMCProfileConnectionClass_softClass_1;
  if (!getMCProfileConnectionClass_softClass_1)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMCProfileConnectionClass_block_invoke_1;
    v5[3] = &unk_24C3B9278;
    v5[4] = &v6;
    __getMCProfileConnectionClass_block_invoke_1((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppClipsAllowed");

  return v3;
}

void sub_20AD463C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AD4649C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20AD46E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDSArchiveServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C3B9298;
    v5 = 0;
    DesktopServicesPrivLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary)
    __getDSArchiveServiceClass_block_invoke_cold_1(&v3);
  result = objc_getClass("DSArchiveService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDSArchiveServiceClass_block_invoke_cold_2();
  getDSArchiveServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_2(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3()
{
  uint64_t v0;

  return v0;
}

void sub_20AD480C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
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

void sub_20AD48F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20AD492E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_20AD49AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t ManagedConfigurationLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24C3B9610;
    v3 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    ManagedConfigurationLibrary_cold_1(&v1);
  return ManagedConfigurationLibraryCore_frameworkLibrary;
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;

  ManagedConfigurationLibrary();
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMCProfileConnectionClass_block_invoke_cold_1();
  getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id OUTLINED_FUNCTION_8(uint64_t a1, void *a2)
{
  return a2;
}

double _CPSScreenScale()
{
  if (_CPSScreenScale_onceToken != -1)
    dispatch_once(&_CPSScreenScale_onceToken, &__block_literal_global_0);
  return *(float *)&_CPSScreenScale_scale;
}

id _CPSUnmaskedIconImageDescriptor()
{
  id v0;
  void *v1;

  v0 = objc_alloc(MEMORY[0x24BE51AB0]);
  if (_CPSScreenScale_onceToken != -1)
    dispatch_once(&_CPSScreenScale_onceToken, &__block_literal_global_0);
  v1 = (void *)objc_msgSend(v0, "initWithSize:scale:", (double)0xB4uLL, (double)0xB4uLL, *(float *)&_CPSScreenScale_scale);
  objc_msgSend(v1, "setShouldApplyMask:", 0);
  return v1;
}

__CFData *_CPSCreateUnmaskedIconDataForBundle(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  __CFData *Mutable;
  CGImageDestination *v7;
  NSObject *v8;

  v1 = (objc_class *)MEMORY[0x24BE51A90];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithBundleIdentifier:", v2);

  _CPSUnmaskedIconImageDescriptor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForImageDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  Mutable = CFDataCreateMutable(0, 0);
  v7 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x24BDC1820], 1uLL, 0);
  CGImageDestinationAddImage(v7, (CGImageRef)objc_msgSend(v5, "cgImage"), 0);
  if (CGImageDestinationFinalize(v7))
  {
    CFRelease(v7);
  }
  else
  {
    v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      _CPSCreateUnmaskedIconDataForBundle_cold_1(v8);
    CFRelease(v7);
    CFRelease(Mutable);
    Mutable = 0;
  }

  return Mutable;
}

double _CPSHeroImagePreferredSize()
{
  if (_CPSHeroImagePreferredSize_onceToken != -1)
    dispatch_once(&_CPSHeroImagePreferredSize_onceToken, &__block_literal_global_3);
  return *(double *)&_CPSHeroImagePreferredSize_preferredSize_0;
}

void sub_20AD4D9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_6_0(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_11(uint64_t a1, void *a2)
{
  return a2;
}

void sub_20AD4EA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
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

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

id pathForWebClipWithIdentifier(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "cps_stringByRemovingPrefix:", CFSTR("com.apple.appclip-"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cps_stringByRemovingPrefix:", CFSTR("com.apple.webapp-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  webClipsDirectoryPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("webclip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id iconPathForWebClipWithIdentifier(void *a1)
{
  void *v1;
  void *v2;

  pathForWebClipWithIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("icon.png"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
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

id webClipsDirectoryPath()
{
  void *v0;
  void *v1;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/WebClips"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v0, 0);

  return v0;
}

id OUTLINED_FUNCTION_6_1(uint64_t a1, void *a2)
{
  return a2;
}

id CPSConfigurationContextForObject(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v1 = (objc_class *)MEMORY[0x24BEB0AD0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v4, "setObject:forSetting:", v2, 0);

  v5 = objc_alloc(MEMORY[0x24BE0BD80]);
  v6 = (void *)objc_msgSend(v5, "initWithInfo:timeout:forResponseOnQueue:withHandler:", v4, MEMORY[0x24BDAC9B8], 0, 0.0);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActions:", v7);

  return v3;
}

uint64_t BOOLForPreferenceKey(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x24BDBCF50];
  v2 = a1;
  objc_msgSend(v1, "cps_clipServicesDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", v2);

  return v4;
}

CGImageRef CPSCreateImageWithContentsOfFile(void *a1)
{
  void *v1;
  id v2;
  const __CFData *v3;
  CGDataProvider *v4;
  void *v5;
  void *v6;
  CGImageRef v7;
  CGImageRef v8;

  v1 = (void *)MEMORY[0x24BDBCE50];
  v2 = a1;
  objc_msgSend(v1, "dataWithContentsOfFile:", v2);
  v3 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v4 = CGDataProviderCreateWithCFData(v3);

  objc_msgSend(v2, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("jpg")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("jpeg")))
  {
    v7 = CGImageCreateWithJPEGDataProvider(v4, 0, 1, kCGRenderingIntentDefault);
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("png")))
    {
      v8 = 0;
      goto LABEL_5;
    }
    v7 = CGImageCreateWithPNGDataProvider(v4, 0, 1, kCGRenderingIntentDefault);
  }
  v8 = v7;
LABEL_5:

  return v8;
}

CGImage *CPSImagePNGRepresentation(CGImage *a1)
{
  CGImage *v1;
  __CFData *v2;
  __CFData *v3;
  CGImageDestinationRef v4;
  CGImageDestination *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  __CFData *v12;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v2 = (__CFData *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = CGImageDestinationCreateWithData(v2, CFSTR("public.png"), 1uLL, 0);
      if (v4)
      {
        v5 = v4;
        v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLong:", 8);
        v8 = objc_alloc(MEMORY[0x24BDBCE70]);
        v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v7, *MEMORY[0x24BDD96A8], 0);
        objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x24BDD96B0]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v10, *MEMORY[0x24BDD96A0]);
        CGImageDestinationAddImage(v5, v1, (CFDictionaryRef)v6);
        v11 = CGImageDestinationFinalize(v5);
        CFRelease(v5);

        if (v11)
          v12 = v3;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v1 = v12;
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

CGImageRef CPSCreateImageFromImageAndBackgroundColor(CGImage *a1, CGColor *a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double v15;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  NSObject *v21;
  CGColorSpace *v22;
  size_t AlignedBytesPerRow;
  CGContext *v24;
  CGImageRef Image;
  NSObject *v26;
  CGAffineTransform v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v15 = a5;
  if (a5 == 0.0)
    v15 = _CPSScreenScale();
  v18 = vcvtpd_u64_f64(a3 * v15);
  v19 = vcvtpd_u64_f64(a4 * v15);
  if (v18)
    v20 = v19 == 0;
  else
    v20 = 1;
  if (v20)
  {
    v21 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      CPSCreateImageFromImageAndBackgroundColor_cold_1(v18, v19, v21);
    return 0;
  }
  v22 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  CGColorSpaceGetNumberOfComponents(v22);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v24 = CGBitmapContextCreate(0, v18, v19, 8uLL, AlignedBytesPerRow, v22, 0x2002u);
  if (v22)
    CGColorSpaceRelease(v22);
  if (!v24)
  {
    v26 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      CPSCreateImageFromImageAndBackgroundColor_cold_2(v26);
    return 0;
  }
  v29.size.width = (double)v18;
  v29.size.height = (double)v19;
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  CGContextClearRect(v24, v29);
  CGContextScaleCTM(v24, v15, v15);
  CGContextGetCTM(&v28, v24);
  CGContextSetBaseCTM();
  CGContextSetFillColorWithColor(v24, a2);
  v30.origin.x = a6;
  v30.origin.y = a7;
  v30.size.width = a8;
  v30.size.height = a9;
  CGContextFillRect(v24, v30);
  v31.origin.x = a6;
  v31.origin.y = a7;
  v31.size.width = a8;
  v31.size.height = a9;
  CGContextDrawImage(v24, v31, a1);
  Image = CGBitmapContextCreateImage(v24);
  CGContextRelease(v24);
  return Image;
}

void sub_20AD55C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_20AD56940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void sub_20AD56F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AD5A2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  id *v27;
  uint64_t v28;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

void *__getCKErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C3B9FF0;
    v5 = 0;
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary)
    __getCKErrorDomainSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)CloudKitLibraryCore_frameworkLibrary, "CKErrorDomain");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCKErrorDomainSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id cps_networkUnavailableErrorLocalizedDescription()
{
  return _CPSLocalizedString(CFSTR("The Internet connection appears to be offline."), &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
}

id _CPSLocalizedString(void *a1, dispatch_once_t *a2, id *a3)
{
  dispatch_once_t v5;
  id v6;
  void *v7;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___CPSLocalizedString_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  v5 = *a2;
  v6 = a1;
  if (v5 != -1)
    dispatch_once(a2, block);
  objc_msgSend(*a3, "localizedStringForKey:value:table:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_20AD5B5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_24C3BA050;
    v5 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ManagedConfigurationLibraryCore_frameworkLibrary_0)
    __getMCProfileConnectionClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMCProfileConnectionClass_block_invoke_cold_2();
  getMCProfileConnectionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20AD5C18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getCLLocationManagerClass()
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
  v0 = (void *)getCLLocationManagerClass_softClass;
  v7 = getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke;
    v3[3] = &unk_24C3B9278;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20AD5C244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id LocationBundle()
{
  if (LocationBundle_onceToken != -1)
    dispatch_once(&LocationBundle_onceToken, &__block_literal_global_120);
  return (id)LocationBundle_bundle;
}

Class __getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreLocationLibrary();
  result = objc_getClass("CLLocationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCLLocationManagerClass_block_invoke_cold_1();
  getCLLocationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreLocationLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24C3BA0B8;
    v3 = 0;
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreLocationLibraryCore_frameworkLibrary)
    CoreLocationLibrary_cold_1(&v1);
  return CoreLocationLibraryCore_frameworkLibrary;
}

void sub_20AD5D060(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20AD5D204(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_20AD5E098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCCUIAppLaunchOriginControlCenterSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ControlCenterUIKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C3BA2C8;
    v5 = 0;
    ControlCenterUIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ControlCenterUIKitLibraryCore_frameworkLibrary)
    __getCCUIAppLaunchOriginControlCenterSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)ControlCenterUIKitLibraryCore_frameworkLibrary, "CCUIAppLaunchOriginControlCenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCCUIAppLaunchOriginControlCenterSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CPSClipMetadataFetchIgnoresCache()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPSClipMetadataFetchIgnoresCache"));

  return v1;
}

uint64_t CPSShouldValidateAssociatedDomains()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPSSkipValidatingAssociatedDomains")) ^ 1;

  return v1;
}

uint64_t CPSBypassAccountEligibilityCheck()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPSBypassAccountEligibilityCheck"));

  return v1;
}

uint64_t CPSAccountPolicyOverride()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerForKey:", CFSTR("CPSAccountPolicyOverride"));

  return v1;
}

uint64_t CPSUsesDemoProgressFill()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("_CPSClipUsesDemoProgressFill"));

  return v1;
}

uint64_t CPSAMSRestrictionsCodeOverride()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerForKey:", CFSTR("CPSAMSRestrictionsCodeOverride"));

  return v1;
}

uint64_t CPSSimulateLargeSizeAppClipForTesting()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPSSimulateLargeSizeAppClip"));

  return v1;
}

Class __getMCProfileConnectionClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary_1)
  {
    v4 = xmmword_24C3BA318;
    v5 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!ManagedConfigurationLibraryCore_frameworkLibrary_1)
    __getMCProfileConnectionClass_block_invoke_cold_1_1(&v3);
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMCProfileConnectionClass_block_invoke_cold_2_0();
  getMCProfileConnectionClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20AD5F594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
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

void sub_20AD6001C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_20AD6034C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMStreamsClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMStreamsClass_block_invoke_cold_1();
  getBMStreamsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void BiomeStreamsLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24C3BA378;
    v2 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
    BiomeStreamsLibrary_cold_1(&v0);
}

Class __getBMAppClipLaunchEventClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMAppClipLaunchEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMAppClipLaunchEventClass_block_invoke_cold_1();
  getBMAppClipLaunchEventClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_3_1(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t CPS_LOG_CHANNEL_PREFIXClipServices()
{
  if (CPS_LOG_CHANNEL_PREFIXClipServices_onceToken != -1)
    dispatch_once(&CPS_LOG_CHANNEL_PREFIXClipServices_onceToken, &__block_literal_global_10);
  return CPS_LOG_CHANNEL_PREFIXClipServices_log;
}

void sub_20AD64FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_20AD65268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AD654E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AD65974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AD65EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_3_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return objc_opt_class();
}

void sub_20AD66C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20AD69090(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20AD69974(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_20AD69B88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20AD6D354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_20AD6D4E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20AD6D620(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20AD6D864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id SafariShared::WBSSQLiteDatabaseFetch<>(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D98]), "initWithDatabase:query:", v3, v4);
  objc_msgSend(v5, "fetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_20AD6D8F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20AD6DA34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6DBF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6DCC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6DEEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6E070(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6E140(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6E20C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6E2D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6E3A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6E470(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6E600(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6E754(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20AD6E8E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20AD6EBB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20AD6EEB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20AD6F1D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

id SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a1;
  v6 = a2;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D98]), "initWithDatabase:query:", v5, v6);
  objc_msgSend(v7, "bindString:atParameterIndex:", *a3, 1);
  objc_msgSend(v7, "fetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_20AD6F2E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20AD6F530(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20AD6F6E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20AD6F878(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(void *a1, _QWORD *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v13;

  v5 = a1;
  v6 = a3;
  v13 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D98]), "initWithDatabase:query:error:", v5, v6, &v13);
  v8 = v13;
  v9 = v8;
  if (v7)
  {
    v10 = objc_msgSend(v7, "execute");
    objc_msgSend(v7, "invalidate");
    if ((v10 - 100) >= 2 && (_DWORD)v10 != 0)
      objc_msgSend(v5, "reportErrorWithCode:statement:error:", v10, objc_msgSend(v7, "handle"), a2);
  }
  else
  {
    if (a2)
      *a2 = objc_retainAutorelease(v8);
    v10 = objc_msgSend(v9, "code");
  }

  return v10;
}

void sub_20AD6F9D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},NSString * {__strong},double>(void *a1, _QWORD *a2, _QWORD *a3, double *a4)
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "bindString:atParameterIndex:", *a2, 1);
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},double>(v7, a3, a4);

}

void sub_20AD6FA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},double>(void *a1, _QWORD *a2, double *a3)
{
  id v5;

  v5 = a1;
  objc_msgSend(v5, "bindString:atParameterIndex:", *a2, 2);
  objc_msgSend(v5, "bindDouble:atParameterIndex:", 3, *a3);

}

void sub_20AD6FAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_6(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_1_3(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_20AD70154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20AD71DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *stringForUserDecision(void *a1)
{
  int v1;
  __CFString *v2;

  if (!a1)
    return CFSTR("none");
  v1 = objc_msgSend(a1, "BOOLValue");
  v2 = CFSTR("disallow");
  if (v1)
    v2 = CFSTR("allow");
  return v2;
}

void __getDSArchiveServiceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *DesktopServicesPrivLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CPSAppInstaller.m"), 14, CFSTR("%s"), *a1);

  __break(1u);
}

void __getDSArchiveServiceClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getDSArchiveServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSAppInstaller.m"), 15, CFSTR("Unable to find class %s"), "DSArchiveService");

  __break(1u);
}

void ManagedConfigurationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CPSClipCleanupManager.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSClipCleanupManager.m"), 28, CFSTR("Unable to find class %s"), "MCProfileConnection");

  __break(1u);
}

void _CPSCreateUnmaskedIconDataForBundle_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20AD44000, log, OS_LOG_TYPE_ERROR, "Unable to render image to in-memory data representation", v1, 2u);
}

void CPSCreateImageFromImageAndBackgroundColor_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_20AD44000, log, OS_LOG_TYPE_ERROR, "_CreateBitmapContext - invalid size: (%zu x %zu)", (uint8_t *)&v3, 0x16u);
}

void CPSCreateImageFromImageAndBackgroundColor_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20AD44000, log, OS_LOG_TYPE_ERROR, "_CreateBitmapContext - failed to allocate CGBitampContext", v1, 2u);
}

void __getCKErrorDomainSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CPSSession.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CPSClipInvocationPolicy.m"), 14, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSClipInvocationPolicy.m"), 15, CFSTR("Unable to find class %s"), "MCProfileConnection");

  __break(1u);
}

void __getCLLocationManagerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLLocationManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSLocationProvider.m"), 13, CFSTR("Unable to find class %s"), "CLLocationManager");

  __break(1u);
}

void CoreLocationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CPSLocationProvider.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCCUIAppLaunchOriginControlCenterSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ControlCenterUIKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CPSUtilities.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_1_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CPSPreferences.m"), 9, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSPreferences.m"), 10, CFSTR("Unable to find class %s"), "MCProfileConnection");

  __break(1u);
}

void __getBMStreamsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getBMStreamsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSClipEventsReporter.m"), 16, CFSTR("Unable to find class %s"), "BMStreams");

  __break(1u);
}

void BiomeStreamsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *BiomeStreamsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CPSClipEventsReporter.m"), 15, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBMAppClipLaunchEventClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getBMAppClipLaunchEventClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSClipEventsReporter.m"), 17, CFSTR("Unable to find class %s"), "BMAppClipLaunchEvent");

  __break(1u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBA48](url);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x24BDBDE98](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x24BDBDFA8]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE5E8](image);
}

CGImageRef CGImageCreateWithJPEGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE608](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE618](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return MEMORY[0x24BE04650]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

uint64_t IXStringForClientID()
{
  return MEMORY[0x24BE51F60]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x24BED8460]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x24BED8480]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SBRemoveWebClipFromHomeScreen()
{
  return MEMORY[0x24BEB0BC0]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x24BEB0D48]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x24BEB3780]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x24BEB37F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x24BDBCF60]();
}

uint64_t _CFBundleCopyFrameworkURLForExecutablePath()
{
  return MEMORY[0x24BDBCF68]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x24BDAE108]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

