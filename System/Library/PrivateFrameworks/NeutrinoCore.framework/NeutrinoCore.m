id NUAssertLogger()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_6342);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_6468);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7844);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13859);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14252);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16700);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20196);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21352);
  return (id)_NUAssertLogger;
}

{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
  return (id)_NUAssertLogger;
}

void sub_1A655B48C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A655B57C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A655B790(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id averageLTMFilter(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  float *v15;
  uint64_t v16;
  uint64_t i;
  float *v18;
  float *v19;
  uint64_t v20;
  float v21;
  float v22;
  uint64_t v23;

  v1 = a1;
  v2 = (void *)objc_msgSend(v1, "copy");
  objc_msgSend(v1, "valueForKey:", CFSTR("inputMapPointsH"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  objc_msgSend(v1, "valueForKey:", CFSTR("inputMapPointsV"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v1, "valueForKey:", CFSTR("inputMapPointsN"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v1, "valueForKey:", CFSTR("inputGainData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * v8);
  v12 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v12, "bytes");
  v14 = objc_retainAutorelease(v11);
  v15 = (float *)objc_msgSend(v14, "mutableBytes");
  v16 = (v6 * v4);
  if ((int)v16 >= 1)
  {
    for (i = 0; i != v16; ++i)
    {
      v18 = (float *)v13;
      v19 = v15;
      v20 = v10;
      if ((int)v10 >= 1)
      {
        do
        {
          v21 = *v18++;
          *v19 = v21 + *v19;
          ++v19;
          --v20;
        }
        while (v20);
      }
      v13 += 4 * v10;
    }
  }
  if ((int)v10 >= 1)
  {
    v22 = (float)(int)v16;
    v23 = v10;
    do
    {
      *v15 = *v15 / v22;
      ++v15;
      --v23;
    }
    while (v23);
  }
  objc_msgSend(v2, "setValue:forKey:", &unk_1E50A2298, CFSTR("inputMapPointsH"));
  objc_msgSend(v2, "setValue:forKey:", &unk_1E50A2298, CFSTR("inputMapPointsV"));
  objc_msgSend(v2, "setValue:forKey:", &unk_1E50A3738, CFSTR("inputMapSpacingH"));
  objc_msgSend(v2, "setValue:forKey:", &unk_1E50A3738, CFSTR("inputMapSpacingV"));
  objc_msgSend(v2, "setValue:forKey:", &unk_1E50A3738, CFSTR("inputMapOriginH"));
  objc_msgSend(v2, "setValue:forKey:", &unk_1E50A3738, CFSTR("inputMapOriginV"));
  objc_msgSend(v2, "setValue:forKey:", v14, CFSTR("inputGainData"));

  return v2;
}

id NUAssertLogger_5()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_39()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_52);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_79()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_86);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_158()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_168);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_208()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_221);
  return (id)_NUAssertLogger;
}

void sub_1A6562A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

id NUAssertLogger_286()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_375()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_385);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_456()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_421);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_551()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_562);
  return (id)_NUAssertLogger;
}

void sub_1A656B954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__586(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__587(uint64_t a1)
{

}

void sub_1A656E3D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getStringEnv(void *a1)
{
  id v1;
  id v2;
  char *v3;
  void *v4;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    NUAssertLogger_728();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_728();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v13;
        v24 = 2114;
        v25 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"NSString *getStringEnv(NSString *__strong)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUGlobalSettings.m", 24, CFSTR("Invalid parameter not satisfying: %s"), v18, v19, v20, v21, (uint64_t)"name != nil");
  }
  v2 = objc_retainAutorelease(v1);
  v3 = getenv((const char *)objc_msgSend(v2, "UTF8String"));
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id NUAssertLogger_728()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_597);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__738(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__739(uint64_t a1)
{

}

id NUAssertLogger_1008()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_1013);
  return (id)_NUAssertLogger;
}

void sub_1A657533C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_1115()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_1129);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_1161()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_1185);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_1305()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_316);
  return (id)_NUAssertLogger;
}

void sub_1A657B784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1481(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1482(uint64_t a1)
{

}

void sub_1A657BBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *NUEvaluationModeName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Prepare");
  else
    return off_1E5060A80[a1 - 1];
}

double NUDegreeToRadian(double a1)
{
  return a1 * 3.14159265 / 180.0;
}

double NURadianToDegree(double a1)
{
  return a1 * 180.0 / 3.14159265;
}

BOOL NUIsRoughlyEqual(double a1, double a2, double a3)
{
  return vabdd_f64(a1, a2) <= a3;
}

BOOL NUIsRoughlyLessThan(double a1, double a2, double a3)
{
  return a2 + a3 > a1;
}

BOOL NUIsRoughlyGreaterThan(double a1, double a2, double a3)
{
  return a2 - a3 < a1;
}

void sub_1A657C0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A657C1F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A657C5B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  _Block_object_dispose((const void *)(v3 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1496(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1497(uint64_t a1)
{

}

void ___ZN12_GLOBAL__N_114getCachedBrushElf_block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  int v12;
  _QWORD v13[4];

  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v2 == v3)
    {
      {
        return;
      }
      v3 = v2;
    }
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
  }
  +[NUImageLayout contiguousLayoutForImageSize:](NUImageLayout, "contiguousLayoutForImageSize:", v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUPixelFormat R8](NUPixelFormat, "R8");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUColorSpace genericGrayColorSpace](NUColorSpace, "genericGrayColorSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUImageFactory bufferImageWithLayout:format:colorSpace:](NUImageFactory, "bufferImageWithLayout:format:colorSpace:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = 0;
  v13[1] = 0;
  v13[2] = v3;
  v13[3] = v3;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___ZN12_GLOBAL__N_114getCachedBrushElf_block_invoke_2;
  v11[3] = &__block_descriptor_44_e35_v24__0___NUMutableBufferTile__8_B16l;
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = *(_DWORD *)(a1 + 48);
  objc_msgSend(v7, "writeBufferRegion:withBlock:", v8, v11);

  objc_msgSend(v7, "immutableImageCopy");
  v9 = objc_claimAutoreleasedReturnValue();

}

void sub_1A657C7A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A657C8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZN12_GLOBAL__N_114getCachedBrushElf_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  float v15;
  int v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "mutableBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(float *)(a1 + 40);
  v6 = objc_msgSend(v3, "mutableBytes");
  v7 = objc_msgSend(v3, "rowBytes");
  if ((float)(2.0 / (float)v4) <= v5)
    v8 = v5;
  else
    v8 = 2.0 / (float)v4;
  if (v4)
  {
    v9 = 0.5;
    v10 = (float)v4 * 0.5;
    v11 = v10 * (float)(1.0 - v8);
    v12 = v4;
    do
    {
      v13 = 0;
      v14 = 0.5;
      do
      {
        v15 = sqrtf((float)((float)(v9 - v10) * (float)(v9 - v10)) + (float)((float)(v14 - v10) * (float)(v14 - v10)));
        if (v15 <= v10)
        {
          if (v15 <= v11)
            LOBYTE(v16) = -1;
          else
            v16 = (int)(float)((float)(1.0
                                     - (float)((float)((float)(v15 - v11) / (float)(v10 - v11))
                                             * (float)((float)((float)(v15 - v11) / (float)(v10 - v11))
                                                     * (float)((float)((float)((float)(v15 - v11) / (float)(v10 - v11))
                                                                     * -2.0)
                                                             + 3.0))))
                             * 255.0);
        }
        else
        {
          LOBYTE(v16) = 0;
        }
        *(_BYTE *)(v6 + v13) = v16;
        v14 = v14 + 1.0;
        ++v13;
      }
      while (v4 != v13);
      v6 += v7;
      v9 = v9 + 1.0;
      --v12;
    }
    while (v12);
  }

}

void sub_1A657CA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZN12_GLOBAL__N_114getCachedBrushElf_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.photoapps.cached_brush_queue", 0);

}

void sub_1A657D0E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A657D638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A657F974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_1586()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__1600(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1601(uint64_t a1)
{

}

void sub_1A65803BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65804F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A6580630(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A6580FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1717(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1718(uint64_t a1)
{

}

void sub_1A658263C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6582DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_1866()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_1881);
  return (id)_NUAssertLogger;
}

void sub_1A6584198(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1A6584184);
}

void sub_1A65841E0(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1A65841D0);
}

const __CFString *NUPixelRoundingPolicyToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Out");
  else
    return off_1E5060D70[a1 - 1];
}

uint64_t NSStringFromNUPixelSize(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), a1, a2);
}

unint64_t NUEvenPixelSize(unint64_t a1, uint64_t a2)
{
  unint64_t v2;
  void *v4;
  void *v5;

  v2 = a1;
  if (((a1 | a2) & 1) != 0)
  {
    v2 = a1 & 0xFFFFFFFFFFFFFFFELL;
    if (a1 & 0x8000000000000000 | a2 & 0x8000000000000000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

    }
  }
  return v2;
}

__n128 NUEvenSizedPixelRect@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unint64_t v4;
  __n128 result;
  __n128 v6;

  a1[1].n128_u64[0] = NUEvenPixelSize(a1[1].n128_u64[0], a1[1].n128_i64[1]);
  a1[1].n128_u64[1] = v4;
  result = *a1;
  v6 = a1[1];
  *a2 = *a1;
  a2[1] = v6;
  return result;
}

BOOL NUPixelSizeIsEven(int a1, unsigned int a2)
{
  return ((a1 | a2) & 1) == 0;
}

uint64_t NUPixelSizeArea(uint64_t a1, uint64_t a2)
{
  return a1 * a2;
}

uint64_t NSStringFromNUPixelPoint(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), a1, a2);
}

uint64_t NSStringFromNUPixelRect(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{origin={%ld, %ld} size={%ld, %ld}}]"), *a1, a1[1], a1[2], a1[3]);
}

void NUPixelRectFromArray(void *a1@<X0>, uint64_t *a2@<X8>)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a1;
  if (objc_msgSend(v11, "count") == 4)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
    objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");
    objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
    *a2 = v4;
    a2[1] = v6;
    a2[2] = v8;
    a2[3] = v10;

  }
  else
  {
    *(_OWORD *)a2 = NUPixelRectNull;
    *((_OWORD *)a2 + 1) = unk_1A6719E60;
  }

}

id NSArrayFromNUPixelRect(_QWORD *a1)
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = *a1 == 0x7FFFFFFFFFFFFFFFLL && a1[1] == 0x7FFFFFFFFFFFFFFFLL && a1[2] == 0;
  if (v3 && !a1[3])
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[1]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[2]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

__CFString *NUOrientationName(uint64_t a1)
{
  uint64_t v1;

  if ((unint64_t)(a1 - 9) >= 0xFFFFFFFFFFFFFFF8)
    v1 = a1;
  else
    v1 = 0;
  return NUOrientationName_names[v1];
}

id NUAssertLogger_2145()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2167);
  return (id)_NUAssertLogger;
}

id NURenderLogger()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
  return (id)_NURenderLogger;
}

uint64_t getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_ptr;
  v6 = getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_ptr;
  if (!getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_block_invoke;
    v2[3] = &unk_1E5062458;
    v2[4] = &v3;
    __getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_block_invoke(v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A658B7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!ImageIOLibraryCore_frameworkLibrary)
    ImageIOLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)ImageIOLibraryCore_frameworkLibrary;
  if (!ImageIOLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ImageIOLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("NURenderSourceNode+CGImage.m"), 43, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptions");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

double nu_rgb_to_tempTint(float *a1, double *a2, double *a3)
{
  double v5;
  double v6;
  double v7;
  double result;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  v6 = a1[1];
  v7 = a1[2];
  v15 = 0.0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v18 = 0;
  v20 = 0u;
  v17 = 0u;
  v16 = 0x3FF03B3AF053F29DLL;
  v19 = 0x3FF0000000000000;
  v21 = 0;
  v22 = 0x3FE83CFAB36818D8;
  MatrixMatrix(GetAdaptationMatrix_identity_mtx, (double *)&v16, (double *)&v11);
  MatrixMatrix((double *)&v11, GetAdaptationMatrix_identity_mtx, (double *)&v11);
  result = (*((double *)&v11 + 1) * 0.672250773 + *(double *)&v11 * 0.327791699 + *(double *)&v12 * 0.11111583) * v6
         + v5 * (*((double *)&v11 + 1) * 0.231750546 + *(double *)&v11 * 0.429420129 + *(double *)&v12 * 0.0204485776)
         + v7 * (*((double *)&v11 + 1) * 0.0959986815 + *(double *)&v11 * 0.193244099 + *(double *)&v12 * 0.957493343);
  v9 = (*(double *)&v13 * 0.672250773 + *((double *)&v12 + 1) * 0.327791699 + *((double *)&v13 + 1) * 0.11111583) * v6
     + v5 * (*(double *)&v13 * 0.231750546 + *((double *)&v12 + 1) * 0.429420129 + *((double *)&v13 + 1) * 0.0204485776)
     + v7 * (*(double *)&v13 * 0.0959986815 + *((double *)&v12 + 1) * 0.193244099 + *((double *)&v13 + 1) * 0.957493343);
  v10 = (*((double *)&v14 + 1) * 0.672250773 + *(double *)&v14 * 0.327791699 + v15 * 0.11111583) * v6
      + v5 * (*((double *)&v14 + 1) * 0.231750546 + *(double *)&v14 * 0.429420129 + v15 * 0.0204485776)
      + v7 * (*((double *)&v14 + 1) * 0.0959986815 + *(double *)&v14 * 0.193244099 + v15 * 0.957493343);
  if (result >= 1.0e-20 || v9 >= 1.0e-20 || v10 >= 1.0e-20)
    return nu_xy_to_tempTint(a2, a3, result / (result + v9 + v10), v9 / (result + v9 + v10));
  *a3 = NAN;
  *a2 = NAN;
  return result;
}

double MatrixMatrix(double *a1, double *a2, double *a3)
{
  double v3;
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double result;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11 = a1[8];
  v12 = *a2;
  v13 = a2[1];
  v14 = a2[2];
  v15 = a2[3];
  v16 = a2[4];
  v17 = a2[5];
  v18 = a2[6];
  v19 = a2[7];
  v20 = a2[8];
  v21 = v7 * v13 + v4 * *a2 + v10 * v14;
  *a3 = v6 * v13 + *a1 * *a2 + v9 * v14;
  a3[1] = v21;
  a3[2] = v8 * v13 + v5 * v12 + v11 * v14;
  a3[3] = v6 * v16 + v3 * v15 + v9 * v17;
  a3[4] = v7 * v16 + v4 * v15 + v10 * v17;
  a3[5] = v8 * v16 + v5 * v15 + v11 * v17;
  a3[6] = v6 * v19 + v3 * v18 + v9 * v20;
  a3[7] = v7 * v19 + v4 * v18 + v10 * v20;
  result = v8 * v19 + v5 * v18 + v11 * v20;
  a3[8] = result;
  return result;
}

double nu_xy_to_tempTint(double *a1, double *a2, double a3, double a4)
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double result;

  v4 = 0;
  v5 = 1.5 - a3 + a4 * 6.0;
  v6 = (a3 + a3) / v5;
  v7 = a4 * 3.0 / v5;
  v8 = 0.0;
  v9 = (double *)&qword_1A67189B8;
  v10 = 0.0;
  v11 = 0.0;
  do
  {
    v12 = v11;
    v13 = v10;
    v14 = v8;
    v15 = v4;
    v16 = sqrt(*v9 * *v9 + 1.0);
    v8 = 1.0 / v16;
    v10 = *v9 / v16;
    v18 = *(v9 - 2);
    v17 = *(v9 - 1);
    v11 = (v7 - v17) * v8 - (v6 - v18) * v10;
    ++v4;
    if (v15 == 29)
      break;
    v9 += 4;
  }
  while (v11 > 0.0);
  v19 = 0.0;
  if ((_DWORD)v4 != 1)
  {
    if (v11 <= 0.0)
      v19 = (v7 - v17) * v8 - (v6 - v18) * v10;
    v19 = -v19 / (v12 - v19);
  }
  v20 = 32 * v4;
  v21 = (double *)((char *)&kTempTable + (((v4 << 32) - 0x100000000) >> 27));
  *a1 = 1000000.0 / ((1.0 - v19) * *(double *)((char *)&kTempTable + v20) + *v21 * v19);
  v22 = v14 * v19 + v8 * (1.0 - v19);
  v23 = v13 * v19 + v10 * (1.0 - v19);
  v24 = sqrt(v23 * v23 + v22 * v22);
  result = (v23 / v24 * (v7 - (v17 * (1.0 - v19) + v21[2] * v19))
          + (v6 - (v18 * (1.0 - v19) + v21[1] * v19)) * (v22 / v24))
         * -3000.0;
  *a2 = result;
  return result;
}

double nu_tempTint_to_xy(double *a1, double *a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t *v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double *v11;
  double v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double result;

  v4 = -1;
  v5 = &qword_1A67189A0;
  v6 = 1000000.0 / a3;
  do
  {
    v7 = v4;
    v8 = *(double *)v5;
    v5 += 4;
    v9 = v8;
    ++v4;
  }
  while (v7 != 28 && v6 >= v9);
  v10 = a4 * -0.000333333333;
  v11 = (double *)((char *)&kTempTable + 32 * v4);
  v12 = (v9 - v6) / (v9 - *v11);
  v13 = (double *)((char *)&kTempTable + 32 * v7 + 64);
  v14 = v13[1] * (1.0 - v12) + v11[1] * v12;
  v15 = v11[3];
  v16 = (1.0 - v12) * v13[2] + v11[2] * v12;
  v17 = v13[3];
  v18 = sqrt(v15 * v15 + 1.0);
  v19 = sqrt(v17 * v17 + 1.0);
  v20 = (1.0 - v12) * (1.0 / v19) + 1.0 / v18 * v12;
  v21 = (1.0 - v12) * (v17 / v19) + v15 / v18 * v12;
  v22 = sqrt(v21 * v21 + v20 * v20);
  v23 = v14 + v20 / v22 * v10;
  v24 = v16 + v21 / v22 * v10;
  v25 = v23 * 1.5;
  v26 = v23 + v24 * -4.0 + 2.0;
  *a1 = v25 / v26;
  result = v24 / v26;
  *a2 = result;
  return result;
}

void sub_1A658E118(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A658E5C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_2574()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2591);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_2618()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2632);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_2683()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2663);
  return (id)_NUAssertLogger;
}

void sub_1A658F86C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A658F8F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id NUAssertLogger_2784()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
  return (id)_NUAssertLogger;
}

const __CFString *NUMediaTypeToString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Invalid");
  else
    return off_1E5060F50[a1];
}

uint64_t mediaTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Image")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Video")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("LivePhoto")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *NUMediaComponentTypeToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Invalid");
  else
    return off_1E5060F70[a1];
}

uint64_t NUMediaComponentTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Image")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Video")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *NUAuxiliaryImageTypeToString(unint64_t a1)
{
  if (a1 > 0xC)
    return CFSTR("Invalid");
  else
    return off_1E5060F88[a1];
}

uint64_t NUAuxiliaryImageTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Disparity")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PortraitEffectsMatte")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SkinSegmentationMatte")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("TeethSegmentationMatte")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HairSegmentationMatte")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("GlassesSegmentationMatte")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HDRGainMap")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("OriginalThumbnail")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("LinearThumbnail")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("DeltaImage")) & 1) != 0)
  {
    v2 = 12;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("SkySegmentationMatte")))
  {
    v2 = 9;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *NUSampleModeToString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("invalid");
  else
    return off_1E5060FF0[a1];
}

uint64_t NUSampleModeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("lanczos")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("bilinear")) & 1) != 0)
  {
    v2 = 2;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("nearest"));
  }

  return v2;
}

uint64_t NUSampleModeIsValid(unint64_t a1)
{
  return (a1 < 4) & (0xEu >> (a1 & 0xF));
}

id NUAssertLogger_3257()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3268);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_3290()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3306);
  return (id)_NUAssertLogger;
}

void sub_1A659B438(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_QWORD *a29)
{
  id v29;

  if (a2 == 2)
  {
    v29 = objc_begin_catch(exception_object);
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("video export AVAssetWriterInput: exception"), v29);
    *a29 = (id)objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x1A659AFB0);
  }
  _Unwind_Resume(exception_object);
}

id NUAssertLogger_3377()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3450);
  return (id)_NUAssertLogger;
}

id NULogger()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_135);
  return (id)_NULogger;
}

void *SourceFormatHintForTrack(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "formatDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 == 1)
  {
    objc_msgSend(v1, "formatDescriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id NUAssertLogger_3505()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3517);
  return (id)_NUAssertLogger;
}

__CFString *NUPriorityLevelName(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E50610B0[a1];
}

uint64_t NUPriorityLevelToDispatchQOS(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return dword_1A671A4E0[a1];
}

id NUAssertLogger_3656()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3589);
  return (id)_NUAssertLogger;
}

const __CFString *NUChannelTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("???");
  else
    return off_1E5061168[a1 - 1];
}

const __CFString *NUChannelTypeSymbol(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("?");
  else
    return off_1E5061130[a1 - 1];
}

const __CFString *NUChannelMediaTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("???");
  else
    return off_1E5061148[a1 - 1];
}

const __CFString *NUChannelControlTypeDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("???");
  if (a1 == 2)
    v1 = CFSTR("schema");
  if (a1 == 1)
    return CFSTR("setting");
  else
    return v1;
}

const __CFString *NUChannelMetadataTypeDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("???");
  if (a1 == 2)
    v1 = CFSTR("video");
  if (a1 == 1)
    return CFSTR("image");
  else
    return v1;
}

void sub_1A65A4DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_3955()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3966);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_4244()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_4256);
  return (id)_NUAssertLogger;
}

void sub_1A65AF368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_4540()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_4557);
  return (id)_NUAssertLogger;
}

double NU::TValue95(NU *this)
{
  int v2;

  if (this < 2)
    return NAN;
  v2 = (_DWORD)this - 1;
  if (((_DWORD)this - 1) >= 0x1F4)
    v2 = 500;
  return gT95[v2 - 1];
}

id NUAssertLogger_4693()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_74);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_4813()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_505);
  return (id)_NUAssertLogger;
}

id NULogger_5174()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_506_5175);
  return (id)_NULogger;
}

void sub_1A65C4F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65C5074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5337(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5338(uint64_t a1)
{

}

id NUAssertLogger_5368()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5343);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_5535()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5501);
  return (id)_NUAssertLogger;
}

double NUAbsoluteTime()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  if (_NUMachTimeToSeconds_onceToken != -1)
    dispatch_once(&_NUMachTimeToSeconds_onceToken, &__block_literal_global_5621);
  return *(double *)&_NUMachTimeToSeconds_sFactor * (double)v0;
}

id NUAbsoluteTimeToString(long double a1)
{
  double v1;
  tm *v2;
  size_t v3;
  long double __y;
  time_t v6;
  char __s[50];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t)a1;
  v1 = modf(a1, &__y);
  v2 = gmtime(&v6);
  strftime(__s, 0x32uLL, "%H:%M:%S", v2);
  v3 = strlen(__s);
  snprintf(&__s[v3], 50 - v3, " +%5i", (int)(v1 * 100000.0) % 100000);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", __s, 1);
}

id NUAssertLogger_5653()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5664);
  return (id)_NUAssertLogger;
}

uint64_t NUScaleMultiplyInteger(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a1 * a3;
  result = a1 * a3 / a2;
  v6 = v4 - result * a2;
  if (v6)
  {
    if (v6 < 0)
      v6 = -v6;
    v7 = v6 < a2 - v6;
    if (a4 != 2)
      v7 = a4;
    if (v7)
    {
      if (v7 == 4)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_5691);
        v8 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUScaleMultiplyInteger. this line should not be hit"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v24 = v9;
          _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v12)
          {
            v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v24 = v15;
            v25 = 2114;
            v26 = v17;
            _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v24 = v14;
          _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"NSInteger NUScaleMultiplyInteger(NUScale, NSInteger, NUPixelRoundingPolicy)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScale.mm", 54, CFSTR("NUScaleMultiplyInteger. this line should not be hit"), v18, v19, v20, v21, v22);
      }
    }
    else if (a3 >= 1)
    {
      ++result;
    }
    else
    {
      --result;
    }
  }
  return result;
}

void sub_1A65C8E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

id NUAssertLogger(void)
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5691);
  return (id)_NUAssertLogger;
}

unint64_t NUScaleFromDouble(double a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = (uint64_t)(a1 * 100000.0);
  if (v1 <= 1)
    v1 = 1;
  v2 = 100000;
  v3 = v1;
  do
  {
    v4 = v3;
    v3 = v2;
    v2 = v4 % v2;
  }
  while (v2);
  return v1 / v3;
}

BOOL NUScaleIsValid(uint64_t a1, uint64_t a2)
{
  return a1 > 0 && a2 > 0;
}

BOOL NUScaleEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v7[2];
  _QWORD v8[2];

  NU::Rational<long>::Rational(v8, a1, a2);
  NU::Rational<long>::Rational(v7, a3, a4);
  return v8[1] * v7[0] == v7[1] * v8[0];
}

_QWORD *NU::Rational<long>::Rational(_QWORD *result, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *result = a2;
  result[1] = a3;
  if (!a3)
  {
    NUAssertLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("zero denominator"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v10;
        v20 = 2114;
        v21 = v12;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"NU::Rational<long>::Rational(T, T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Math/NURational.h", 39, CFSTR("zero denominator"), v13, v14, v15, v16, v17);
  }
  return result;
}

void sub_1A65C9170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t NUScaleCompare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  NU::Rational<long>::Rational(&v11, a1, a2);
  NU::Rational<long>::Rational(&v9, a3, a4);
  if (v12 * v9 == v10 * v11)
    return 0;
  v7 = 1;
  if ((uint64_t)(v10 * v11) < (uint64_t)(v12 * v9))
    v8 = 1;
  else
    v8 = -1;
  if ((uint64_t)(v10 * v11) < (uint64_t)(v12 * v9))
    v7 = -1;
  if ((v12 >> 63) + (v10 >> 63) == 1)
    return v8;
  else
    return v7;
}

uint64_t NUScaleInvert(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t NUScaleMultiply(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;

  NU::Rational<long>::Rational(v11, a1, a2);
  NU::Rational<long>::Rational(v10, a3, a4);
  NU::Rational<long>::Rational(&v12, v10[0] * v11[0], v10[1] * v11[1]);
  if (v13)
  {
    v6 = v13;
    v7 = v12;
    do
    {
      v8 = v6;
      v6 = v7 % v6;
      v7 = v8;
    }
    while (v6);
  }
  else
  {
    v8 = v12;
  }
  return v12 / v8;
}

uint64_t NUScaleDivide(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;

  NU::Rational<long>::Rational(v11, a1, a2);
  NU::Rational<long>::Rational(v10, a3, a4);
  NU::Rational<long>::Rational(&v12, v10[1] * v11[0], v10[0] * v11[1]);
  if (v13)
  {
    v6 = v13;
    v7 = v12;
    do
    {
      v8 = v6;
      v6 = v7 % v6;
      v7 = v8;
    }
    while (v6);
  }
  else
  {
    v8 = v12;
  }
  return v12 / v8;
}

double NUScaleToDouble(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1 < 1 || a2 <= 0)
  {
    NUAssertLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUScaleIsValid(scale)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v10;
        v19 = 2114;
        v20 = v12;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"double NUScaleToDouble(NUScale)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScale.mm", 117, CFSTR("Invalid parameter not satisfying: %s"), v13, v14, v15, v16, (uint64_t)"NUScaleIsValid(scale)");
  }
  return (double)a1 / (double)a2;
}

void sub_1A65C95BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t NUScaleToString(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld"), a1, a2);
}

uint64_t NUScaleFromString(void *a1)
{
  id v1;
  void *v2;
  int v3;
  __int128 *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v1);
  v9 = 0;
  if ((objc_msgSend(v2, "scanInteger:", &v9) & 1) == 0)
    goto LABEL_13;
  if (objc_msgSend(v2, "scanString:intoString:", CFSTR(":"), 0))
  {
    v8 = 0;
    v3 = objc_msgSend(v2, "scanInteger:", &v8);
    v4 = &NUScaleUnknown;
    if (v3)
      v4 = (__int128 *)&v9;
    v5 = *(_QWORD *)v4;
    goto LABEL_14;
  }
  if (!objc_msgSend(v2, "scanString:intoString:", CFSTR("."), 0))
  {
    if (objc_msgSend(v2, "isAtEnd"))
    {
      v5 = v9;
      goto LABEL_14;
    }
LABEL_13:
    v5 = NUScaleUnknown;
    goto LABEL_14;
  }
  v8 = 0;
  if (!objc_msgSend(v2, "scanInteger:", &v8))
    goto LABEL_13;
  for (i = 1; i <= v8; i *= 10)
    ;
  v5 = v8 + v9 * i;
LABEL_14:

  return v5;
}

void sub_1A65C9770(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id NUScaleToValue(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a1;
  v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v3, "{?=qq}");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t NUScaleFromValue(void *a1)
{
  __int128 v2;

  v2 = NUScaleUnknown;
  objc_msgSend(a1, "getValue:", &v2);
  return v2;
}

id NUAssertLogger_5901()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_151_5920);
  return (id)_NUAssertLogger;
}

void _deriveTranslatedRectFromConstrainedRect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float64x2_t a9, double a10, double a11, double a12, __n128 a13, __n128 a14, __n128 a15, __n128 a16, float64x2_t a17)
{
  deriveTranslatedRectFromConstrainedRect(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

double _deriveTranslatedQuadFromConstrainedQuad(float64x2_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, float64x2_t a17)
{
  double result;

  *(_QWORD *)&result = *(_OWORD *)&deriveTranslatedQuadFromConstrainedQuad(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
  return result;
}

void _deriveScaledRectFromConstrainedRect(double a1, double a2, double a3, double a4, float64_t a5, float64_t a6, float64_t a7, float64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, CGVector a17, __int128 a18, __int128 a19, __int128 a20)
{
  deriveScaledRectFromConstrainedRect(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

double _deriveScaleQuadFromConstrainedQuad(__n128 a1, __n128 a2, __n128 a3, __n128 a4, float64x2_t a5, float64x2_t a6, float64x2_t a7, float64x2_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, CGVector a17, __int128 a18, __int128 a19, __int128 a20)
{
  double result;

  *(_QWORD *)&result = deriveScaledQuadFromConstrainedQuad(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
                         a20).n128_u64[0];
  return result;
}

double _aspectRatioConstrainedFromRect(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8)
{
  return aspectRatioConstrainedFromRect(a1, a2, a3, a4, a5, a6, a7, a8, a5 * a6);
}

uint64_t _vertexIDFromPoint(const CGRect *a1, float64x2_t *a2)
{
  uint64_t v3;
  float64x2_t v4;
  float64_t v5;
  float64x2_t v6;
  float64x2_t v8;

  v3 = 0;
  v8 = *a2;
  while (1)
  {
    v4.f64[0] = pointFromVertexID(a1, v3);
    v4.f64[1] = v5;
    v6 = vsubq_f64(v8, v4);
    if (sqrt(vaddvq_f64(vmulq_f64(v6, v6))) < 5.0)
      break;
    v3 = (v3 + 1);
    if ((_DWORD)v3 == 8)
      return 0xFFFFFFFFLL;
  }
  return v3;
}

uint64_t _vertexIDFromPointWithTolerance(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, float64x2_t a5, float64_t a6, double a7)
{
  uint64_t v8;
  float64x2_t v9;
  float64_t v10;
  float64x2_t v11;
  float64x2_t v13;
  CGRect v14;

  v8 = 0;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  a5.f64[1] = a6;
  v13 = a5;
  while (1)
  {
    v9.f64[0] = pointFromVertexID(&v14, v8);
    v9.f64[1] = v10;
    v11 = vsubq_f64(v13, v9);
    if (sqrt(vaddvq_f64(vmulq_f64(v11, v11))) < a7)
      break;
    v8 = (v8 + 1);
    if ((_DWORD)v8 == 8)
      return 0xFFFFFFFFLL;
  }
  return v8;
}

double _pointFromVertexID(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGRect v6;

  v6.origin.x = a2;
  v6.origin.y = a3;
  v6.size.width = a4;
  v6.size.height = a5;
  return pointFromVertexID(&v6, a1);
}

BOOL _canExpandWithAbsoluteAnchor(uint64_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  float64x2_t v10[4];
  CGPoint v11;
  CGRect v12;

  v12.origin.x = a6;
  v12.origin.y = a7;
  v12.size.width = a8;
  v12.size.height = a9;
  v10[0] = a2;
  v10[1] = a3;
  v10[2] = a4;
  v10[3] = a5;
  return canExpandWithAbsoluteAnchor(a1, v10, &v12, (float64x2_t *)&v11);
}

void sub_1A65CF3F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A65CF580(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A65CF644(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A65CF83C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A65CF9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A65CFB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A65CFE00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A65D01EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A65D0294(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A65D044C(_Unwind_Exception *a1)
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

void sub_1A65D0B8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A65D0CC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A65D0FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A65D12B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A65D15B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A65D18B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A65D19B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A65D1C64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A65D1FC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A65D2130(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A65D220C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A65D22A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A65D2348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A65D27DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A65D2964(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A65D2E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A65D31B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A65D3530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A65D3818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A65D3968(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A65D3BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A65D3E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A65D41DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

id NUAssertLogger_6578()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_6937()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_34_6949);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_7182()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7194);
  return (id)_NUAssertLogger;
}

void sub_1A65E3058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL CGAffineTransformIsValid(double *a1)
{
  return fabs(*a1 * a1[3] - a1[1] * a1[2]) > 1.0e-12;
}

double CGAffineTransformDeterminant(double *a1)
{
  return *a1 * a1[3] - a1[1] * a1[2];
}

double CGAffineTransformDot(double *a1, double *a2)
{
  return a1[1] * a2[1] + *a1 * *a2 + a1[2] * a2[2] + a1[3] * a2[3] + a1[4] * a2[4] + a1[5] * a2[5];
}

float64x2_t CGAffineTransformSubstract@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3;
  float64x2_t result;

  v3 = vsubq_f64(a1[1], a2[1]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = v3;
  result = vsubq_f64(a1[2], a2[2]);
  a3[2] = result;
  return result;
}

double CGAffineTransformRoot(double *a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double result;
  double v7;
  double v8;
  double v9;
  double v10;

  v1 = *a1;
  v2 = a1[1];
  v4 = a1[2];
  v3 = a1[3];
  v5 = *a1 * v3 - v2 * v4;
  if (v5 != 0.0)
    return (v4 * a1[5] - v3 * a1[4]) / v5;
  if (v1 == 0.0 && v4 == 0.0)
  {
    if (v2 == 0.0)
    {
      return 0.0;
    }
    else if (a1[4] == 0.0)
    {
      return -a1[5] / v2;
    }
    else
    {
      return 0.0;
    }
  }
  else if (v2 == 0.0 && v3 == 0.0)
  {
    result = 0.0;
    if (a1[5] == 0.0)
    {
      result = -a1[4] / v1;
      if (v1 == 0.0)
        return 0.0;
    }
  }
  else
  {
    v7 = a1[4];
    v8 = a1[5];
    v9 = v2 * v7;
    v10 = v7 * v3;
    result = -v7 / v1;
    if (v8 * v4 != v10)
      result = 0.0;
    if (v9 != v1 * v8)
      return 0.0;
  }
  return result;
}

double CGAffineTransformFixedPoint(float64x2_t *a1)
{
  float64x2_t v1;
  _OWORD v3[3];

  v1 = vsubq_f64(a1[1], *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16));
  v3[0] = vsubq_f64(*a1, *MEMORY[0x1E0C9BAA8]);
  v3[1] = v1;
  v3[2] = vsubq_f64(a1[2], *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32));
  return CGAffineTransformRoot((double *)v3);
}

BOOL CGAffineTransformHasRotation(double *a1)
{
  return *a1 < 0.0 || a1[1] != 0.0 || a1[2] != 0.0 || a1[3] < 0.0;
}

CGAffineTransform *CGAffineTransformMove@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  __int128 v10;
  CGAffineTransform v12;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, a3, a4);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, -a5, -a6);
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  t1 = v16;
  v10 = a1[1];
  *(_OWORD *)&v12.a = *a1;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tx = a1[2];
  CGAffineTransformConcat(&v14, &t1, &v12);
  t1 = v15;
  return CGAffineTransformConcat((CGAffineTransform *)a2, &v14, &t1);
}

id NSStringFromAffineTransform(_OWORD *a1)
{
  __int128 v1;
  void *v2;
  void *v3;
  _OWORD v5[3];

  v1 = a1[1];
  v5[0] = *a1;
  v5[1] = v1;
  v5[2] = a1[2];
  objc_msgSend(MEMORY[0x1E0CB3478], "nu_transformWithCGAffineTransform:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

CGFloat CGAffineTransformForMappingFromRectToRect@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, CGFloat a6@<D4>, CGFloat a7@<D5>, double a8@<D6>, double a9@<D7>)
{
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGFloat result;
  CGAffineTransform v25;
  CGAffineTransform v26;

  v16 = MEMORY[0x1E0C9BAA8];
  v17 = *MEMORY[0x1E0C9BAA8];
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a1 + 16) = v18;
  v19 = *(_OWORD *)(v16 + 32);
  *(_OWORD *)(a1 + 32) = v19;
  *(_OWORD *)&v26.a = v17;
  *(_OWORD *)&v26.c = v18;
  *(_OWORD *)&v26.tx = v19;
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v26, a6, a7);
  v20 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v20;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v26, &v25, a8 / a4, a9 / a5);
  v21 = *(_OWORD *)&v26.c;
  *(_OWORD *)a1 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a1 + 16) = v21;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v26.tx;
  v22 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v22;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformTranslate(&v26, &v25, -a2, -a3);
  v23 = *(_OWORD *)&v26.c;
  *(_OWORD *)a1 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a1 + 16) = v23;
  result = v26.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v26.tx;
  return result;
}

