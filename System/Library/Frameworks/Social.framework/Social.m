void sub_1BCD81A00(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1BCD81A20(void *a1, int a2)
{
  void *v2;

  objc_begin_catch(a1);
  if (a2 == 2)
  {

    objc_end_catch();
  }
  JUMPOUT(0x1BCD81908);
}

void _SLSystemConfigManagerPreferencesCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = (void *)MEMORY[0x1C3B6C6F0]();
  pthread_mutex_lock(&__SystemConfigManagerMutex);
  +[SLSystemConfigManager sharedInstanceForCallbackWhileLocked:](SLSystemConfigManager, "sharedInstanceForCallbackWhileLocked:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(&__SystemConfigManagerMutex);
  if (v6)
    objc_msgSend(v6, "_notifyTarget:", a2);

  objc_autoreleasePoolPop(v5);
}

void sub_1BCD83640(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1BCD83458);
  }
  objc_exception_rethrow();
}

void sub_1BCD83668(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1BCD853C4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 136));
  _Unwind_Resume(a1);
}

void sub_1BCD85A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCD86200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
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

uint64_t _SLServiceRegionIsChina()
{
  void *v0;
  void *v1;
  uint64_t v2;

  CPGetDeviceRegionCode();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "isEqualToString:", CFSTR("CH"));
  else
    v2 = 0;

  return v2;
}

uint64_t _SLServiceChineseKeyboardInstalled()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "enabledInputModeIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        MEMORY[0x1C3B6C4EC](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("zh"), (_QWORD)v11);

        if ((v8 & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

uint64_t _SLServiceHasEntitlement(const __CFString *a1)
{
  const __CFAllocator *Default;
  __SecTask *v3;
  void *v4;
  uint64_t v5;

  Default = CFAllocatorGetDefault();
  v3 = SecTaskCreateFromSelf(Default);
  v4 = (void *)SecTaskCopyValueForEntitlement(v3, a1, 0);
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

void sub_1BCD88E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCD8C014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MKCoordinateRegionMakeWithDistance(double a1, double a2, double a3, double a4)
{
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v8 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  v14 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  if (!getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr)
  {
    v9 = (void *)MapKitLibrary();
    v8 = dlsym(v9, "MKCoordinateRegionMakeWithDistance");
    v12[3] = (uint64_t)v8;
    getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr = v8;
  }
  _Block_object_dispose(&v11, 8);
  if (!v8)
    __MKCoordinateRegionMakeWithDistance_cold_1();
  return ((uint64_t (*)(double, double, double, double))v8)(a1, a2, a3, a4);
}

void sub_1BCD8C0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1BCD8CAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCD8D250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double initMKMapRectNull()
{
  void *v0;
  __int128 *v1;
  __int128 v2;

  v0 = (void *)MapKitLibrary();
  v1 = (__int128 *)dlsym(v0, "MKMapRectNull");
  if (!v1)
    initMKMapRectNull_cold_1();
  v2 = v1[1];
  constantMKMapRectNull = *v1;
  *(_OWORD *)&qword_1EF493F10 = v2;
  getMKMapRectNull = (uint64_t (*)())MKMapRectNullFunction;
  return *(double *)&constantMKMapRectNull;
}

uint64_t MapKitLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!MapKitLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E75909B0;
    v3 = 0;
    MapKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MapKitLibraryCore_frameworkLibrary)
    MapKitLibrary_cold_1(&v1);
  return MapKitLibraryCore_frameworkLibrary;
}

double MKMapRectNullFunction()
{
  return *(double *)&constantMKMapRectNull;
}

Class __getMKLocationManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  MapKitLibrary();
  result = objc_getClass("MKLocationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMKLocationManagerClass_block_invoke_cold_1();
  getMKLocationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMKMapViewClass_block_invoke(uint64_t a1)
{
  Class result;

  MapKitLibrary();
  result = objc_getClass("MKMapView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMKMapViewClass_block_invoke_cold_1();
  getMKMapViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

char *OUTLINED_FUNCTION_0()
{
  return dlerror();
}

void sub_1BCD8EE84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BCD90138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCD92C24(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1BCD92B0CLL);
  }
  objc_exception_rethrow();
}

void sub_1BCD92C4C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1BCD96AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCD96DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCD973CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCD975C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCD9E038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void _SLSheetURLPreviewImageFrameWithBounds()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");

}

void sub_1BCD9EDFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t SLAttachmentPayloadIsAssetLibraryURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "payload");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("assets-library"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t SLAttachmentPayloadIsVideoFileURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  if (objc_msgSend(v1, "type") == 9)
  {
    objc_msgSend(v1, "payload");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "payload");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scheme");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("file"));

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id _SLAttachmentURLForAsset(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;

  v2 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "defaultRepresentation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "url");
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _SLLog(v1, 3, CFSTR("SLAttachment media assets must be URLs or ALAssets - returning nil attachment"));
      v3 = 0;
    }
  }

  return v3;
}

CGImageRef SLCreateThumbnailImageForImageData(const __CFData *a1, uint64_t a2)
{
  CGImageSourceRef v2;
  CGImageSource *v3;
  CFNumberRef v4;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  CGImageRef ThumbnailAtIndex;
  uint64_t v10;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  v10 = a2;
  v2 = CGImageSourceCreateWithData(a1, 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFNumberCreate(0, kCFNumberNSIntegerType, &v10);
  v5 = (void *)*MEMORY[0x1E0C9AE50];
  v6 = (void *)*MEMORY[0x1E0CBD180];
  keys[0] = *(void **)MEMORY[0x1E0CBD190];
  keys[1] = v6;
  values[0] = v5;
  values[1] = v5;
  keys[2] = *(void **)MEMORY[0x1E0CBD2A0];
  values[2] = v4;
  v7 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v3, 0, v7);
  CFRelease(v4);
  CFRelease(v7);
  CFRelease(v3);
  return ThumbnailAtIndex;
}

CGImageSource *SLDownSampledImageData(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  const __CFData *v6;
  CGImageSource *v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CGImage *ImageAtIndex;
  CGImageDestinationRef v18;
  CGImageDestination *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v24 = a2;
  _SLLog(v3, 6, CFSTR("Will downsample image to target width:%i height:%i"));
  v7 = CGImageSourceCreateWithData(v6, 0);

  if (v7)
  {
    v8 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
    v9 = v8;
    if (v8)
    {
      -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0], a2, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = v11;
        v13 = *MEMORY[0x1E0CBD0C0];
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0C0]);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
        {
          v25 = v13;
          v26[0] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {

          v16 = 0;
        }

LABEL_11:
        if (CGImageSourceGetCount(v7))
        {
          ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
          CFRelease(v7);
          if (ImageAtIndex)
          {
            v7 = (CGImageSource *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
            v18 = CGImageDestinationCreateWithData(v7, CFSTR("public.jpeg"), 1uLL, 0);
            if (v18)
            {
              v19 = v18;
              v20 = (void *)objc_opt_new();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E75AE038, *MEMORY[0x1E0CBC780]);
              if (a2 && a3)
              {
                if (a2 <= a3)
                  v21 = a3;
                else
                  v21 = a2;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21, v24);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CBC778]);

              }
              _SLLog(v3, 6, CFSTR("Orientation is %@"));
              if (v10)
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CBCFF0], v10);
              if (v16)
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CBD090]);
              CGImageDestinationAddImage(v19, ImageAtIndex, (CFDictionaryRef)v20);
              CGImageDestinationFinalize(v19);
              CFRelease(v19);

            }
            CGImageRelease(ImageAtIndex);
            goto LABEL_28;
          }
        }
        else
        {
          CFRelease(v7);
        }
        v7 = 0;
LABEL_28:

        return v7;
      }
    }
    else
    {
      v10 = 0;
    }
    v16 = 0;
    goto LABEL_11;
  }
  _SLLog(v3, 6, CFSTR("SLImageDownsampling cannot create image source, returning nil"));
  return v7;
}

uint64_t SLServiceMain(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 5, CFSTR("SLServiceMain is creating a service listener for %@"));

  objc_msgSend(v4, "beginAcceptingConnections", v6);
  return 0;
}

__CFString *SLUserDataDirectory()
{
  const __CFURL *v0;
  const __CFURL *v1;
  const __CFString *v2;
  const __CFString *v3;
  __CFString *MutableCopy;

  v0 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v0)
  {
    v1 = v0;
    v2 = CFURLCopyFileSystemPath(v0, kCFURLPOSIXPathStyle);
    if (v2)
    {
      v3 = v2;
      MutableCopy = CFStringCreateMutableCopy(0, 0, v2);
      CFStringAppend(MutableCopy, CFSTR("/Library/Social/"));
      CFRelease(v3);
    }
    else
    {
      MutableCopy = 0;
    }
    CFRelease(v1);
  }
  else
  {
    MutableCopy = 0;
  }
  return MutableCopy;
}