__n128 CGAffineTransformRelative@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id NUAssertLogger_7719()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7730);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__7823(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7824(uint64_t a1)
{

}

double CGRectTranslate(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5;
}

void deriveTranslatedRectFromConstrainedRect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float64x2_t a9, double a10, double a11, double a12, __n128 a13, __n128 a14, __n128 a15, __n128 a16, float64x2_t a17)
{
  __n128 v18;
  __n128 v19;
  __n128 v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24[4];

  v18.n128_f64[0] = a9.f64[0] + a11;
  a9.f64[1] = a10;
  v19.n128_f64[0] = a9.f64[0] + a11;
  v19.n128_f64[1] = a10;
  v20.n128_u64[0] = *(_QWORD *)&a9.f64[0];
  v20.n128_f64[1] = a10 + a12;
  v18.n128_f64[1] = a10 + a12;
  v24[0] = deriveTranslatedQuadFromConstrainedQuad(a9, v19, v20, v18, a13, a14, a15, a16, a1, a2, a3, a4, a5, a6, a7, a8, a17);
  v24[1] = v21;
  v24[2] = v22;
  v24[3] = v23;
  NU::Quad2d::boundingRect(v24);
}

float64x2_t deriveTranslatedQuadFromConstrainedQuad(float64x2_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, float64x2_t a17)
{
  double v17;
  double v18;
  double v19;
  double v20;
  float64x2_t v21;
  unsigned __int8 v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  float64x2_t v26;
  __int128 v27;
  int IntersectParam;
  BOOL v30;
  int v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v43;
  void *v44;
  uint64_t v45;
  float64x2_t v46;
  float64x2_t v51;
  float64x2_t v55;
  CGVector v56;
  __n128 v57;
  __n128 v58;
  __n128 v59;
  _OWORD v60[4];
  double v61;
  _OWORD v62[2];
  __int128 v63;
  float64x2_t v64[2];
  __int128 v65;
  __n128 v66;
  _BYTE v67[21];
  _OWORD v68[3];
  _OWORD v69[2];
  int v70;
  _OWORD v71[4];
  _BYTE buf[32];
  __int128 v73;
  __n128 v74;
  _BYTE v75[21];
  __n128 v76;
  __n128 v77;
  int v78;
  __n128 v79;
  __n128 v80;
  int v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v51 = a1;
  v60[0] = a1;
  v60[1] = a2;
  v60[2] = a3;
  v60[3] = a4;
  v56 = (CGVector)a5;
  v57 = a6;
  v58 = a7;
  v59 = a8;
  intersectionPoint((uint64_t)v64, (const NU::Quad2d *)v60, &v56, a17, 0.000244140625);
  if (v67[20])
    goto LABEL_8;
  NU::Quad2d::boundingRect((float64x2_t *)&v56);
  if (v17 >= v18)
    v19 = v18;
  else
    v19 = v17;
  v20 = 10.0;
  if (v19 <= 10.0)
    v20 = v19;
  intersectionPoint((uint64_t)buf, (const NU::Quad2d *)v60, &v56, a17, v20);
  *(_QWORD *)&v67[13] = *(_QWORD *)&v75[13];
  v65 = v73;
  v66 = v74;
  *(_OWORD *)v67 = *(_OWORD *)v75;
  v64[0] = *(float64x2_t *)buf;
  v64[1] = *(float64x2_t *)&buf[16];
  if (v75[20])
  {
LABEL_8:
    v46 = v64[0];
    v62[1] = v66;
    v63 = *(_OWORD *)v67;
    v62[0] = v65;
    LODWORD(v63) = 1;
    v21 = projectionPoint((uint64_t)v62, vaddq_f64(v64[0], a17));
    v22 = 0;
    v23 = 0;
    *(__n128 *)buf = a5;
    *(__n128 *)&buf[16] = a6;
    v55 = vsubq_f64(v21, v46);
    LODWORD(v73) = 0;
    v74 = a6;
    *(__n128 *)v75 = a8;
    *(_DWORD *)&v75[16] = 0;
    v76 = a8;
    v77 = a7;
    v78 = 0;
    v79 = a7;
    v80 = a5;
    v81 = 0;
    v71[0] = v51;
    v71[1] = a2;
    v24 = 1.79769313e308;
    v71[2] = a3;
    v71[3] = a4;
    do
    {
      v25 = 0;
      v26 = vaddq_f64((float64x2_t)v71[v23], v55);
      v69[0] = v71[v23];
      v69[1] = v26;
      v70 = 0;
      do
      {
        v27 = *(_OWORD *)&buf[v25 + 16];
        v68[0] = *(_OWORD *)&buf[v25];
        v68[1] = v27;
        v68[2] = *(_OWORD *)&buf[v25 + 32];
        v61 = 0.0;
        IntersectParam = NU::LineSegment2d::findIntersectParam((uint64_t)v69, (uint64_t)v68, &v61);
        v30 = v61 >= 0.0 && IntersectParam == 2;
        v31 = v30 && v24 > v61;
        if (v31)
          v24 = v61;
        v22 |= v31;
        v25 += 48;
      }
      while (v25 != 192);
      ++v23;
    }
    while (v23 != 4);
    if ((v22 & (v24 > 0.000000953674316)) != 0)
      return vaddq_f64(vmulq_n_f64(v55, fmin(v24, 1.0)), v51);
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7844);
    v32 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("None of the crop rect points are on the boundary!"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v33;
      _os_log_impl(&dword_1A6553000, v32, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

    }
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_7844);
      v34 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v37;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_7844);
      v34 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v44;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
    }

    _NUAssertContinueHandler((uint64_t)"NU::Quad2d deriveTranslatedQuadFromConstrainedQuad(NU::Quad2d, NU::Quad2d, CGVector)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModelAlgo.mm", 212, CFSTR("None of the crop rect points are on the boundary!"), v38, v39, v40, v41, v45);
  }
  return v51;
}

void sub_1A65E7F64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double NU::Quad2d::boundingRect(float64x2_t *this)
{
  float64x2_t v1;
  float64x2_t v2;
  double result;

  v1 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(this[1], *this), *(int8x16_t *)this, (int8x16_t)this[1]);
  v2 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(this[2], v1), (int8x16_t)v1, (int8x16_t)this[2]);
  *(_QWORD *)&result = vbslq_s8((int8x16_t)vcgtq_f64(this[3], v2), (int8x16_t)v2, (int8x16_t)this[3]).u64[0];
  return result;
}

uint64_t intersectionPoint(uint64_t result, const NU::Quad2d *a2, const CGVector *a3, float64x2_t a4, double a5)
{
  uint64_t v6;
  uint64_t v7;
  CGVector v8;
  CGVector v9;
  CGVector v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  float64x2_t v16;
  float64x2_t v17;
  double v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t *v21;
  float64x2_t v22;
  float64x2_t v23;
  double v24;
  float64x2_t v25;
  float64x2_t v26;
  int64x2_t v27;
  float64x2_t v28;
  int64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v37;
  _OWORD v38[2];
  int v39;
  _OWORD v40[4];
  _OWORD v41[2];
  int v42;
  CGVector v43;
  CGVector v44;
  int v45;
  CGVector v46;
  CGVector v47;
  int v48;
  CGVector v49;
  __int128 v50;
  int v51;
  uint64_t v52;

  v6 = result;
  v7 = 0;
  v52 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(result + 84) = 0;
  v8 = a3[1];
  v41[0] = *a3;
  v41[1] = v8;
  v42 = 0;
  v10 = a3[2];
  v9 = a3[3];
  v43 = v8;
  v44 = v9;
  v45 = 0;
  v46 = v9;
  v47 = v10;
  v48 = 0;
  v49 = v10;
  v50 = v41[0];
  v11 = *((_OWORD *)a2 + 1);
  v40[0] = *(_OWORD *)a2;
  v40[1] = v11;
  v12 = *((_OWORD *)a2 + 3);
  v13 = result + 32;
  v40[2] = *((_OWORD *)a2 + 2);
  v40[3] = v12;
  v14 = a4.f64[1] != 0.0 || a4.f64[0] != 0.0;
  v51 = 0;
LABEL_5:
  v15 = 0;
  v16 = (float64x2_t)v40[v7];
  v17.f64[0] = v16.f64[0] + -0.1;
  v18 = *((double *)&v40[v7] + 1);
  v19.f64[0] = v16.f64[0] + -0.1;
  v19.f64[1] = v18 + -0.1;
  v34 = v19;
  v19.f64[0] = v16.f64[0] + 0.1;
  v20.f64[0] = v16.f64[0] + 0.1;
  v20.f64[1] = v18 + -0.1;
  v17.f64[1] = v18 + 0.1;
  v35 = v17;
  v19.f64[1] = v18 + 0.1;
  v32 = v20;
  v33 = v19;
  v21 = (float64x2_t *)v41;
  v37 = v16;
  while (1)
  {
    v23 = *v21;
    v22 = v21[1];
    if (LODWORD(v21[2].f64[0]))
    {
      v24 = 1.79769313e308;
    }
    else
    {
      v25 = vsubq_f64(v22, v23);
      v24 = sqrt(vaddvq_f64(vmulq_f64(v25, v25)));
    }
    v26 = vsubq_f64(v16, v23);
    v27 = (int64x2_t)vmulq_f64(v26, v26);
    v28 = vsubq_f64(v22, v16);
    v29 = (int64x2_t)vmulq_f64(v28, v28);
    if (vabdd_f64(vaddvq_f64(vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v29, v27), (float64x2_t)vzip2q_s64(v29, v27)))), v24) < a5)
    {
      *(float64x2_t *)v6 = v16;
      *(_DWORD *)(v6 + 16) = v7;
      v30 = v21[1];
      *(float64x2_t *)v13 = *v21;
      *(float64x2_t *)(v13 + 16) = v30;
      *(_DWORD *)(v13 + 32) = LODWORD(v21[2].f64[0]);
      *(_DWORD *)(v6 + 80) = v15;
      *(_BYTE *)(v6 + 84) = 1;
      if (!v14)
        return result;
      v31 = v16;
      switch((int)v7)
      {
        case 0:
          v31 = v33;
          break;
        case 1:
          v31 = v35;
          break;
        case 2:
          v31 = v32;
          break;
        case 3:
          v31 = v34;
          break;
        default:
          break;
      }
      v38[0] = v31;
      v38[1] = vaddq_f64(v31, a4);
      v39 = 0;
      result = NU::LineSegment2d::findIntersectParam((uint64_t)v38, v13, 0);
      v16 = v37;
      if ((_DWORD)result == 2)
        return result;
    }
    v21 += 3;
    if (++v15 == 4)
    {
      if (++v7 != 4)
        goto LABEL_5;
      return result;
    }
  }
}

float64x2_t projectionPoint(uint64_t a1, float64x2_t a2)
{
  float64x2_t v2;
  int64x2_t v3;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  _OWORD v9[2];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(float64x2_t *)(a1 + 16);
  v6 = *(float64x2_t *)a1;
  v7 = a2;
  v3 = (int64x2_t)vsubq_f64(v2, *(float64x2_t *)a1);
  v2.f64[0] = -*(double *)&v3.i64[1];
  v5 = (float64x2_t)v3;
  v9[0] = a2;
  v9[1] = vaddq_f64((float64x2_t)vzip1q_s64((int64x2_t)v2, v3), a2);
  v10 = 1;
  v8 = 0.0;
  if (NU::LineSegment2d::findIntersectParam(a1, (uint64_t)v9, &v8) == 2)
    return vmlaq_n_f64(v6, v5, v8);
  return v7;
}

uint64_t NU::LineSegment2d::findIntersectParam(uint64_t a1, uint64_t a2, double *a3)
{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  double v7;
  double v9;
  uint64_t v10;
  double v11;
  int v12;
  double v13;
  int v14;
  double v19;
  char v20;
  uint64_t result;
  double v22;
  double v23;
  float64x2_t v26;
  __int128 v27;

  v3 = *(float64x2_t *)a1;
  v4 = vsubq_f64(*(float64x2_t *)(a1 + 16), *(float64x2_t *)a1);
  v5 = vsubq_f64(*(float64x2_t *)(a2 + 16), *(float64x2_t *)a2);
  _Q2 = vsubq_f64(*(float64x2_t *)a2, *(float64x2_t *)a1);
  v7 = vmlad_n_f64(-_Q2.f64[1] * v5.f64[0], v5.f64[1], _Q2.f64[0]);
  _D3 = v4.f64[1];
  v9 = vmlad_n_f64(-v4.f64[1] * v5.f64[0], v5.f64[1], v4.f64[0]);
  if (v9 == 0.0)
  {
    if (v7 == 0.0)
    {
      if (*(_DWORD *)(a1 + 32) | *(_DWORD *)(a2 + 32))
      {
        return 4;
      }
      else
      {
        if (v4.f64[0] == 0.0)
        {
          v10 = 1;
          v4.f64[0] = v4.f64[1];
          v11 = _Q2.f64[1] / v4.f64[1];
        }
        else
        {
          v10 = 0;
          *(_QWORD *)&v11 = *(_OWORD *)&vdivq_f64(_Q2, v4);
        }
        v27 = *(_OWORD *)(a2 + 16);
        v22 = *(double *)((unint64_t)&v27 & 0xFFFFFFFFFFFFFFF7 | (8 * (v10 & 1)));
        v26 = v3;
        v23 = (v22 - *(double *)((unint64_t)&v26 | (8 * v10))) / v4.f64[0];
        result = 3;
        if (v11 <= 1.0 || v23 <= 1.0)
        {
          if (v23 < 0.0 && v11 < 0.0)
            return 3;
          else
            return 4;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v12 = *(_DWORD *)(a1 + 32);
    v13 = v7 / v9;
    if (v12 != 1)
    {
      v12 = v13 >= 0.0;
      if (v13 > 1.0)
        v12 = 0;
    }
    v14 = *(_DWORD *)(a2 + 32);
    if (v14 != 1)
    {
      __asm { FMLS            D4, D3, V2.D[0] }
      v19 = _D4 / (v5.f64[0] * v4.f64[1] - v5.f64[1] * v4.f64[0]);
      v14 = v19 >= 0.0;
      if (v19 > 1.0)
        v14 = 0;
    }
    v20 = v12 ^ 1;
    if (!a3)
      v20 = 1;
    if ((v20 & 1) == 0)
      *a3 = v13;
    if ((v12 & v14) != 0)
      return 2;
    else
      return 1;
  }
  return result;
}

void deriveScaledRectFromConstrainedRect(double a1, double a2, double a3, double a4, float64_t a5, float64_t a6, float64_t a7, float64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, CGVector a17, __int128 a18, __int128 a19, __int128 a20)
{
  __int128 v20;
  __int128 v21;
  __int128 v22;
  float64x2_t v23;
  int64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  NSObject *v29;
  void *v30;
  void *specific;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  double v51;
  float64x2_t v52;
  float64_t v53;
  float64_t v54;
  _OWORD v55[4];
  CGVector v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  float64x2_t buf[4];
  _OWORD v61[2];
  __int128 v62;
  char v63[16];
  int v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  char v68;
  uint64_t v69;

  *(double *)&v20 = a1;
  *((double *)&v20 + 1) = a2;
  v69 = *MEMORY[0x1E0C80C00];
  v56 = a17;
  v57 = a18;
  v58 = a19;
  v59 = a20;
  *(double *)&v21 = a1 + a3;
  *(_QWORD *)&v22 = v21;
  *((double *)&v22 + 1) = a2;
  v55[0] = v20;
  v55[1] = v22;
  *((double *)&v20 + 1) = a2 + a4;
  *((double *)&v21 + 1) = a2 + a4;
  v55[2] = v20;
  v55[3] = v21;
  intersectionPoint((uint64_t)v63, (const NU::Quad2d *)v55, &v56, (float64x2_t)0, 0.000244140625);
  if (!v68)
  {
    NUAssertLogger();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("none of the crop rect points are on the boundary!"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].f64[0]) = 138543362;
      *(_QWORD *)((char *)buf[0].f64 + 4) = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0].f64[0]) = 138543618;
        *(_QWORD *)((char *)buf[0].f64 + 4) = v36;
        WORD2(buf[0].f64[1]) = 2114;
        *(_QWORD *)((char *)&buf[0].f64[1] + 6) = v38;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].f64[0]) = 138543362;
      *(_QWORD *)((char *)buf[0].f64 + 4) = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"CGRect deriveScaledRectFromConstrainedRect(CGRect, CGRect, NU::Quad2d)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModelAlgo.mm", 247, CFSTR("none of the crop rect points are on the boundary!"), v39, v40, v41, v42, v43);
  }
  v23.f64[0] = a5;
  v23.f64[1] = a6;
  v24 = vdupq_n_s64(0x3EE4F8B588E368F1uLL);
  switch(v64)
  {
    case 0:
      goto LABEL_7;
    case 1:
      v25.f64[1] = a6;
      v24 = (int64x2_t)xmmword_1A671A2D0;
      goto LABEL_6;
    case 2:
      v23.f64[1] = a6 + a8;
      v24 = (int64x2_t)xmmword_1A671A2C0;
      goto LABEL_7;
    case 3:
      v25.f64[1] = a6 + a8;
      v24 = vdupq_n_s64(0xBEE4F8B588E368F1);
LABEL_6:
      v25.f64[0] = a5 + a7;
      v23 = v25;
LABEL_7:
      v46 = v23;
      v45 = (float64x2_t)v24;
      v61[1] = v66;
      v62 = v67;
      v61[0] = v65;
      LODWORD(v62) = 1;
      v44 = projectionPoint((uint64_t)v61, v23);
      v26.f64[0] = a5;
      v26.f64[1] = a6;
      v52 = vaddq_f64(v26, vsubq_f64(v44, v46));
      v27.f64[0] = a7;
      v27.f64[1] = a8;
      v53 = a7;
      v54 = a8;
      v28 = vaddq_f64(v27, v52);
      v26.f64[0] = v52.f64[0];
      v26.f64[1] = v28.f64[1];
      buf[2] = v26;
      buf[3] = v28;
      v28.f64[1] = v52.f64[1];
      buf[0] = v52;
      buf[1] = v28;
      if ((NU::Quad2d::simpleContains((float64x2_t *)&v56, buf) & 1) == 0)
      {
        buf[0] = vaddq_f64(v45, v44);
        v51 = a7 / a8;
        NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor((float64x2_t *)&v56, buf[0].f64, (uint64_t)&v52, (uint64_t)&v52, (uint64_t *)&v51, 0.000000953674316);
      }
      break;
    default:
      return;
  }
}

void sub_1A65E8864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_Unwind_Exception *exception_object)
{
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

uint64_t NU::Quad2d::simpleContains(float64x2_t *this, float64x2_t *a2)
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v4 = NU::Quad2d::simpleContains(this, *a2);
  v5 = NU::Quad2d::simpleContains(this, a2[1]);
  v6 = NU::Quad2d::simpleContains(this, a2[2]);
  return (v4 && v5) & v6 & NU::Quad2d::simpleContains(this, a2[3]);
}

void NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor(float64x2_t *a1, CGFloat *a2, uint64_t a3, uint64_t a4, uint64_t *a5, double a6)
{
  float64x2_t v12;
  float64x2_t v13;
  __int128 v14;
  int v15;
  double width;
  double height;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v22;
  int v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  BOOL v30;
  _BOOL4 v31;
  uint64_t v32;
  CGRect rect;
  __int128 v34;
  CGPoint v35;
  __int128 v36;
  float64x2_t v37[4];
  CGPoint size;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v42 = *MEMORY[0x1E0C80C00];
  rect.origin = *(CGPoint *)a4;
  v12 = vaddq_f64(*(float64x2_t *)(a4 + 16), *(float64x2_t *)a4);
  v13.f64[0] = *(float64_t *)a4;
  v13.f64[1] = v12.f64[1];
  v37[2] = v13;
  v37[3] = v12;
  v12.f64[1] = rect.origin.y;
  v37[0] = (float64x2_t)rect.origin;
  v37[1] = v12;
  if (!NU::Quad2d::equivalentWithTolerance(a1, v37, a6))
  {
    v14 = *(_OWORD *)(a3 + 16);
    v35 = *(CGPoint *)a3;
    v36 = v14;
    v15 = 100;
    height = *((double *)&v14 + 1);
    width = *(double *)&v14;
    while (1)
    {
      *(CGFloat *)&v18 = v35.x;
      *(double *)&v19 = width + v35.x;
      *((_QWORD *)&v20 + 1) = *(_QWORD *)&v35.y;
      *(double *)&v20 = width + v35.x;
      size = v35;
      v39 = v20;
      *((double *)&v18 + 1) = v35.y + height;
      *((double *)&v19 + 1) = v35.y + height;
      v40 = v18;
      v41 = v19;
      if ((NU::Quad2d::contains(a1, (float64x2_t *)&size) & 1) != 0 || !v15)
        break;
      if (width <= 10.0 || height <= 10.0)
        break;
      v43.origin = v35;
      v43.size.width = width;
      v43.size.height = height;
      v44 = CGRectOffset(v43, -*a2, -a2[1]);
      v44.size.width = v44.size.width * 0.5;
      v44.size.height = v44.size.height * 0.5;
      v44.origin.x = v44.origin.x * 0.5;
      v44.origin.y = v44.origin.y * 0.5;
      v45 = CGRectOffset(v44, *a2, a2[1]);
      width = v45.size.width;
      height = v45.size.height;
      v35.x = v45.origin.x;
      v35.y = v45.origin.y;
      *(CGFloat *)&v36 = v45.size.width;
      *((_QWORD *)&v36 + 1) = *(_QWORD *)&v45.size.height;
      --v15;
    }
    v22 = *(_OWORD *)(a4 + 16);
    rect.size = *(CGSize *)a4;
    v34 = v22;
    v23 = 100;
    v25 = *((double *)&v22 + 1);
    v24 = *(double *)&v22;
    while (1)
    {
      *(CGFloat *)&v26 = rect.size.width;
      *(double *)&v27 = v24 + rect.size.width;
      *((_QWORD *)&v28 + 1) = *(_QWORD *)&rect.size.height;
      *(double *)&v28 = v24 + rect.size.width;
      size = (CGPoint)rect.size;
      v39 = v28;
      *((double *)&v26 + 1) = rect.size.height + v25;
      *((double *)&v27 + 1) = rect.size.height + v25;
      v40 = v26;
      v41 = v27;
      v29 = NU::Quad2d::contains(a1, (float64x2_t *)&size);
      v30 = v23-- != 0;
      v31 = v30;
      if (!v29 || !v31)
        break;
      v46.origin.x = rect.size.width;
      v46.origin.y = rect.size.height;
      v46.size.width = v24;
      v46.size.height = v25;
      v47 = CGRectOffset(v46, -*a2, -a2[1]);
      v47.size.width = v47.size.width + v47.size.width;
      v47.size.height = v47.size.height + v47.size.height;
      v47.origin.x = v47.origin.x + v47.origin.x;
      v47.origin.y = v47.origin.y + v47.origin.y;
      v48 = CGRectOffset(v47, *a2, a2[1]);
      v24 = v48.size.width;
      v25 = v48.size.height;
      rect.size.width = v48.origin.x;
      rect.size.height = v48.origin.y;
      *(CGFloat *)&v34 = v48.size.width;
      *((_QWORD *)&v34 + 1) = *(_QWORD *)&v48.size.height;
    }
    v32 = *a5;
    *(_QWORD *)&size.x = &off_1E505F560;
    v39 = *(_OWORD *)a2;
    *(_QWORD *)&v40 = v32;
    NU::Quad2d::computeLimitRect(a1, (uint64_t)&v35, (uint64_t)&rect.size, (uint64_t)&size, a6);
  }
}

uint64_t NU::Quad2d::equivalentWithTolerance(float64x2_t *this, float64x2_t *a2, double a3)
{
  float64x2_t v3;
  double v4;
  double v5;
  float64x2_t v7;
  double v8;
  double v9;
  float64x2_t v11;
  double v12;
  double v13;
  BOOL v14;
  float64x2_t v15;
  double v16;
  double v17;
  BOOL v18;

  v3 = vsubq_f64(*this, *a2);
  v4 = fabs(v3.f64[0]);
  v5 = fabs(v3.f64[1]);
  if (v4 >= a3 || v5 >= a3)
    return 0;
  v7 = vsubq_f64(this[1], a2[1]);
  v8 = fabs(v7.f64[0]);
  v9 = fabs(v7.f64[1]);
  if (v8 >= a3 || v9 >= a3)
    return 0;
  v11 = vsubq_f64(this[2], a2[2]);
  v12 = fabs(v11.f64[0]);
  v13 = fabs(v11.f64[1]);
  v14 = v12 < a3 && v13 < a3;
  if (v14
    && ((v15 = vsubq_f64(this[3], a2[3]), v16 = fabs(v15.f64[0]), v17 = fabs(v15.f64[1]), v16 < a3)
      ? (v18 = v17 < a3)
      : (v18 = 0),
        v18))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

uint64_t NU::Quad2d::contains(float64x2_t *this, float64x2_t *a2)
{
  int v4;
  int v5;
  int v6;

  v4 = NU::Quad2d::contains(this, *a2);
  v5 = NU::Quad2d::contains(this, a2[1]);
  v6 = NU::Quad2d::contains(this, a2[2]);
  return v4 & v5 & v6 & NU::Quad2d::contains(this, a2[3]);
}

float64_t NU::Quad2d::computeLimitRect(float64x2_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  int v10;
  float64x2_t v11;
  float64_t v12;
  float64x2_t v13;
  float64_t v14;
  float64x2_t v15;
  uint64_t v16;
  __int128 v17;
  float64x2_t v19[4];
  float64x2_t v20;
  __int128 v21;

  v10 = 100;
  do
  {
    v11.f64[0] = (*(double (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a4 + 16))(a4, a3, a2);
    v20.f64[0] = v11.f64[0];
    v20.f64[1] = v12;
    *(float64_t *)&v21 = v13.f64[0];
    *((float64_t *)&v21 + 1) = v14;
    v13.f64[1] = v14;
    v15 = vaddq_f64(v13, v20);
    v13.f64[0] = v15.f64[0];
    v13.f64[1] = v20.f64[1];
    v19[0] = v20;
    v19[1] = v13;
    v11.f64[1] = v15.f64[1];
    v19[2] = v11;
    v19[3] = v15;
    if ((*(unsigned int (**)(uint64_t, float64x2_t *, uint64_t, double))(*(_QWORD *)a4 + 24))(a4, &v20, a3, a5)&& NU::Quad2d::simpleContains(a1, v19))
    {
      break;
    }
    v16 = NU::Quad2d::simpleContains(a1, v19) ? a2 : a3;
    v17 = v21;
    *(float64x2_t *)v16 = v20;
    *(_OWORD *)(v16 + 16) = v17;
    --v10;
  }
  while (v10);
  return v20.f64[0];
}

void NU::AnchorRectFinder::~AnchorRectFinder(NU::AnchorRectFinder *this)
{
  JUMPOUT(0x1A85C0F94);
}

double NU::AnchorRectFinder::constructNextRect(NU::AnchorRectFinder *this, const CGRect *a2, const CGRect *a3)
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v13;
  double result;
  CGRect v15;

  width = a2->size.width;
  height = a2->size.height;
  v8 = a3->size.height + (height - a3->size.height) * 0.5;
  v9 = v8 / height;
  v10 = *((double *)this + 4);
  v11 = v10 * v8 / width;
  if (v11 > 1.0 || v9 > 1.0)
  {
    v13 = a3->size.width + (width - a3->size.width) * 0.5;
    v11 = v13 / width;
    v9 = v13 / v10 / height;
  }
  x = a2->origin.x;
  y = a2->origin.y;
  v15 = CGRectOffset(*(CGRect *)(&width - 2), -*((double *)this + 2), -*((double *)this + 3));
  v15.size.width = v11 * v15.size.width;
  v15.size.height = v9 * v15.size.height;
  v15.origin.x = v11 * v15.origin.x;
  v15.origin.y = v9 * v15.origin.y;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v15, *((CGFloat *)this + 2), *((CGFloat *)this + 3));
  return result;
}

BOOL NU::AnchorRectFinder::converged(NU::AnchorRectFinder *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->size.width, a3->size.width) < a4 && vabdd_f64(a2->size.height, a3->size.height) < a4;
}

uint64_t NU::Quad2d::contains(float64x2_t *a1, float64x2_t a2)
{
  uint64_t v2;
  char v3;
  float64x2_t v4;
  float64x2_t v5;
  unsigned __int8 v6;
  BOOL v7;
  double v8;
  double v9;
  float64x2_t v10;
  float64x2_t v11;
  int IntersectParam;
  _OWORD v15[2];
  int v16;
  float64x2_t v17;
  float64x2_t v18;
  int v19;
  float64x2_t v20;
  float64x2_t v21;
  int v22;
  float64x2_t v23;
  float64x2_t v24;
  int v25;
  _OWORD v26[2];
  int v27;
  uint64_t v28;

  v2 = 0;
  v3 = 0;
  v28 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = a1[1];
  v6 = vmovn_s64(vcgtq_f64(v5, *a1)).u8[0];
  v7 = (v6 & 1) == 0;
  if ((v6 & 1) != 0)
    v8 = a1->f64[0];
  else
    v8 = a1[1].f64[0];
  if (v7)
    v9 = a1->f64[0];
  else
    v9 = a1[1].f64[0];
  v10 = a1[2];
  v11 = a1[3];
  if (v8 >= v10.f64[0])
    v8 = a1[2].f64[0];
  if (v8 >= v11.f64[0])
    v8 = a1[3].f64[0];
  if (v9 < v10.f64[0])
    v9 = a1[2].f64[0];
  if (v9 < v11.f64[0])
    v9 = a1[3].f64[0];
  v26[1] = a2;
  a2.f64[0] = v8;
  v26[0] = vsubq_f64(a2, (float64x2_t)vdupq_lane_s64(COERCE__INT64((v9 - v8) / 100.0), 0));
  v27 = 0;
  v15[0] = v4;
  v15[1] = v5;
  v16 = 0;
  v17 = v5;
  v18 = v11;
  v19 = 0;
  v20 = v11;
  v21 = v10;
  v22 = 0;
  v23 = v10;
  v24 = v4;
  v25 = 0;
  do
  {
    IntersectParam = NU::LineSegment2d::findIntersectParam((uint64_t)v26, (uint64_t)&v15[v2], 0);
    if (IntersectParam == 4 || IntersectParam == 2)
      ++v3;
    v2 += 3;
  }
  while (v2 != 12);
  return v3 & 1;
}

BOOL NU::Quad2d::simpleContains(float64x2_t *a1, float64x2_t a2)
{
  uint64_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  uint64_t i;
  float64x2_t v7;
  __int32 v8;
  double v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  _OWORD v15[5];
  uint64_t v16;

  v2 = 0;
  v16 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = a1[1];
  v15[0] = v3;
  v15[1] = v4;
  v5 = a1[2];
  v15[2] = a1[3];
  v15[3] = v5;
  v15[4] = v3;
  for (i = 1; i != 5; ++i)
  {
    v7 = v3;
    v8 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vcgeq_f64(a2, v3))).i32[1];
    v3 = (float64x2_t)v15[i];
    v9 = *((double *)&v15[i] + 1);
    if ((v8 & 1) != 0)
    {
      if (v9 <= a2.f64[1])
      {
        v10 = vsubq_f64(v3, v7);
        v11 = vsubq_f64(a2, v7);
        v2 -= vmlad_n_f64(-v10.f64[1] * v11.f64[0], v11.f64[1], v10.f64[0]) <= 0.0;
      }
    }
    else if (v9 > a2.f64[1])
    {
      v12 = vsubq_f64(v3, v7);
      v13 = vsubq_f64(a2, v7);
      if (vmlad_n_f64(-v12.f64[1] * v13.f64[0], v13.f64[1], v12.f64[0]) >= 0.0)
        ++v2;
    }
  }
  return v2 != 0;
}

__n128 deriveScaledQuadFromConstrainedQuad(__n128 a1, __n128 a2, __n128 a3, __n128 a4, float64x2_t a5, float64x2_t a6, float64x2_t a7, float64x2_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, CGVector a17, __int128 a18, __int128 a19, __int128 a20)
{
  float64x2_t v20;
  float64x2_t v21;
  __n128 result;
  NSObject *v23;
  void *v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __n128 v43;
  CGVector v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD v48[4];
  _BYTE buf[32];
  float64x2_t v50;
  float64x2_t v51;
  _OWORD v52[2];
  __int128 v53;
  _BYTE v54[16];
  int v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v48[0] = a1;
  v48[1] = a2;
  v37 = a4.n128_u64[0];
  v48[2] = a3;
  v48[3] = a4;
  v44 = a17;
  v45 = a18;
  v46 = a19;
  v47 = a20;
  intersectionPoint((uint64_t)v54, (const NU::Quad2d *)v48, &v44, (float64x2_t)0, 0.000244140625);
  if (!v59)
  {
    NUAssertLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("none of the crop rect points are on the boundary!"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v32;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"NU::Quad2d deriveScaledQuadFromConstrainedQuad(NU::Quad2d, NU::Quad2d, NU::Quad2d)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModelAlgo.mm", 333, CFSTR("none of the crop rect points are on the boundary!"), v33, v34, v35, v36, v37);
  }
  v20 = a5;
  switch(v55)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v20 = a6;
      goto LABEL_6;
    case 2:
      v20 = a7;
      goto LABEL_6;
    case 3:
      v20 = a8;
LABEL_6:
      v52[0] = v56;
      v52[1] = v57;
      v53 = v58;
      LODWORD(v53) = 1;
      v21 = vsubq_f64(projectionPoint((uint64_t)v52, v20), v20);
      *(float64x2_t *)buf = vaddq_f64(a5, v21);
      *(float64x2_t *)&buf[16] = vaddq_f64(a6, v21);
      v50 = vaddq_f64(a7, v21);
      v51 = vaddq_f64(a8, v21);
      v43 = *(__n128 *)buf;
      if (NU::Quad2d::simpleContains((float64x2_t *)&v44, (float64x2_t *)buf))
        result = v43;
      else
        result = a1;
      break;
    default:
      result = *(__n128 *)MEMORY[0x1E0C9D648];
      break;
  }
  return result;
}

void sub_1A65E9410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_Unwind_Exception *exception_object)
{
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

double aspectRatioConstrainedFromRect(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8)
{
  return aspectRatioConstrainedFromRect(a1, a2, a3, a4, a5, a6, a7, a8, a5 * a6);
}

double aspectRatioConstrainedFromRect(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9)
{
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  CGRect v17;

  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  v11 = sqrt((double)a2 * a9 / (double)a1);
  v12 = v11 / a6;
  v13 = v11 * (double)a1 / (double)a2 / a5;
  NU::RectT<double>::RectT(&v15, &v17);
  v15 = v15 - a7;
  v16 = v16 - a8;
  NU::RectT<double>::scale(&v15, v13, v12);
  return a7 + v15;
}

double *NU::RectT<double>::RectT(double *a1, CGRect *a2)
{
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;

  MinX = CGRectGetMinX(*a2);
  MinY = CGRectGetMinY(*a2);
  MaxX = CGRectGetMaxX(*a2);
  MaxY = CGRectGetMaxY(*a2);
  NU::RectT<double>::setXYMinMax(a1, MinX, MinY, MaxX, MaxY);
  return a1;
}

double NU::RectT<double>::scale(double *a1, double a2, double a3)
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a2 < 0.0)
  {
    NUAssertLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Negative x-scale values not supported"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v18;
        v35 = 2114;
        v36 = v20;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<double>::scale(CGFloat, CGFloat, NUPixelRoundingPolicy) [T = double]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 289, CFSTR("Negative x-scale values not supported"), v21, v22, v23, v24, v32);
  }
  if (a3 < 0.0)
  {
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Negative y-scale values not supported"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v25;
        v35 = 2114;
        v36 = v27;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<double>::scale(CGFloat, CGFloat, NUPixelRoundingPolicy) [T = double]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 290, CFSTR("Negative y-scale values not supported"), v28, v29, v30, v31, v32);
  }
  return NU::RectT<double>::setXYMinMax(a1, *a1 * a2, a1[1] * a3, *a1 * a2 + a1[2] * a2, a1[1] * a3 + a1[3] * a3);
}

void sub_1A65E9980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

double NU::RectT<double>::setXYMinMax(double *a1, double a2, double a3, double a4, double a5)
{
  double result;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a2 > a4)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7844);
    v6 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set min > max"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7844);
    v9 = (id)_NUAssertLogger;
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v20;
        v37 = 2114;
        v38 = v22;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<double>::setXMinMax(T, T) [T = double]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 129, CFSTR("Cannot set min > max"), v23, v24, v25, v26, v34);
  }
  a1[2] = a4 - a2;
  *a1 = a2;
  if (a3 > a5)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7844);
    v13 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set min > max"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7844);
    v16 = (id)_NUAssertLogger;
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v27;
        v37 = 2114;
        v38 = v29;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<double>::setYMinMax(T, T) [T = double]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 136, CFSTR("Cannot set min > max"), v30, v31, v32, v33, v34);
  }
  result = a5 - a3;
  a1[3] = a5 - a3;
  a1[1] = a3;
  return result;
}

void sub_1A65E9E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t vertexIDFromPoint(const CGRect *a1, float64x2_t *a2)
{
  uint64_t v3;
  float64x2_t v4;
  float64_t v5;
  float64x2_t v6;
  float64x2_t v8;

  v3 = 0;
  v8 = *a2;
  while (1)
  {
    v4.f64[0] = pointFromVertexID(a1, v3);
    v4.f64[1] = v5;
    v6 = vsubq_f64(v8, v4);
    if (sqrt(vaddvq_f64(vmulq_f64(v6, v6))) < 5.0)
      break;
    v3 = (v3 + 1);
    if ((_DWORD)v3 == 8)
      return 0xFFFFFFFFLL;
  }
  return v3;
}

double pointFromVertexID(const CGRect *a1, int a2)
{
  double MinX;
  double v4;
  double MaxX;
  double v6;

  switch(a2)
  {
    case 0:
      MinX = CGRectGetMinX(*a1);
      goto LABEL_8;
    case 1:
      MinX = CGRectGetMaxX(*a1);
      goto LABEL_8;
    case 2:
      MaxX = CGRectGetMinX(*a1);
      goto LABEL_13;
    case 3:
      MaxX = CGRectGetMaxX(*a1);
      goto LABEL_13;
    case 4:
      MinX = CGRectGetMidX(*a1);
LABEL_8:
      v4 = MinX;
      CGRectGetMinY(*a1);
      return v4;
    case 5:
      v6 = CGRectGetMaxX(*a1);
      goto LABEL_11;
    case 6:
      v6 = CGRectGetMinX(*a1);
LABEL_11:
      v4 = v6;
      CGRectGetMidY(*a1);
      break;
    case 7:
      MaxX = CGRectGetMidX(*a1);
LABEL_13:
      v4 = MaxX;
      CGRectGetMaxY(*a1);
      break;
    default:
      v4 = -1.79769313e308;
      break;
  }
  return v4;
}

uint64_t vertexIDFromPoint(const CGRect *a1, float64x2_t *a2, double a3)
{
  uint64_t v5;
  float64x2_t v6;
  float64_t v7;
  float64x2_t v8;
  float64x2_t v10;

  v5 = 0;
  v10 = *a2;
  while (1)
  {
    v6.f64[0] = pointFromVertexID(a1, v5);
    v6.f64[1] = v7;
    v8 = vsubq_f64(v10, v6);
    if (sqrt(vaddvq_f64(vmulq_f64(v8, v8))) < a3)
      break;
    v5 = (v5 + 1);
    if ((_DWORD)v5 == 8)
      return 0xFFFFFFFFLL;
  }
  return v5;
}

CGFloat PAAbsolutePointInRect(CGPoint a1, CGRect a2)
{
  return a2.origin.x + a1.x * a2.size.width;
}

BOOL canExpandWithAbsoluteAnchor(uint64_t a1, float64x2_t *a2, const CGRect *a3, float64x2_t *a4)
{
  CGFloat MidX;
  CGFloat MidY;
  float64x2_t v10;
  __int32 v11;
  double y;
  double height;
  double v19;
  _BOOL8 result;
  double v21;
  CGFloat v22;
  double x;
  double width;
  double v25;

  MidX = CGRectGetMidX(*a3);
  MidY = CGRectGetMidY(*a3);
  a4->f64[0] = MidX;
  a4->f64[1] = MidY;
  if ((a1 & 0x10) == 0)
  {
    if ((a1 & 0x40) != 0)
    {
      *a4 = (float64x2_t)xmmword_1A671A2F0;
      *a4 = vmlaq_f64((float64x2_t)a3->origin, (float64x2_t)xmmword_1A671A2F0, (float64x2_t)a3->size);
      result = (a1 & 0x20) == 0;
      if ((a1 & 0xA0) != 0x80)
        return result;
    }
    else
    {
      if ((a1 & 0x20) != 0)
      {
        *a4 = (float64x2_t)xmmword_1A671A300;
        v22 = a3->origin.y + a3->size.height * 0.5;
        a4->f64[0] = a3->origin.x + a3->size.width;
        a4->f64[1] = v22;
        if ((a1 & 0x80) == 0)
          return 1;
        goto LABEL_20;
      }
      if ((a1 & 0x80) != 0)
      {
        *a4 = (float64x2_t)xmmword_1A671A310;
        x = a3->origin.x;
        y = a3->origin.y;
        width = a3->size.width;
        height = a3->size.height;
        v25 = 0.5;
LABEL_24:
        v19 = x + width * v25;
        goto LABEL_25;
      }
      v10 = a2[1];
      v11 = vmovn_s64(vcgtq_f64(v10, *a2)).i32[1];
      if ((a1 & 1) == 0)
      {
        if ((a1 & 2) == 0)
        {
          if ((a1 & 4) == 0)
          {
            if ((a1 & 8) != 0)
            {
              if (a1 == 8)
              {
                __asm { FMOV            V0.2D, #1.0 }
                *(CGPoint *)a4 = _Q0;
                y = a3->origin.y;
                height = a3->size.height;
                v19 = a3->origin.x + a3->size.width;
LABEL_25:
                v21 = height + y;
LABEL_26:
                a4->f64[0] = v19;
                goto LABEL_27;
              }
              return 0;
            }
            return 1;
          }
          if (a1 == 4)
          {
            *a4 = (float64x2_t)xmmword_1A671A290;
            x = a3->origin.x;
            y = a3->origin.y;
            width = a3->size.width;
            height = a3->size.height;
            v25 = 0.0;
            goto LABEL_24;
          }
          if ((a1 & 8) == 0)
            return 0;
          if ((v11 & 1) != 0)
            goto LABEL_20;
          goto LABEL_18;
        }
        if (a1 == 2)
        {
          *a4 = (float64x2_t)xmmword_1A671A2A0;
          v19 = a3->origin.x + a3->size.width;
          v21 = a3->origin.y + a3->size.height * 0.0;
          goto LABEL_26;
        }
        if ((a1 & 0xC) != 8)
          return 0;
        if ((v11 & 1) != 0)
          goto LABEL_43;
LABEL_20:
        a4->f64[0] = a2[3].f64[0];
        v21 = a2[3].f64[1];
        goto LABEL_27;
      }
      if (a1 == 1)
      {
        a4->f64[0] = 0.0;
        a4->f64[1] = 0.0;
        v19 = a3->origin.x + a3->size.width * 0.0;
        v21 = a3->origin.y + a3->size.height * 0.0;
        goto LABEL_26;
      }
      if ((a1 & 8) != 0)
        return 0;
      if ((a1 & 4) == 0)
      {
        if ((a1 & 2) == 0)
          return 0;
        if ((v11 & 1) == 0)
        {
LABEL_43:
          a4->f64[0] = v10.f64[0];
          goto LABEL_22;
        }
        goto LABEL_45;
      }
      if ((v11 & 1) == 0)
      {
LABEL_45:
        a4->f64[0] = a2->f64[0];
        goto LABEL_16;
      }
    }
LABEL_18:
    a4->f64[0] = a2[2].f64[0];
    v21 = a2[2].f64[1];
    goto LABEL_27;
  }
  result = 0;
  *a4 = (float64x2_t)xmmword_1A671A2E0;
  *a4 = vmlaq_f64((float64x2_t)a3->origin, (float64x2_t)xmmword_1A671A2E0, (float64x2_t)a3->size);
  if ((~(_BYTE)a1 & 0x60) != 0 && (a1 & 0x80) == 0)
  {
    if ((a1 & 0x20) != 0)
    {
      a4->f64[0] = a2[1].f64[0];
LABEL_22:
      v21 = a2[1].f64[1];
      goto LABEL_27;
    }
    if ((a1 & 0x40) == 0)
      return 1;
    a4->f64[0] = a2->f64[0];
LABEL_16:
    v21 = a2->f64[1];
LABEL_27:
    a4->f64[1] = v21;
    return 1;
  }
  return result;
}

void _NULogInit()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;

  v0 = os_log_create("com.apple.photos.Neutrino", "general");
  v1 = (void *)_NULogger;
  _NULogger = (uint64_t)v0;

  v2 = os_log_create("com.apple.photos.Neutrino", "pipeline");
  v3 = (void *)_NUPipelineLogger;
  _NUPipelineLogger = (uint64_t)v2;

  v4 = os_log_create("com.apple.photos.Neutrino", "render");
  v5 = (void *)_NURenderLogger;
  _NURenderLogger = (uint64_t)v4;

  v6 = os_log_create("com.apple.photos.Neutrino", "schedule");
  v7 = (void *)_NUScheduleLogger;
  _NUScheduleLogger = (uint64_t)v6;

  v8 = os_log_create("com.apple.photos.Neutrino", "assert");
  v9 = (void *)_NUAssertLogger;
  _NUAssertLogger = (uint64_t)v8;

  v10 = os_log_create("com.apple.photos.Neutrino", "ui");
  v11 = (void *)_NUUILogger;
  _NUUILogger = (uint64_t)v10;

  v12 = os_log_create("com.apple.photos.Neutrino", "js");
  v13 = (void *)_NUJSLogger;
  _NUJSLogger = (uint64_t)v12;

}

void NULogAdoptVoucher(void *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);

  v3 = a1;
  v4 = a2;
  voucher_adopt();
  v4[2](v4);

}

id NUAssertLogger_8104()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
  return (id)_NUAssertLogger;
}

void sub_1A65ED390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8275(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8276(uint64_t a1)
{

}

id NUAssertLogger_8396()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8418);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_8539()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8527);
  return (id)_NUAssertLogger;
}

void sub_1A65F08AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_8789()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_195_8777);
  return (id)_NUAssertLogger;
}

void sub_1A65F92D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

id NUAssertLogger_9062()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9083);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__9075(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9076(uint64_t a1)
{

}

id NUAssertLogger_9222()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9235);
  return (id)_NUAssertLogger;
}

void sub_1A65FB1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_9407()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_85_9424);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__9446(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9447(uint64_t a1)
{

}

id NUAssertLogger_9515()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9528);
  return (id)_NUAssertLogger;
}

void sub_1A65FFD74(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_9655()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9681);
  return (id)_NUAssertLogger;
}

double NU::Sum(double **this, const DataSet *a2)
{
  double *v2;
  double *v3;
  double v4;
  _QWORD v6[2];
  double (*v7)(uint64_t, double);
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2000000000;
  v13 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v7 = ___ZN2NU3SumERKNS_7DataSetE_block_invoke;
  v8 = &unk_1E5061BC0;
  v9 = &v10;
  v2 = *this;
  v3 = this[1];
  if (*this == v3)
  {
    v4 = 0.0;
  }
  else
  {
    do
      ((void (*)(_QWORD *, const DataSet *, double))v7)(v6, a2, *v2++);
    while (v2 != v3);
    v4 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void sub_1A660093C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double ___ZN2NU3SumERKNS_7DataSetE_block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

double NU::Min(double **this, const DataSet *a2)
{
  double *v2;
  double *v3;
  double v4;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t, double);
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2000000000;
  v13 = 0x7FF0000000000000;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v7 = ___ZN2NU3MinERKNS_7DataSetE_block_invoke;
  v8 = &unk_1E5061BE8;
  v9 = &v10;
  v2 = *this;
  v3 = this[1];
  if (*this == v3)
  {
    v4 = INFINITY;
  }
  else
  {
    do
      ((void (*)(_QWORD *, const DataSet *, double))v7)(v6, a2, *v2++);
    while (v2 != v3);
    v4 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void sub_1A6600A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN2NU3MinERKNS_7DataSetE_block_invoke(uint64_t result, double a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(double *)(v2 + 24) <= a2)
    a2 = *(double *)(v2 + 24);
  *(double *)(v2 + 24) = a2;
  return result;
}

double NU::Max(double **this, const DataSet *a2)
{
  double *v2;
  double *v3;
  double v4;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t, double);
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  unint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2000000000;
  v13 = 0xFFF0000000000000;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v7 = ___ZN2NU3MaxERKNS_7DataSetE_block_invoke;
  v8 = &unk_1E5061C10;
  v9 = &v10;
  v2 = *this;
  v3 = this[1];
  if (*this == v3)
  {
    v4 = -INFINITY;
  }
  else
  {
    do
      ((void (*)(_QWORD *, const DataSet *, double))v7)(v6, a2, *v2++);
    while (v2 != v3);
    v4 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void sub_1A6600B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN2NU3MaxERKNS_7DataSetE_block_invoke(uint64_t result, double a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(double *)(v2 + 24) >= a2)
    a2 = *(double *)(v2 + 24);
  *(double *)(v2 + 24) = a2;
  return result;
}

double NU::Mean(double **this, const DataSet *a2)
{
  double v3;
  uint64_t v4;

  v3 = NU::Sum(this, a2);
  v4 = (char *)this[1] - (char *)*this;
  if (v4)
    return v3 / (double)(v4 >> 3);
  else
    return 0.0;
}

double NU::Mean(NU *this, double a2)
{
  if (this)
    return a2 / (double)(uint64_t)this;
  else
    return 0.0;
}

double NU::Variance(double **this, const DataSet *a2)
{
  const NU::DataSet *v3;
  double v4;
  uint64_t v5;
  double v6;

  v4 = NU::Sum(this, a2);
  v5 = (char *)this[1] - (char *)*this;
  if (v5)
    v6 = v4 / (double)(v5 >> 3);
  else
    v6 = 0.0;
  return NU::Variance((NU *)this, v3, v6);
}

double NU::Variance(NU *this, const NU::DataSet *a2, double a3)
{
  const DataSet *v4;
  double v5;
  double v6;
  void *v8[3];
  void *__p[3];

  if (*((_QWORD *)this + 1) == *(_QWORD *)this)
    return 0.0;
  NU::operator+((uint64_t)this, (double **)v8, -a3);
  NU::Square((uint64_t)v8, (double **)__p);
  v5 = NU::Sum((double **)__p, v4);
  if ((uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3 == 1)
    v6 = 0.0;
  else
    v6 = v5 / (double)(((uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3) - 1);
  if (__p[0])
    operator delete(__p[0]);
  if (v8[0])
    operator delete(v8[0]);
  return v6;
}

void sub_1A6600C88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p)
    operator delete(__p);
  if (a9)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

double NU::StandardDeviation(double **this, const DataSet *a2)
{
  return sqrt(NU::Variance(this, a2));
}

double NU::StandardDeviation(NU *this, double a2)
{
  return sqrt(a2);
}

double NU::StandardDeviation(NU *this, const NU::DataSet *a2, double a3)
{
  return sqrt(NU::Variance(this, a2, a3));
}

double NU::StandardError(double **this, const DataSet *a2)
{
  double v3;
  uint64_t v4;

  v3 = NU::Variance(this, a2);
  v4 = (char *)this[1] - (char *)*this;
  if (v4)
    return sqrt(v3) / sqrt((double)(v4 >> 3));
  else
    return 0.0;
}

double NU::StandardError(NU *this, double a2)
{
  if (this)
    return a2 / sqrt((double)(uint64_t)this);
  else
    return 0.0;
}

double NU::StandardError(NU *this, const NU::DataSet *a2, double a3)
{
  double v4;
  uint64_t v5;

  v4 = NU::Variance(this, a2, a3);
  v5 = *((_QWORD *)this + 1) - *(_QWORD *)this;
  if (v5)
    return sqrt(v4) / sqrt((double)(v5 >> 3));
  else
    return 0.0;
}

double NU::Variation(NU *this, double a2, double a3)
{
  return a3 / a2;
}

double NU::Median(NU *this, const NU::DataSet *a2)
{
  return NU::Percentile(this, a2, 0.5);
}

double NU::Percentile(NU *this, const NU::DataSet *a2, double a3)
{
  double *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v12 = 0;
  v13 = 0;
  v14 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v12, *(const void **)this, *((_QWORD *)this + 1), (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3);
  v4 = v12;
  v5 = v13;
  std::__sort<std::__less<double,double> &,double *>();
  v6 = (v5 - (uint64_t)v4) >> 3;
  v7 = a3 * (double)(unint64_t)v6 + -0.5;
  if (v7 >= 0.0)
  {
    v9 = vcvtmd_u64_f64(v7);
    v10 = v6 - 1;
    if (v9 + 1 <= v10)
      v8 = v4[v9] + (v7 - (double)v9) * (v4[v9 + 1] - v4[v9]);
    else
      v8 = v4[v10];
  }
  else
  {
    v8 = *v4;
  }
  operator delete(v4);
  return v8;
}

void sub_1A6600E68(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A6600EDC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E505E780, MEMORY[0x1E0DE42D0]);
}

void sub_1A6600FE0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

long double NU::GeometricMean(NU *this, const NU::DataSet *a2)
{
  const DataSet *v2;
  double v3;
  double v4;
  double *v6;
  double *v7;

  NU::Log(this, &v6);
  v3 = NU::Sum(&v6, v2);
  if (v7 == v6)
  {
    v4 = 0.0;
    if (!v6)
      return exp(v4);
    goto LABEL_3;
  }
  v4 = v3 / (double)(v7 - v6);
  if (v6)
LABEL_3:
    operator delete(v6);
  return exp(v4);
}

void sub_1A6601080(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

id NUAssertLogger_9861()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_26);
  return (id)_NUAssertLogger;
}

void sub_1A6601C20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A6602110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A66025C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A66026F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6602D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A6603338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A660347C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A660362C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6603754(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6604328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _Unwind_Exception *exception_object)
{
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1A66047E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A6606008(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void NU::Quad2d::findInscribedAxisAlignedAspectFitRect(float64x2_t *a1, __n128 a2, double a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  _OWORD v11[2];
  void (**v12)(NU::centerRectFinder *__hidden);
  __n128 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v11[0] = *MEMORY[0x1E0C9D648];
  v11[1] = v5;
  v10[0] = NU::Quad2d::boundingRect(a1);
  v10[1] = v6;
  v10[2] = v7;
  v10[3] = v8;
  v12 = &off_1E505F590;
  v13 = a2;
  v14 = a3;
  NU::Quad2d::computeLimitRect(a1, (uint64_t)v11, (uint64_t)v10, (uint64_t)&v12, 0.000244140625);
}

void NU::centerRectFinder::~centerRectFinder(NU::centerRectFinder *this)
{
  JUMPOUT(0x1A85C0F94);
}

double NU::centerRectFinder::constructNextRect(NU::centerRectFinder *this, const CGRect *a2, const CGRect *a3)
{
  return *((double *)this + 2)
       - *((double *)this + 4) * (a3->size.height + (a2->size.height - a3->size.height) * 0.5) * 0.5;
}

BOOL NU::centerRectFinder::converged(NU::centerRectFinder *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->size.height, a3->size.height) < a4;
}

float64_t NU::Quad2d::findInscribedUnscaledFitRect(NU::Quad2d *this, const CGRect *a2, float64_t a3, double a4, double a5, float64x2_t a6)
{
  float64x2_t v8;
  __int128 v9;
  float64x2_t origin;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGFloat v16;
  CGFloat MinY;
  __int128 v18;
  CGFloat width;
  CGFloat x;
  CGFloat height;
  CGFloat v22;
  __int128 v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat MaxY;
  __int128 v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  float64x2_t v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  float64x2_t *v38;
  int64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat v46;
  CGFloat v47;
  CGSize rect;
  CGRect v49;
  float64x2_t v50;
  __int128 v51;
  float64x2_t v52;
  _OWORD v53[4];
  _OWORD v54[12];
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  a6.f64[0] = a3;
  v55 = *MEMORY[0x1E0C80C00];
  rect = a2->size;
  v49.origin = a2->origin;
  v8 = vaddq_f64((float64x2_t)rect, (float64x2_t)a2->origin);
  *(CGFloat *)&v9 = a2->origin.x;
  *((_QWORD *)&v9 + 1) = *(_QWORD *)&v8.f64[1];
  v51 = v9;
  v52 = v8;
  v8.f64[1] = v49.origin.y;
  v49.size = (CGSize)v49.origin;
  v50 = v8;
  v43 = a6;
  if ((NU::Quad2d::equivalentWithTolerance((float64x2_t *)this, (float64x2_t *)&v49.size, a6.f64[0]) & 1) != 0)
  {
    origin.f64[0] = v49.origin.x;
  }
  else
  {
    v12 = 0;
    v13 = *((_OWORD *)this + 1);
    v54[0] = *(_OWORD *)this;
    v54[1] = v13;
    v15 = *((_OWORD *)this + 2);
    v14 = *((_OWORD *)this + 3);
    v54[3] = v13;
    v54[4] = v14;
    v54[6] = v14;
    v54[7] = v15;
    v54[9] = v15;
    v54[10] = v54[0];
    origin = (float64x2_t)v49.origin;
    while (v12 != 100)
    {
      ++v12;
      v16 = origin.f64[1];
      v56.origin = (CGPoint)origin;
      v56.size = rect;
      v49.origin = (CGPoint)origin;
      MinX = CGRectGetMinX(v56);
      v57.size.width = rect.width;
      v57.origin.x = v49.origin.x;
      v57.origin.y = v16;
      v57.size.height = rect.height;
      MinY = CGRectGetMinY(v57);
      *(CGFloat *)&v18 = MinX;
      width = rect.width;
      *((CGFloat *)&v18 + 1) = MinY;
      v53[0] = v18;
      x = v49.origin.x;
      *(CGFloat *)&v18 = v16;
      height = rect.height;
      MaxX = CGRectGetMaxX(*(CGRect *)((char *)&v18 - 8));
      v58.size.width = rect.width;
      v58.origin.x = v49.origin.x;
      v58.origin.y = v16;
      v58.size.height = rect.height;
      v22 = CGRectGetMinY(v58);
      *(CGFloat *)&v23 = MaxX;
      v24 = rect.width;
      *((CGFloat *)&v23 + 1) = v22;
      v53[1] = v23;
      v25 = v49.origin.x;
      *(CGFloat *)&v23 = v16;
      v26 = rect.height;
      v46 = CGRectGetMinX(*(CGRect *)((char *)&v23 - 8));
      v59.size.width = rect.width;
      v59.origin.x = v49.origin.x;
      v59.origin.y = v16;
      v59.size.height = rect.height;
      MaxY = CGRectGetMaxY(v59);
      *(CGFloat *)&v28 = v46;
      v29 = rect.width;
      *((CGFloat *)&v28 + 1) = MaxY;
      v53[2] = v28;
      v30 = v49.origin.x;
      *(CGFloat *)&v28 = v16;
      v31 = rect.height;
      v47 = CGRectGetMaxX(*(CGRect *)((char *)&v28 - 8));
      v60.size.width = rect.width;
      v60.origin.x = v49.origin.x;
      v60.origin.y = v16;
      v60.size.height = rect.height;
      v32 = CGRectGetMaxY(v60);
      *(CGFloat *)&v34 = v47;
      origin = (float64x2_t)v49.origin;
      v35 = 0;
      *((CGFloat *)&v34 + 1) = v32;
      v53[3] = v34;
      v36 = 1;
      do
      {
        v37 = 0;
        v38 = (float64x2_t *)&v54[3 * v35];
        v39 = (int64x2_t)vsubq_f64(v38[1], *v38);
        v33.f64[0] = -*(double *)&v39.i64[1];
        v40 = (float64x2_t)vzip1q_s64((int64x2_t)v33, v39);
        v41 = vmulq_n_f64(v40, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v40, v40))));
        do
        {
          v33 = vmulq_f64(v41, vsubq_f64((float64x2_t)v53[v37], *v38));
          v42 = vaddq_f64(v33, (float64x2_t)vdupq_laneq_s64((int64x2_t)v33, 1));
          v33.f64[0] = vaddvq_f64(v33);
          origin = (float64x2_t)vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_f64(v43, v42).i64[0], 0), (int8x16_t)vsubq_f64(origin, vmulq_n_f64(v41, v33.f64[0] * 0.4 - v43.f64[0])), (int8x16_t)origin);
          v36 &= v33.f64[0] >= v43.f64[0];
          ++v37;
        }
        while (v37 != 4);
        ++v35;
      }
      while (v35 != 4);
      if ((v36 & 1) != 0)
      {
        if (v12 == 100)
          origin = (float64x2_t)a2->origin;
        return origin.f64[0];
      }
    }
  }
  return origin.f64[0];
}

void NU::PathRectFinder::~PathRectFinder(NU::PathRectFinder *this)
{
  JUMPOUT(0x1A85C0F94);
}

CGFloat NU::PathRectFinder::constructNextRect(NU::PathRectFinder *this, const CGRect *a2, const CGRect *a3)
{
  return (a2->origin.x + a3->origin.x) * 0.5;
}

BOOL NU::PathRectFinder::converged(NU::PathRectFinder *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->origin.x, a3->origin.x) < a4 && vabdd_f64(a2->origin.y, a3->origin.y) < a4;
}

void NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchor(float64x2_t *a1, float64x2_t *a2, uint64_t a3, uint64_t a4)
{
  float64x2_t v8;
  float64x2_t v9;
  double v10;
  double v11;
  float64_t v12;
  float64_t v13;
  float64_t v14;
  float64_t v15;
  double v16;
  float64_t v17;
  float64_t v18;
  float64_t v19;
  double v20;
  double v21;
  double v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  void (**v30)(NU::AnchorRectFinderHorizontal *__hidden);
  float64x2_t v31;
  float64x2_t v32[2];
  void (**v33)(NU::AnchorRectFinderVertical *__hidden);
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  double v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;

  v26 = *(float64x2_t *)a4;
  v27 = *(float64x2_t *)(a4 + 16);
  v8 = vaddq_f64(v27, *(float64x2_t *)a4);
  v9.f64[0] = v8.f64[0];
  v9.f64[1] = *(float64_t *)(a4 + 8);
  v42 = v26;
  v43 = v9;
  v24 = v9;
  v25 = v8;
  v9.f64[0] = v26.f64[0];
  v9.f64[1] = v8.f64[1];
  v23 = v9;
  v44 = v9;
  v45 = v8;
  if ((NU::Quad2d::equivalentWithTolerance(a1, &v42, 0.000000953674316) & 1) == 0)
  {
    v38 = v26;
    v39 = v24;
    v40 = v23;
    v41 = v25;
    if ((NU::Quad2d::simpleContains(a1, &v38) & 1) == 0)
    {
      v37 = v27.f64[0] / v27.f64[1];
      NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor(a1, a2->f64, a3, a4, (uint64_t *)&v37, 0.000000953674316);
      v11 = v10;
      v42.f64[0] = v12;
      v42.f64[1] = v13;
      v43.f64[0] = v10;
      v43.f64[1] = v14;
      NU::RectT<double>::RectT(v38.f64, (CGRect *)a4);
      v28 = *a2;
      v38 = vsubq_f64(v38, *a2);
      NU::RectT<double>::scale(v38.f64, v11 / v39.f64[0], 1.0);
      v38 = vaddq_f64(v28, v38);
      v35 = v38;
      v36 = v39;
      v33 = &off_1E505F5C0;
      v34 = *a2;
      v15 = NU::Quad2d::computeLimitRect(a1, (uint64_t)&v42, (uint64_t)&v35, (uint64_t)&v33, 0.000000953674316);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      NU::RectT<double>::RectT(v32[0].f64, (CGRect *)a4);
      v42.f64[0] = v15;
      v42.f64[1] = v17;
      v43.f64[0] = v19;
      v43.f64[1] = v21;
      v22 = v21 / *(double *)(a4 + 24);
      v29 = *a2;
      v32[0] = vsubq_f64(v32[0], *a2);
      NU::RectT<double>::scale(v32[0].f64, 1.0, v22);
      v32[0] = vaddq_f64(v29, v32[0]);
      v35 = v32[0];
      v36 = v32[1];
      v30 = &off_1E505F5F0;
      v31 = *a2;
      NU::Quad2d::computeLimitRect(a1, (uint64_t)&v42, (uint64_t)&v35, (uint64_t)&v30, 0.000000953674316);
    }
  }
}

void NU::AnchorRectFinderHorizontal::~AnchorRectFinderHorizontal(NU::AnchorRectFinderHorizontal *this)
{
  JUMPOUT(0x1A85C0F94);
}

double NU::AnchorRectFinderHorizontal::constructNextRect(NU::AnchorRectFinderHorizontal *this, const CGRect *a2, const CGRect *a3)
{
  CGFloat v4;
  double result;
  CGRect v6;
  CGRect v7;

  v6 = *a2;
  v4 = (a3->size.width + (v6.size.width - a3->size.width) * 0.5) / v6.size.width;
  v7 = CGRectOffset(*a2, -*((double *)this + 2), -*((double *)this + 3));
  v7.size.width = v4 * v7.size.width;
  v7.origin.x = v4 * v7.origin.x;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v7, *((CGFloat *)this + 2), *((CGFloat *)this + 3));
  return result;
}

BOOL NU::AnchorRectFinderHorizontal::converged(NU::AnchorRectFinderHorizontal *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->size.width, a3->size.width) < a4;
}

void NU::AnchorRectFinderVertical::~AnchorRectFinderVertical(NU::AnchorRectFinderVertical *this)
{
  JUMPOUT(0x1A85C0F94);
}

double NU::AnchorRectFinderVertical::constructNextRect(NU::AnchorRectFinderVertical *this, const CGRect *a2, const CGRect *a3)
{
  CGFloat v4;
  double result;
  CGRect v6;
  CGRect v7;

  v6 = *a2;
  v4 = (a3->size.height + (v6.size.height - a3->size.height) * 0.5) / v6.size.height;
  v7 = CGRectOffset(*a2, -*((double *)this + 2), -*((double *)this + 3));
  v7.size.height = v4 * v7.size.height;
  v7.origin.y = v4 * v7.origin.y;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v7, *((CGFloat *)this + 2), *((CGFloat *)this + 3));
  return result;
}

BOOL NU::AnchorRectFinderVertical::converged(NU::AnchorRectFinderVertical *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->size.height, a3->size.height) < a4;
}

double _bestIntegralRectPreservingAspectRatioAndAnchor(CGRect a1, CGPoint a2)
{
  double v2;
  double v3;

  v2 = nearbyint(a1.size.width * nearbyint(a1.size.height) / a1.size.height);
  v3 = nearbyint(a1.size.width);
  if (a1.size.width > a1.size.height)
    v2 = v3;
  return nearbyint(a1.origin.x + a2.x * (a1.size.width - v2));
}

void sub_1A660807C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL CGRectEqualToRectWithTol(CGRect a1, CGRect a2, double a3)
{
  return vabdd_f64(a1.origin.x, a2.origin.x) < a3
      && vabdd_f64(a1.origin.y, a2.origin.y) < a3
      && vabdd_f64(a1.size.width, a2.size.width) < a3
      && vabdd_f64(a1.size.height, a2.size.height) < a3;
}

__n128 makeTranslationMatrix@<Q0>(__n128 result@<Q0>, double a2@<D1>, double a3@<D2>, uint64_t a4@<X8>)
{
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = (_OWORD *)MEMORY[0x1E0C83FD8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 80);
  *(_OWORD *)(a4 + 64) = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 64);
  *(_OWORD *)(a4 + 80) = v5;
  v6 = v4[1];
  *(_OWORD *)a4 = *v4;
  *(_OWORD *)(a4 + 16) = v6;
  v7 = v4[3];
  *(_OWORD *)(a4 + 32) = v4[2];
  *(_OWORD *)(a4 + 48) = v7;
  v8 = v4[7];
  result.n128_f64[1] = a2;
  *(__n128 *)(a4 + 96) = result;
  *(_OWORD *)(a4 + 112) = v8;
  *(double *)(a4 + 112) = a3;
  return result;
}

double convertTo2D(const simd_double4x4 *a1)
{
  uint64_t i;
  __int128 v3;

  for (i = 0; i != 4; ++i)
    *(&v3 + i) = (__int128)vdivq_f64(*(float64x2_t *)a1->columns[i].f64, (float64x2_t)vdupq_laneq_s64(*(int64x2_t *)&a1->columns[i].f64[2], 1));
  return *(double *)&v3;
}