id SLUserLibraryDirectory()
{
  if (SLUserLibraryDirectory_onceToken != -1)
    dispatch_once(&SLUserLibraryDirectory_onceToken, &__block_literal_global_4);
  return (id)SLUserLibraryDirectory_userLibraryDirectory;
}

id SLSocialFrameworkBundle()
{
  if (SLSocialFrameworkBundle_onceToken != -1)
    dispatch_once(&SLSocialFrameworkBundle_onceToken, &__block_literal_global_4);
  return (id)SLSocialFrameworkBundle_socialBundle;
}

void sub_1BCDA3E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void ___startObservingPreferenceChanges_block_invoke()
{
  NSObject *v0;

  _preferencesQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch("com.apple.social.facebook.envDidChange", (int *)&_startObservingPreferenceChanges_token, v0, &__block_literal_global_54);

}

uint64_t ___startObservingPreferenceChanges_block_invoke_2()
{
  return CFPreferencesAppSynchronize(CFSTR("com.apple.social.facebook"));
}

id _preferencesQueue()
{
  if (_preferencesQueue_once != -1)
    dispatch_once(&_preferencesQueue_once, &__block_literal_global_55);
  return (id)_preferencesQueue_queue;
}

void ___preferencesQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.social.facebook.preferencesQueue", 0);
  v1 = (void *)_preferencesQueue_queue;
  _preferencesQueue_queue = (uint64_t)v0;

}

void sub_1BCDA4998(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1BCDA48C4);
}

void OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  _SLLog(v3, 3, a3);
}