void sub_1A66089EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _Unwind_Exception *exception_object, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1A660A3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A660A7FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A660B03C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A660B1E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A660BA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A660BBE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A660C254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A660C984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A660CB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A660CEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A660D7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1A660DFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A660E6E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A660E894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A660E9C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A660EA94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A660EC4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t *nu::fill_rect<NUPixelRect>(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned __int8 *a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v96;
  uint64_t v97;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v118;
  uint64_t v119;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v140;
  uint64_t v141;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  int v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v164;
  uint64_t v165;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  __int128 v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  unint64_t v182;

  switch(a6)
  {
    case 1:
      v8 = result[2];
      v7 = result[3];
      v9 = v8 < 1 || v7 < 1;
      if (!v9)
      {
        v11 = a4[2];
        v10 = a4[3];
        if (v11 >= 1 && v10 >= 1)
        {
          v13 = *result;
          if (*result <= *a4)
            v14 = *a4;
          else
            v14 = *result;
          v15 = v13 + v8;
          v16 = *a4 + v11;
          if (v15 >= v16)
            v15 = v16;
          v17 = v15 - v14;
          if (v15 > v14)
          {
            v18 = result[1];
            v19 = a4[1];
            if (v18 <= v19)
              v20 = a4[1];
            else
              v20 = result[1];
            v21 = v18 + v7;
            v22 = v19 + v10;
            if (v21 >= v22)
              v21 = v22;
            if (v21 > v20 && v17 >= 1 && v21 - v20 >= 1)
            {
              v23 = *a5;
              v24 = (char *)(a2 + (v20 - v18) * a3 + v14 - v13);
              v25 = v20 - v21;
              do
              {
                result = (uint64_t *)memset(v24, v23, v17);
                v24 += a3;
              }
              while (!__CFADD__(v25++, 1));
            }
          }
        }
      }
      break;
    case 2:
      v28 = result[2];
      v27 = result[3];
      if (v28 >= 1 && v27 >= 1)
      {
        v31 = a4[2];
        v30 = a4[3];
        if (v31 >= 1 && v30 >= 1)
        {
          v33 = *result;
          if (*result <= *a4)
            v34 = *a4;
          else
            v34 = *result;
          v35 = v33 + v28;
          v36 = *a4 + v31;
          if (v35 >= v36)
            v35 = v36;
          v9 = v35 <= v34;
          v37 = v35 - v34;
          if (!v9)
          {
            v38 = result[1];
            v39 = a4[1];
            if (v38 <= v39)
              v40 = a4[1];
            else
              v40 = result[1];
            v41 = v38 + v27;
            v42 = v39 + v30;
            if (v41 >= v42)
              v41 = v42;
            v9 = v41 <= v40;
            v43 = v41 - v40;
            if (!v9 && v37 >= 1 && v43 >= 1)
            {
              v44 = *(_WORD *)a5;
              v45 = a2 + (v40 - v38) * a3 + 2 * (v34 - v33);
              v46 = v37 + 1;
              do
              {
                v47 = 0;
                v48 = v46;
                do
                {
                  *(_WORD *)(v45 + v47) = v44;
                  v47 += 2;
                  --v48;
                }
                while (v48 > 1);
                v45 += a3;
                --v43;
              }
              while (v43);
            }
          }
        }
      }
      break;
    case 3:
      v50 = result[2];
      v49 = result[3];
      if (v50 >= 1 && v49 >= 1)
      {
        v53 = a4[2];
        v52 = a4[3];
        if (v53 >= 1 && v52 >= 1)
        {
          v55 = *result;
          if (*result <= *a4)
            v56 = *a4;
          else
            v56 = *result;
          v57 = v55 + v50;
          v58 = *a4 + v53;
          if (v57 >= v58)
            v57 = v58;
          v9 = v57 <= v56;
          v59 = v57 - v56;
          if (!v9)
          {
            v60 = result[1];
            v61 = a4[1];
            if (v60 <= v61)
              v62 = a4[1];
            else
              v62 = result[1];
            v63 = v60 + v49;
            v64 = v61 + v52;
            if (v63 >= v64)
              v63 = v64;
            v9 = v63 <= v62;
            v65 = v63 - v62;
            if (!v9 && v59 >= 1 && v65 >= 1)
            {
              v66 = *(unsigned __int16 *)a5 | (a5[2] << 16);
              v67 = a2 + (v62 - v60) * a3 + 3 * (v56 - v55);
              do
              {
                v68 = 0;
                v69 = 3 * v59 / 3uLL + 1;
                do
                {
                  v70 = v67 + v68;
                  *(_BYTE *)(v70 + 2) = BYTE2(v66);
                  *(_WORD *)v70 = v66;
                  v68 += 3;
                  --v69;
                }
                while (v69 > 1);
                v67 += a3;
                --v65;
              }
              while (v65);
            }
          }
        }
      }
      break;
    case 4:
      v72 = result[2];
      v71 = result[3];
      if (v72 >= 1 && v71 >= 1)
      {
        v75 = a4[2];
        v74 = a4[3];
        if (v75 >= 1 && v74 >= 1)
        {
          v77 = *result;
          if (*result <= *a4)
            v78 = *a4;
          else
            v78 = *result;
          v79 = v77 + v72;
          v80 = *a4 + v75;
          if (v79 >= v80)
            v79 = v80;
          v9 = v79 <= v78;
          v81 = v79 - v78;
          if (!v9)
          {
            v82 = result[1];
            v83 = a4[1];
            if (v82 <= v83)
              v84 = a4[1];
            else
              v84 = result[1];
            v85 = v82 + v71;
            v86 = v83 + v74;
            if (v85 >= v86)
              v85 = v86;
            v9 = v85 <= v84;
            v87 = v85 - v84;
            if (!v9 && v81 >= 1 && v87 >= 1)
            {
              v88 = *(_DWORD *)a5;
              v89 = a2 + (v84 - v82) * a3 + 4 * (v78 - v77);
              v90 = (v81 & 0x3FFFFFFFFFFFFFFFLL) + 1;
              do
              {
                v91 = 0;
                v92 = v90;
                do
                {
                  *(_DWORD *)(v89 + v91) = v88;
                  v91 += 4;
                  --v92;
                }
                while (v92 > 1);
                v89 += a3;
                --v87;
              }
              while (v87);
            }
          }
        }
      }
      break;
    case 6:
      v94 = result[2];
      v93 = result[3];
      if (v94 >= 1 && v93 >= 1)
      {
        v97 = a4[2];
        v96 = a4[3];
        if (v97 >= 1 && v96 >= 1)
        {
          v99 = *result;
          if (*result <= *a4)
            v100 = *a4;
          else
            v100 = *result;
          v101 = v99 + v94;
          v102 = *a4 + v97;
          if (v101 >= v102)
            v101 = v102;
          v9 = v101 <= v100;
          v103 = v101 - v100;
          if (!v9)
          {
            v104 = result[1];
            v105 = a4[1];
            if (v104 <= v105)
              v106 = a4[1];
            else
              v106 = result[1];
            v107 = v104 + v93;
            v108 = v105 + v96;
            if (v107 >= v108)
              v107 = v108;
            v9 = v107 <= v106;
            v109 = v107 - v106;
            if (!v9 && v103 >= 1 && v109 >= 1)
            {
              v110 = *(unsigned int *)a5 | ((unint64_t)*((unsigned __int16 *)a5 + 2) << 32);
              v111 = a2 + (v106 - v104) * a3 + 6 * (v100 - v99);
              do
              {
                v112 = 0;
                v113 = 6 * v103 / 6uLL + 1;
                do
                {
                  v114 = v111 + v112;
                  *(_DWORD *)v114 = v110;
                  *(_WORD *)(v114 + 4) = WORD2(v110);
                  v112 += 6;
                  --v113;
                }
                while (v113 > 1);
                v111 += a3;
                --v109;
              }
              while (v109);
            }
          }
        }
      }
      break;
    case 8:
      v116 = result[2];
      v115 = result[3];
      if (v116 >= 1 && v115 >= 1)
      {
        v119 = a4[2];
        v118 = a4[3];
        if (v119 >= 1 && v118 >= 1)
        {
          v121 = *result;
          if (*result <= *a4)
            v122 = *a4;
          else
            v122 = *result;
          v123 = v121 + v116;
          v124 = *a4 + v119;
          if (v123 >= v124)
            v123 = v124;
          v9 = v123 <= v122;
          v125 = v123 - v122;
          if (!v9)
          {
            v126 = result[1];
            v127 = a4[1];
            if (v126 <= v127)
              v128 = a4[1];
            else
              v128 = result[1];
            v129 = v126 + v115;
            v130 = v127 + v118;
            if (v129 >= v130)
              v129 = v130;
            v9 = v129 <= v128;
            v131 = v129 - v128;
            if (!v9 && v125 >= 1 && v131 >= 1)
            {
              v132 = *(_QWORD *)a5;
              v133 = a2 + (v128 - v126) * a3 + 8 * (v122 - v121);
              v134 = (v125 & 0x1FFFFFFFFFFFFFFFLL) + 1;
              do
              {
                v135 = 0;
                v136 = v134;
                do
                {
                  *(_QWORD *)(v133 + v135) = v132;
                  v135 += 8;
                  --v136;
                }
                while (v136 > 1);
                v133 += a3;
                --v131;
              }
              while (v131);
            }
          }
        }
      }
      break;
    case 12:
      v138 = result[2];
      v137 = result[3];
      if (v138 >= 1 && v137 >= 1)
      {
        v141 = a4[2];
        v140 = a4[3];
        if (v141 >= 1 && v140 >= 1)
        {
          v143 = *result;
          if (*result <= *a4)
            v144 = *a4;
          else
            v144 = *result;
          v145 = v143 + v138;
          v146 = *a4 + v141;
          if (v145 >= v146)
            v145 = v146;
          v147 = v145 - v144;
          if (v145 > v144)
          {
            v148 = result[1];
            v149 = a4[1];
            if (v148 <= v149)
              v150 = a4[1];
            else
              v150 = result[1];
            v151 = v148 + v137;
            v152 = v149 + v140;
            if (v151 >= v152)
              v151 = v152;
            v9 = v151 <= v150;
            v153 = v151 - v150;
            if (!v9 && v147 >= 1 && v153 >= 1)
            {
              v154 = *(_QWORD *)a5;
              v155 = *((_DWORD *)a5 + 2);
              v156 = a2 + (v150 - v148) * a3 + 12 * (v144 - v143);
              v157 = 12 * v147 / 0xCuLL + 1;
              do
              {
                v158 = 0;
                v159 = v157;
                do
                {
                  v160 = v156 + v158;
                  *(_QWORD *)v160 = v154;
                  *(_DWORD *)(v160 + 8) = v155;
                  v158 += 12;
                  --v159;
                }
                while (v159 > 1);
                v156 += a3;
                --v153;
              }
              while (v153);
            }
          }
        }
      }
      break;
    case 16:
      v162 = result[2];
      v161 = result[3];
      if (v162 >= 1 && v161 >= 1)
      {
        v165 = a4[2];
        v164 = a4[3];
        if (v165 >= 1 && v164 >= 1)
        {
          v167 = *result;
          if (*result <= *a4)
            v168 = *a4;
          else
            v168 = *result;
          v169 = v167 + v162;
          v170 = *a4 + v165;
          if (v169 >= v170)
            v169 = v170;
          v9 = v169 <= v168;
          v171 = v169 - v168;
          if (!v9)
          {
            v172 = result[1];
            v173 = a4[1];
            if (v172 <= v173)
              v174 = a4[1];
            else
              v174 = result[1];
            v175 = v172 + v161;
            v176 = v173 + v164;
            if (v175 >= v176)
              v175 = v176;
            v9 = v175 <= v174;
            v177 = v175 - v174;
            if (!v9 && v171 >= 1 && v177 >= 1)
            {
              v178 = *(_OWORD *)a5;
              v179 = a2 + (v174 - v172) * a3 + 16 * (v168 - v167);
              v180 = (v171 & 0xFFFFFFFFFFFFFFFLL) + 1;
              do
              {
                v181 = 0;
                v182 = v180;
                do
                {
                  *(_OWORD *)(v179 + v181) = v178;
                  v181 += 16;
                  --v182;
                }
                while (v182 > 1);
                v179 += a3;
                --v177;
              }
              while (v177);
            }
          }
        }
      }
      break;
    default:
      return result;
  }
  return result;
}

void sub_1A660F4C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A660F6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A660F8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_1A660FA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A660FB60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A660FE14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A6610130(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A6610270(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6610544(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A6610698(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A6610744(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6610A18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A6610CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A6611128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66113E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66114D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66115B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A661189C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A6611F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A6612300(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A6612430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66126EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A66129E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A6612CE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A6612D98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6612E98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A6612F48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A6613284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A6613530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66139AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A6613AE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6613D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A6614028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A6614128(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6614420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A661458C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66146A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66147A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A6614864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A66148C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)NUPurgeableImageAccessGuard;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A66149EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6614B00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1A6614BEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id NUAssertLogger_10707()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10736);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_11022()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11045);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_11084()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11098);
  return (id)_NUAssertLogger;
}

void sub_1A6620F90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A66212C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A6621328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id NUAssertLogger_11337()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_11486()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11497);
  return (id)_NUAssertLogger;
}

void sub_1A6625238(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_11560()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11574);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__11583(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11584(uint64_t a1)
{

}

id NUAssertLogger_11707()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11725);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_11803()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11816);
  return (id)_NUAssertLogger;
}

void sub_1A662CD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

void sub_1A662DB90(_Unwind_Exception *exception_object, int a2)
{
  _QWORD *v2;
  id v3;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("AVAssetReaderVideoCompositionOutput: exception"), v3);
    *v2 = (id)objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x1A662D978);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A662E190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6631054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A66322E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11997(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11998(uint64_t a1)
{

}

id NUAssertLogger_12004()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
  return (id)_NUAssertLogger;
}

void sub_1A6632FF0()
{
  objc_end_catch();
  JUMPOUT(0x1A6632FF8);
}

id NUMediaCharacteristicForAuxiliaryImageType(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = a1 - 2;
  if ((unint64_t)(a1 - 2) <= 0xA && ((0x687u >> v1) & 1) != 0)
    v2 = **((id **)&unk_1E50622A0 + v1);
  else
    v2 = 0;
  return v2;
}

CFStringRef NUStringFromTimeRange(_OWORD *a1)
{
  const __CFAllocator *v1;
  __int128 v2;
  CMTimeRange v4;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = a1[1];
  *(_OWORD *)&v4.start.value = *a1;
  *(_OWORD *)&v4.start.epoch = v2;
  *(_OWORD *)&v4.duration.timescale = a1[2];
  return (id)CMTimeRangeCopyDescription(v1, &v4);
}

void NUCVImageBufferSetCleanRect(__CVBuffer *a1, uint64_t *a2)
{
  double Width;
  size_t Height;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  Width = (double)CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  v6 = (double)*a2 - (Width - (double)a2[2]) * 0.5;
  v7 = ((double)Height - (double)a2[3]) * 0.5 - (double)a2[1];
  v13[0] = *MEMORY[0x1E0CA8D60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v13[1] = *MEMORY[0x1E0CA8D40];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2[3]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v13[2] = *MEMORY[0x1E0CA8D48];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  v13[3] = *MEMORY[0x1E0CA8D58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CVBufferSetAttachment(a1, (CFStringRef)*MEMORY[0x1E0CA8D50], v12, kCVAttachmentMode_ShouldPropagate);
}

CFStringRef NUStringFromTime(CMTime *a1)
{
  const __CFAllocator *v1;
  CMTime v3;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = *a1;
  return (id)CMTimeCopyDescription(v1, &v3);
}

id NUStringFromTimeMapping(_OWORD *a1)
{
  __int128 v2;
  const __CFAllocator *v3;
  __CFString *v4;
  __int128 v5;
  __CFString *v6;
  void *v7;
  CMTimeRange range;

  v2 = a1[1];
  *(_OWORD *)&range.start.value = *a1;
  *(_OWORD *)&range.start.epoch = v2;
  *(_OWORD *)&range.duration.timescale = a1[2];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &range);
  v5 = a1[4];
  *(_OWORD *)&range.start.value = a1[3];
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = a1[5];
  v6 = (__CFString *)CMTimeRangeCopyDescription(v3, &range);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@ -> %@]"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id NUValueFromArrayAtTime(void *a1, CMTime *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v13;
  void *v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CMTime time1;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CMTime time2;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!objc_msgSend(v3, "count"))
  {
    NUAssertLogger_12004();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("array is empty"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time2.value) = 138543362;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time2, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time2.value) = 138543618;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v20;
        LOWORD(time2.flags) = 2114;
        *(_QWORD *)((char *)&time2.flags + 2) = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time2, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time2.value) = 138543362;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time2, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"id  _Nonnull NUValueFromArrayAtTime(NSArray *__strong _Nonnull, CMTime)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 2192, CFSTR("array is empty"), v25, v26, v27, v28, v29);
  }
  objc_msgSend(v3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    while (2)
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        if (v11)
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v9), "time");
        else
          memset(&time1, 0, sizeof(time1));
        time2 = *a2;
        if (CMTimeCompare(&time1, &time2) > 0)
        {
          v4 = v10;
          goto LABEL_15;
        }
        v4 = v11;

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_15:

  return v4;
}

id NUAssertLogger_12358()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12368);
  return (id)_NUAssertLogger;
}

void sub_1A66358E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6636D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id NUAssertLogger_12502()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__12548(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12549(uint64_t a1)
{

}

void sub_1A663D3E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A6640390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A66423D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6642530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_12944()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__13002(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13003(uint64_t a1)
{

}

id NUAssertLogger_13197()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13212);
  return (id)_NUAssertLogger;
}

void *nu_CVPixelBufferDataProviderGetBytePointer(__CVBuffer *a1)
{
  if (CVPixelBufferLockBaseAddress(a1, 1uLL))
    return 0;
  else
    return CVPixelBufferGetBaseAddress(a1);
}

__CVBuffer *nu_CVPixelBufferDataProviderReleaseBytePointer(__CVBuffer *result, uint64_t a2)
{
  if (a2)
    return (__CVBuffer *)CVPixelBufferUnlockBaseAddress(result, 1uLL);
  return result;
}

void _NUAuxiliaryImageCVPixelBufferReleaseBytesCallback(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

uint64_t getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_ptr;
  v6 = getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_ptr;
  if (!getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_block_invoke;
    v2[3] = &unk_1E5062458;
    v2[4] = &v3;
    __getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_block_invoke(v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A66458F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getkCGImageAuxiliaryDataInfoPixelBuffer()
{
  void *v0;
  void *v1;

  if (!getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCGImageAuxiliaryDataInfoPixelBuffer(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NUAuxiliaryImage.m"), 31, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void *__getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!ImageIOLibraryCore_frameworkLibrary_13300)
    ImageIOLibraryCore_frameworkLibrary_13300 = _sl_dlopen();
  v2 = (void *)ImageIOLibraryCore_frameworkLibrary_13300;
  if (!ImageIOLibraryCore_frameworkLibrary_13300)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ImageIOLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("NUAuxiliaryImage.m"), 30, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "kCGImageAuxiliaryDataInfoPixelBuffer");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

CFMutableDictionaryRef NUIORegistryEntryCopyProperties(io_registry_entry_t a1)
{
  kern_return_t v1;
  kern_return_t v2;
  NSObject *v3;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  kern_return_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  properties = 0;
  v1 = IORegistryEntryCreateCFProperties(a1, &properties, 0, 0);
  if (!v1)
    return properties;
  v2 = v1;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13362);
  v3 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v7 = v2;
    _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Failed to read IORegistry, error: %d", buf, 8u);
  }
  return (CFMutableDictionaryRef)0;
}

CFTypeRef NUIORegistryEntryGetProperty(io_registry_entry_t a1, const __CFString *a2)
{
  return (id)IORegistryEntryCreateCFProperty(a1, a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
}

id NUIORegistryEntryGetDataProperty(io_registry_entry_t a1, const __CFString *a2)
{
  void *CFProperty;
  id v3;

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = CFProperty;
  else
    v3 = 0;

  return v3;
}

id NUIORegistryEntryGetStringProperty(io_registry_entry_t a1, const __CFString *a2)
{
  void *CFProperty;
  id v3;
  void *v4;

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = CFProperty;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", objc_msgSend(objc_retainAutorelease(CFProperty), "bytes"), 30);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return v4;
}

id NUIORegistryEntryGetName(uint64_t a1)
{
  int v1;
  int v2;
  NSObject *v3;
  _DWORD v5[4];
  _OWORD v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, sizeof(v6));
  v1 = MEMORY[0x1A85C0D54](a1, v6);
  if (v1)
  {
    v2 = v1;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13362);
    v3 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Failed to read IORegistry, error: %d", (uint8_t *)v5, 8u);
    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 30);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id NUAssertLogger_13434()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13457);
  return (id)_NUAssertLogger;
}

void sub_1A6648850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_13590()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13601);
  return (id)_NUAssertLogger;
}

uint64_t NUPixelSizeFromCGSize(uint64_t a1, double a2, double a3)
{
  uint64_t v5;

  v5 = NUPixelRoundValue(a1, a2);
  NUPixelRoundValue(a1, a3);
  return v5;
}

uint64_t NUPixelRoundValue(uint64_t result, double a2)
{
  NSObject *v2;
  void *v3;
  void *specific;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  switch(result)
  {
    case 0:
      result = vcvtpd_s64_f64(a2);
      break;
    case 1:
      result = vcvtmd_s64_f64(a2);
      break;
    case 2:
      result = llround(a2);
      break;
    case 3:
      result = (uint64_t)a2;
      break;
    case 4:
      NUAssertLogger();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported rounding policy: OutEven"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v3;
        _os_log_error_impl(&dword_1A6553000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v6)
        {
          v9 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v18 = v9;
          v19 = 2114;
          v20 = v11;
          _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v8;
        _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"NSInteger NUPixelRoundValue(CGFloat, NUPixelRoundingPolicy)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometry.mm", 35, CFSTR("Unsupported rounding policy: OutEven"), v12, v13, v14, v15, v16);
    default:
      return result;
  }
  return result;
}

void sub_1A664A504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

double NUPixelSizeToCGSize(uint64_t a1)
{
  return (double)a1;
}

double NUPixelSizeToCGRect()
{
  return *MEMORY[0x1E0C9D538];
}

BOOL NUPixelSizeEqualToSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL NUPixelSizeIsEmpty(uint64_t a1, uint64_t a2)
{
  return !a1 || a2 == 0;
}

uint64_t NUPixelSizeLargestDimension(uint64_t result, uint64_t a2)
{
  if (result <= a2)
    return a2;
  return result;
}

BOOL NUPixelSizeGreaterThanSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 >= a3 && a2 >= a4;
}

uint64_t NUPixelSizeAlignToGrid(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;

  v8 = NUPixelRoundValue(a5, (double)a1 / (double)a3) * a3;
  NUPixelRoundValue(a5, (double)a2 / (double)a4);
  return v8;
}

uint64_t NUPixelPointFromCGPoint(uint64_t a1, double a2, double a3)
{
  uint64_t v5;

  v5 = NUPixelRoundValue(a1, a2);
  NUPixelRoundValue(a1, a3);
  return v5;
}

double NUPixelPointToCGPoint(uint64_t a1)
{
  return (double)a1;
}

BOOL NUPixelPointEqualToPoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

double NUPixelRectContainingPoints@<D0>(float64x2_t *a1@<X0>, int a2@<W1>, _OWORD *a3@<X8>)
{
  float64x2_t v4;
  uint64_t v5;
  float64x2_t *v6;
  CGPoint v7;
  float64x2_t v8;
  double result;
  __int128 v10;
  _OWORD v11[2];
  CGRect v12;

  v4 = *a1;
  if (a2 < 2)
  {
    v7 = (CGPoint)*a1;
  }
  else
  {
    v5 = a2 - 1;
    v6 = a1 + 1;
    v7 = (CGPoint)*a1;
    do
    {
      v8 = *v6++;
      v4 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v4), (int8x16_t)v8, (int8x16_t)v4);
      v7 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v8, (float64x2_t)v7), (int8x16_t)v7, (int8x16_t)v8);
      --v5;
    }
    while (v5);
  }
  v12.origin = v7;
  v12.size = (CGSize)vsubq_f64(v4, (float64x2_t)v7);
  NU::RectT<long>::RectT(v11, &v12, 0);
  result = *(double *)v11;
  v10 = v11[1];
  *a3 = v11[0];
  a3[1] = v10;
  return result;
}

_QWORD *NU::RectT<long>::RectT(_QWORD *a1, CGRect *a2, uint64_t a3)
{
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;

  MinX = CGRectGetMinX(*a2);
  MinY = CGRectGetMinY(*a2);
  MaxX = CGRectGetMaxX(*a2);
  MaxY = CGRectGetMaxY(*a2);
  NU::RectT<long>::setXYMinMax(a1, a3, MinX, MinY, MaxX, MaxY);
  return a1;
}

_QWORD *NU::RectT<long>::setXYMinMax(_QWORD *result, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t)result;
  switch(a2)
  {
    case 0:
      NU::RectT<long>::setXMinMax(result, vcvtmd_s64_f64(a3 + 0.000001), vcvtpd_s64_f64(a5 + -0.000001));
      v9 = vcvtmd_s64_f64(a4 + 0.000001);
      v10 = vcvtpd_s64_f64(a6 + -0.000001);
      return (_QWORD *)NU::RectT<long>::setYMinMax(v8, v9, v10);
    case 1:
      v15 = vcvtpd_s64_f64(a3 + -0.000001);
      if (a5 - a3 >= 1.000002)
      {
        result = NU::RectT<long>::setXMinMax(result, v15, vcvtmd_s64_f64(a5 + 0.000001));
      }
      else
      {
        *result = v15;
        result[2] = 0;
      }
      v9 = vcvtpd_s64_f64(a4 + -0.000001);
      if (a6 - a4 >= 1.000002)
      {
        v10 = vcvtmd_s64_f64(a6 + 0.000001);
        return (_QWORD *)NU::RectT<long>::setYMinMax(v8, v9, v10);
      }
      else
      {
        *(_QWORD *)(v8 + 8) = v9;
        *(_QWORD *)(v8 + 24) = 0;
      }
      return result;
    case 2:
      NU::RectT<long>::setXMinMax(result, (uint64_t)nearbyint(a3), (uint64_t)nearbyint(a5));
      v9 = (uint64_t)nearbyint(a4);
      v10 = (uint64_t)nearbyint(a6);
      return (_QWORD *)NU::RectT<long>::setYMinMax(v8, v9, v10);
    case 3:
      NU::RectT<long>::setXMinMax(result, (uint64_t)a3, (uint64_t)a5);
      v9 = (uint64_t)a4;
      v10 = (uint64_t)a6;
      return (_QWORD *)NU::RectT<long>::setYMinMax(v8, v9, v10);
    case 4:
      v11 = floor(a3 + 0.000001);
      v12 = floor(a4 + 0.000001);
      v13 = ceil(a5 + -0.000001);
      v14 = ceil(a6 + -0.000001);
      if (((unint64_t)(v13 - v11) & 1) != 0)
      {
        if (a3 - v11 <= v13 - a5)
          v13 = v13 + -1.0;
        else
          v11 = v11 + 1.0;
      }
      if (((unint64_t)(v14 - v12) & 1) != 0)
      {
        if (a4 - v12 <= v14 - a6)
          v14 = v14 + -1.0;
        else
          v12 = v12 + 1.0;
      }
      NU::RectT<long>::setXMinMax(result, (uint64_t)v11, (uint64_t)v13);
      v9 = (uint64_t)v12;
      v10 = (uint64_t)v14;
      return (_QWORD *)NU::RectT<long>::setYMinMax(v8, v9, v10);
    default:
      NUAssertLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rounding mode not supported"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v17;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v20)
        {
          v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v23;
          v33 = 2114;
          v34 = v25;
          _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v22;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setXYMinMax(CGFloat, CGFloat, CGFloat, CGFloat, NUPixelRoundingPolicy) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 122, CFSTR("Rounding mode not supported"), v26, v27, v28, v29, v30);
  }
}

void sub_1A664AC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

_QWORD *NU::RectT<long>::setXMinMax(_QWORD *result, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 < a2)
  {
    NUAssertLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set min > max"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v10;
        v20 = 2114;
        v21 = v12;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setXMinMax(T, T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 129, CFSTR("Cannot set min > max"), v13, v14, v15, v16, v17);
  }
  result[2] = a3 - a2;
  *result = a2;
  return result;
}

void sub_1A664AEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t NU::RectT<long>::setYMinMax(uint64_t result, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 < a2)
  {
    NUAssertLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set min > max"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v10;
        v20 = 2114;
        v21 = v12;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setYMinMax(T, T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 136, CFSTR("Cannot set min > max"), v13, v14, v15, v16, v17);
  }
  *(_QWORD *)(result + 24) = a3 - a2;
  *(_QWORD *)(result + 8) = a2;
  return result;
}

void sub_1A664B144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

double NUPixelRectFromCGRect@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  double result;
  __int128 v8;
  _OWORD v9[2];
  CGRect v10;

  v10.origin.x = a3;
  v10.origin.y = a4;
  v10.size.width = a5;
  v10.size.height = a6;
  NU::RectT<long>::RectT(v9, &v10, a1);
  result = *(double *)v9;
  v8 = v9[1];
  *a2 = v9[0];
  a2[1] = v8;
  return result;
}

uint64_t NUMaxX(_QWORD *a1)
{
  return a1[2] + *a1;
}

uint64_t NUMaxY(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24) + *(_QWORD *)(a1 + 8);
}

uint64_t NUMinX(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t NUMinY(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t NUWidth(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t NUHeight(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

double NUPixelRectIntersection@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  __int128 v4;
  __int128 v5;
  double result;
  __int128 v7;
  _OWORD v8[2];
  _OWORD v9[2];
  _OWORD v10[2];

  v4 = a1[1];
  v10[0] = *a1;
  v10[1] = v4;
  v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  NU::RectT<long>::Intersection((uint64_t)v8, (uint64_t *)v10, (uint64_t *)v9);
  result = *(double *)v8;
  v7 = v8[1];
  *a3 = v8[0];
  a3[1] = v7;
  return result;
}

double NU::RectT<long>::Intersection(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double result;

  v4 = a2[2];
  if (v4
    && (v6 = a2[3]) != 0
    && ((v9 = a3[2], v8 = a3[3], v9) ? (v10 = v8 == 0) : (v10 = 1),
        !v10 && (NU::RectT<long>::intersects(a2, a3) & 1) != 0))
  {
    v11 = a2[1];
    v12 = a3[1];
    if (*a2 <= *a3)
      v13 = *a3;
    else
      v13 = *a2;
    if (v9 + *a3 >= v4 + *a2)
      v14 = v4 + *a2;
    else
      v14 = v9 + *a3;
    if (v11 <= v12)
      v15 = a3[1];
    else
      v15 = a2[1];
    if (v8 + v12 >= v6 + v11)
      v16 = v6 + v11;
    else
      v16 = v8 + v12;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    NU::RectT<long>::setXMinMax((_QWORD *)a1, v13, v14);
    NU::RectT<long>::setYMinMax(a1, v15, v16);
  }
  else
  {
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t NU::RectT<long>::intersects(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v3 = *a2;
  if (*a1 >= *a2)
  {
    if (*a1 > *a2 && a2[2] + v3 <= v2)
      return 0;
LABEL_6:
    v4 = a1[1];
    v5 = a2[1];
    if (v4 >= v5)
    {
      if (v4 > v5 && a2[3] + v5 <= v4)
        return 0;
    }
    else if (a1[3] + v4 <= v5)
    {
      return 0;
    }
    return 1;
  }
  if (a1[2] + v2 > v3)
    goto LABEL_6;
  return 0;
}

double NUPixelRectUnion@<D0>(__int128 *a1@<X0>, _OWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  __int128 v4;
  __int128 v5;
  double result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];

  v4 = a2[1];
  v10[0] = *a2;
  v10[1] = v4;
  v5 = a1[1];
  v8 = *a1;
  v9 = v5;
  NU::RectT<long>::add((uint64_t *)&v8, (uint64_t *)v10);
  result = *(double *)&v8;
  v7 = v9;
  *a3 = v8;
  a3[1] = v7;
  return result;
}

__n128 NU::RectT<long>::add(uint64_t *a1, uint64_t *a2)
{
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 result;

  if (a1[2] && a1[3])
  {
    if (a2[2])
      v4 = a2[3] == 0;
    else
      v4 = 1;
    if (!v4)
    {
      if (*a2 >= *a1)
        v5 = *a1;
      else
        v5 = *a2;
      NU::RectT<long>::setXMin(a1, v5);
      v6 = a2[2];
      if (a1[2] + *a1 <= v6 + *a2)
        v7 = v6 + *a2;
      else
        v7 = a1[2] + *a1;
      NU::RectT<long>::setXMax(a1, v7);
      if (a2[1] >= a1[1])
        v8 = a1[1];
      else
        v8 = a2[1];
      NU::RectT<long>::setYMin(a1, v8);
      v9 = a2[3];
      if (a1[3] + a1[1] <= v9 + a2[1])
        v10 = v9 + a2[1];
      else
        v10 = a1[3] + a1[1];
      NU::RectT<long>::setYMax(a1, v10);
    }
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    result = *((__n128 *)a2 + 1);
    *((__n128 *)a1 + 1) = result;
  }
  return result;
}

uint64_t *NU::RectT<long>::setXMin(uint64_t *result, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v2 = result;
  v24 = *MEMORY[0x1E0C80C00];
  v3 = result[2] + *result;
  v4 = v3 < a2;
  v5 = v3 - a2;
  if (v4)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set min > max: { %ld, %ld, %ld, %ld }"), *v2, v2[1], v2[2], v2[3]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v13;
        v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setXMin(T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 143, CFSTR("Cannot set min > max: { %ld, %ld, %ld, %ld }"), v16, v17, v18, v19, *v2);
  }
  result[2] = v5;
  *result = a2;
  return result;
}

void sub_1A664B730(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t *NU::RectT<long>::setXMax(uint64_t *result, uint64_t a2)
{
  uint64_t *v2;
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v2 = result;
  v21 = *MEMORY[0x1E0C80C00];
  if (a2 < *result)
  {
    NUAssertLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set max < min: { %ld, %ld, %ld, %ld }"), *v2, v2[1], v2[2], v2[3]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v10;
        v19 = 2114;
        v20 = v12;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setXMax(T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 155, CFSTR("Cannot set max < min: { %ld, %ld, %ld, %ld }"), v13, v14, v15, v16, *v2);
  }
  result[2] = a2 - *result;
  return result;
}

void sub_1A664B9C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t *NU::RectT<long>::setYMin(uint64_t *result, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v2 = result;
  v24 = *MEMORY[0x1E0C80C00];
  v3 = result[3] + result[1];
  v4 = v3 < a2;
  v5 = v3 - a2;
  if (v4)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set min > max: { %ld, %ld, %ld, %ld }"), *v2, v2[1], v2[2], v2[3]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v13;
        v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setYMin(T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 149, CFSTR("Cannot set min > max: { %ld, %ld, %ld, %ld }"), v16, v17, v18, v19, *v2);
  }
  result[3] = v5;
  result[1] = a2;
  return result;
}

void sub_1A664BC64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t *NU::RectT<long>::setYMax(uint64_t *result, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v2 = result;
  v24 = *MEMORY[0x1E0C80C00];
  v3 = result[1];
  v4 = __OFSUB__(a2, v3);
  v5 = a2 - v3;
  if (v5 < 0 != v4)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set max < min: { %ld, %ld, %ld, %ld }"), *v2, v2[1], v2[2], v2[3]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v13;
        v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setYMax(T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 160, CFSTR("Cannot set max < min: { %ld, %ld, %ld, %ld }"), v16, v17, v18, v19, *v2);
  }
  result[3] = v5;
  return result;
}

void sub_1A664BEF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

__n128 NUPixelRectConstrainToRect@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 result;
  __int128 v14;

  v3 = a1[2];
  v4 = a2[2];
  if (v3 <= v4)
  {
    v5 = a1[3];
    if (v5 <= a2[3])
    {
      v6 = *a2;
      if (*a1 >= *a2)
      {
        v7 = *a2;
        v6 = *a1;
      }
      else
      {
        *a1 = v6;
        v7 = *a2;
        v4 = a2[2];
      }
      v8 = v4 + v7;
      if (v6 + v3 > v8)
        *a1 = v8 - v3;
      v9 = a2[1];
      if (a1[1] >= v9)
      {
        v10 = a2[1];
        v9 = a1[1];
      }
      else
      {
        a1[1] = v9;
        v10 = a2[1];
      }
      v11 = v9 + v5;
      v12 = a2[3] + v10;
      if (v11 > v12)
        a1[1] = v12 - v5;
    }
  }
  result = *(__n128 *)a1;
  v14 = *((_OWORD *)a1 + 1);
  *a3 = *(_OWORD *)a1;
  a3[1] = v14;
  return result;
}

int64x2_t *NUPixelRectMaxCenteredInRect@<X0>(int64x2_t *result@<X0>, uint64_t a2@<X8>)
{
  int64x2_t v2;
  BOOL v3;
  uint64_t v4;
  int64x2_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = result[1];
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(*result, vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)), (int32x4_t)vceqzq_s64(v2))))) & 1) == 0|| (v2.i64[0] ? (v3 = v2.i64[1] == 0) : (v3 = 1), v3))
  {
    *(_OWORD *)a2 = NUPixelRectNull;
    *(_OWORD *)(a2 + 16) = unk_1A6719E60;
  }
  else
  {
    if (v2.i64[0] >= v2.i64[1])
      v4 = result[1].i64[1];
    else
      v4 = result[1].i64[0];
    v5 = result[1];
    *(int64x2_t *)a2 = *result;
    *(int64x2_t *)(a2 + 16) = v5;
    if (v2.i64[1] <= v2.i64[0])
    {
      v7 = v2.i64[0] - v4;
      if (v2.i64[0] < v4)
        ++v7;
      *(_QWORD *)a2 += v7 >> 1;
      *(_QWORD *)(a2 + 16) = v4;
    }
    else
    {
      v6 = v2.i64[1] - v4;
      if (v2.i64[1] < v4)
        ++v6;
      *(_QWORD *)(a2 + 8) += v6 >> 1;
      *(_QWORD *)(a2 + 24) = v4;
    }
  }
  return result;
}

BOOL NUPixelRectIsNull(_QWORD *a1)
{
  return *a1 == 0x7FFFFFFFFFFFFFFFLL && a1[1] == 0x7FFFFFFFFFFFFFFFLL && a1[2] == 0 && a1[3] == 0;
}

BOOL NUPixelRectIsEmpty(uint64_t a1)
{
  return !*(_QWORD *)(a1 + 16) || *(_QWORD *)(a1 + 24) == 0;
}

uint64_t NUPixelRectIntersectsRect(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[2];
  _OWORD v6[2];

  v2 = a1[1];
  v6[0] = *a1;
  v6[1] = v2;
  v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  return NU::RectT<long>::intersects((uint64_t *)v6, (uint64_t *)v5);
}

__n128 NUPixelRectOffset@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __n128 *a4@<X8>)
{
  unint64_t v4;
  __n128 result;

  v4 = a1->n128_u64[1] + a3;
  a4->n128_u64[0] = a1->n128_u64[0] + a2;
  a4->n128_u64[1] = v4;
  result = a1[1];
  a4[1] = result;
  return result;
}

__n128 NUPixelRectSetOrigin@<Q0>(__n128 *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, __n128 *a4@<X8>)
{
  __n128 result;

  a4->n128_u64[0] = a2;
  a4->n128_u64[1] = a3;
  result = a1[1];
  a4[1] = result;
  return result;
}

__n128 NUPixelRectFlipYOrigin@<Q0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = a2[3] + a2[1] - (*(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 24));
  result = *(__n128 *)a1;
  v5 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)a3 = *(_QWORD *)a1 - *a2;
  *(_QWORD *)(a3 + 8) = v3;
  *(_OWORD *)(a3 + 16) = v5;
  return result;
}

double NUPixelRectScale@<D0>(__int128 *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  __int128 v6;
  double result;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v6 = a1[1];
  v9 = *a1;
  v10 = v6;
  NU::RectT<long>::scale((uint64_t *)&v9, a2, a4, a5);
  result = *(double *)&v9;
  v8 = v10;
  *a3 = v9;
  a3[1] = v8;
  return result;
}

_QWORD *NU::RectT<long>::scale(uint64_t *a1, uint64_t a2, double a3, double a4)
{
  NSObject *v5;
  void *v6;
  void *specific;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0)
  {
    NUAssertLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Negative x-scale values not supported"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v6;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v19;
        v36 = 2114;
        v37 = v21;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::scale(CGFloat, CGFloat, NUPixelRoundingPolicy) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 289, CFSTR("Negative x-scale values not supported"), v22, v23, v24, v25, v33);
  }
  if (a4 < 0.0)
  {
    NUAssertLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Negative y-scale values not supported"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v26;
        v36 = 2114;
        v37 = v28;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::scale(CGFloat, CGFloat, NUPixelRoundingPolicy) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 290, CFSTR("Negative y-scale values not supported"), v29, v30, v31, v32, v33);
  }
  return NU::RectT<long>::setXYMinMax(a1, a2, (double)*a1 * a3, (double)a1[1] * a4, (double)*a1 * a3 + (double)a1[2] * a3, (double)a1[1] * a4 + (double)a1[3] * a4);
}

void sub_1A664C5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

double NUPixelRectScaleRational@<D0>(int64x2_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int64x2_t *a5@<X8>)
{
  int64x2_t v8;
  int64x2_t v9;
  uint64_t v11;
  uint64_t v12;
  double v13;
  int64x2_t v14;
  double result;
  int64x2_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = *a1;
  v9 = a1[1];
  v36 = *a1;
  v37 = v9;
  if (a2 < 1 || a3 <= 0)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13859);
    v17 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld"), a2, a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Invalid scale: %@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13859);
    v22 = (id)_NUAssertLogger;
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v26;
        v40 = 2114;
        v41 = v28;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld"), a2, a3);
    v29 = objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::scale(NUScale, NUPixelRoundingPolicy) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 302, CFSTR("Invalid scale: %@"), v30, v31, v32, v33, v29);
  }
  v11 = v8.i64[1];
  v12 = v8.i64[0];
  v34 = v9;
  v35 = v8;
  v13 = NUScaleToDouble(a2, a3);
  v14 = vaddq_s64(v34, v35);
  NU::RectT<long>::setXYMinMax(&v36, a4, v13 * (double)v12, v13 * (double)v11, v13 * (double)v14.i64[0], v13 * (double)v14.i64[1]);
  result = *(double *)v36.i64;
  v16 = v37;
  *a5 = v36;
  a5[1] = v16;
  return result;
}

void sub_1A664C980(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

double NUPixelRectInset@<D0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  __int128 v5;
  double result;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v5 = a1[1];
  v8 = *a1;
  v9 = v5;
  NU::RectT<long>::shrink((uint64_t *)&v8, a2, a3);
  result = *(double *)&v8;
  v7 = v9;
  *a4 = v8;
  a4[1] = v7;
  return result;
}

uint64_t *NU::RectT<long>::shrink(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  NU::RectT<long>::setXMin(a1, *a1 + a2);
  NU::RectT<long>::setYMin(a1, a1[1] + a3);
  NU::RectT<long>::setXMax(a1, *a1 - a2 + a1[2]);
  return NU::RectT<long>::setYMax(a1, a1[1] - a3 + a1[3]);
}

double NUPixelRectErode@<D0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  __int128 v5;
  double result;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v5 = a1[1];
  v8 = *a1;
  v9 = v5;
  NU::RectT<long>::shrink((uint64_t *)&v8, a2, a3);
  result = *(double *)&v8;
  v7 = v9;
  *a4 = v8;
  a4[1] = v7;
  return result;
}

double NUPixelRectDilate@<D0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  __int128 v5;
  double result;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v5 = a1[1];
  v8 = *a1;
  v9 = v5;
  NU::RectT<long>::grow((uint64_t *)&v8, a2, a3);
  result = *(double *)&v8;
  v7 = v9;
  *a4 = v8;
  a4[1] = v7;
  return result;
}

uint64_t *NU::RectT<long>::grow(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  NU::RectT<long>::setXMin(a1, *a1 - a2);
  NU::RectT<long>::setYMin(a1, a1[1] - a3);
  NU::RectT<long>::setXMax(a1, *a1 + a2 + a1[2]);
  return NU::RectT<long>::setYMax(a1, a1[1] + a3 + a1[3]);
}

BOOL NUPixelRectEqualToRect(_QWORD *a1, _QWORD *a2)
{
  return *a2 == *a1 && a2[1] == a1[1] && a2[2] == a1[2] && a2[3] == a1[3];
}

BOOL NUPixelPointInRect(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  v3 = a3[1];
  v4 = a3[2] + *a3;
  if (a1 >= *a3)
  {
    v6 = __OFSUB__(a1, v4);
    v5 = a1 - v4 < 0;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  if (v5 != v6)
  {
    v8 = __OFSUB__(a2, v3);
    v7 = a2 - v3 < 0;
  }
  else
  {
    v8 = 0;
    v7 = 1;
  }
  return v7 == v8 && a2 < a3[3] + v3;
}

double NUPixelRectToCGRect(uint64_t *a1)
{
  return (double)*a1;
}

uint64_t NUScaleToFitSizeInSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1 || !a2)
    return NUScaleUnknown;
  if (NUScaleCompare(a3, a1, a4, a2) >= 0)
    return a4;
  return a3;
}

uint64_t NUScaleToFillSizeInSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1 || !a2)
    return NUScaleUnknown;
  if (NUScaleCompare(a3, a1, a4, a2) <= 0)
    return a4;
  return a3;
}

uint64_t NUOrientationFromClockwiseRotation(uint64_t a1)
{
  uint64_t v1;

  if (a1 / -90 >= 0)
    v1 = -((a1 / -90) & 3);
  else
    v1 = (a1 / 90) & 3;
  return qword_1A671A070[v1 + 3];
}

uint64_t NUOrientationToClockwiseRotationAndFlips(uint64_t a1, char *a2)
{
  uint64_t result;
  char v3;

  switch(a1)
  {
    case 2:
      result = 0;
      v3 = 1;
      if (a2)
        goto LABEL_17;
      return result;
    case 3:
      v3 = 0;
      goto LABEL_8;
    case 4:
      v3 = 1;
LABEL_8:
      result = 180;
      if (!a2)
        return result;
      goto LABEL_17;
    case 5:
      v3 = 1;
      goto LABEL_16;
    case 6:
      v3 = 0;
      goto LABEL_13;
    case 7:
      v3 = 1;
LABEL_13:
      result = 90;
      if (!a2)
        return result;
      goto LABEL_17;
    case 8:
      v3 = 0;
LABEL_16:
      result = 270;
      if (a2)
        goto LABEL_17;
      return result;
    default:
      result = 0;
      v3 = 0;
      if (!a2)
        return result;
LABEL_17:
      *a2 = v3;
      return result;
  }
}

uint64_t NUOrientationInverse(uint64_t a1)
{
  uint64_t v1;

  v1 = 6;
  if (a1 != 8)
    v1 = a1;
  if (a1 == 6)
    return 8;
  else
    return v1;
}

uint64_t NUOrientationConcat(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a1 - 9) <= 0xFFFFFFFFFFFFFFF7)
  {
    NUAssertLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "orientation1 >= 1 && orientation1 <= 8");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v17;
        v33 = 2114;
        v34 = v19;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"NUOrientation NUOrientationConcat(NUOrientation, NUOrientation)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometry.mm", 444, CFSTR("Invalid parameter not satisfying: %s"), v20, v21, v22, v23, (uint64_t)"orientation1 >= 1 && orientation1 <= 8");
  }
  if ((unint64_t)(a2 - 9) <= 0xFFFFFFFFFFFFFFF7)
  {
    NUAssertLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "orientation2 >= 1 && orientation2 <= 8");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v24;
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"NUOrientation NUOrientationConcat(NUOrientation, NUOrientation)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometry.mm", 445, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"orientation2 >= 1 && orientation2 <= 8");
  }
  return NUOrientationConcat::m[8 * a1 - 9 + a2];
}

void sub_1A664D1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t NUOrientationTransformImageSize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = a2;
  if ((unint64_t)(a1 - 5) <= 3)
  {
    if ((a3 | a2) < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

    }
    return a3;
  }
  return v4;
}

void sub_1A664D32C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double NUOrientationTransformSize(uint64_t a1, double a2, double a3)
{
  if ((unint64_t)(a1 - 5) >= 4)
    return a2;
  return a3;
}

uint64_t NUOrientationTransformImageOrigin(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a1 - 5) >= 4)
    return a2;
  else
    return a3;
}

double NUOrientationTransformVector(uint64_t a1, double result, double a3)
{
  switch(a1)
  {
    case 2:
      result = -result;
      break;
    case 3:
      result = -result;
      break;
    case 5:
      result = -a3;
      break;
    case 6:
      result = a3;
      break;
    case 7:
      result = a3;
      break;
    case 8:
      result = -a3;
      break;
    default:
      return result;
  }
  return result;
}

double NUOrientationTransformImagePoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double result;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;

  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  NUOrientationMakeTransformWithSizeAndOrigin(a1, a2, a3, a4, a5, (uint64_t)&v10);
  *(_QWORD *)&result = vcvtq_s64_f64(vaddq_f64(v12, vmlaq_n_f64(vmulq_n_f64(v11, (double)a7), v10, (double)a6))).u64[0];
  return result;
}

CGAffineTransform *NUOrientationMakeTransformWithSizeAndOrigin@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  double v14;
  double v15;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  if ((unint64_t)(a1 - 5) >= 4)
    v10 = (double)a5;
  else
    v10 = (double)a4;
  if ((unint64_t)(a1 - 5) >= 4)
    v11 = (double)a4;
  else
    v11 = (double)a5;
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeTranslation(&v23, (double)-a4, (double)-a5);
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, v11, v10);
  v12 = xmmword_1A671A290;
  v13 = xmmword_1A671A410;
  v14 = 0.0;
  v15 = (double)a2;
  switch(a1)
  {
    case 2:
      break;
    case 3:
      v12 = xmmword_1A671A420;
      v15 = (double)a2;
      goto LABEL_11;
    case 4:
      v12 = xmmword_1A671A420;
      v13 = xmmword_1A671A2A0;
      v15 = 0.0;
LABEL_11:
      v14 = (double)a3;
      break;
    case 5:
      v12 = xmmword_1A671A410;
      v13 = xmmword_1A671A420;
      v15 = (double)a3;
      goto LABEL_14;
    case 6:
      v12 = xmmword_1A671A2A0;
      v13 = xmmword_1A671A420;
      v15 = 0.0;
LABEL_14:
      v14 = (double)a2;
      break;
    case 7:
      v12 = xmmword_1A671A2A0;
      v13 = xmmword_1A671A290;
      v15 = 0.0;
      break;
    case 8:
      v12 = xmmword_1A671A410;
      v13 = xmmword_1A671A290;
      v15 = (double)a3;
      break;
    default:
      v13 = xmmword_1A671A2A0;
      v15 = 0.0;
      v14 = 0.0;
      break;
  }
  t1 = v23;
  memset(&v21, 0, sizeof(v21));
  *(_OWORD *)&t2.a = v13;
  *(_OWORD *)&t2.c = v12;
  t2.tx = v15;
  t2.ty = v14;
  CGAffineTransformConcat(&v21, &t1, &t2);
  *(_OWORD *)(a6 + 16) = 0u;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)a6 = 0u;
  v18 = v21;
  v17 = v22;
  return CGAffineTransformConcat((CGAffineTransform *)a6, &v18, &v17);
}

double NUOrientationTransformPoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  double result;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;

  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  NUOrientationMakeTransformWithSizeAndOrigin(a1, a2, a3, a4, a5, (uint64_t)&v10);
  *(_QWORD *)&result = *(_OWORD *)&vaddq_f64(v12, vmlaq_n_f64(vmulq_n_f64(v11, a7), v10, a6));
  return result;
}

double NUOrientationTransformImageRect@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int128 *a4@<X3>, _OWORD *a5@<X8>)
{
  __int128 v6;
  double result;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v6 = a4[1];
  v9 = *a4;
  v10 = v6;
  NU::RectT<long>::applyOrientation((uint64_t *)&v9, a1, a2, a3);
  result = *(double *)&v9;
  v8 = v10;
  *a5 = v9;
  a5[1] = v8;
  return result;
}

uint64_t *NU::RectT<long>::applyOrientation(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *result;
  v4 = result[1];
  v7 = result[2];
  v6 = result[3];
  switch(a2)
  {
    case 2:
      v8 = a3 - (v5 + v7);
      goto LABEL_6;
    case 3:
      v8 = a3 - (v5 + v7);
      v4 = a4 - (v4 + v6);
      goto LABEL_6;
    case 4:
      v4 = a4 - (v4 + v6);
      goto LABEL_5;
    case 5:
      v8 = a4 - (v4 + v6);
      v4 = a3 - (v5 + v7);
      goto LABEL_12;
    case 6:
      v8 = result[1];
      v4 = a3 - (v5 + v7);
      goto LABEL_12;
    case 7:
      v8 = result[1];
      goto LABEL_11;
    case 8:
      v8 = a4 - (v4 + v6);
LABEL_11:
      v4 = *result;
LABEL_12:
      v9 = result[3];
      v6 = result[2];
      break;
    default:
LABEL_5:
      v8 = *result;
LABEL_6:
      v9 = result[2];
      break;
  }
  *result = v8;
  result[1] = v4;
  result[2] = v9;
  result[3] = v6;
  return result;
}

double NUOrientationTransformRect(uint64_t a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double result;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;

  v15.origin.x = a4;
  v15.origin.y = a5;
  v15.size.width = a6;
  v15.size.height = a7;
  NU::RectT<double>::RectT(&v11, &v15);
  switch(a1)
  {
    case 2:
      result = (double)a2 - (v11 + v13);
      break;
    case 3:
      result = (double)a2 - (v11 + v13);
      break;
    case 5:
      result = (double)a3 - (v12 + v14);
      break;
    case 6:
      result = v12;
      break;
    case 7:
      result = v12;
      break;
    case 8:
      result = (double)a3 - (v12 + v14);
      break;
    default:
      result = v11;
      break;
  }
  return result;
}

CGAffineTransform *NUOrientationMakeTransformWithSize@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return NUOrientationMakeTransformWithSizeAndOrigin(a1, a2, a3, 0, 0, a4);
}

uint64_t NUAffineTransformOrientation(double *a1)
{
  double v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *a1;
  v2 = a1[1];
  v3 = (uint64_t)llround(a1[2] * 180.0 / 3.14159265) / -90;
  v4 = v3 & 3;
  v6 = -v3;
  v5 = v6 < 0;
  v7 = v6 & 3;
  if (v5)
    v8 = v4;
  else
    v8 = -v7;
  v9 = qword_1A671A070[v8 + 3];
  v10 = 4;
  if (v2 >= 0.0)
    v10 = 1;
  v11 = 3;
  if (v2 >= 0.0)
    v11 = 2;
  if (v1 < 0.0)
    v12 = v11;
  else
    v12 = v10;
  return NUOrientationConcat(v9, v12);
}

uint64_t NUOrientationFromCGAffineTransform(__n128 *a1)
{
  __n128 v2;
  __n128 v4;
  __n128 v5[3];
  double v6[5];
  CGAffineTransform v7;

  v2 = a1[1];
  *(__n128 *)&v7.a = *a1;
  *(__n128 *)&v7.c = v2;
  *(__n128 *)&v7.tx = a1[2];
  if (CGAffineTransformIsIdentity(&v7))
    return 1;
  v4 = a1[1];
  v5[0] = *a1;
  v5[1] = v4;
  v5[2] = a1[2];
  NUDecomposeAffineTransform(v5, (uint64_t)v6);
  return NUAffineTransformOrientation(v6);
}

__n128 NUDecomposeAffineTransform@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X8>)
{
  double v4;
  long double v5;
  double v6;
  long double v7;
  long double v8;
  double v9;
  long double v10;
  BOOL v11;
  double v12;
  double v13;
  __n128 result;

  v4 = a1->n128_f64[0];
  v5 = a1[1].n128_f64[0];
  v6 = hypot(a1->n128_f64[0], v5);
  v7 = a1->n128_f64[1];
  v8 = a1[1].n128_f64[1];
  v9 = hypot(v7, v8);
  v10 = v4 * v8 - v7 * v5;
  v11 = v10 < 0.0;
  if (v10 <= 0.0)
  {
    v12 = 0.0;
    if (!v11)
      goto LABEL_13;
    if (fabs(v4) >= 0.00001 || fabs(v8) >= 0.00001)
    {
      if (v4 >= 0.0)
      {
LABEL_12:
        v12 = atan2(-v7 - v5, v4 - v8);
        v9 = -v9;
        goto LABEL_13;
      }
      v13 = v5 + v7;
    }
    else
    {
      v13 = v5 + v7;
      if (v5 + v7 <= 0.0)
        goto LABEL_12;
    }
    v12 = atan2(v13, v8 - v4);
    v6 = -v6;
    goto LABEL_13;
  }
  v12 = atan2(v7 - v5, v4 + v8);
LABEL_13:
  *(double *)a2 = v6;
  *(double *)(a2 + 8) = v9;
  *(double *)(a2 + 16) = v12;
  result = a1[2];
  *(__n128 *)(a2 + 24) = result;
  return result;
}

BOOL NUOrientationIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 8;
}

uint64_t NUOrientationHasFlip(unint64_t a1)
{
  return (a1 < 8) & (0xB4u >> a1);
}

uint64_t NUOrientationTransformRectVertex(uint64_t a1, uint64_t a2)
{
  unsigned int v2;

  switch(a1)
  {
    case 2:
      a2 = a2 ^ 1;
      break;
    case 3:
      a2 = a2 ^ 3;
      break;
    case 4:
      a2 = a2 ^ 2;
      break;
    case 5:
      v2 = ~__rbit32(a2);
      goto LABEL_8;
    case 6:
      a2 = (__rbit32(a2) >> 30) ^ 2;
      break;
    case 7:
      v2 = __rbit32(a2);
LABEL_8:
      a2 = v2 >> 30;
      break;
    case 8:
      a2 = (__rbit32(a2) >> 30) ^ 1;
      break;
    default:
      return a2;
  }
  return a2;
}

double NUConvertImageRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, CGFloat a9, CGFloat a10, double a11, double a12)
{
  double v20;
  double v21;
  double result;
  CGRect v23;
  CGRect v24;

  v20 = a11 / a7;
  v21 = a12 / a8;
  v23 = CGRectOffset(*(CGRect *)&a1, -a5, -a6);
  v23.origin.x = v20 * v23.origin.x;
  v23.origin.y = v21 * v23.origin.y;
  v23.size.width = v20 * v23.size.width;
  v23.size.height = v21 * v23.size.height;
  v24 = CGRectStandardize(v23);
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v24, a9, a10);
  return result;
}

double NUMultiplyRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double result;
  CGRect v7;

  v7.origin.x = a1 * a5;
  v7.origin.y = a2 * a6;
  v7.size.width = a3 * a5;
  v7.size.height = a4 * a6;
  *(_QWORD *)&result = (unint64_t)CGRectStandardize(v7);
  return result;
}

double NUPixelRectVertex(char a1, double a2, double a3, double a4, double a5)
{
  double MaxX;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if ((a1 & 1) != 0)
    MaxX = CGRectGetMaxX(*(CGRect *)&a2);
  else
    MaxX = CGRectGetMinX(*(CGRect *)&a2);
  v11 = MaxX;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if ((a1 & 2) != 0)
    CGRectGetMaxY(*(CGRect *)&v12);
  else
    CGRectGetMinY(*(CGRect *)&v12);
  return v11;
}

uint64_t NUPixelRectVectexOpposite(int a1)
{
  return a1 ^ 3u;
}

CGFloat NUAlignRectToPixelGrid@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, CGPoint *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint v14;
  CGSize v15;
  CGFloat result;
  CGSize size;
  _OWORD v18[2];
  CGRect v19;
  CGRect v20;

  v10 = (double)a1;
  v11 = (double)a2;
  v12 = 1.0 / (double)a1;
  v13 = 1.0 / (double)a2;
  v20.origin.x = a5 * v12;
  v20.origin.y = a6 * v13;
  v20.size.width = a7 * v12;
  v20.size.height = a8 * v13;
  v19 = CGRectStandardize(v20);
  NU::RectT<long>::RectT(v18, &v19, a3);
  v14 = (CGPoint)v18[0];
  v15 = (CGSize)v18[1];
  *a4 = 0u;
  a4[1] = 0u;
  v19.origin = v14;
  v19.size = v15;
  NU::RectT<long>::scale((uint64_t *)&v19, 2, v10, v11);
  result = v19.origin.x;
  size = v19.size;
  *a4 = v19.origin;
  a4[1] = (CGPoint)size;
  return result;
}

CGFloat NUAlignPixelRectToPixelGrid@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, CGPoint *a5@<X8>)
{
  return NUAlignRectToPixelGrid(a2, a3, a4, a5, (double)*a1, (double)a1[1], (double)a1[2], (double)a1[3]);
}

double NURelativePointInRect(double a1, double a2, double a3, double a4, double a5)
{
  double result;

  result = 0.0;
  if (a5 != 0.0)
    return (a1 - a3) / a5;
  return result;
}

double NUAbsolutePointInRect(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

double NUPixelPointClipToRect(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v11;
  double v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.origin.x = a3;
  v14.origin.y = a4;
  v14.size.width = a5;
  v14.size.height = a6;
  v11 = fmax(a1, CGRectGetMinX(v14));
  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  v12 = fmin(v11, CGRectGetMaxX(v15));
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  CGRectGetMinY(v16);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGRectGetMaxY(v17);
  return v12;
}

double NUAnchorPointFromRectToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double result;

  result = 0.5;
  if (vabdd_f64(a7, a3) > 0.00000011920929)
    return -(a5 - a1) / (a7 - a3);
  return result;
}

double NUScaleRect(double a1, double a2, double a3, double a4, double a5)
{
  double result;
  CGRect v6;

  v6.origin.x = a1 * a5;
  v6.origin.y = a2 * a5;
  v6.size.width = a3 * a5;
  v6.size.height = a4 * a5;
  *(_QWORD *)&result = (unint64_t)CGRectStandardize(v6);
  return result;
}

double NURectFlipYOrigin(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX;
  double v16;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  v16 = MinX - CGRectGetMinX(v19);
  v20.origin.x = a5;
  v20.origin.y = a6;
  v20.size.width = a7;
  v20.size.height = a8;
  CGRectGetMaxY(v20);
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  CGRectGetMaxY(v21);
  return v16;
}

double NUResizeRectByMovingRelativePoint(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v16;

  v16 = a1 + a9 * a3;
  if (a5 != a9)
    a3 = (a1 + a5 * a3 + a7 - v16) / (a5 - a9);
  return v16 - a9 * a3;
}

double NUPixelRectEnforceMinimumSizeAndAspectRatio(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9;
  double v10;

  if (a1 | a2 && a7 * (double)a2 < a8 * (double)a1)
  {
    v9 = (double)a1 / (double)a2;
    v10 = INFINITY;
    if (!a1)
      v10 = NAN;
    if (!a2)
      v9 = v10;
    a7 = a8 * v9;
  }
  return fmin(a3, a3 + a9 * (a5 - a7));
}

BOOL NUAspectRatioIsUndefined(uint64_t a1, uint64_t a2)
{
  return (a1 | a2) == 0;
}

double NUAspectRatioValue(uint64_t a1, uint64_t a2)
{
  double result;
  double v3;

  result = (double)a1 / (double)a2;
  v3 = INFINITY;
  if (!a1)
    v3 = NAN;
  if (!a2)
    return v3;
  return result;
}

double NUPixelRectEnforceMinimumSize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return fmin(a1, a1 + a7 * (a3 - a5));
}

double NUResizeRectRelative(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1 + a7 * a3 - a7 * (a3 + a5);
}

double NURescaleRectRelative(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6 * a3 - a6 * (a3 * a5);
}

double NURescaleRectRelativeXY(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1 + a7 * a3 - a7 * (a3 * a5);
}

double NUPixelRectAspectConstrain(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!(a1 | a2))
  {
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUAspectRatioIsUndefined(ratio)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v18;
        v27 = 2114;
        v28 = v20;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"CGRect NUPixelRectAspectConstrain(CGRect, CGPoint, NUAspectRatio, CGPoint)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometry.mm", 1031, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"!NUAspectRatioIsUndefined(ratio)");
  }
  return a3
       + a9 * a5
       - a9
       * (((a4 + a8 * a6 - (a4 + a10 * a6)) * ((a8 - a10) * (double)a2)
         + (a3 + a7 * a5 - (a3 + a9 * a5)) * ((a7 - a9) * (double)a1))
        / ((a8 - a10) * (double)a2 * ((a8 - a10) * (double)a2) + (a7 - a9) * (double)a1 * ((a7 - a9) * (double)a1))
        * (double)a1);
}

void sub_1A664E338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

CGFloat NUPixelRectResizeToFitInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12)
{
  CGFloat v22;
  CGFloat v23;
  CGFloat MinY;
  CGFloat v25;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v34;
  CGFloat v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v37.size.width = a11;
  v22 = a1 + a5 * a3;
  v36 = v22;
  v34 = a2 + a6 * a4;
  v37.origin.x = a9;
  v37.origin.y = a10;
  v37.size.height = a12;
  v23 = v22 - CGRectGetMinX(v37);
  v38.origin.x = a1;
  v38.origin.y = a2;
  v38.size.width = a3;
  v38.size.height = a4;
  v32 = v23 / (a5 * CGRectGetWidth(v38));
  v39.origin.x = a9;
  v39.origin.y = a10;
  v39.size.width = a11;
  v39.size.height = a12;
  MinY = CGRectGetMinY(v39);
  v40.size.width = a3;
  v30 = v34 - MinY;
  v40.origin.x = a1;
  v40.origin.y = a2;
  v40.size.height = a4;
  v31 = v30 / (a6 * CGRectGetHeight(v40));
  v41.origin.x = a9;
  v41.origin.y = a10;
  v41.size.width = a11;
  v41.size.height = a12;
  v28 = CGRectGetMaxX(v41) - v36;
  v42.origin.x = a1;
  v42.origin.y = a2;
  v42.size.width = a3;
  v42.size.height = a4;
  v29 = v28 / ((1.0 - a5) * CGRectGetWidth(v42));
  v43.origin.x = a9;
  v43.origin.y = a10;
  v43.size.width = a11;
  v43.size.height = a12;
  v25 = CGRectGetMaxY(v43) - v34;
  v44.origin.x = a1;
  v44.origin.y = a2;
  v44.size.width = a3;
  v44.size.height = a4;
  return v36 - a5 * (a3 * fmin(fmin(v32, v29), fmin(v31, v25 / ((1.0 - a6) * CGRectGetHeight(v44)))));
}

double NUPixelRectNormalize(uint64_t *a1, uint64_t *a2)
{
  return ((double)*a1 - (double)*a2) / (double)a2[2];
}

double NURectNormalize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return (a1 - a5) / a7;
}

double NUPixelRectDenormalize@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  double v8;
  double v9;
  CGFloat v10;
  double result;
  __int128 v12;
  _OWORD v13[2];
  CGRect v14;

  v8 = (double)a1[2];
  v9 = (double)a1[3];
  v10 = (double)a1[1] + a5 * v9;
  v14.origin.x = (double)*a1 + a4 * v8;
  v14.origin.y = v10;
  v14.size.width = a6 * v8;
  v14.size.height = a7 * v9;
  NU::RectT<long>::RectT(v13, &v14, a2);
  result = *(double *)v13;
  v12 = v13[1];
  *a3 = v13[0];
  a3[1] = v12;
  return result;
}

double NURectDenormalize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a5 + a1 * a7;
}

BOOL NUAspectRatioIsEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;

  if (a3 | a4)
    v4 = a4 * a1 == a3 * a2;
  else
    v4 = (a1 | a2 | a3 | a4) == 0;
  if (a1 | a2)
    return v4;
  else
    return (a1 | a2 | a3 | a4) == 0;
}

uint64_t NUAspectRatioWithOrientation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a3 - 5) >= 4)
    return a1;
  return a2;
}

uint64_t NUAspectRatioConstrain(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v5;
  double v6;
  double v7;

  v5 = (double)result;
  v6 = (double)a2;
  v7 = (double)a3 / (double)a4;
  if (a5 == 1)
  {
    if (v5 / v6 <= v7)
    {
      if (v6 / v5 > v7)
        return vcvtpd_s64_f64(v6 / v7);
    }
    else
    {
      return vcvtmd_s64_f64(v7 * v6);
    }
  }
  return result;
}

uint64_t NUAspectRatioCompare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v4;
  double v5;
  double v6;
  double v7;

  v4 = (double)a1 / (double)a2;
  v5 = INFINITY;
  if (!a1)
    v5 = NAN;
  if (!a2)
    v4 = v5;
  v6 = (double)a3 / (double)a4;
  v7 = INFINITY;
  if (!a3)
    v7 = NAN;
  if (!a4)
    v6 = v7;
  if (v4 < v6)
    return -1;
  else
    return v4 > v6;
}

double NUExtractRotationFromStraightenAffineTransform(__n128 *a1)
{
  __n128 v1;
  double result;
  __n128 v3[3];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = 0;
  v4 = 0u;
  v5 = 0u;
  v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  v3[2] = a1[2];
  NUDecomposeAffineTransform(v3, (uint64_t)&v4);
  result = *(double *)&v5 * 180.0 / 3.14159265;
  if (result < 0.0)
    return result + 360.0;
  return result;
}

double NUConvertCropRectWithStraightenAffineTransform(_OWORD *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7)
{
  __int128 v11;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double result;
  CGAffineTransform v17;
  CGRect v18;

  v11 = a1[1];
  *(_OWORD *)&v17.a = *a1;
  *(_OWORD *)&v17.c = v11;
  *(_OWORD *)&v17.tx = a1[2];
  *(double *)&v11 = a7;
  v13 = -_NUOffsetFromDGCropToCICropWithTransform(&v17, *(CGSize *)((char *)&v11 - 8));
  v15 = -v14;
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v18, v13, v15);
  return result;
}

double _NUOffsetFromDGCropToCICropWithTransform(CGAffineTransform *a1, CGSize a2)
{
  CGFloat height;
  CGFloat width;
  __int128 v4;
  uint64_t v5;
  double result;
  CGAffineTransform v7;
  CGRect v8;

  height = a2.height;
  width = a2.width;
  v4 = *(_OWORD *)&a1->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a1->a;
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tx = *(_OWORD *)&a1->tx;
  v5 = 0;
  *(_QWORD *)&v4 = 0;
  v8 = CGRectApplyAffineTransform(*(CGRect *)(&height - 3), &v7);
  *(_QWORD *)&result = (unint64_t)CGRectIntegral(v8);
  return result;
}

void NUConvertCICropRectToDGCropRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, CGFloat a6, CGFloat a7)
{
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGSize v18;
  CGRect v19;

  memset(&v17, 0, sizeof(v17));
  NUStraightenAffineTransformWithRadians((uint64_t)&v17, a5 * 3.14159265 / 180.0, a6, a7);
  v16 = v17;
  v18.width = a6;
  v18.height = a7;
  v13 = -_NUOffsetFromDGCropToCICropWithTransform(&v16, v18);
  v15 = -v14;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  CGRectOffset(v19, v13, v15);
}

CGFloat NUStraightenAffineTransformWithRadians@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGFloat v12;
  CGFloat MidX;
  CGFloat MidY;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  __int128 v23;
  CGFloat result;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGRect v29;
  CGRect v30;

  v8 = MEMORY[0x1E0C9BAA8];
  v9 = *MEMORY[0x1E0C9BAA8];
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a1 + 16) = v10;
  v11 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)(a1 + 32) = v11;
  *(_OWORD *)&v28.a = v9;
  *(_OWORD *)&v28.c = v10;
  *(_OWORD *)&v28.tx = v11;
  *(_QWORD *)&v9 = 0;
  *(_QWORD *)&v10 = 0;
  *(CGFloat *)&v11 = a3;
  v12 = a4;
  MidX = CGRectGetMidX(*(CGRect *)&v9);
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = a3;
  v29.size.height = a4;
  MidY = CGRectGetMidY(v29);
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v28, MidX, MidY);
  v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v26.a = *(_OWORD *)a1;
  *(_OWORD *)&v26.c = v15;
  *(_OWORD *)&v26.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformRotate(&v27, &v26, a2);
  v16 = *(_OWORD *)&v27.c;
  *(_OWORD *)a1 = *(_OWORD *)&v27.a;
  *(_OWORD *)(a1 + 16) = v16;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v27.tx;
  v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v17;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  v18 = 0;
  *(_QWORD *)&v17 = 0;
  v19 = a3;
  v20 = a4;
  v21 = -CGRectGetMidX(*(CGRect *)((char *)&v17 - 8));
  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = a3;
  v30.size.height = a4;
  v22 = CGRectGetMidY(v30);
  CGAffineTransformTranslate(&v27, &v25, v21, -v22);
  v23 = *(_OWORD *)&v27.c;
  *(_OWORD *)a1 = *(_OWORD *)&v27.a;
  *(_OWORD *)(a1 + 16) = v23;
  result = v27.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v27.tx;
  return result;
}

CGFloat NUStraightenAffineTransformWithDegrees@<D0>(uint64_t a1@<X8>, double a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  return NUStraightenAffineTransformWithRadians(a1, a2 * 3.14159265 / 180.0, a3, a4);
}

void NUConvertDGCropRectToCICropRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, CGFloat a6, CGFloat a7)
{
  double v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGSize v18;
  CGRect v19;

  memset(&v17, 0, sizeof(v17));
  NUStraightenAffineTransformWithRadians((uint64_t)&v17, a5 * 3.14159265 / 180.0, a6, a7);
  v16 = v17;
  v18.width = a6;
  v18.height = a7;
  v13 = _NUOffsetFromDGCropToCICropWithTransform(&v16, v18);
  v15 = v14;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  CGRectOffset(v19, v13, v15);
}

double NUConvertCropRectWithAspectRatio(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  return _rectWithAspectRatio(a1, a2, a3, a4, a5, a6, 1.0);
}