void sub_1BCDA6E84(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1BCDA7668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCDA7954(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1BCDA7A4C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _SLLog(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;

  v3 = _SLGetLogSystem_onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_SLGetLogSystem_onceToken, &__block_literal_global_7);
  os_log_shim_with_CFString();

}

void sub_1BCDB0610(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_1BCDB4548(mach_port_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unint64_t *a5, _QWORD *a6, unsigned int *a7)
{
  mach_port_t reply_port;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  unsigned int v16;
  mach_msg_header_t msg;
  int v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  int v24;

  v18 = 1;
  v19 = a3;
  v20 = 16777472;
  v21 = a4;
  v22 = *MEMORY[0x1E0C804E8];
  v23 = __PAIR64__(a4, a2);
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
  v12 = mach_msg(&msg, 3, 0x3Cu, 0x48u, reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v13;
  }
  if ((_DWORD)v12)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (msg.msgh_id == 71)
  {
    v15 = 4294966988;
  }
  else if (msg.msgh_id == 1300)
  {
    if ((msg.msgh_bits & 0x80000000) != 0)
    {
      v15 = 4294966996;
      if (v18 == 1 && msg.msgh_size == 64 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
      {
        v16 = v21;
        if (v21 == v24)
        {
          *a5 = v23;
          *a6 = v19;
          *a7 = v16;
          return 0;
        }
      }
    }
    else if (msg.msgh_size == 36)
    {
      v15 = 4294966996;
      if (HIDWORD(v19))
      {
        if (msg.msgh_remote_port)
          v15 = 4294966996;
        else
          v15 = HIDWORD(v19);
      }
    }
    else
    {
      v15 = 4294966996;
    }
  }
  else
  {
    v15 = 4294966995;
  }
  mach_msg_destroy(&msg);
  return v15;
}

uint64_t sub_1BCDB473C(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  mach_port_t reply_port;
  uint64_t v7;
  uint64_t v8;
  mach_msg_header_t msg;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = 1;
  v12 = a4;
  v13 = 16777472;
  v14 = a5;
  v15 = *MEMORY[0x1E0C804E8];
  v16 = a2;
  v17 = a3;
  v18 = a5;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v7 = mach_msg(&msg, 3, 0x44u, 0x2Cu, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v8;
  }
  if ((_DWORD)v7)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v8;
  }
  if (msg.msgh_id == 71)
  {
    v8 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v8;
  }
  if (msg.msgh_id != 1301)
  {
    v8 = 4294966995;
    goto LABEL_17;
  }
  v8 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_17;
  if (msg.msgh_size != 36)
    goto LABEL_17;
  if (msg.msgh_remote_port)
    goto LABEL_17;
  v8 = HIDWORD(v12);
  if (HIDWORD(v12))
    goto LABEL_17;
  return v8;
}

uint64_t sub_1BCDB48B4(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7)
{
  mach_port_t reply_port;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  int v15;
  mach_msg_header_t msg;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;

  v17 = 1;
  v18 = a4;
  v19 = 16777472;
  v20 = a5;
  v21 = *MEMORY[0x1E0C804E8];
  v22 = a2;
  v23 = a3;
  v24 = a5;
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
  v11 = mach_msg(&msg, 3, 0x44u, 0x40u, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v12;
  }
  if ((_DWORD)v11)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v12;
  }
  if (msg.msgh_id == 71)
  {
    v14 = 4294966988;
  }
  else if (msg.msgh_id == 1302)
  {
    if ((msg.msgh_bits & 0x80000000) != 0)
    {
      v14 = 4294966996;
      if (v17 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v19) == 1)
      {
        v15 = v20;
        if (v20 == v22)
        {
          *a6 = v18;
          *a7 = v15;
          return 0;
        }
      }
    }
    else if (msg.msgh_size == 36)
    {
      v14 = 4294966996;
      if (HIDWORD(v18))
      {
        if (msg.msgh_remote_port)
          v14 = 4294966996;
        else
          v14 = HIDWORD(v18);
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

uint64_t sub_1BCDB4AA4(mach_port_t a1, unsigned int a2, uint64_t a3)
{
  mach_port_t reply_port;
  uint64_t v5;
  uint64_t v6;
  mach_msg_header_t msg;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v9 = *MEMORY[0x1E0C804E8];
  v10 = a2;
  v11 = a3;
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
  v5 = mach_msg(&msg, 3, 0x2Cu, 0x2Cu, reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v6;
  }
  if ((_DWORD)v5)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v6;
  }
  else
  {
    if (msg.msgh_id == 71)
    {
      v6 = 4294966988;
    }
    else if (msg.msgh_id == 1303)
    {
      v6 = 4294966996;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        v6 = v10;
        if (!v10)
          return v6;
      }
    }
    else
    {
      v6 = 4294966995;
    }
    mach_msg_destroy(&msg);
    return v6;
  }
}

void sub_1BCDB4BF4(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1BCDB4CAC()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8
                                             * (((((v1 + 121702045) & 0x856FEF6) - 4) * (v2 == 0)) ^ (v0 + v1 + 2)))
                            - 8))();
}

uint64_t sub_1BCDB4CEC@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t))(a1 + 8 * (v1 - 3)))(v3);
  *(_DWORD *)(v2 + 24) = 0;
  return result;
}

void KxmB0CKvgWt(uint64_t a1, int a2)
{
  BOOL v2;
  int v3;

  if (a1)
    v2 = a2 == 0;
  else
    v2 = 1;
  v3 = v2;
  __asm { BR              X9 }
}

uint64_t sub_1BCDB4EC4()
{
  return 4294923273;
}

void sub_1BCDB4FF4(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[23];

  *(_QWORD *)&v5[15] = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)a1 ^ (646995413 * ((((2 * a1) | 0x8F18737E) - a1 + 947111489) ^ 0x534DB4D5));
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(unsigned int *)off_1E75918C0[v1 - 36];
  strcpy(v5, "com.apple.absd");
  v4 = *(_QWORD *)((char *)off_1E75918C0[v1 - 46]
                 + 8
                 * ((123
                   * (((unsigned int (*)(uint64_t, _BYTE *, uint64_t))off_1E75918C0[v1 - 40])(v3, v5, v2) == 0)) ^ v1)
                 - 12)
     - ((v1 + 23) ^ 0x41);
  __asm { BR              X9 }
}

void sub_1BCDB50F8()
{
  uint64_t v0;
  int v1;

  *(_DWORD *)(v0 + 4) = v1;
}

void nDYmeMqvWb(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v3;
  int v5;

  if (a1)
    v3 = a2 == 0;
  else
    v3 = 1;
  v5 = v3 || a3 == 0;
  __asm { BR              X9 }
}

uint64_t sub_1BCDB51F4()
{
  return 4294923273;
}