double _rectWithAspectRatio(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;

  v7 = vcvtmd_s64_f64(sqrt(a6 * (a5 * a7) * (double)a2 / (double)a1) + 0.5);
  v8 = v7 | 1;
  v9 = (v7 & 1) + v7;
  if ((vcvtmd_s64_f64(a6) & 1) != 0)
    v9 = v8;
  v10 = vcvtmd_s64_f64(a5);
  v11 = vcvtmd_s64_f64(floor((double)a1 * (double)v9 / (double)a2) + 0.5);
  v12 = v11 | 1;
  v13 = (v11 & 1) + v11;
  if ((v10 & 1) != 0)
    v13 = v12;
  return a3 - (float)((float)(int)(v13 - v10) * 0.5);
}

double NUConvertCropRectWithAspectRatioAndArea(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  return _rectWithAspectRatio(a1, a2, a3, a4, a5, a6, a7 / (a5 * a6));
}

__n128 NURecomposeAffineTransform@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  __double2 v4;
  double v5;
  double v6;
  __n128 result;

  v4 = __sincos_stret(*(double *)(a1 + 16));
  v5 = *(double *)a1;
  v6 = *(double *)(a1 + 8);
  a2->n128_f64[0] = *(double *)a1 * v4.__cosval;
  a2->n128_f64[1] = v4.__sinval * v6;
  a2[1].n128_f64[0] = -(v5 * v4.__sinval);
  a2[1].n128_f64[1] = v4.__cosval * v6;
  result = *(__n128 *)(a1 + 24);
  a2[2] = result;
  return result;
}

double NUAffineTransformDelta@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, uint64_t a3@<X8>)
{
  double v3;
  float64x2_t v4;
  double result;
  _OWORD v6[2];
  double v7;

  v3 = a2[2].f64[0] - a1[2].f64[0];
  v4 = vsubq_f64(a2[1], a1[1]);
  v6[0] = vdivq_f64(*a2, *a1);
  v6[1] = v4;
  v7 = v3;
  *(_QWORD *)&result = NUAffineTransformStandardize((uint64_t)v6, a3).n128_u64[0];
  return result;
}

__n128 NUAffineTransformStandardize@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __n128 result;
  __int128 v11;

  v5 = *(double *)a1;
  v4 = *(double *)(a1 + 8);
  if (*(double *)a1 >= 0.0)
  {
    if (v4 >= 0.0)
    {
      v6 = *(double *)(a1 + 16);
      goto LABEL_14;
    }
  }
  else if (v4 < 0.0)
  {
    *(double *)a1 = -v5;
    *(double *)(a1 + 8) = -v4;
    v6 = *(double *)(a1 + 16);
    if (v6 > 0.0)
    {
LABEL_12:
      v7 = -3.14159265;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  v6 = *(double *)(a1 + 16);
  if (v6 >= -1.57079633)
  {
    if (v6 <= 1.57079633)
      goto LABEL_14;
    *(double *)a1 = -v5;
    *(double *)(a1 + 8) = -v4;
    goto LABEL_12;
  }
  *(double *)a1 = -v5;
  *(double *)(a1 + 8) = -v4;
LABEL_8:
  v7 = 3.14159265;
LABEL_13:
  v6 = v6 + v7;
  *(double *)(a1 + 16) = v6;
LABEL_14:
  v8 = -3.14159265;
  if (v6 <= -3.14159265)
  {
    v9 = 3.14159265;
    goto LABEL_18;
  }
  v8 = 3.14159265;
  if (v6 > 3.14159265)
  {
    v9 = -3.14159265;
LABEL_18:
    *(long double *)(a1 + 16) = fmod(v6 + v8, 6.28318531) + v9;
  }
  result = *(__n128 *)a1;
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v11;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  return result;
}

CGFloat NUCGAffineTransformByMappingFromRectToRect@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>, CGFloat a6@<D4>, CGFloat a7@<D5>, CGFloat a8@<D6>, CGFloat a9@<D7>)
{
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGFloat MinX;
  CGFloat MinY;
  __int128 v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double Width;
  CGFloat v29;
  double Height;
  CGFloat v31;
  __int128 v32;
  __int128 v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  __int128 v39;
  CGFloat result;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v17 = MEMORY[0x1E0C9BAA8];
  v18 = *MEMORY[0x1E0C9BAA8];
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a1 + 16) = v19;
  v20 = *(_OWORD *)(v17 + 32);
  *(_OWORD *)(a1 + 32) = v20;
  *(_OWORD *)&v46.a = v18;
  *(_OWORD *)&v46.c = v19;
  *(_OWORD *)&v46.tx = v20;
  *(CGFloat *)&v18 = a6;
  *(CGFloat *)&v19 = a7;
  *(CGFloat *)&v20 = a8;
  MinX = CGRectGetMinX(*(CGRect *)&v18);
  v47.origin.x = a6;
  v47.origin.y = a7;
  v47.size.width = a8;
  v47.size.height = a9;
  MinY = CGRectGetMinY(v47);
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v46, MinX, MinY);
  v24 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v44.a = *(_OWORD *)a1;
  *(_OWORD *)&v44.c = v24;
  *(_OWORD *)&v44.tx = *(_OWORD *)(a1 + 32);
  v25 = a6;
  *(CGFloat *)&v24 = a7;
  v26 = a8;
  v27 = a9;
  Width = CGRectGetWidth(*(CGRect *)((char *)&v24 - 8));
  v48.origin.x = a2;
  v48.origin.y = a3;
  v48.size.width = a4;
  v48.size.height = a5;
  v29 = Width / CGRectGetWidth(v48);
  v49.origin.x = a6;
  v49.origin.y = a7;
  v49.size.width = a8;
  v49.size.height = a9;
  Height = CGRectGetHeight(v49);
  v50.origin.x = a2;
  v50.origin.y = a3;
  v50.size.width = a4;
  v50.size.height = a5;
  v31 = CGRectGetHeight(v50);
  CGAffineTransformScale(&v45, &v44, v29, Height / v31);
  v32 = *(_OWORD *)&v45.c;
  *(_OWORD *)a1 = *(_OWORD *)&v45.a;
  *(_OWORD *)(a1 + 16) = v32;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v45.tx;
  v33 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v43.a = *(_OWORD *)a1;
  *(_OWORD *)&v43.c = v33;
  *(_OWORD *)&v43.tx = *(_OWORD *)(a1 + 32);
  v34 = a2;
  *(CGFloat *)&v33 = a3;
  v35 = a4;
  v36 = a5;
  v37 = -CGRectGetMinX(*(CGRect *)((char *)&v33 - 8));
  v51.origin.x = a2;
  v51.origin.y = a3;
  v51.size.width = a4;
  v51.size.height = a5;
  v38 = CGRectGetMinY(v51);
  CGAffineTransformTranslate(&v45, &v43, v37, -v38);
  v39 = *(_OWORD *)&v45.c;
  *(_OWORD *)a1 = *(_OWORD *)&v45.a;
  *(_OWORD *)(a1 + 16) = v39;
  result = v45.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v45.tx;
  return result;
}

__n128 NUCGAffineTransformFlipYInRect@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  __n128 v12;
  __n128 v13;
  __n128 v14;
  double v15;
  double v16;
  double v17;
  CGFloat Height;
  __n128 v19;
  __n128 v20;
  __n128 result;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v12 = a1[1];
  *(__n128 *)&v23.a = *a1;
  *(__n128 *)&v23.c = v12;
  *(__n128 *)&v23.tx = a1[2];
  CGAffineTransformScale(&v24, &v23, 1.0, -1.0);
  v13 = *(__n128 *)&v24.c;
  *a1 = *(__n128 *)&v24.a;
  a1[1] = v13;
  a1[2] = *(__n128 *)&v24.tx;
  v14 = a1[1];
  *(__n128 *)&v22.a = *a1;
  *(__n128 *)&v22.c = v14;
  *(__n128 *)&v22.tx = a1[2];
  v15 = a3;
  v14.n128_f64[0] = a4;
  v16 = a5;
  v17 = a6;
  Height = CGRectGetHeight(*(CGRect *)((char *)&v14 - 8));
  CGAffineTransformTranslate(&v24, &v22, 0.0, -Height);
  v19 = *(__n128 *)&v24.c;
  *a1 = *(__n128 *)&v24.a;
  a1[1] = v19;
  a1[2] = *(__n128 *)&v24.tx;
  v20 = a1[1];
  *a2 = *a1;
  a2[1] = v20;
  result = a1[2];
  a2[2] = result;
  return result;
}

double NUCGPointConvertFromRectToRect(int a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8, double a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13)
{
  double result;
  __n128 v26[3];
  __n128 v27[3];
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;

  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  NUCGAffineTransformByMappingFromRectToRect((uint64_t)&v28, a4, a5, a6, a7, a10, a11, a12, a13);
  if (a1)
  {
    v26[0] = (__n128)v28;
    v26[1] = (__n128)v29;
    v26[2] = (__n128)v30;
    NUCGAffineTransformFlipYInRect(v26, v27, a4, a5, a6, a7);
    v28 = (float64x2_t)v27[0];
    v29 = (float64x2_t)v27[1];
    v30 = (float64x2_t)v27[2];
  }
  *(_QWORD *)&result = *(_OWORD *)&vaddq_f64(v30, vmlaq_n_f64(vmulq_n_f64(v29, a3), v28, a2));
  return result;
}

void NUCGRectConvertFromRectToRect(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13)
{
  CGAffineTransform v29;
  __n128 v30[3];
  __n128 v31[3];
  CGAffineTransform v32;
  CGRect v33;

  memset(&v32, 0, sizeof(v32));
  NUCGAffineTransformByMappingFromRectToRect((uint64_t)&v32, a6, a7, a8, a9, a10, a11, a12, a13);
  if (a1)
  {
    v30[0] = *(__n128 *)&v32.a;
    v30[1] = *(__n128 *)&v32.c;
    v30[2] = *(__n128 *)&v32.tx;
    NUCGAffineTransformFlipYInRect(v30, v31, a6, a7, a8, a9);
    *(__n128 *)&v32.a = v31[0];
    *(__n128 *)&v32.c = v31[1];
    *(__n128 *)&v32.tx = v31[2];
  }
  v29 = v32;
  v33.origin.x = a2;
  v33.origin.y = a3;
  v33.size.width = a4;
  v33.size.height = a5;
  CGRectApplyAffineTransform(v33, &v29);
}

id NUAssertLogger_14087()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_142_14104);
  return (id)_NUAssertLogger;
}

void sub_1A6650178(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6650430(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A66506D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66509E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A6650B24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6650BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A6650C38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A665103C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A665132C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66515F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A6651CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1A6651EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A6651FC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6652050(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66520CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6652368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A665243C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A6652A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id NUAssertLogger_14463()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14474);
  return (id)_NUAssertLogger;
}

void sub_1A6653CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14527(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14528(uint64_t a1)
{

}

id NUAssertLogger_14537()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_45_14554);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_14643()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14668);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_14830()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14842);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_14916()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14893);
  return (id)_NUAssertLogger;
}

void sub_1A6674CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;

  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_15529()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_160);
  return (id)_NUAssertLogger;
}

void NUCopyCVBufferAttachment(__CVBuffer *a1, __CVBuffer *a2, CFStringRef key)
{
  CFTypeRef v5;
  const void *v6;
  CVAttachmentMode attachmentMode;

  attachmentMode = kCVAttachmentMode_ShouldNotPropagate;
  v5 = CVBufferCopyAttachment(a1, key, &attachmentMode);
  if (v5)
  {
    v6 = v5;
    CVBufferSetAttachment(a2, key, v5, attachmentMode);
    CFRelease(v6);
  }
  else
  {
    CVBufferRemoveAttachment(a2, key);
  }
}

uint64_t __Block_byref_object_copy__15560(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15561(uint64_t a1)
{

}

void sub_1A6675FA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t areUniversalCompressionFormatsSupported()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *v2;

  if ((areUniversalCompressionFormatsSupported_didCheck & 1) == 0)
  {
    v0 = (const __CFDictionary *)MGCopyAnswer();
    if (v0)
    {
      v1 = v0;
      v2 = (const void *)*MEMORY[0x1E0C9AE50];
      if (v2 == CFDictionaryGetValue(v0, CFSTR("universal-buffer-compression")))
        areUniversalCompressionFormatsSupported_result = 1;
      CFRelease(v1);
    }
    areUniversalCompressionFormatsSupported_didCheck = 1;
  }
  return areUniversalCompressionFormatsSupported_result;
}

id NUAssertLogger_15728()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15740);
  return (id)_NUAssertLogger;
}

uint64_t NUImagePropertyAlphaFromCGBitmapInfo(char a1)
{
  if ((a1 & 0x1Fu) > 6)
    return 0;
  else
    return qword_1A671A0A8[a1 & 0x1F];
}

uint64_t NUImagePropertyComponentFromCGBitmapInfo(unsigned int a1)
{
  unsigned int v1;

  if ((a1 & 0x100) != 0)
    return 4;
  v1 = (a1 >> 12) & 7;
  if (v1 > 4)
    return 0;
  else
    return qword_1A671A0E0[v1];
}

id NUAssertLogger_15856()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15891);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_15953()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_65);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__15976(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15977(uint64_t a1)
{

}

id NUAssertLogger_16192()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16205);
  return (id)_NUAssertLogger;
}

uint64_t NU::Rational<long>::compare(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2[1];
  v3 = a1[1];
  v4 = v2 * *a1;
  v5 = v3 * *a2;
  if (v5 == v4)
    return 0;
  v7 = (v3 >> 63) + (v2 >> 63);
  v8 = v4 < v5;
  v9 = 1;
  if (v8)
    v10 = 1;
  else
    v10 = -1;
  if (v8)
    v9 = -1;
  if (v7 == 1)
    return v10;
  else
    return v9;
}

uint64_t NU::Rational<int>::compare(int *a1, int *a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2[1];
  v3 = a1[1];
  v4 = v2 * (uint64_t)*a1;
  v5 = v3 * (uint64_t)*a2;
  if (v5 == v4)
    return 0;
  v7 = (v3 >> 31) + (v2 >> 31);
  v8 = v4 < v5;
  v9 = 1;
  if (v8)
    v10 = 1;
  else
    v10 = -1;
  if (v8)
    v9 = -1;
  if (v7 == 1)
    return v10;
  else
    return v9;
}

uint64_t NU::Rational<unsigned int>::compare(unsigned int *a1, unsigned int *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = a2[1] * (unint64_t)*a1;
  v3 = a1[1] * (unint64_t)*a2;
  v4 = 1;
  if (v2 <= v3)
    v4 = -1;
  if (v3 == v2)
    return 0;
  else
    return v4;
}

id NUAssertLogger_16293()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_216);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_16537()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16556);
  return (id)_NUAssertLogger;
}

void sub_1A6681400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A6681850(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A6681D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A6681E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A6681ED8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66823A4(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void sub_1A66828D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A6682C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A6682F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A6683364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A6683704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A6684200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_16814()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16835);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_16917()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_17097()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17128);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_17335()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17349);
  return (id)_NUAssertLogger;
}

void sub_1A668D7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_17449()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17463);
  return (id)_NUAssertLogger;
}

void sub_1A668ECD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_17631()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17653);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__17644(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17645(uint64_t a1)
{

}

id NUAssertLogger_17713()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17698);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_17753()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17764);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__17809(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17810(uint64_t a1)
{

}

id NUAssertLogger_17814()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17825);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_17968()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17893);
  return (id)_NUAssertLogger;
}

const __CFString *NUSegmentationTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_1E5062F08[a1 - 1];
}

const __CFString *NUVisionSegmentationPolicyDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("First");
  else
    return off_1E5062F20[a1 - 1];
}

id NUAssertLogger_18095()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18108);
  return (id)_NUAssertLogger;
}

void sub_1A6693F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_18179()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18198);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__18201(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18202(uint64_t a1)
{

}

id NUAssertLogger_18335()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18348);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_18492()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_108);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_18647()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18668);
  return (id)_NUAssertLogger;
}

void sub_1A669C7FC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id NUAssertLogger_18745()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18765);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__18844(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18845(uint64_t a1)
{

}

id NUAssertLogger_19108()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19126);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_19213()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19228);
  return (id)_NUAssertLogger;
}

void sub_1A66A346C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A66A3DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 56), 8);
  _Unwind_Resume(a1);
}

void sub_1A66A3EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A66A3FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 56), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19500(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19501(uint64_t a1)
{

}

id NUAssertLogger_19521()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  return (id)_NUAssertLogger;
}

void sub_1A66AE0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A66AEEE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66AEF9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66AF250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66AF420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A66AF500(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66AF584(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL NU::Region::includes(NU::Region *this, const NU::Region *a2)
{
  _BOOL8 v3;
  __n128 v5;
  uint64_t v6;

  if (!*((_QWORD *)a2 + 3))
    return 0;
  std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set((uint64_t)&v5, (uint64_t)a2);
  NU::Region::breakRects((uint64_t)this, &v5);
  NU::Region::mergeRectsVertically((NU::Region *)&v5);
  v3 = v6 == 0;
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v5);
  return v3;
}

void sub_1A66AF758(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set(uint64_t a1, uint64_t a2)
{
  __n128 *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(__n128 **)(a2 + 16); i; i = (__n128 *)i->n128_u64[0])
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect const&>(a1, (uint64_t *)&i[1], i[1], i[2]);
  return a1;
}

void sub_1A66AF7C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::breakRects(uint64_t result, __n128 *a2)
{
  _QWORD *v2;
  __n128 *v4;
  __n128 *v5;
  __int128 v6;
  __int128 v7;
  int v8;

  v2 = *(_QWORD **)(result + 16);
  if (v2)
  {
    v4 = a2 + 1;
    do
    {
      v6 = 0u;
      v7 = 0u;
      v5 = v4;
      v8 = 1065353216;
      while (1)
      {
        v5 = (__n128 *)v5->n128_u64[0];
        if (!v5)
          break;
        NU::Region::breakRects(v5 + 1, v2 + 2, (uint64_t)&v6);
      }
      if (&v6 != (__int128 *)a2)
      {
        a2[2].n128_u32[0] = v8;
        std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(a2, (uint64_t *)v7);
      }
      result = std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v6);
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return result;
}

void sub_1A66AF88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::mergeRectsVertically(NU::Region *this)
{
  _QWORD *i;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v13;
  __n128 v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  int v21;

  v19 = 0u;
  v20 = 0u;
  v21 = 1065353216;
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__rehash<true>((uint64_t)&v19, (unint64_t)(float)*((unint64_t *)this + 3));
  for (i = (_QWORD *)*((_QWORD *)this + 2); i; i = (_QWORD *)*i)
  {
    v3 = i[2];
    v4 = i[3];
    v15 = v3;
    v16 = v4;
    v5 = i[4];
    v6 = i[5];
    v17 = v5;
    v18 = v6;
    v7 = (uint64_t *)v20;
    if ((_QWORD)v20)
    {
      do
      {
        while (1)
        {
          v8 = v7[3];
          if ((v18 + v16 == v8 || v16 == v7[5] + v8) && v15 == v7[2] && v17 == v7[4])
            break;
          v7 = (uint64_t *)*v7;
          if (!v7)
            goto LABEL_16;
        }
        if (v8 >= v16)
          v9 = v16;
        else
          v9 = v7[3];
        NU::RectT<long>::setYMin((uint64_t *)&v15, v9);
        v10 = v7[5];
        if ((uint64_t)(v18 + v16) <= v10 + v7[3])
          v11 = v10 + v7[3];
        else
          v11 = v18 + v16;
        NU::RectT<long>::setYMax((uint64_t *)&v15, v11);
        v7 = (uint64_t *)std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::erase(&v19, v7);
      }
      while (v7);
LABEL_16:
      v3 = v15;
      v4 = v16;
      v5 = v17;
      v6 = v18;
    }
    v13.n128_u64[0] = v3;
    v13.n128_u64[1] = v4;
    v14.n128_u64[0] = v5;
    v14.n128_u64[1] = v6;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>((uint64_t)&v19, (uint64_t *)&v13, v13, v14);
  }
  if (&v19 != (__int128 *)this)
  {
    *((_DWORD *)this + 8) = v21;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(this, (uint64_t *)v20);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v19);
}

void sub_1A66AFA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

void std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t i;
  _BYTE *v6;
  __int128 v7;
  __int128 v8;
  _BYTE *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;

  v4 = a1[1];
  if (!v4)
    goto LABEL_9;
  for (i = 0; i != v4; *(_QWORD *)(*a1 + 8 * i++) = 0)
    ;
  v6 = (_BYTE *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v6)
  {
    while (a2)
    {
      v7 = *((_OWORD *)a2 + 1);
      v8 = *((_OWORD *)a2 + 2);
      v6[48] = *((_BYTE *)a2 + 48);
      *((_OWORD *)v6 + 1) = v7;
      *((_OWORD *)v6 + 2) = v8;
      v9 = *(_BYTE **)v6;
      std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__node_insert_multi((uint64_t)a1, (uint64_t)v6);
      a2 = (uint64_t *)*a2;
      v6 = v9;
      if (!v9)
        goto LABEL_9;
    }
    do
    {
      v15 = *(_BYTE **)v6;
      operator delete(v6);
      v6 = v15;
    }
    while (v15);
  }
  else
  {
LABEL_9:
    while (a2)
    {
      v10 = operator new(0x38uLL);
      *v10 = 0;
      v11 = a2[2];
      v12 = a2[3];
      v13 = a2[4];
      v14 = a2[5];
      v10[3] = v12;
      v10[4] = v13;
      v10[5] = v14;
      v10[1] = (COERCE__INT64((double)v11) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v12)
                                                                                              + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v13) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v14) + 4095) >> 32);
      v10[2] = v11;
      std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__node_insert_multi((uint64_t)a1, (uint64_t)v10);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_1A66AFD88(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_1A66AFDA8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::erase(_QWORD *a1, uint64_t *__p)
{
  int8x8_t v2;
  unint64_t v3;
  uint64_t v4;
  uint8x8_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v2 = (int8x8_t)a1[1];
  v4 = *__p;
  v3 = __p[1];
  v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v3 >= *(_QWORD *)&v2)
      v3 %= *(_QWORD *)&v2;
  }
  else
  {
    v3 &= *(_QWORD *)&v2 - 1;
  }
  v6 = *(uint64_t **)(*a1 + 8 * v3);
  do
  {
    v7 = v6;
    v6 = (uint64_t *)*v6;
  }
  while (v6 != __p);
  if (v7 != a1 + 2)
  {
    v8 = v7[1];
    if (v5.u32[0] > 1uLL)
    {
      if (v8 >= *(_QWORD *)&v2)
        v8 %= *(_QWORD *)&v2;
    }
    else
    {
      v8 &= *(_QWORD *)&v2 - 1;
    }
    v9 = *__p;
    if (v8 == v3)
    {
LABEL_20:
      if (!v9)
        goto LABEL_27;
      goto LABEL_21;
    }
  }
  if (!v4)
    goto LABEL_19;
  v10 = *(_QWORD *)(v4 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v10 >= *(_QWORD *)&v2)
      v10 %= *(_QWORD *)&v2;
  }
  else
  {
    v10 &= *(_QWORD *)&v2 - 1;
  }
  v9 = *__p;
  if (v10 != v3)
  {
LABEL_19:
    *(_QWORD *)(*a1 + 8 * v3) = 0;
    v9 = *__p;
    goto LABEL_20;
  }
LABEL_21:
  v11 = *(_QWORD *)(v9 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v11 >= *(_QWORD *)&v2)
      v11 %= *(_QWORD *)&v2;
  }
  else
  {
    v11 &= *(_QWORD *)&v2 - 1;
  }
  if (v11 != v3)
  {
    *(_QWORD *)(*a1 + 8 * v11) = v7;
    v9 = *__p;
  }
LABEL_27:
  *v7 = v9;
  *__p = 0;
  --a1[3];
  operator delete(__p);
  return v4;
}

void std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(uint64_t a1, uint64_t *a2, __n128 a3, __n128 a4)
{
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  _QWORD *v12;
  _QWORD *i;
  unint64_t v14;
  __n128 *v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  __n128 **v23;
  unint64_t v24;

  v6 = a2[1];
  v7 = a2[2];
  v8 = a2[3];
  v9 = (COERCE__INT64((double)*a2) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v6) + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v7) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v8) + 4095) >> 32);
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = (COERCE__INT64((double)*a2) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v6)
                                                                                          + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v7) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v8) + 4095) >> 32);
      if (v9 >= v10)
        v4 = v9 % v10;
    }
    else
    {
      v4 = v9 & (v10 - 1);
    }
    v12 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v12)
    {
      for (i = (_QWORD *)*v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2 && i[3] == v6 && i[4] == v7 && i[5] == v8)
            return;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10)
              v14 %= v10;
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  v15 = (__n128 *)operator new(0x38uLL);
  v15->n128_u64[0] = 0;
  v15->n128_u64[1] = v9;
  v15[1] = a3;
  v15[2] = a4;
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD *)a1;
  v23 = *(__n128 ***)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    v15->n128_u64[0] = (unint64_t)*v23;
LABEL_41:
    *v23 = v15;
    goto LABEL_42;
  }
  v15->n128_u64[0] = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v15;
  *(_QWORD *)(v22 + 8 * v4) = a1 + 16;
  if (v15->n128_u64[0])
  {
    v24 = *(_QWORD *)(v15->n128_u64[0] + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v24 >= v10)
        v24 %= v10;
    }
    else
    {
      v24 &= v10 - 1;
    }
    v23 = (__n128 **)(*(_QWORD *)a1 + 8 * v24);
    goto LABEL_41;
  }
LABEL_42:
  ++*(_QWORD *)(a1 + 24);
}

void sub_1A66B0188(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__node_insert_multi(uint64_t a1, uint64_t a2)
{
  int8x16_t v4;
  unint64_t v5;
  unint64_t v6;
  float v7;
  float v8;
  _BOOL8 v9;
  unint64_t v10;
  unint64_t v11;
  int8x8_t prime;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint8x8_t v18;
  unint64_t v19;
  uint8x8_t v20;
  uint64_t v21;
  _QWORD *i;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint8x8_t v26;
  unint64_t v27;
  _QWORD *v28;
  int v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  _BOOL4 v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;

  v4 = vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vaddq_s64((int64x2_t)vcvtq_f64_s64(*(int64x2_t *)(a2 + 24)), vdupq_n_s64(0xFFFuLL)), (uint64x2_t)xmmword_1A671A4B0), (int8x16_t)xmmword_1A671A4C0);
  v5 = v4.i64[0] ^ (COERCE__INT64((double)*(uint64_t *)(a2 + 16)) + 4095) & 0xFFFFFFFF00000000 ^ v4.i64[1] ^ ((unint64_t)(COERCE__INT64((double)*(uint64_t *)(a2 + 40)) + 4095) >> 32);
  *(_QWORD *)(a2 + 8) = v5;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 1;
    if (v6 >= 3)
      v9 = (v6 & (v6 - 1)) != 0;
    v10 = v9 | (2 * v6);
    v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11)
      prime = (int8x8_t)v11;
    else
      prime = (int8x8_t)v10;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v6 = *(_QWORD *)(a1 + 8);
    }
    if (*(_QWORD *)&prime > v6)
      goto LABEL_98;
    if (*(_QWORD *)&prime >= v6)
      goto LABEL_46;
    v19 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (v20 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      v19 = std::__next_prime(v19);
    }
    else
    {
      v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2)
        v19 = v21;
    }
    if (*(_QWORD *)&prime <= v19)
      prime = (int8x8_t)v19;
    if (*(_QWORD *)&prime >= v6)
    {
      v6 = *(_QWORD *)(a1 + 8);
      goto LABEL_46;
    }
    if (prime)
    {
LABEL_98:
      if (*(_QWORD *)&prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v13 = operator new(8 * *(_QWORD *)&prime);
      v14 = *(void **)a1;
      *(_QWORD *)a1 = v13;
      if (v14)
        operator delete(v14);
      v15 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v15++) = 0;
      while (*(_QWORD *)&prime != v15);
      v16 = *(_QWORD **)(a1 + 16);
      if (v16)
      {
        v17 = v16[1];
        v18 = (uint8x8_t)vcnt_s8(prime);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          if (v17 >= *(_QWORD *)&prime)
            v17 %= *(_QWORD *)&prime;
        }
        else
        {
          v17 &= *(_QWORD *)&prime - 1;
        }
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v17) = a1 + 16;
        for (i = (_QWORD *)*v16; *v16; i = (_QWORD *)*v16)
        {
          v23 = i[1];
          if (v18.u32[0] > 1uLL)
          {
            if (v23 >= *(_QWORD *)&prime)
              v23 %= *(_QWORD *)&prime;
          }
          else
          {
            v23 &= *(_QWORD *)&prime - 1;
          }
          if (v23 == v17)
          {
            v16 = i;
          }
          else
          {
            v24 = i;
            if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v23))
            {
              do
              {
                v25 = v24;
                v24 = (_QWORD *)*v24;
              }
              while (v24 && i[2] == v24[2] && i[3] == v24[3] && i[4] == v24[4] && i[5] == v24[5]);
              *v16 = v24;
              *v25 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v23);
              **(_QWORD **)(*(_QWORD *)a1 + 8 * v23) = i;
            }
            else
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v16;
              v16 = i;
              v17 = v23;
            }
          }
        }
      }
      v6 = (unint64_t)prime;
    }
    else
    {
      v37 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v37)
        operator delete(v37);
      v6 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
  }
LABEL_46:
  v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v26.i16[0] = vaddlv_u8(v26);
  if (v26.u32[0] > 1uLL)
  {
    v27 = v5;
    if (v6 <= v5)
      v27 = v5 % v6;
  }
  else
  {
    v27 = (v6 - 1) & v5;
  }
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v27);
  if (v28)
  {
    v29 = 0;
    do
    {
      v30 = v28;
      v28 = (_QWORD *)*v28;
      if (!v28)
        break;
      v31 = v28[1];
      if (v26.u32[0] > 1uLL)
      {
        v32 = v28[1];
        if (v31 >= v6)
          v32 = v31 % v6;
      }
      else
      {
        v32 = v31 & (v6 - 1);
      }
      if (v32 != v27)
        break;
      v33 = v31 == v5
         && v28[2] == *(_QWORD *)(a2 + 16)
         && v28[3] == *(_QWORD *)(a2 + 24)
         && v28[4] == *(_QWORD *)(a2 + 32)
         && v28[5] == *(_QWORD *)(a2 + 40);
      v34 = v29 & !v33;
      v29 |= v33;
    }
    while (v34 != 1);
  }
  else
  {
    v30 = 0;
  }
  v35 = *(_QWORD *)(a2 + 8);
  if (v26.u32[0] > 1uLL)
  {
    if (v35 >= v6)
      v35 %= v6;
  }
  else
  {
    v35 &= v6 - 1;
  }
  if (!v30)
  {
    *(_QWORD *)a2 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = a2;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v35) = a1 + 16;
    if (!*(_QWORD *)a2)
      goto LABEL_85;
    v36 = *(_QWORD *)(*(_QWORD *)a2 + 8);
    if (v26.u32[0] > 1uLL)
    {
      if (v36 >= v6)
        v36 %= v6;
    }
    else
    {
      v36 &= v6 - 1;
    }
LABEL_84:
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v36) = a2;
    goto LABEL_85;
  }
  *(_QWORD *)a2 = *v30;
  *v30 = a2;
  if (*(_QWORD *)a2)
  {
    v36 = *(_QWORD *)(*(_QWORD *)a2 + 8);
    if (v26.u32[0] > 1uLL)
    {
      if (v36 >= v6)
        v36 %= v6;
    }
    else
    {
      v36 &= v6 - 1;
    }
    if (v36 != v35)
      goto LABEL_84;
  }
LABEL_85:
  ++*(_QWORD *)(a1 + 24);
}

void NU::Region::breakRects(__n128 *a1, uint64_t *a2, uint64_t a3)
{
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;

  if (!NU::RectT<long>::intersects((uint64_t *)a1, a2))
  {
    v14 = *a1;
    v15 = a1[1];
    goto LABEL_11;
  }
  v6 = a1->n128_u64[0];
  v7 = a1->n128_i64[1];
  v20.n128_u64[0] = a1->n128_u64[0];
  v20.n128_u64[1] = v7;
  v9 = a1[1].n128_u64[0];
  v8 = a1[1].n128_u64[1];
  v21.n128_u64[0] = v9;
  v21.n128_u64[1] = v8;
  v10 = a2[1];
  if (v7 < v10)
  {
    v18.n128_u64[0] = v6;
    v18.n128_u64[1] = v7;
    v19.n128_u64[0] = v9;
    v19.n128_u64[1] = v8;
    NU::RectT<long>::setYMax((uint64_t *)&v18, v10);
    NU::RectT<long>::setYMin((uint64_t *)&v20, a2[1]);
    v16 = v18;
    v17 = v19;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v16, v18, v19);
    v8 = a1[1].n128_u64[1];
    v10 = a2[1];
    v6 = a1->n128_u64[0];
    v7 = a1->n128_i64[1];
  }
  v11 = a2[3] + v10;
  if ((uint64_t)(v8 + v7) > v11)
  {
    v18.n128_u64[0] = v6;
    v18.n128_u64[1] = v7;
    v19.n128_u64[0] = a1[1].n128_u64[0];
    v19.n128_u64[1] = v8;
    NU::RectT<long>::setYMin((uint64_t *)&v18, v11);
    NU::RectT<long>::setYMax((uint64_t *)&v20, a2[3] + a2[1]);
    v16 = v18;
    v17 = v19;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v16, v18, v19);
    v6 = a1->n128_u64[0];
  }
  v12 = *a2;
  if (v6 < *a2)
  {
    v18 = v20;
    v19 = v21;
    NU::RectT<long>::setXMax((uint64_t *)&v18, v12);
    v16 = v18;
    v17 = v19;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v16, v18, v19);
    v6 = a1->n128_u64[0];
    v12 = *a2;
  }
  v13 = a2[2] + v12;
  if ((int64_t)(a1[1].n128_u64[0] + v6) > v13)
  {
    v18 = v20;
    v19 = v21;
    NU::RectT<long>::setXMin((uint64_t *)&v18, v13);
    v14 = v18;
    v15 = v19;
LABEL_11:
    v16 = v14;
    v17 = v15;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v16, v14, v15);
  }
}

void std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect const&>(uint64_t a1, uint64_t *a2, __n128 a3, __n128 a4)
{
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  _QWORD *v12;
  _QWORD *i;
  unint64_t v14;
  __n128 *v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  __n128 **v23;
  unint64_t v24;

  v6 = a2[1];
  v7 = a2[2];
  v8 = a2[3];
  v9 = (COERCE__INT64((double)*a2) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v6) + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v7) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v8) + 4095) >> 32);
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = (COERCE__INT64((double)*a2) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v6)
                                                                                          + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v7) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v8) + 4095) >> 32);
      if (v9 >= v10)
        v4 = v9 % v10;
    }
    else
    {
      v4 = v9 & (v10 - 1);
    }
    v12 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v12)
    {
      for (i = (_QWORD *)*v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2 && i[3] == v6 && i[4] == v7 && i[5] == v8)
            return;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10)
              v14 %= v10;
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  v15 = (__n128 *)operator new(0x38uLL);
  v15->n128_u64[0] = 0;
  v15->n128_u64[1] = v9;
  v15[1] = a3;
  v15[2] = a4;
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD *)a1;
  v23 = *(__n128 ***)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    v15->n128_u64[0] = (unint64_t)*v23;
LABEL_41:
    *v23 = v15;
    goto LABEL_42;
  }
  v15->n128_u64[0] = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v15;
  *(_QWORD *)(v22 + 8 * v4) = a1 + 16;
  if (v15->n128_u64[0])
  {
    v24 = *(_QWORD *)(v15->n128_u64[0] + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v24 >= v10)
        v24 %= v10;
    }
    else
    {
      v24 &= v10 - 1;
    }
    v23 = (__n128 **)(*(_QWORD *)a1 + 8 * v24);
    goto LABEL_41;
  }
LABEL_42:
  ++*(_QWORD *)(a1 + 24);
}

void sub_1A66B0A48(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL NU::Region::includes(NU::Region *a1, __n128 *a2)
{
  _BOOL8 v3;
  _BYTE v5[40];

  NU::Region::Region((uint64_t)v5, a2);
  v3 = NU::Region::includes(a1, (const NU::Region *)v5);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v5);
  return v3;
}

void sub_1A66B0AA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::Region(uint64_t a1, __n128 *a2)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  __n128 v7;
  __n128 v8;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  v3 = a2[1].n128_u64[0];
  v4 = a2[1].n128_u64[1];
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v7 = *a2;
    v8.n128_u64[0] = v3;
    v8.n128_u64[1] = v4;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a1, (uint64_t *)&v7, v7, v8);
  }
  return a1;
}

void sub_1A66B0B1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::intersects(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    v3 = (_QWORD *)(a2 + 16);
    do
    {
      v4 = v3;
      while (1)
      {
        v4 = (_QWORD *)*v4;
        if (!v4)
          break;
        if (NU::RectT<long>::intersects(v4 + 2, v2 + 2))
          return 1;
      }
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t NU::Region::intersects(uint64_t a1, __n128 *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  NU::Region::Region((uint64_t)v5, a2);
  v3 = NU::Region::intersects(a1, (uint64_t)v5);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v5);
  return v3;
}

void NU::Region::getBounds(NU::Region *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t *i;
  __int128 v4;
  _OWORD v5[3];

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  for (i = (uint64_t *)*((_QWORD *)this + 2); i; i = (uint64_t *)*i)
  {
    v4 = *((_OWORD *)i + 2);
    v5[0] = *((_OWORD *)i + 1);
    v5[1] = v4;
    NU::RectT<long>::add((uint64_t *)a2, (uint64_t *)v5);
  }
}

BOOL std::operator==[abi:ne180100]<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  int8x8_t v3;
  uint64_t v4;
  uint8x8_t v5;
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;

  if (*(_QWORD *)(a1 + 24) != a2[3])
    return 0;
  v2 = (_QWORD *)(a1 + 16);
  v4 = *a2;
  v3 = (int8x8_t)a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  v6 = *(_QWORD *)&v3 - 1;
LABEL_3:
  v2 = (_QWORD *)*v2;
  result = v2 == 0;
  if (v2)
  {
    if (v3)
    {
      v8 = v2[2];
      v9 = v2[3];
      v10 = v2[4];
      v11 = v2[5];
      v12 = (COERCE__INT64((double)v8) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v9)
                                                                                          + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v10) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v11) + 4095) >> 32);
      if (v5.u32[0] > 1uLL)
      {
        v13 = (COERCE__INT64((double)v8) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v9)
                                                                                            + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v10) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v11) + 4095) >> 32);
        if (v12 >= *(_QWORD *)&v3)
          v13 = v12 % *(_QWORD *)&v3;
      }
      else
      {
        v13 = v12 & v6;
      }
      v14 = *(_QWORD **)(v4 + 8 * v13);
      if (v14)
      {
        while (1)
        {
          v14 = (_QWORD *)*v14;
          if (!v14)
            break;
          v15 = v14[1];
          if (v12 == v15)
          {
            if (v14[2] == v8 && v14[3] == v9 && v14[4] == v10 && v14[5] == v11)
              goto LABEL_3;
          }
          else
          {
            if (v5.u32[0] > 1uLL)
            {
              if (v15 >= *(_QWORD *)&v3)
                v15 %= *(_QWORD *)&v3;
            }
            else
            {
              v15 &= v6;
            }
            if (v15 != v13)
              return 0;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t NU::Region::getHash(NU::Region *this)
{
  uint64_t *v1;
  uint64_t result;
  int64x2_t v3;
  int8x16_t v4;

  v1 = (uint64_t *)*((_QWORD *)this + 2);
  if (!v1)
    return 0;
  result = 0;
  v3 = vdupq_n_s64(0xFFFuLL);
  do
  {
    v4 = vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vaddq_s64((int64x2_t)vcvtq_f64_s64(*(int64x2_t *)(v1 + 3)), v3), (uint64x2_t)xmmword_1A671A4B0), (int8x16_t)xmmword_1A671A4C0);
    result ^= 0x1D92AD94BE7929
            * (v4.i64[0] ^ (COERCE__INT64((double)v1[2]) + 4095) & 0xFFFFFFFF00000000 ^ v4.i64[1] ^ ((unint64_t)(COERCE__INT64((double)v1[5]) + 4095) >> 32));
    v1 = (uint64_t *)*v1;
  }
  while (v1);
  return result;
}

void sub_1A66B0FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A66B1234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66B14D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66B1750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66B19E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t NU::Region::applyAffineTransform(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  __n128 *i;
  __n128 v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  __int128 v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  __n128 v22;
  __n128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  CGAffineTransform v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v24 = 0u;
  v25 = 0u;
  v26 = 1065353216;
  for (i = *(__n128 **)(a1 + 16); i; i = (__n128 *)i->n128_u64[0])
  {
    v7 = i[2];
    v8 = (double)i[1].n128_i64[0];
    v9 = (double)i[1].n128_i64[1];
    v10 = i[2].n128_i64[1];
    v22 = i[1];
    v23 = v7;
    v11 = (double)v7.n128_i64[0];
    v7.n128_f64[0] = (double)v10;
    v12 = a2[1];
    *(_OWORD *)&v27.a = *a2;
    *(_OWORD *)&v27.c = v12;
    *(_OWORD *)&v27.tx = a2[2];
    v28 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v7 - 24), &v27);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
    MinX = CGRectGetMinX(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    MinY = CGRectGetMinY(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MaxX = CGRectGetMaxX(v30);
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    MaxY = CGRectGetMaxY(v31);
    NU::RectT<long>::setXYMinMax(&v22, a3, MinX, MinY, MaxX, MaxY);
    *(__n128 *)&v27.a = v22;
    *(__n128 *)&v27.c = v23;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>((uint64_t)&v24, (uint64_t *)&v27, v22, v23);
  }
  if (&v24 != (__int128 *)a1)
  {
    *(_DWORD *)(a1 + 32) = v26;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>((_QWORD *)a1, (uint64_t *)v25);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v24);
}

void sub_1A66B1BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::applyOrientation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 *i;
  __n128 v9;
  _OWORD v11[3];
  __n128 v12;
  __n128 v13;
  __int128 v14;
  __int128 v15;
  int v16;

  v14 = 0u;
  v15 = 0u;
  v16 = 1065353216;
  for (i = *(__n128 **)(a1 + 16); i; i = (__n128 *)i->n128_u64[0])
  {
    v9 = i[2];
    v12 = i[1];
    v13 = v9;
    NU::RectT<long>::applyOrientation((uint64_t *)&v12, a2, a3, a4);
    v11[0] = v12;
    v11[1] = v13;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>((uint64_t)&v14, (uint64_t *)v11, v12, v13);
  }
  if (&v14 != (__int128 *)a1)
  {
    *(_DWORD *)(a1 + 32) = v16;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>((_QWORD *)a1, (uint64_t *)v15);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v14);
}

void sub_1A66B1C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::shrinkInRect(__n128 *a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned __int32 v19;
  __n128 v20[2];

  NU::Region::Region((uint64_t)v20, a4);
  NU::Region::breakRects((uint64_t)a1, v20);
  NU::Region::mergeRectsVertically((NU::Region *)v20);
  NU::Region::grow((NU::Region *)v20, a2, a3);
  NU::Region::Region((uint64_t)&v15, a4);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::clear(a1);
  v8 = v15;
  v15 = 0;
  v9 = (void *)a1->n128_u64[0];
  a1->n128_u64[0] = v8;
  if (v9)
    operator delete(v9);
  v10 = v16;
  v11 = v17;
  a1[1].n128_u64[0] = v17;
  a1->n128_u64[1] = v10;
  v16 = 0;
  v12 = v18;
  a1[1].n128_u64[1] = v18;
  a1[2].n128_u32[0] = v19;
  if (v12)
  {
    v13 = *(_QWORD *)(v11 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v13 >= v10)
        v13 %= v10;
    }
    else
    {
      v13 &= v10 - 1;
    }
    *(_QWORD *)(a1->n128_u64[0] + 8 * v13) = a1 + 1;
    v17 = 0;
    v18 = 0;
  }
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v15);
  NU::Region::breakRects((uint64_t)v20, a1);
  NU::Region::mergeRectsVertically((NU::Region *)a1);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v20);
}

void sub_1A66B1E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::grow(NU::Region *this, uint64_t a2, uint64_t a3)
{
  __n128 *i;
  __n128 v7;
  __n128 v9[2];
  _BYTE v10[16];
  __n128 *v11;

  std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set((uint64_t)v10, (uint64_t)this);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::clear(this);
  for (i = v11; i; i = (__n128 *)i->n128_u64[0])
  {
    v7 = i[2];
    v9[0] = i[1];
    v9[1] = v7;
    NU::RectT<long>::grow((uint64_t *)v9, a2, a3);
    NU::Region::add(this, v9);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v10);
}

void sub_1A66B1E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t NU::Region::add(NU::Region *a1, __n128 *a2)
{
  _BYTE v4[40];

  NU::Region::Region((uint64_t)v4, a2);
  NU::Region::add(a1, (const NU::Region *)v4);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1A66B1F54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::add(NU::Region *this, const NU::Region *a2)
{
  __n128 v4[2];

  std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set((uint64_t)v4, (uint64_t)a2);
  NU::Region::breakRects((uint64_t)this, v4);
  NU::Region::mergeRects(this, v4);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1A66B1FB4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::mergeRects(NU::Region *this, _QWORD *a2)
{
  __n128 *v4;
  __n128 v5;
  __n128 v7[2];

  while (a2[3])
  {
    v4 = (__n128 *)a2[2];
    v5 = v4[2];
    v7[0] = v4[1];
    v7[1] = v5;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::erase(a2, (uint64_t *)v4);
    NU::Region::mergeRectsHorizontally((uint64_t)this, v7, (uint64_t)a2);
  }
  return NU::Region::mergeRectsVertically(this);
}

void NU::Region::mergeRectsHorizontally(uint64_t a1, __n128 *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  __n128 v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;

  v5 = (_QWORD *)a1;
  v6 = (uint64_t *)(a1 + 16);
  do
  {
    v6 = (uint64_t *)*v6;
    if (!v6)
    {
      v19 = a2[1];
      v27 = *a2;
      v28 = v19;
      std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>((uint64_t)v5, (uint64_t *)&v27, v27, v19);
      return;
    }
    LODWORD(a1) = NU::RectPartialHorizontallyAdjacentTo::operator()(a1, a2, v6 + 2);
  }
  while (!(_DWORD)a1);
  v29 = 0u;
  v30 = 0u;
  v7 = v6[2];
  if (v7 >= (int64_t)a2->n128_u64[0])
    v8 = a2->n128_u64[0];
  else
    v8 = v6[2];
  v9 = v6[4] + v7;
  if ((int64_t)(a2[1].n128_u64[0] + a2->n128_u64[0]) <= v9)
    v10 = v9;
  else
    v10 = a2[1].n128_u64[0] + a2->n128_u64[0];
  NU::RectT<long>::setXMinMax(&v29, v8, v10);
  v11 = a2->n128_i64[1];
  v12 = v6[3];
  if (v11 <= v12)
    v13 = v6[3];
  else
    v13 = a2->n128_i64[1];
  v14 = a2[1].n128_u64[1] + v11;
  v15 = v6[5] + v12;
  if (v15 >= v14)
    v16 = v14;
  else
    v16 = v15;
  NU::RectT<long>::setYMinMax((uint64_t)&v29, v13, v16);
  v27 = v29;
  v28 = v30;
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v27, v29, v30);
  v17 = a2->n128_i64[1];
  v18 = v6[3];
  if (v17 >= v18)
  {
    if (v17 <= v18)
      goto LABEL_22;
    v25.n128_u64[0] = v6[2];
    v25.n128_u64[1] = v18;
    v26 = *((__n128 *)v6 + 2);
  }
  else
  {
    v25.n128_u64[0] = a2->n128_u64[0];
    v25.n128_u64[1] = v17;
    v26 = a2[1];
    v17 = v18;
  }
  NU::RectT<long>::setYMax((uint64_t *)&v25, v17);
  v27 = v25;
  v28 = v26;
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v27, v25, v26);
LABEL_22:
  v20 = a2->n128_u64[1];
  v21 = a2[1].n128_u64[1];
  v22 = v21 + v20;
  v23 = v6[3];
  v24 = v6[5];
  if ((uint64_t)(v21 + v20) < (uint64_t)(v24 + v23))
  {
    v25.n128_u64[0] = v6[2];
    v25.n128_u64[1] = v23;
    v26.n128_u64[0] = v6[4];
    v26.n128_u64[1] = v24;
LABEL_26:
    NU::RectT<long>::setYMin((uint64_t *)&v25, v22);
    v27 = v25;
    v28 = v26;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v27, v25, v26);
    goto LABEL_27;
  }
  if ((uint64_t)(v21 + v20) > (uint64_t)(v24 + v23))
  {
    v25.n128_u64[0] = a2->n128_u64[0];
    v25.n128_u64[1] = v20;
    v26.n128_u64[0] = a2[1].n128_u64[0];
    v26.n128_u64[1] = v21;
    v22 = v24 + v23;
    goto LABEL_26;
  }
LABEL_27:
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::erase(v5, v6);
}

BOOL NU::RectPartialHorizontallyAdjacentTo::operator()(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((a2[2] + *a2 == *a3 || *a2 == a3[2] + *a3) && (v3 = a2[1], v4 = a3[1], v3 < a3[3] + v4))
    return a2[3] + v3 > v4;
  else
    return 0;
}

uint64_t NU::Region::shrink(NU::Region *this, uint64_t a2, uint64_t a3)
{
  _OWORD v7[2];
  __n128 v8[2];

  NU::Region::getBounds(this, (uint64_t)v7);
  v8[0] = (__n128)v7[0];
  v8[1] = (__n128)v7[1];
  NU::RectT<long>::grow((uint64_t *)v8, a2, a3);
  return NU::Region::shrinkInRect((__n128 *)this, a2, a3, v8);
}

uint64_t NU::Region::clip(NU::Region *a1, __n128 *a2)
{
  _BYTE v4[40];

  NU::Region::Region((uint64_t)v4, a2);
  NU::Region::clip(a1, (const NU::Region *)v4);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1A66B22E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::clip(NU::Region *this, const NU::Region *a2)
{
  _QWORD *i;
  _QWORD *j;
  BOOL v6;
  _OWORD v8[3];
  __n128 v9;
  __n128 v10;
  __int128 v11;
  __int128 v12;
  int v13;

  v11 = 0u;
  v12 = 0u;
  v13 = 1065353216;
  for (i = (_QWORD *)*((_QWORD *)this + 2); i; i = (_QWORD *)*i)
  {
    for (j = (_QWORD *)*((_QWORD *)a2 + 2); j; j = (_QWORD *)*j)
    {
      NU::RectT<long>::Intersection((uint64_t)&v9, i + 2, j + 2);
      if (v10.n128_u64[0])
        v6 = v10.n128_u64[1] == 0;
      else
        v6 = 1;
      if (!v6)
      {
        v8[0] = v9;
        v8[1] = v10;
        std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>((uint64_t)&v11, (uint64_t *)v8, v9, v10);
      }
    }
  }
  if (&v11 != (__int128 *)this)
  {
    *((_DWORD *)this + 8) = v13;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(this, (uint64_t *)v12);
  }
  NU::Region::mergeRectsVertically(this);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v11);
}

void sub_1A66B23D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *NU::Region::scale(uint64_t a1, uint64_t a2, double a3, double a4)
{
  __n128 *i;
  __n128 v9;
  __n128 v11;
  __n128 v12;
  __int128 v13;
  __int128 v14;
  int v15;

  if (a3 == 0.0 || a4 == 0.0)
    return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::clear((_QWORD *)a1);
  v13 = 0u;
  v14 = 0u;
  v15 = 1065353216;
  for (i = *(__n128 **)(a1 + 16); i; i = (__n128 *)i->n128_u64[0])
  {
    v9 = i[2];
    v11 = i[1];
    v12 = v9;
    NU::RectT<long>::scale((uint64_t *)&v11, a2, a3, a4);
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect const&>((uint64_t)&v13, (uint64_t *)&v11, v11, v12);
  }
  if (&v13 != (__int128 *)a1)
  {
    *(_DWORD *)(a1 + 32) = v15;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>((_QWORD *)a1, (uint64_t *)v14);
  }
  return (_QWORD *)std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v13);
}

void sub_1A66B24D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::translate(NU::Region *this, uint64_t a2, uint64_t a3)
{
  __n128 *i;
  unint64_t v7;
  unint64_t v8;
  __n128 v10;
  __n128 v11;
  __int128 v12;
  __int128 v13;
  int v14;

  v12 = 0u;
  v13 = 0u;
  v14 = 1065353216;
  for (i = (__n128 *)*((_QWORD *)this + 2); i; i = (__n128 *)i->n128_u64[0])
  {
    v7 = i[1].n128_u64[0];
    v8 = i[1].n128_u64[1];
    v11 = i[2];
    v10.n128_u64[0] = v7 + a2;
    v10.n128_u64[1] = v8 + a3;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect const&>((uint64_t)&v12, (uint64_t *)&v10, v10, v11);
  }
  if (&v12 != (__int128 *)this)
  {
    *((_DWORD *)this + 8) = v14;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(this, (uint64_t *)v13);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v12);
}

void sub_1A66B258C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::flipInRect(uint64_t a1, _QWORD *a2)
{
  _QWORD *i;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __n128 v11;
  __n128 v12;
  __int128 v13;
  __int128 v14;
  int v15;

  v13 = 0u;
  v14 = 0u;
  v15 = 1065353216;
  for (i = *(_QWORD **)(a1 + 16); i; i = (_QWORD *)*i)
  {
    v5 = i[3];
    v6 = a2[1];
    v7 = i[2] - *a2;
    v8 = i[5];
    v12.n128_u64[0] = i[4];
    v12.n128_u64[1] = v8;
    v9 = v6 - (v8 + v5) + a2[3];
    v11.n128_u64[0] = v7;
    v11.n128_u64[1] = v9;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect const&>((uint64_t)&v13, (uint64_t *)&v11, v11, v12);
  }
  if (&v13 != (__int128 *)a1)
  {
    *(_DWORD *)(a1 + 32) = v15;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>((_QWORD *)a1, (uint64_t *)v14);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v13);
}

void sub_1A66B2654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::diff(__n128 *this, const NU::Region *a2)
{
  __n128 v5[2];

  std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set((uint64_t)v5, (uint64_t)a2);
  NU::Region::breakRects((uint64_t)this, v5);
  NU::Region::breakRects((uint64_t)a2, this);
  NU::Region::mergeRects((NU::Region *)this, v5);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v5);
}

void sub_1A66B26C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::diff(__n128 *a1, __n128 *a2)
{
  _BYTE v4[40];

  NU::Region::Region((uint64_t)v4, a2);
  NU::Region::diff(a1, (const NU::Region *)v4);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1A66B271C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::remove(__n128 *a1, __n128 *a2)
{
  _BYTE v4[40];

  NU::Region::Region((uint64_t)v4, a2);
  NU::Region::breakRects((uint64_t)v4, a1);
  NU::Region::mergeRectsVertically((NU::Region *)a1);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1A66B2778(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A66B27EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1A66B288C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B28DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66B2990(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B29E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66B2A44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2A9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66B2AF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2B50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66B2BB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2C04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2C54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2CBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2D0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2D74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2DCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2E34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2E84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B2F24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66B34D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A66B3608(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t NU::hash(NU *this, double a2)
{
  return (*(_QWORD *)&a2 + 4095) & 0xFFFFFFFFFFFFF000;
}

unint64_t NU::RectHash::operator()(uint64_t a1, uint64_t a2)
{
  int8x16_t v2;

  v2 = vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vaddq_s64((int64x2_t)vcvtq_f64_s64(*(int64x2_t *)(a2 + 8)), vdupq_n_s64(0xFFFuLL)), (uint64x2_t)xmmword_1A671A4B0), (int8x16_t)xmmword_1A671A4C0);
  return v2.i64[0] ^ (COERCE__INT64((double)*(uint64_t *)a2) + 4095) & 0xFFFFFFFF00000000 ^ v2.i64[1] ^ ((unint64_t)(COERCE__INT64((double)*(uint64_t *)(a2 + 24)) + 4095) >> 32);
}

BOOL NU::RectEqualTo::operator()(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  return *a2 == *a3 && a2[1] == a3[1] && a2[2] == a3[2] && a2[3] == a3[3];
}

BOOL NU::RectStrictHorizontallyAdjacentTo::operator()(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  return (a2[2] + *a2 == *a3 || *a2 == a3[2] + *a3) && a2[1] == a3[1] && a2[3] == a3[3];
}

BOOL NU::RectStrictVerticallyAdjacentTo::operator()(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a3[1];
  return (a2[3] + v3 == v4 || v3 == a3[3] + v4) && *a2 == *a3 && a2[2] == a3[2];
}

double NU::Region::getArea(NU::Region *this)
{
  _QWORD *v1;
  double result;

  v1 = (_QWORD *)*((_QWORD *)this + 2);
  if (!v1)
    return 0.0;
  result = 0.0;
  do
  {
    result = result + (double)(uint64_t)(v1[5] * v1[4]);
    v1 = (_QWORD *)*v1;
  }
  while (v1);
  return result;
}

uint64_t NU::Region::remove(__n128 *this, const NU::Region *a2)
{
  NU::Region::breakRects((uint64_t)a2, this);
  return NU::Region::mergeRectsVertically((NU::Region *)this);
}

uint64_t NU::Region::growInRect(NU::Region *a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  NU::Region::grow(a1, a2, a3);
  return NU::Region::clip(a1, a4);
}

id NUAssertLogger_20294()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20310);
  return (id)_NUAssertLogger;
}

const __CFString *NUSettingTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("???");
  else
    return off_1E50633E8[a1 - 1];
}

void sub_1A66C08C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_20896()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20909);
  return (id)_NUAssertLogger;
}

uint64_t NUIsPixelBufferProbablyAllZeros(__CVBuffer *a1)
{
  NSObject *v2;
  char v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v8[20];
  int v9;
  int v10;
  int v11;

  if (CVPixelBufferLockBaseAddress(a1, 1uLL))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_82_20959);
    v2 = _NULogger;
    v3 = 0;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6553000, v2, OS_LOG_TYPE_DEFAULT, "NUIsPixelBufferProbablyAllZeros could not lock CVPixelBufferRef.", v8, 2u);
      v3 = 0;
    }
  }
  else
  {
    v11 = 0;
    v9 = 0;
    v10 = 0;
    *(_QWORD *)v8 = 0;
    v3 = 0;
    if (NUCVBufferGeometry(a1, &v11, &v10, &v9, v8))
    {
      if (v10 < 1)
      {
        v3 = 1;
      }
      else
      {
        v4 = 0;
        v5 = *(_QWORD *)v8;
        v3 = 1;
        do
        {
          if (v11 >= 1)
          {
            v6 = 0;
            while (v6 >= v10 * (uint64_t)v9 || !*(_BYTE *)(v5 + v6))
            {
              if (v11 == ++v6)
                goto LABEL_16;
            }
            v3 = 0;
          }
LABEL_16:
          v4 += 100;
          v5 += 100 * v9;
        }
        while (v4 < v10);
      }
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  }
  return v3 & 1;
}

BOOL NUCVBufferGeometry(__CVBuffer *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _QWORD *a5)
{
  void *BaseAddressOfPlane;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];

  if (CVPixelBufferIsPlanar(a1))
  {
    *a2 = CVPixelBufferGetWidthOfPlane(a1, 1uLL);
    *a3 = CVPixelBufferGetHeightOfPlane(a1, 1uLL);
    *a4 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
  }
  else
  {
    *a2 = CVPixelBufferGetWidth(a1);
    *a3 = CVPixelBufferGetHeight(a1);
    *a4 = CVPixelBufferGetBytesPerRow(a1);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddress(a1);
  }
  v11 = BaseAddressOfPlane;
  *a5 = BaseAddressOfPlane;
  if (!BaseAddressOfPlane)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_82_20959);
    v12 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A6553000, v12, OS_LOG_TYPE_DEFAULT, "NUCVBufferGeometry couldn't get address of plane.", v14, 2u);
    }
  }
  return v11 != 0;
}

uint64_t NUDebugWatermarkCVPixelBuffer(__CVBuffer *a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t result;
  const char *v7;
  uint8_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  uint64_t v39;
  _BYTE buf[12];
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a2 >= 10)
  {
    NUAssertLogger_20896();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "numRectangles < MAX_RECTS");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_20896();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v28;
        v41 = 2114;
        v42 = v32;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"BOOL NUDebugWatermarkCVPixelBuffer(CVPixelBufferRef _Nonnull, int)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUCVPixelBuffer.m", 154, CFSTR("Invalid parameter not satisfying: %s"), v33, v34, v35, v36, (uint64_t)"numRectangles < MAX_RECTS");
  }
  if (CVPixelBufferLockBaseAddress(a1, 0))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_82_20959);
    v4 = _NULogger;
    v5 = os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v5)
    {
      *(_WORD *)buf = 0;
      v7 = "NUDebugWatermarkCVPixelBuffer could not lock CVPixelBufferRef.";
      v8 = buf;
LABEL_7:
      _os_log_impl(&dword_1A6553000, v4, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      return 0;
    }
    return result;
  }
  v39 = 0;
  *(_QWORD *)buf = 0;
  v38 = 0;
  if (!NUCVBufferGeometry(a1, (_DWORD *)&v39 + 1, &v39, &v38, buf))
  {
    CVPixelBufferUnlockBaseAddress(a1, 0);
    return 0;
  }
  if (a2 < 1)
  {
LABEL_20:
    CVPixelBufferUnlockBaseAddress(a1, 0);
    return 1;
  }
  if (SHIDWORD(v39) >= 210)
  {
    v9 = 0;
    v10 = 0;
    v11 = v38;
    v12 = v39;
    v13 = (int)v39 * (uint64_t)v38;
    v14 = SHIDWORD(v39) / 10;
    v15 = ((int)v39 / 8);
    v16 = *(_QWORD *)buf;
    do
    {
      if (v12 > 7)
      {
        v17 = 0;
        v18 = v16;
        do
        {
          v19 = v10;
          do
          {
            if (v19 < v13)
              *(_BYTE *)(v18 + v19) = -1;
            ++v19;
          }
          while (v19 < v14 - 20 + v9 * v14);
          ++v17;
          v18 += v11;
        }
        while (v17 != v15);
      }
      ++v9;
      v10 += v14;
    }
    while (v9 != a2);
    goto LABEL_20;
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_82_20959);
  v4 = _NULogger;
  v20 = os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v20)
  {
    v37 = 0;
    v7 = "NUDebugWatermarkCVPixelBuffer buffer too small.";
    v8 = (uint8_t *)&v37;
    goto LABEL_7;
  }
  return result;
}

id NUAssertLogger_20995()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21010);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_21151()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21175);
  return (id)_NUAssertLogger;
}

void sub_1A66C5680(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A66C5D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A66C62B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66C6748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66C6900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A66C72C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32)
{
  void *v32;
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

void sub_1A66C7564(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::default_delete<NU::Histogram<long,double>>::operator()[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(_QWORD *)(a1 + 24) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1A85C0F94);
}

__n128 __Block_byref_object_copy__95(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__96(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void NU::Histogram<long,double>::Kernel::box(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  void *__p;
  _BYTE *v6;

  if ((a2 & 0x8000000000000001) != 1)
    __assert_rtn("box", "Histogram.hpp", 292, "size % 2 == 1");
  v4 = 1;
  std::vector<long>::vector(&__p, a2, &v4);
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(a1, __p, (uint64_t)v6, (v6 - (_BYTE *)__p) >> 3);
  a1[3] = a2;
  if (__p)
  {
    v6 = __p;
    operator delete(__p);
  }
}

void sub_1A66C7700(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZNK2NU9HistogramIldE16modalityAnalysisEmRKdS3_RU15__autoreleasingKU13block_pointerFllE_block_invoke(_QWORD *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  char *v25;
  char *v26;
  _OWORD *v27;
  __int128 v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  int64_t v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;

  v2 = a1[7] - a1[6];
  v3 = v2 >> 3;
  if (v2 >> 3 >= 0)
    v4 = v2 >> 3;
  else
    v4 = v3 + 1;
  if (v3 != (v4 | 1))
    __assert_rtn("sample", "Histogram.hpp", 376, "n == 2*k+1");
  v7 = a1[9];
  if (v2 < 1)
  {
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = a1[10];
    if (v3 <= 1)
      v11 = 1;
    else
      v11 = v2 >> 3;
    do
      v9 += *(_QWORD *)(a1[6] + 8 * v8++) * (*(uint64_t (**)(void))(*(_QWORD *)v10 + 16))();
    while (v11 != v8);
  }
  if (v7 >= 0)
    v12 = v7;
  else
    v12 = v7 + 1;
  v13 = *(_QWORD *)(a2 + 8);
  if (v13 - (v9 + (v12 >> 1)) / v7 >= a1[11])
  {
    v14 = *(_QWORD **)(a1[4] + 8);
    v16 = (char *)v14[6];
    v15 = (char *)v14[7];
    v17 = v15 - v16;
    if (v15 == v16)
    {
      v19 = (char *)v14[7];
    }
    else
    {
      v18 = v17 >> 4;
      v19 = (char *)v14[6];
      do
      {
        v20 = v18 >> 1;
        v21 = &v19[16 * (v18 >> 1)];
        v22 = *((_QWORD *)v21 + 1);
        v23 = v21 + 16;
        v18 += ~(v18 >> 1);
        if (v13 > v22)
          v18 = v20;
        else
          v19 = v23;
      }
      while (v18);
    }
    v24 = v14[8];
    if ((unint64_t)v15 >= v24)
    {
      v29 = (v17 >> 4) + 1;
      if (v29 >> 60)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v30 = v19 - v16;
      v31 = (v19 - v16) >> 4;
      v32 = v24 - (_QWORD)v16;
      v33 = (uint64_t)(v24 - (_QWORD)v16) >> 3;
      if (v33 > v29)
        v29 = v33;
      if (v32 >= 0x7FFFFFFFFFFFFFF0)
        v34 = 0xFFFFFFFFFFFFFFFLL;
      else
        v34 = v29;
      if (v34)
      {
        v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NU::Histogram<long,double>::Sample>>(v34);
      }
      else
      {
        v36 = 0;
        v35 = 0;
      }
      v37 = &v36[16 * v31];
      v38 = &v36[16 * v35];
      if (v31 == v35)
      {
        if (v30 < 1)
        {
          if (v19 == v16)
            v40 = 1;
          else
            v40 = v30 >> 3;
          v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NU::Histogram<long,double>::Sample>>(v40);
          v37 = &v41[16 * (v40 >> 2)];
          v38 = &v41[16 * v42];
          if (v36)
            operator delete(v36);
        }
        else
        {
          v39 = v31 + 2;
          if (v31 >= -1)
            v39 = v31 + 1;
          v37 -= 16 * (v39 >> 1);
        }
      }
      *(_OWORD *)v37 = *(_OWORD *)a2;
      v43 = (char *)v14[6];
      v44 = v37;
      if (v43 != v19)
      {
        v45 = v19;
        v46 = v37;
        do
        {
          v44 = v46 - 16;
          *((_OWORD *)v46 - 1) = *((_OWORD *)v45 - 1);
          v45 -= 16;
          v46 -= 16;
        }
        while (v45 != v43);
      }
      v47 = (char *)v14[7];
      v48 = v47 - v19;
      if (v47 != v19)
        memmove(v37 + 16, v19, v47 - v19);
      v49 = (void *)v14[6];
      v14[6] = v44;
      v14[7] = &v37[v48 + 16];
      v14[8] = v38;
      if (v49)
        operator delete(v49);
    }
    else if (v19 == v15)
    {
      *(_OWORD *)v15 = *(_OWORD *)a2;
      v14[7] = v15 + 16;
    }
    else
    {
      v25 = v19 + 16;
      v26 = v15 - 16;
      v27 = (_OWORD *)v14[7];
      while (v26 < v15)
      {
        v28 = *(_OWORD *)v26;
        v26 += 16;
        *v27++ = v28;
      }
      v14[7] = v27;
      if (v15 != v25)
        memmove(&v15[-16 * ((v15 - v25) >> 4)], v19, v15 - v25);
      if ((unint64_t)v19 <= a2)
        a2 += 16 * (v14[7] > a2);
      *(_OWORD *)v19 = *(_OWORD *)a2;
    }
    v50 = a1[12];
    while (1)
    {
      v51 = *(_QWORD *)(a1[4] + 8);
      v54 = *(_QWORD *)(v51 + 56);
      v52 = (_QWORD *)(v51 + 56);
      v53 = v54;
      if (v50 >= (v54 - *(v52 - 1)) >> 4)
        break;
      *v52 = v53 - 16;
    }
  }
}

void sub_1A66C7A84(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<long>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A66C7AF8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void NU::Histogram<long,double>::findAllModes(uint64_t a1, uint64_t *a2, void *a3)
{
  void (**v5)(id, _QWORD *);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  int v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;

  v5 = a3;
  v7 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v8 = (*(uint64_t (**)(void))(*a2 + 16))();
  v9 = (*(uint64_t (**)(void))(*a2 + 16))();
  v10 = (v6 - v7) >> 3;
  v11 = v8 - v9;
  v12 = v8 == v9;
  v32 = v10;
  if (v6 - v7 < 0)
  {
    v33 = -2;
    if (v8 != v9)
      goto LABEL_39;
    goto LABEL_31;
  }
  v13 = 0;
  v14 = (v10 & ~(v10 >> 63)) + 1;
  v33 = -2;
  v15 = v8;
  do
  {
    v8 = (*(uint64_t (**)(void))(*a2 + 16))();
    v16 = v8 - v15;
    if (v11 >= 1 && v16 < 0)
    {
      if (v13)
      {
        v17 = *(double *)(a1 + 8);
        v18 = (v17 - *(double *)a1) / (double)((uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3);
        v19 = *(double *)a1 + (double)(v13 - 1) * v18 + (double)v11 / (double)(v11 - v16) * v18;
        if (*(double *)a1 >= v19)
          v19 = *(double *)a1;
        if (v17 < v19)
          v19 = *(double *)(a1 + 8);
        v34 = v19;
        v35 = v15;
        ((void (**)(id, double *))v5)[2](v5, &v34);
      }
    }
    else if (v11 < 1 || v16)
    {
      if (v11 | v16)
      {
        if (v11)
          v20 = 0;
        else
          v20 = v16 < 0;
        v21 = v20;
        if (v13 && (v21 & v12) != 0 && v13 - v33 < (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3)
        {
          v22 = NU::Histogram<long,double>::sample(a1, *a2, (double)(v33 + v13) * 0.5);
          v34 = v23;
          v35 = v24;
          ((void (*)(void (**)(id, _QWORD *), double *, double))v5[2])(v5, &v34, v22);
        }
        v12 = 0;
      }
      else
      {
        v16 = 0;
        v8 = v15;
      }
    }
    else
    {
      v33 = v13 - 1;
      v12 = 1;
    }
    ++v13;
    v11 = v16;
    v15 = v8;
  }
  while (v14 != v13);
  if (v12)
  {
LABEL_31:
    v25 = (*(uint64_t (**)(void))(*a2 + 16))();
    if (v25 == v8)
    {
      v26 = *(double *)(a1 + 8);
      v27 = (v26 - *(double *)a1) / (double)((uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3);
      v28 = *(double *)a1 + (double)v32 * v27 + v27 * 0.0;
      if (*(double *)a1 >= v28)
        v28 = *(double *)a1;
      if (v26 < v28)
        v28 = *(double *)(a1 + 8);
      v34 = v28;
      v35 = v8;
      ((void (**)(id, double *))v5)[2](v5, &v34);
    }
    else if (v25 < v8)
    {
      v29 = NU::Histogram<long,double>::sample(a1, *a2, (double)(v32 + 1 + v33) * 0.5);
      v34 = v30;
      v35 = v31;
      ((void (*)(void (**)(id, _QWORD *), double *, double))v5[2])(v5, &v34, v29);
    }
  }
LABEL_39:

}

void sub_1A66C7DC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<NU::Histogram<long,double>::Sample>>(unint64_t a1)
{
  if (a1 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a1);
}

double NU::Histogram<long,double>::sample(uint64_t a1, uint64_t a2, double a3)
{
  double v4;
  double v5;
  double result;
  double v7;
  double v8;
  double v9;

  v4 = (double)(uint64_t)floor(a3);
  v5 = a3 - v4;
  (*(void (**)(uint64_t, unint64_t))(a2 + 16))(a2, vcvtmd_s64_f64(a3));
  result = *(double *)a1;
  v7 = *(double *)(a1 + 8);
  v8 = (v7 - *(double *)a1) / (double)((uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3);
  v9 = *(double *)a1 + v4 * v8 + v5 * v8;
  if (*(double *)a1 < v9)
    result = v9;
  if (v7 < result)
    return *(double *)(a1 + 8);
  return result;
}

char *std::vector<long>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;

  if (a2 >> 61)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(8 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * a2];
  return result;
}

_QWORD *__copy_helper_block_ea8_48c30_ZTSN2NU9HistogramIldE6KernelE(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *result;

  a1[6] = 0;
  a1[7] = 0;
  v3 = a1 + 6;
  a1[8] = 0;
  result = std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(a1 + 6, *(const void **)(a2 + 48), *(_QWORD *)(a2 + 56), (uint64_t)(*(_QWORD *)(a2 + 56) - *(_QWORD *)(a2 + 48)) >> 3);
  v3[3] = *(_QWORD *)(a2 + 72);
  return result;
}

void __destroy_helper_block_ea8_48c30_ZTSN2NU9HistogramIldE6KernelE(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

_QWORD *std::vector<long>::vector(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<long>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1A66C7FAC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

id NU::Histogram<long,double>::edgeClamp(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];

  v1 = (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___ZNK2NU9HistogramIldE9edgeClampEv_block_invoke;
  v3[3] = &__block_descriptor_48_e8_q16__0q8l;
  v3[4] = a1;
  v3[5] = v1;
  return (id)MEMORY[0x1A85C1564](v3);
}

uint64_t ___ZNK2NU9HistogramIldE6repeatEv_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 <= a2)
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = 0;
  if (a2 >= 0)
    v2 = -v3;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8 * (v2 + a2));
}

uint64_t ___ZNK2NU9HistogramIldE6mirrorEv_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 < 0)
  {
    v3 = -a2;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2 <= a2)
      v3 = 2 * v2 - a2 - 2;
    else
      v3 = a2;
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8 * v3);
}

uint64_t ___ZNK2NU9HistogramIldE9edgeClampEv_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 < 0)
  {
    v3 = 0;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2 <= a2)
      v3 = v2 - 1;
    else
      v3 = a2;
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8 * v3);
}

uint64_t ___ZNK2NU9HistogramIldE9zeroClampEv_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 < 0 || *(_QWORD *)(a1 + 40) <= a2)
    return 0;
  else
    return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8 * a2);
}