void sub_1BCDB5318(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1BCDB53C4()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, uint64_t (*)()))(v2 + 8 * (v0 & 0x40188)))(*(_QWORD *)(v2 + 8 * (v0 & 0x40000402)), nullsub_1);
  *v1 = -1133814153;
  return result;
}

void t1BoNctgaUu66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  int v5;

  if (a1)
    v4 = a4 == 0;
  else
    v4 = 1;
  v5 = !v4;
  __asm { BR              X9 }
}

uint64_t sub_1BCDB6448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  void (*v11)(int *);
  _QWORD v14[3];
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _QWORD *v19;
  unsigned int v20;

  v14[0] = *(_QWORD *)(v6 + 16);
  v20 = 1829790799 * (((&v18 | 0xDC543C92) - (&v18 & 0xDC543C92)) ^ 0x1E9D9CD9) + 463207035;
  v19 = v14;
  v11 = *(void (**)(int *))(a6 + 48);
  v11(&v18);
  v14[0] = *(_QWORD *)(v6 + 248);
  v14[1] = a1;
  v14[2] = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v19 = v14;
  v20 = 1829790799 * (&v18 ^ 0xC2C9A04B) + 463207035;
  v11(&v18);
  return (v18 - 955058042);
}

uint64_t sub_1BCDB6588(char a1, unsigned int a2)
{
  return byte_1BCDBC170[(byte_1BCDBBE70[a2] ^ a1)] ^ a2;
}

uint64_t sub_1BCDB65B4(unsigned int a1)
{
  return byte_1BCDBC170[byte_1BCDBBE70[a1] ^ 0xCE] ^ a1;
}

uint64_t sub_1BCDB65E0(char a1, unsigned int a2)
{
  return byte_1BCDBC270[(byte_1BCDBBF70[a2] ^ a1)] ^ a2;
}

uint64_t sub_1BCDB660C(unsigned int a1)
{
  return byte_1BCDBC270[byte_1BCDBBF70[a1] ^ 0xE2] ^ a1;
}

uint64_t sub_1BCDB6638(char a1, unsigned int a2)
{
  return byte_1BCDBC070[(byte_1BCDBC570[a2] ^ a1)] ^ a2;
}

uint64_t sub_1BCDB6664(unsigned int a1)
{
  return byte_1BCDBC070[byte_1BCDBC570[a1] ^ 0xD6] ^ a1;
}

uint64_t sub_1BCDB6690(char a1, unsigned int a2)
{
  return byte_1BCDBC470[(byte_1BCDBC370[a2] ^ a1)] ^ a2;
}

uint64_t sub_1BCDB66BC(unsigned int a1)
{
  return byte_1BCDBC470[byte_1BCDBC370[a1] ^ 0x34] ^ a1;
}

uint64_t Be81a395Bf0(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  qword_1EF493E50 = 1681628227 * ((qword_1EF493E50 - (_QWORD)&v4 + qword_1EF493E40) ^ 0x68EECD5B1F580389);
  qword_1EF493E40 = qword_1EF493E50;
  v1 = *(_QWORD *)((char *)off_1E75918C0[((67 * ((2 * qword_1EF493E50) ^ 0x89)) ^ byte_1BCDBC470[byte_1BCDBC370[(67 * ((2 * qword_1EF493E50) ^ 0x89))] ^ 0x34])
                                       - 49]
                 + 140)
     - 4;
  v2 = 942846689 * ((unint64_t)&v5 ^ 0x2DF4282E8CBBA516);
  v5 = v2 ^ 0xF067FA72;
  v6 = a1;
  v7 = v1 ^ v2;
  sub_1BCDB4BF4((uint64_t)&v5);
  return v8;
}

uint64_t IW1PcFszqNK(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  qword_1EF493E48 = 1681628227 * ((qword_1EF493E40 + qword_1EF493E48) ^ (unint64_t)&v4 ^ 0x68EECD5B1F580389);
  qword_1EF493E40 = qword_1EF493E48;
  v1 = *(_QWORD *)((char *)off_1E75918C0[((67 * ((2 * qword_1EF493E48) ^ 0x89)) ^ byte_1BCDBC070[byte_1BCDBC570[(67 * ((2 * qword_1EF493E48) ^ 0x89))] ^ 0xD6])
                                       - 8]
                 + 28)
     - 4;
  v2 = 942846689
     * ((((unint64_t)&v5 | 0xDBD392286209E2F0)
       - ((unint64_t)&v5 | 0x242C6DD79DF61D0FLL)
       + 0x242C6DD79DF61D0FLL) ^ 0xF627BA06EEB247E6);
  v5 = v2 ^ 0xF067FA72;
  v6 = a1;
  v7 = v1 ^ v2;
  sub_1BCDB4BF4((uint64_t)&v5);
  return v8;
}