__n128 __Block_byref_object_copy__21355(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

__n128 ___ZNK2NU9HistogramIldE4modeEv_block_invoke(uint64_t a1, __n128 *a2)
{
  __n128 *v2;
  __n128 result;

  v2 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 8);
  if ((int64_t)a2->n128_u64[1] > (int64_t)v2[3].n128_u64[1])
  {
    result = *a2;
    v2[3] = *a2;
  }
  return result;
}

double NU::Histogram<long,double>::maximum(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(a1 + 24) - v1;
  if (v2 < 1)
    return *(double *)(a1 + 8);
  v3 = 0;
  v4 = v2 >> 3;
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  v6 = (_QWORD *)(v1 + 8 * v4 - 8);
  while (!*v6--)
  {
    if (v5 == ++v3)
      return *(double *)(a1 + 8);
  }
  return *(double *)a1 + (double)(v4 - v3) * ((*(double *)(a1 + 8) - *(double *)a1) / (double)v4);
}

double NU::Histogram<long,double>::minimum(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(a1 + 24) - v1;
  if (v2 < 1)
    return *(double *)a1;
  v3 = 0;
  v4 = v2 >> 3;
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  while (!*(_QWORD *)(v1 + 8 * v3))
  {
    if (v5 == ++v3)
      return *(double *)a1;
  }
  return *(double *)a1 + (double)v3 * ((*(double *)(a1 + 8) - *(double *)a1) / (double)v4);
}

void sub_1A66C844C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66C8714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66C8A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66C8EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void NU::Histogram<long,double>::convolve(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  size_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  _BYTE *v29;
  unint64_t v30;
  char *v31;
  void *v32;
  char *v33;
  void **v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *__src;
  char *v40;

  v37 = a2[1] - *a2;
  v3 = v37 >> 3;
  if (v37 >> 3 >= 0)
    v4 = v37 >> 3;
  else
    v4 = v3 + 1;
  if (v3 != (v4 | 1))
    __assert_rtn("convolve", "Histogram.hpp", 314, "n == 2*k+1");
  v7 = a1;
  v8 = (void **)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16);
  v10 = v9 >> 3;
  v38 = 0;
  std::vector<long>::vector(&__src, v9 >> 3, &v38);
  if (v9 <= 0)
  {
    v12 = 0;
    v21 = (char *)__src;
  }
  else
  {
    v34 = v8;
    v35 = v7;
    v11 = 0;
    v12 = 0;
    v13 = v4 >> 1;
    v14 = a2[3];
    if (v14 >= 0)
      v15 = a2[3];
    else
      v15 = v14 + 1;
    v36 = v15 >> 1;
    if (v3 <= 1)
      v3 = 1;
    if (v10 <= 1)
      v16 = 1;
    else
      v16 = v10;
    v17 = -v13;
    do
    {
      if (v37 < 1)
      {
        v19 = 0;
      }
      else
      {
        v18 = 0;
        v19 = 0;
        do
          v19 += *(_QWORD *)(*a2 + 8 * v18++) * (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
        while (v3 != v18);
      }
      v20 = (v19 + v36) / v14;
      v21 = (char *)__src;
      *((_QWORD *)__src + v11) = v20;
      v12 += v20;
      ++v11;
      ++v17;
    }
    while (v11 != v16);
    v8 = v34;
    v7 = v35;
  }
  if (v8 != &__src)
  {
    v22 = v40;
    v23 = v40 - v21;
    v24 = (v40 - v21) >> 3;
    v25 = *(_QWORD *)(v7 + 32);
    v26 = *(char **)(v7 + 16);
    if (v24 <= (v25 - (uint64_t)v26) >> 3)
    {
      v29 = *(_BYTE **)(v7 + 24);
      v30 = (v29 - v26) >> 3;
      if (v30 < v24)
      {
        v31 = &v21[8 * v30];
        if (v29 != v26)
        {
          memmove(*(void **)(v7 + 16), v21, v29 - v26);
          v26 = *(char **)(v7 + 24);
        }
        v23 = v22 - v31;
        if (v22 == v31)
          goto LABEL_42;
        v32 = v26;
        v33 = v31;
        goto LABEL_41;
      }
    }
    else
    {
      if (v26)
      {
        *(_QWORD *)(v7 + 24) = v26;
        operator delete(v26);
        v25 = 0;
        *v8 = 0;
        v8[1] = 0;
        v8[2] = 0;
      }
      if ((v23 & 0x8000000000000000) != 0)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v27 = v25 >> 2;
      if (v25 >> 2 <= v24)
        v27 = v24;
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
        v28 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v28 = v27;
      std::vector<long>::__vallocate[abi:ne180100](v8, v28);
      v26 = *(char **)(v7 + 24);
    }
    if (v22 == v21)
    {
LABEL_42:
      *(_QWORD *)(v7 + 24) = &v26[v23];
      v21 = (char *)__src;
      goto LABEL_43;
    }
    v32 = v26;
    v33 = v21;
LABEL_41:
    memmove(v32, v33, v23);
    goto LABEL_42;
  }
LABEL_43:
  *(_QWORD *)(v7 + 40) = v12;
  if (v21)
  {
    v40 = v21;
    operator delete(v21);
  }
}

void sub_1A66C91BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__21459(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21460(uint64_t a1)
{

}

id NUAssertLogger_21569()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21585);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_21783()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21761);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_22007()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22019);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_22215()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22180);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_22345()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22362);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_22640()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22655);
  return (id)_NUAssertLogger;
}

double NU::DataSet::abs(double **this)
{
  double *v1;
  double *v2;
  double result;

  v1 = *this;
  v2 = this[1];
  while (v1 != v2)
  {
    result = fabs(*v1);
    *v1++ = result;
  }
  return result;
}

void NU::Abs(NU *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  void *v5;
  double *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = 0;
  v8 = 0;
  v9 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v7, *(const void **)this, *((_QWORD *)this + 1), (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3);
  v5 = v7;
  v4 = v8;
  if (v7 != (void *)v8)
  {
    v6 = (double *)v7;
    do
    {
      *v6 = fabs(*v6);
      ++v6;
    }
    while (v6 != (double *)v4);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v5, v4, (v4 - (uint64_t)v5) >> 3);
  if (v5)
    operator delete(v5);
}

void sub_1A66D74F4(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void NU::Abs(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  double *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v6, *(const void **)a1, *(_QWORD *)(a1 + 8), (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v4 = v6;
  v3 = v7;
  if (v6 != (void *)v7)
  {
    v5 = (double *)v6;
    do
    {
      *v5 = fabs(*v5);
      ++v5;
    }
    while (v5 != (double *)v3);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v4, v3, (v3 - (uint64_t)v4) >> 3);
  if (v4)
    operator delete(v4);
}

void sub_1A66D75A4(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

double NU::DataSet::square(double **this)
{
  double *v1;
  double *v2;
  double result;

  v1 = *this;
  v2 = this[1];
  while (v1 != v2)
  {
    result = *v1 * *v1;
    *v1++ = result;
  }
  return result;
}

double NU::Square@<D0>(NU *this@<X0>, double **a2@<X8>)
{
  double result;
  double *v5;
  double *v6;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, *(const void **)this, *((_QWORD *)this + 1), (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3);
  v5 = *a2;
  v6 = a2[1];
  while (v5 != v6)
  {
    result = *v5 * *v5;
    *v5++ = result;
  }
  return result;
}

double NU::Square@<D0>(uint64_t a1@<X0>, double **a2@<X8>)
{
  double result;
  double *v4;
  double *v5;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, *(const void **)a1, *(_QWORD *)(a1 + 8), (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v4 = *a2;
  v5 = a2[1];
  while (v4 != v5)
  {
    result = *v4 * *v4;
    *v4++ = result;
  }
  return result;
}

NU::DataSet *NU::DataSet::pow(long double **this, long double a2)
{
  long double *v3;
  long double *v4;

  v3 = *this;
  v4 = this[1];
  if (*this != v4)
  {
    do
    {
      *v3 = pow(*v3, a2);
      ++v3;
    }
    while (v3 != v4);
  }
  return (NU::DataSet *)this;
}

NU::DataSet *NU::DataSet::log(long double **this)
{
  long double *v2;
  long double *v3;

  v2 = *this;
  v3 = this[1];
  while (v2 != v3)
  {
    *v2 = log(*v2);
    ++v2;
  }
  return (NU::DataSet *)this;
}

void NU::Log(NU *this@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  uint64_t v5;
  long double *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = 0;
  v8 = 0;
  v9 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v7, *(const void **)this, *((_QWORD *)this + 1), (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3);
  v4 = v7;
  v5 = v8;
  if (v7 != (void *)v8)
  {
    v6 = (long double *)v7;
    do
    {
      *v6 = log(*v6);
      ++v6;
    }
    while (v6 != (long double *)v5);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v4, v5, (v5 - (uint64_t)v4) >> 3);
  if (v4)
    operator delete(v4);
}

void sub_1A66D77C8(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void NU::Log(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  uint64_t v4;
  long double *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v6, *(const void **)a1, *(_QWORD *)(a1 + 8), (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = v6;
  v4 = v7;
  if (v6 != (void *)v7)
  {
    v5 = (long double *)v6;
    do
    {
      *v5 = log(*v5);
      ++v5;
    }
    while (v5 != (long double *)v4);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v3, v4, (v4 - (uint64_t)v3) >> 3);
  if (v3)
    operator delete(v3);
}

void sub_1A66D7888(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

NU::DataSet *NU::DataSet::exp(long double **this)
{
  long double *v2;
  long double *v3;

  v2 = *this;
  v3 = this[1];
  while (v2 != v3)
  {
    *v2 = exp(*v2);
    ++v2;
  }
  return (NU::DataSet *)this;
}

void NU::Exp(NU *this@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  uint64_t v5;
  long double *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = 0;
  v8 = 0;
  v9 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v7, *(const void **)this, *((_QWORD *)this + 1), (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3);
  v4 = v7;
  v5 = v8;
  if (v7 != (void *)v8)
  {
    v6 = (long double *)v7;
    do
    {
      *v6 = exp(*v6);
      ++v6;
    }
    while (v6 != (long double *)v5);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v4, v5, (v5 - (uint64_t)v4) >> 3);
  if (v4)
    operator delete(v4);
}

void sub_1A66D798C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void NU::Exp(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  uint64_t v4;
  long double *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v6, *(const void **)a1, *(_QWORD *)(a1 + 8), (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = v6;
  v4 = v7;
  if (v6 != (void *)v7)
  {
    v5 = (long double *)v6;
    do
    {
      *v5 = exp(*v5);
      ++v5;
    }
    while (v5 != (long double *)v4);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v3, v4, (v4 - (uint64_t)v3) >> 3);
  if (v3)
    operator delete(v3);
}

void sub_1A66D7A4C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

double **NU::DataSet::operator+=(double **result, double a2)
{
  double *v2;
  double *v3;

  v2 = *result;
  v3 = result[1];
  while (v2 != v3)
  {
    *v2 = *v2 + a2;
    ++v2;
  }
  return result;
}

double **NU::DataSet::operator-=(double **result, double a2)
{
  double *v2;
  double *v3;

  v2 = *result;
  v3 = result[1];
  while (v2 != v3)
  {
    *v2 = *v2 - a2;
    ++v2;
  }
  return result;
}

_QWORD *NU::operator+@<X0>(uint64_t a1@<X0>, double **a2@<X8>, double a3@<D0>)
{
  _QWORD *result;
  double *v6;
  double *v7;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  result = std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, *(const void **)a1, *(_QWORD *)(a1 + 8), (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v6 = *a2;
  v7 = a2[1];
  while (v6 != v7)
  {
    *v6 = *v6 + a3;
    ++v6;
  }
  return result;
}

_QWORD *NU::operator-@<X0>(uint64_t a1@<X0>, double **a2@<X8>, double a3@<D0>)
{
  return NU::operator+(a1, a2, -a3);
}

double NU::DataSet::operator*=(uint64_t a1, uint64_t a2)
{
  double *v2;
  uint64_t v3;
  double *v4;
  uint64_t v5;
  double v6;
  double result;

  v2 = *(double **)a1;
  v3 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  v4 = *(double **)a2;
  if ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3 >= (unint64_t)(v3 >> 3))
    v5 = v3 >> 3;
  else
    v5 = (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3;
  for (; v5; --v5)
  {
    v6 = *v4++;
    result = v6 * *v2;
    *v2++ = result;
  }
  return result;
}

void sub_1A66DA638(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66DA790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66DA830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66DA93C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66DAA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66DAB1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66DABF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66DACB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66DB14C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66DB548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66DBCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66DBE84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A66DC3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t NUGetBytesAtPositionFromImageCallback(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v24;
  int64x2_t v25;
  _QWORD v26[2];
  __int128 v27;

  v7 = a1;
  objc_msgSend(v7, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "bytesPerPixel");
  v10 = objc_msgSend(v7, "size");
  v12 = v11;
  v13 = objc_msgSend(v8, "alignedRowBytesForWidth:", v10);
  if (v13 * v12 <= a3)
  {
    a4 = 0;
    goto LABEL_22;
  }
  if (a4 >= 1)
  {
    v24 = a4;
    v14 = a4 + a3;
    v25 = vdupq_n_s64(1uLL);
    v15 = a3;
    while (1)
    {
      v16 = v15 / v13;
      v17 = v15 / v13 * v13;
      v18 = v17 + v13;
      if (v14 < v17 + v13)
        v18 = v14;
      v19 = (v18 - v17) / v9;
      v20 = __OFSUB__(v15, v17);
      v21 = v15 % v13;
      if (!v21)
        break;
      if (!((v21 < 0) ^ v20 | (v21 == 0)))
      {
        if (v21 == v21 / v9 * v9)
          v21 /= v9;
        else
          v21 = v21 / v9 + 1;
        if (v10 < v19)
          v19 = v10;
        v19 -= v21;
        goto LABEL_17;
      }
LABEL_19:
      v15 = v13 + v13 * v16;
      if (v15 >= v14)
      {
        a4 = v24;
        goto LABEL_22;
      }
    }
    if (v10 < v19)
      v19 = v10;
LABEL_17:
    if (v19)
    {
      *((_QWORD *)&v22 + 1) = v25.i64[1];
      *(_QWORD *)&v22 = v19;
      v26[0] = v21;
      v26[1] = v16;
      v27 = v22;
      +[NUImageUtilities copyPixelsFromImage:rect:destPtr:destPtrRowBytes:](NUImageUtilities, "copyPixelsFromImage:rect:destPtr:destPtrRowBytes:", v7, v26, &a2[v17 - a3 + v21 * v9], v13);
    }
    goto LABEL_19;
  }
LABEL_22:

  return a4;
}

void sub_1A66DC60C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t NUGetBytePointerCallback(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _BYTE buf[24];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tileCount");

  if (v3 != 1)
  {
    NUAssertLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tile count must be 1 for GetBytePointerCallback"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v16;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"const void * _Nullable NUGetBytePointerCallback(void *)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 131, CFSTR("Tile count must be 1 for GetBytePointerCallback"), v17, v18, v19, v20, v21);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v24 = 0;
  objc_msgSend(v1, "validRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = ___ZL24NUGetBytePointerCallbackPv_block_invoke;
  v22[3] = &unk_1E5063A68;
  v22[4] = buf;
  objc_msgSend(v1, "readBufferRegion:withBlock:", v4, v22);

  v5 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);

  return v5;
}

void sub_1A66DC8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void ___ZL24NUGetBytePointerCallbackPv_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "bytes");

}

void sub_1A66DC9C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A66DCCA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A66DD474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A66DD608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_NUImage;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A66DD7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_1A66DDC34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A66DE3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1A66DE874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_1A66DE94C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66DEA70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66DED04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A66DEE4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66DEE8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66DF15C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A66DF474(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<unsigned char>::vector(_QWORD *a1, size_t __sz, char *a3)
{
  size_t v4;
  _BYTE *v6;
  _BYTE *v7;
  char v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (__sz)
  {
    v4 = __sz;
    if ((__sz & 0x8000000000000000) != 0)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v6 = operator new(__sz);
    *a1 = v6;
    a1[1] = v6;
    v7 = &v6[v4];
    a1[2] = &v6[v4];
    v8 = *a3;
    do
    {
      *v6++ = v8;
      --v4;
    }
    while (v4);
    a1[1] = v7;
  }
  return a1;
}

void sub_1A66DF620(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A66DF77C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66DF844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1A66DF90C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A66DF9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1A66DFB04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A66DFC38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66DFCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A66DFE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,void *a25)
{
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1A66DFF88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23182(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23183(uint64_t a1)
{

}

void sub_1A66E00B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A66E020C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A66E03FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66E04BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66E055C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66E063C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A66E0728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A66E0874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1A66E096C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66E0ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66E0B98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66E0E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66E1158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A66E1240(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66E1284(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66E12C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A66E1318(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66E135C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A66E1454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66E1520(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66E15F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66E16C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66E1964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A66E1C80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A66E1DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66E1EB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A66E234C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A66E31A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _NUAssertFailHandler(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v12 = a4;
  dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v13 = objc_claimAutoreleasedReturnValue();
  +[NUAssertionHandler currentHandler](NUAssertionHandler, "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:currentlyExecutingJobName:description:arguments:", v15, v16, a3, v13, v12, &a9);

  abort();
}

void _NUAssertContinueHandler(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = a4;
  +[NUAssertionHandler currentHandler](NUAssertionHandler, "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "continueAfterAssertInFunction:file:lineNumber:currentlyExecutingJobName:description:arguments:", v16, v17, a3, v13, v14, &a9);

}

id NUAssertLogger_23626()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23639);
  return (id)_NUAssertLogger;
}

void sub_1A66E4A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_23747()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23768);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__23773(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23774(uint64_t a1)
{

}

void sub_1A66E5964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_23831()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23844);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_24071()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24021);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_24216()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_68);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_24262()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23);
  return (id)_NUAssertLogger;
}

uint64_t NUProtocolEnumerateMethods(Protocol *a1, _BOOL8 a2, _BOOL8 a3, void *a4)
{
  uint64_t (**v7)(id, _QWORD, _BOOL8, _BOOL8);
  objc_method_description *v8;
  objc_method_description *v9;
  unint64_t v10;
  objc_method_description *v11;
  uint64_t v12;
  unsigned int outCount;

  v7 = a4;
  outCount = 0;
  v8 = protocol_copyMethodDescriptionList(a1, a2, a3, &outCount);
  if (v8)
  {
    v9 = v8;
    if (outCount)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        v12 = ((uint64_t (**)(id, objc_method_description *, _BOOL8, _BOOL8))v7)[2](v7, v11, a2, a3);
        if ((v12 & 1) == 0)
          break;
        ++v10;
        ++v11;
      }
      while (v10 < outCount);
    }
    else
    {
      v12 = 1;
    }
    free(v9);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

id NUDebugQuicklookWrapCGImage(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("UIImage"))), "initWithCGImage:", a1);
}

void NUDispatchAsyncEnforceCurrentQoS(void *a1, void *a2)
{
  id v3;
  qos_class_t v4;
  id v5;

  v3 = a2;
  v5 = a1;
  v4 = qos_class_self();
  NUDispatchAsyncEnforceQoS(v5, v4, v3);

}

void NUDispatchAsyncEnforceQoS(void *a1, dispatch_qos_class_t a2, void *a3)
{
  NSObject *v5;
  id v6;

  v5 = a1;
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, a2, 0, a3);
  dispatch_async(v5, v6);

}

dispatch_time_t NUDispatchSeconds(double a1)
{
  NSObject *v2;
  void *v3;
  void *specific;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1 < 0.0)
  {
    NUAssertLogger_24262();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "seconds >= 0.0");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v3;
      _os_log_error_impl(&dword_1A6553000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24262();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v6)
      {
        v9 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v10 = (void *)MEMORY[0x1E0CB3978];
        v11 = v9;
        objc_msgSend(v10, "callStackSymbols");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v9;
        v20 = 2114;
        v21 = v13;
        _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v8;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"dispatch_time_t NUDispatchSeconds(NSTimeInterval)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUUtilities.m", 154, CFSTR("Invalid parameter not satisfying: %s"), v14, v15, v16, v17, (uint64_t)"seconds >= 0.0");
  }
  return dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
}

uint64_t NUIsAppleInternal()
{
  if (NUIsAppleInternal_onceToken != -1)
    dispatch_once(&NUIsAppleInternal_onceToken, &__block_literal_global_14);
  return NUIsAppleInternal_isAppleInternal;
}

uint64_t NUDeepDictionaryHash(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v1, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = NUDeepValueHash();
        v4 ^= (0x16FB702EBEEDA9 * v9) ^ (0x13D6D34D692409 * objc_msgSend(v7, "hash"));

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t NUDeepValueHash(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = NUDeepDictionaryHash(v1);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = NUDeepMapTableHash(v1);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v2 = NUDeepArrayHash(v1);
      else
        v2 = objc_msgSend(v1, "hash");
    }
  }
  v3 = v2;

  return v3;
}

uint64_t NUDeepMapTableHash(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v1, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = NUDeepValueHash();
        v4 ^= v9 ^ objc_msgSend(v7, "hash");

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t NUDeepArrayHash(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v1);
        v4 ^= NUDeepValueHash(*(void **)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t NUMapTablePointerHash(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v1, "objectForKey:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v4 ^= v8 ^ objc_msgSend(v7, "hash");

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id NUFileTypeFromExtension(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    NUAssertLogger_24262();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "ext != nil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24262();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v13;
        v24 = 2114;
        v25 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"NSString * _Nonnull NUFileTypeFromExtension(NSString *__strong _Nonnull)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUUtilities.m", 261, CFSTR("Invalid parameter not satisfying: %s"), v18, v19, v20, v21, (uint64_t)"ext != nil");
  }
  v2 = v1;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id NUStringForTypeCode(int a1)
{
  _BYTE v2[5];

  v2[0] = HIBYTE(a1);
  v2[1] = BYTE2(a1);
  v2[2] = BYTE1(a1);
  v2[3] = a1;
  v2[4] = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v2, 30);
}

uint64_t NUTypeCodeFromString(void *a1)
{
  uint64_t result;
  _BYTE v2[5];

  result = objc_msgSend(a1, "getCString:maxLength:encoding:", v2, 5, 30);
  if ((_DWORD)result)
    return (v2[1] << 16) | (v2[0] << 24) | (v2[2] << 8) | v2[3];
  return result;
}

id NUDictionary(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id *v13;
  id v14;
  id v15;
  id *v16;
  id v17;
  BOOL v18;
  void *v19;
  uint64_t i;
  uint64_t j;
  id v23;
  id *v24;
  id *v25;
  _OWORD v26[8];
  id v27[17];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  memset(v27, 0, 128);
  memset(v26, 0, sizeof(v26));
  v24 = (id *)&a9;
  v9 = a1;
  v10 = v9;
  v11 = 0;
  if (v9)
  {
    v12 = v9;
    do
    {
      v13 = v24;
      v25 = v24 + 1;
      v14 = *v13;
      v15 = *v13;
      if (v15)
      {
        objc_storeStrong(&v27[v11], v12);
        objc_storeStrong((id *)v26 + v11++, v14);
      }

      v16 = v25;
      v24 = v25 + 1;
      v17 = *v16;

      if (v17)
        v18 = v11 >= 0x10;
      else
        v18 = 1;
      v12 = v17;
    }
    while (!v18);

    if (v11 == 16)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Too many keys!"), 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v23);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v27, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 120; i != -8; i -= 8)

  for (j = 15; j != -1; --j)
  return v19;
}

id _NUMakeDictionary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  id v14;
  void **i;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = (void **)&a9; a1; --a1)
  {
    v11 = i;
    v12 = *i;
    i += 2;
    v13 = v11[1];
    v14 = v12;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v14);

  }
  return v10;
}

id NUMakeDictionary1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(1, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(2, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(3, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(4, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(5, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(6, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(7, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(8, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(9, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(10, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUAssertLogger_24314()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24329);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_24413()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24428);
  return (id)_NUAssertLogger;
}

id NULogger_24828()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
  return (id)_NULogger;
}

void sub_1A66FB718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25008(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25009(uint64_t a1)
{

}

id NUAssertLogger_25135()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25123);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__25141(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25142(uint64_t a1)
{

}

id NUAssertLogger_25274()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_54_25289);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_25439()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25456);
  return (id)_NUAssertLogger;
}

id NUAssertLogger_25494()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25505);
  return (id)_NUAssertLogger;
}

void sub_1A6702AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6702DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_25570()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25593);
  return (id)_NUAssertLogger;
}

void sub_1A67044B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_25713()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25792);
  return (id)_NUAssertLogger;
}

uint64_t __Block_byref_object_copy__25795(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25796(uint64_t a1)
{

}

id NUAssertLogger_25891()
{
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25906);
  return (id)_NUAssertLogger;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
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

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

uint64_t CGColorConversionInfoIterateColorSpaceFunctionsWithCallbacks()
{
  return MEMORY[0x1E0C9BC60]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB8](red, green, blue, alpha);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

uint64_t CGColorSpaceContainsFlexGTCInfo()
{
  return MEMORY[0x1E0C9BD70]();
}

uint64_t CGColorSpaceCopyICCProfileDescription()
{
  return MEMORY[0x1E0C9BDB0]();
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

uint64_t CGColorSpaceCreateFromCICP()
{
  return MEMORY[0x1E0C9BE08]();
}

CGColorSpaceRef CGColorSpaceCreateLinearized(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE28](space);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE40](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE60](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1E0C9BE68]();
}

CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE80](space);
}

uint64_t CGColorSpaceGetCICPInfo()
{
  return MEMORY[0x1E0C9BE88]();
}

uint64_t CGColorSpaceGetMD5Digest()
{
  return MEMORY[0x1E0C9BEC0]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1E0C9BEF0]();
}

CFTypeID CGColorSpaceGetTypeID(void)
{
  return MEMORY[0x1E0C9BEF8]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF28](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BF38](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF48](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF50](a1);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFlush(CGContextRef c)
{
  MEMORY[0x1E0C9C230](c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
  MEMORY[0x1E0C9C398](c, allowsAntialiasing);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x1E0C9C478](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5E0](info, size, callbacks);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1E0CBC2D8]();
}

void CGImageDestinationAddAuxiliaryDataInfo(CGImageDestinationRef idst, CFStringRef auxiliaryImageDataType, CFDictionaryRef auxiliaryDataInfoDictionary)
{
  MEMORY[0x1E0CBC2F8](idst, auxiliaryImageDataType, auxiliaryDataInfoDictionary);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
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

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x1E0CBC390](metadata, parent, path);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C0]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C8](metadata);
}

CFDataRef CGImageMetadataCreateXMPData(CGImageMetadataRef metadata, CFDictionaryRef options)
{
  return (CFDataRef)MEMORY[0x1E0CBC3D8](metadata, options);
}

CFTypeID CGImageMetadataGetTypeID(void)
{
  return MEMORY[0x1E0CBC3E8]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1E0CBC408](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x1E0CBC418](metadata, parent, path, tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x1E0CBC448](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x1E0CBC450](xmlns, prefix, name, *(_QWORD *)&type, value);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSourceRef isrc, size_t index, CFStringRef auxiliaryImageDataType)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC500](isrc, index, auxiliaryImageDataType);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC528](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
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

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2A0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1E0C9EAD8](desc);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB88](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB98](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1E0C9EBA8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9EDC8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9EDD0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EE90](allocator, *(_QWORD *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1E0C9EE98](desc);
}

uint64_t CMPhotoDecompressionContainerCopyAuxiliaryImageMetadataForIndexWithOptions()
{
  return MEMORY[0x1E0D08DC0]();
}

uint64_t CMPhotoDecompressionContainerCopyAuxiliaryImageTypeURNForIndexWithOptions()
{
  return MEMORY[0x1E0D08DD8]();
}

uint64_t CMPhotoDecompressionContainerCopyCustomMetadataForIndexWithOptions()
{
  return MEMORY[0x1E0D08DE8]();
}

uint64_t CMPhotoDecompressionContainerCreateAuxiliaryImageForIndex()
{
  return MEMORY[0x1E0D08E48]();
}

uint64_t CMPhotoDecompressionContainerCreateImageForIndex()
{
  return MEMORY[0x1E0D08E58]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndexWithOptions()
{
  return MEMORY[0x1E0D08EE0]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageGeometryForIndexWithOptions()
{
  return MEMORY[0x1E0D08EF8]();
}

uint64_t CMPhotoDecompressionContainerGetImageCountWithOptions()
{
  return MEMORY[0x1E0D08F28]();
}

uint64_t CMPhotoDecompressionContainerGetImageGeometryForIndexWithOptions()
{
  return MEMORY[0x1E0D08F38]();
}

uint64_t CMPhotoDecompressionDetectContainerFormat()
{
  return MEMORY[0x1E0D08FB8]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x1E0D08FE0]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x1E0D08FE8]();
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF40](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFC8](retstr, sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EFE0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFF8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1E0C9F2F8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMapTimeFromRangeToRange(CMTime *__return_ptr retstr, CMTime *t, CMTimeRange *fromRange, CMTimeRange *toRange)
{
  return (CMTime *)MEMORY[0x1E0C9F340](retstr, t, fromRange, toRange);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F370](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F378](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F380](retstr, time, *(_QWORD *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1E0C9F390](retstr, time, *(_QWORD *)&multiplier, *(_QWORD *)&divisor);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1E0C9F3A8](range, otherRange);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1E0C9F3B8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1E0C9F3C0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3C8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3D8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeGetUnion(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E0](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F520](allocator, *(_QWORD *)&codecType, *(_QWORD *)&width, *(_QWORD *)&height, extensions, formatDescriptionOut);
}

CGRect CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescriptionRef videoDesc, Boolean originIsAtTopLeft)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9F550](videoDesc, originIsAtTopLeft);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

uint64_t CMVideoFormatDescriptionGetVideoDynamicRange()
{
  return MEMORY[0x1E0C9F588]();
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8900](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8908](buffer, *(_QWORD *)&attachmentMode);
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
  MEMORY[0x1E0CA8940](buffer, key);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8958](buffer, theAttachments, *(_QWORD *)&attachmentMode);
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1E0CA89D0](attachments);
}

CGColorSpaceRef CVImageBufferGetColorSpace(CVImageBufferRef imageBuffer)
{
  return (CGColorSpaceRef)MEMORY[0x1E0CA89E0](imageBuffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AB8](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CA8AE8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B00](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B08](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B68](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8C08](allocator, *(_QWORD *)&pixelFormat);
}

uint64_t FigAudioFormatDescriptionGetCinematicAudioEffectEligibility()
{
  return MEMORY[0x1E0C9F840]();
}

uint64_t FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()
{
  return MEMORY[0x1E0CA0E88]();
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1E0CBB8F0](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x1E0CBB938](*(_QWORD *)&entry, name);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBBAE8](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB90](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC68](buffer);
}

uint32_t IOSurfaceGetSeed(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCA8](buffer);
}

int32_t IOSurfaceGetUseCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCD0](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
  MEMORY[0x1E0CBBDE8](buffer, key);
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x1E0CBBE30](buffer, *(_QWORD *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0CBBE40](buffer, key, value);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x1E0CC69C8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1E0CB2D70]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
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

uint64_t PFFilter()
{
  return MEMORY[0x1E0D710A8]();
}

uint64_t PFFind()
{
  return MEMORY[0x1E0D710B0]();
}

uint64_t PFMap()
{
  return MEMORY[0x1E0D710C8]();
}

uint64_t PFProcessIsLaunchedToExecuteTests()
{
  return MEMORY[0x1E0D71108]();
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1E0CEC9D8](pixelBuffer, options, imageOut);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x1E0CECCD8](allocator, pixelRotationSessionOut);
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECCF0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x1E0CECD28](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1E0C9A0D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x1E0DE4AE0]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E505E798(__p);
}

uint64_t operator delete()
{
  return off_1E505E7A0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E505E7A8(__sz);
}

uint64_t operator new()
{
  return off_1E505E7B0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

uint64_t __invert_d4()
{
  return MEMORY[0x1E0C80B20]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
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

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
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

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C83678]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1E0C83858](a1);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C838F0](a1, a2);
  return result;
}

float ldexpf(float a1, int a2)
{
  float result;

  MEMORY[0x1E0C83B48](*(_QWORD *)&a2, a1);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1E0C840A8]();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x1E0C840C0](__b, __pattern4, __len);
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  return (objc_method_description *)MEMORY[0x1E0DE7B60](m);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
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

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

int raise(int a1)
{
  return MEMORY[0x1E0C84FA8](*(_QWORD *)&a1);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF28](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageHistogramCalculation_ARGB8888(const vImage_Buffer *src, vImagePixelCount *histogram[4], vImage_Flags flags)
{
  return MEMORY[0x1E0C8D2F0](src, histogram, *(_QWORD *)&flags);
}

vImage_Error vImageHistogramCalculation_ARGBFFFF(const vImage_Buffer *src, vImagePixelCount *histogram[4], unsigned int histogram_entries, Pixel_F minVal, Pixel_F maxVal, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D2F8](src, histogram, *(_QWORD *)&histogram_entries, *(_QWORD *)&flags, minVal, maxVal);
}

vImage_Error vImageMatrixMultiply_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[16], int32_t divisor, const int16_t *pre_bias, const int32_t *post_bias, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D410](src, dest, matrix, *(_QWORD *)&divisor, pre_bias, post_bias, *(_QWORD *)&flags);
}

vImage_Error vImageMatrixMultiply_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, const float matrix[16], const float *pre_bias, const float *post_bias, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D420](src, dest, matrix, pre_bias, post_bias, *(_QWORD *)&flags);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1E0C8D520](src, dest, permuteMap, *(_QWORD *)&flags);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_purgable_control(vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1E0C85AE8](*(_QWORD *)&target_task, address, *(_QWORD *)&control, state);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1E0C85B10]();
}

uint64_t voucher_copy_without_importance()
{
  return MEMORY[0x1E0C85B28]();
}