void __MKCoordinateRegionMakeWithDistance_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MKCoordinateRegion __MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D, CLLocationDistance, CLLocationDistance)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SLSheetPlaceViewController.m"), 45, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void initMKMapRectNull_cold_1()
{
  __assert_rtn("initMKMapRectNull", "SLSheetPlaceViewController.m", 68, "constant");
}

void MapKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MapKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SLSheetPlaceViewController.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMKLocationManagerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMKLocationManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SLSheetPlaceViewController.m"), 42, CFSTR("Unable to find class %s"), "MKLocationManager");

  __break(1u);
}

void __getMKMapViewClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMKMapViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SLSheetPlaceViewController.m"), 41, CFSTR("Unable to find class %s"), "MKMapView");

  __break(1u);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1E0C98368]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C993F8](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFE8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextEOClip(CGContextRef c)
{
  MEMORY[0x1E0C9C1E8](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
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

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

uint64_t CPFileBuildDirectoriesToPath()
{
  return MEMORY[0x1E0CFA280]();
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1E0CFA2A0]();
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x1E0CFA908]();
}

uint64_t DMCopyCurrentBuildVersion()
{
  return MEMORY[0x1E0D1CF88]();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x1E0D27B50]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1E0D4E580]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
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

uint64_t SBSCopyBundleInfoValueForKeyAndProcessID()
{
  return MEMORY[0x1E0DAB5F0]();
}

uint64_t SBSCopyDisplayIdentifiersForProcessID()
{
  return MEMORY[0x1E0DAB600]();
}

uint64_t SBSCopyLocalizedApplicationNameForDisplayIdentifier()
{
  return MEMORY[0x1E0DAB610]();
}

int SCError(void)
{
  return MEMORY[0x1E0CE87E0]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89B8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89C0](prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89D0](allocator, name, prefsID, authorization);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE89E0](prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x1E0CE89E8](prefs, wait);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE89F8](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1E0CE8A00](prefs, callout, context);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x1E0CE8A28](prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x1E0CE8A30](prefs);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE8A38](prefs);
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE8A40](prefs, runLoop, runLoopMode);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

uint64_t SecTrustCopyInfo()
{
  return MEMORY[0x1E0CD6668]();
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1E0CD66A8](trust, result);
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0CEB250]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0CEB628]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0CEB650]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0CEB658](context);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0CEB680](image, compressionQuality);
}

uint64_t UIKeyboardForceOrderInAutomaticAnimated()
{
  return MEMORY[0x1E0CEB868]();
}

uint64_t UIKeyboardForceOrderInAutomaticFromDirectionWithDuration()
{
  return MEMORY[0x1E0CEB870]();
}

uint64_t UIKeyboardForceOrderOutAutomaticAnimated()
{
  return MEMORY[0x1E0CEB878]();
}

uint64_t UIKeyboardForceOrderOutAutomaticToDirectionWithDuration()
{
  return MEMORY[0x1E0CEB880]();
}

uint64_t UIKeyboardInputModeGetBaseLanguage()
{
  return MEMORY[0x1E0CEB898]();
}

uint64_t UIKeyboardIsAutomaticAppearanceEnabled()
{
  return MEMORY[0x1E0CEB8B0]();
}

uint64_t UIKeyboardOrderInAutomaticFromDirectionWithDuration()
{
  return MEMORY[0x1E0CEB8D0]();
}

uint64_t UIKeyboardOrderOutAutomaticToDirectionWithDuration()
{
  return MEMORY[0x1E0CEB8F8]();
}

uint64_t WebThreadRun()
{
  return MEMORY[0x1E0CEF7F8]();
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x1E0C8F300]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _UISharedImageSetPreferredImageScale()
{
  return MEMORY[0x1E0CEC190]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

uint64_t os_log_shim_with_CFString()
{
  return MEMORY[0x1E0C84770]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

