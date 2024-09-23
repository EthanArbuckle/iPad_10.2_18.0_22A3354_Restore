id _AVLog()
{
  if (_AVLog_onceToken != -1)
    dispatch_once(&_AVLog_onceToken, &__block_literal_global_348);
  return (id)_log;
}

void sub_1AC4B57BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,char a30)
{
  id *v30;
  uint64_t v31;

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v31 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AC4B6148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1AC4B725C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AC4B9EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC4BA2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1AC4BAB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1AC4BD260(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t AVVideoGravityFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8A6D8]) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8A6E0]) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8A6D0]))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void AVPlayerControllerTimeResolverUpdate(void *a1)
{
  id v1;
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  double v17;
  AVTimer *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  v1 = a1;
  AVPlayerControllerTimeResolverUpdateTime(v1);
  v2 = (id *)v1;
  objc_msgSend(v2[1], "timing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2[1], "minTiming");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2[1], "maxTiming");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "rate");
    v8 = fabs(v7);
    v6 = 0.0;
    v9 = v8;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v9 = 0.0;
    if (!v4)
      goto LABEL_8;
  }
  if (objc_msgSend(v2[1], "hasSeekableLiveStreamingContent", v6))
  {
    objc_msgSend(v4, "rate");
    v10 = fabs(v6);
    if (v9 < v10)
      v9 = v10;
  }
LABEL_8:
  if (v5)
  {
    if (objc_msgSend(v2[1], "hasSeekableLiveStreamingContent", v6))
    {
      objc_msgSend(v5, "rate");
      v12 = fabs(v11);
      if (v9 < v12)
        v9 = v12;
    }
  }
  v13 = AVPlayerControllerTimeResolverGetEffectiveInterval(v2) / v9 * 0.5;
  v14 = fabs(v13);
  v15 = v2[5];
  if (v14 >= INFINITY && v14 <= INFINITY && v15)
  {
    objc_msgSend(v15, "invalidate");
    v16 = v2[5];
    v2[5] = 0;

  }
  else if (v14 != INFINITY)
  {
    if (v15)
    {
      objc_msgSend(v15, "interval");
      if (v17 == v13)
        goto LABEL_21;
      v15 = v2[5];
    }
    objc_msgSend(v15, "invalidate");
    objc_initWeak(&location, v2);
    v18 = [AVTimer alloc];
    v19 = MEMORY[0x1E0C80D38];
    v20 = MEMORY[0x1E0C80D38];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __AVPlayerControllerTimeResolverUpdateTimer_block_invoke;
    v23[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v24, &location);
    v21 = -[AVTimer initWithTimeInterval:queue:block:repeats:](v18, "initWithTimeInterval:queue:block:repeats:", v19, v23, 1, v13);
    v22 = v2[5];
    v2[5] = (id)v21;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
LABEL_21:

}

void sub_1AC4C0168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void AVPlayerControllerTimeResolverUpdateTime(void *a1)
{
  double v1;
  double v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double EffectiveInterval;
  double v11;
  double v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id *v32;
  BOOL v33;
  char v34;
  id *v35;

  v35 = a1;
  +[AVValueTiming currentTimeStamp](AVValueTiming, "currentTimeStamp");
  v2 = v1;
  objc_msgSend(v35[1], "timing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anchorTimeStamp");
  v5 = v4;
  objc_msgSend(v35[1], "timing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v2 > v5)
    objc_msgSend(v6, "valueForTimeStamp:", v2);
  else
    objc_msgSend(v6, "anchorValue");
  v9 = v8;

  EffectiveInterval = AVPlayerControllerTimeResolverGetEffectiveInterval(v35);
  v11 = EffectiveInterval * round(v9 / EffectiveInterval);
  v12 = v9 - v11;
  v13 = objc_msgSend(v35[1], "hasSeekableLiveStreamingContent");
  v14 = v35[1];
  if (v13)
  {
    objc_msgSend(v14, "minTiming");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v35[1];
    if (v15)
    {
      objc_msgSend(v16, "minTiming");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "valueForTimeStamp:", v2);
      v19 = v18 - v12;

    }
    else
    {
      objc_msgSend(v16, "minTime");
      v19 = v21;
    }

  }
  else
  {
    objc_msgSend(v14, "minTime");
    v19 = v20;
  }
  v22 = objc_msgSend(v35[1], "hasSeekableLiveStreamingContent");
  v23 = v35[1];
  if (v22)
  {
    objc_msgSend(v23, "maxTiming");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v35[1];
    if (v24)
    {
      objc_msgSend(v25, "maxTiming");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "valueForTimeStamp:", v2);
      v28 = v27 - v12;

    }
    else
    {
      objc_msgSend(v25, "maxTime");
      v28 = v30;
    }

  }
  else
  {
    objc_msgSend(v23, "maxTime");
    v28 = v29;
  }
  v31 = fmax(v19, fmin(v11, v28));
  v32 = v35;
  v33 = v28 == *((double *)v35 + 7);
  if (v31 == *((double *)v35 + 4))
  {
    v34 = 1;
    if (v19 == *((double *)v35 + 6))
      goto LABEL_19;
    goto LABEL_18;
  }
  v34 = 0;
  if (v19 != *((double *)v35 + 6))
  {
LABEL_18:
    objc_msgSend(v35, "willChangeValueForKey:", CFSTR("minTime"));
    *((double *)v35 + 6) = v19;
    objc_msgSend(v35, "didChangeValueForKey:", CFSTR("minTime"));
    v32 = v35;
  }
LABEL_19:
  if (!v33)
  {
    objc_msgSend(v35, "willChangeValueForKey:", CFSTR("maxTime"));
    *((double *)v35 + 7) = v28;
    objc_msgSend(v35, "didChangeValueForKey:", CFSTR("maxTime"));
    v32 = v35;
    if ((v34 & 1) != 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  if ((v34 & 1) == 0)
  {
LABEL_21:
    objc_msgSend(v35, "willChangeValueForKey:", CFSTR("currentTime"));
    *((double *)v35 + 4) = v31;
    objc_msgSend(v35, "didChangeValueForKey:", CFSTR("currentTime"));
    v32 = v35;
  }
LABEL_22:

}

double AVPlayerControllerTimeResolverGetEffectiveInterval(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  BOOL v5;
  double v6;

  v1 = a1;
  v2 = (void *)*((_QWORD *)v1 + 1);
  if (v2)
  {
    if (objc_msgSend(v2, "hasSeekableLiveStreamingContent", *((double *)v1 + 3)))
      objc_msgSend(v1, "seekableTimeRangeDuration");
    else
      objc_msgSend(*((id *)v1 + 1), "contentDuration");
    v5 = ((*(_QWORD *)&v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF
      && (*(_QWORD *)&v3 & 0x7FFFFFFFFFFFFFFFuLL) - 1 >= 0xFFFFFFFFFFFFFLL;
    v6 = *((double *)v1 + 2);
    if (v5)
      v4 = fmax(v6, 1.0);
    else
      v4 = fmin(v6, v3 / *((double *)v1 + 3));
  }
  else
  {
    v4 = *((double *)v1 + 2);
  }

  return v4;
}

void sub_1AC4C4234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;
  uint64_t v26;

  objc_destroyWeak(v25);
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v26 - 160));
  _Unwind_Resume(a1);
}

void sub_1AC4C4AB4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AC4C8FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void AVAsynchronousLocalizedString(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a1;
  v6 = a2;
  v7 = (void *)objc_msgSend(a3, "copy");
  if (AVAsynchronousLocalizedString_createQueueOnceToken != -1)
    dispatch_once(&AVAsynchronousLocalizedString_createQueueOnceToken, &__block_literal_global_8_23783);
  v8 = AVAsynchronousLocalizedString_localizedStringBackgroundQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __AVAsynchronousLocalizedString_block_invoke_2;
  block[3] = &unk_1E5BB4C38;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

void sub_1AC4CCA8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  id *v33;
  uint64_t v34;

  objc_destroyWeak(v33);
  objc_destroyWeak((id *)(v34 - 208));
  _Unwind_Resume(a1);
}

void sub_1AC4CD45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  uint64_t v19;

  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  objc_destroyWeak((id *)(v19 - 72));
  _Unwind_Resume(a1);
}

void sub_1AC4CDDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AVApplicationIdentifier()
{
  if (AVApplicationIdentifier_createMainAppBundleOnceToken != -1)
    dispatch_once(&AVApplicationIdentifier_createMainAppBundleOnceToken, &__block_literal_global_5_23776);
  return objc_msgSend((id)AVApplicationIdentifier_mainAppBundle, "bundleIdentifier");
}

id AVKitUserDefaults()
{
  if (AVKitUserDefaults_initializeAVKitUserDefaultsOnceToken != -1)
    dispatch_once(&AVKitUserDefaults_initializeAVKitUserDefaultsOnceToken, &__block_literal_global_10_23787);
  return (id)AVKitUserDefaults_AVKitUserDefaults;
}

void sub_1AC4CDF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVKCImageAnalyzerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionKitCoreLibraryCore_frameworkLibrary)
  {
    VisionKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!VisionKitCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VKCImageAnalyzer");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getVKCImageAnalyzerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AC4CEF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_1AC4CF300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC4CF860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4D0238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4D1CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4D3F54(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1AC4D4298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AVLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  AVBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E5BB5F88, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AVBundle()
{
  if (AVBundle_onceToken != -1)
    dispatch_once(&AVBundle_onceToken, &__block_literal_global_23769);
  return (id)AVBundle_bundle;
}

void sub_1AC4D6D34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AC4D7D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1AC4D8D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v22);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4D9354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC4DACC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC4DC110(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_1AC4DC4BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1AC4DD35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *location,id *a25,id *a26,id *a27,id *a28,id *a29)
{
  id *v29;
  uint64_t v30;

  objc_destroyWeak(v29);
  objc_destroyWeak(a23);
  objc_destroyWeak(a16);
  objc_destroyWeak(a13);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(a14);
  objc_destroyWeak(a12);
  objc_destroyWeak(a17);
  objc_destroyWeak(a15);
  objc_destroyWeak(a18);
  objc_destroyWeak(a20);
  objc_destroyWeak(a19);
  objc_destroyWeak(a22);
  objc_destroyWeak(a21);
  objc_destroyWeak(location);
  objc_destroyWeak(a25);
  objc_destroyWeak(a27);
  objc_destroyWeak(a26);
  objc_destroyWeak(a28);
  objc_destroyWeak(a29);
  objc_destroyWeak((id *)&STACK[0x310]);
  objc_destroyWeak((id *)(v30 - 128));
  _Unwind_Resume(a1);
}

void sub_1AC4DD6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4DE268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4DE4B0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1AC4DE6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4DE8D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1AC4E2864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4E4240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1AC4E48C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4E510C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4E5AC4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AC4E6D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4E782C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4E7EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4E9CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1AC4EA9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4EBA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id NSStringFromVideoGravity(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 0;
  else
    return **((id **)&unk_1E5BB0B78 + a1 - 1);
}

void sub_1AC4ED544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4EE5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC4F1DDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AC4F3E10(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _avairlog()
{
  if (_avairlog_onceToken != -1)
    dispatch_once(&_avairlog_onceToken, &__block_literal_global_6003);
  return (id)_avairlog__log;
}

void ___avairlog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.avkit", "Air");
  v1 = (void *)_avairlog__log;
  _avairlog__log = (uint64_t)v0;

}

void sub_1AC4F7B38(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1AC4FB17C(uint64_t a1, uint64_t a2)
{
  return sub_1AC4FB750(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1AC4FB194(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1AC5DD6FC();
  *a2 = 0;
  return result;
}

uint64_t sub_1AC4FB208(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1AC5DD708();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1AC4FB284@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1AC5DD714();
  v2 = sub_1AC5DD6F0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1AC4FB2CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1AC5DD714();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for AVMetadataIdentifier(uint64_t a1)
{
  sub_1AC4FBDD0(a1, &qword_1EEC83198);
}

uint64_t initializeBufferWithCopyOfBuffer for AVInfoDescriptionView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_1AC4FB350(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AC4FB370(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for AudioFormatListItem(uint64_t a1)
{
  sub_1AC4FBDD0(a1, &qword_1EEC83170);
}

void type metadata accessor for CMFormatDescription(uint64_t a1)
{
  sub_1AC4FBDD0(a1, &qword_1EEC831A8);
}

void type metadata accessor for AVMediaCharacteristic(uint64_t a1)
{
  sub_1AC4FBDD0(a1, &qword_1EEC831A0);
}

void type metadata accessor for Identifier(uint64_t a1)
{
  sub_1AC4FBDD0(a1, &qword_1EEC837C8);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1AC4FB404(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AC4FB424(uint64_t result, int a2, int a3)
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
  sub_1AC4FBDD0(a1, qword_1EEC831F8);
}

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_1AC4FB474(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AC4FB494(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CMTime(uint64_t a1)
{
  sub_1AC4FBDD0(a1, &qword_1EEC837D0);
}

uint64_t sub_1AC4FB4D4()
{
  sub_1AC4FB5B0(&qword_1EEC83840, (uint64_t (*)(uint64_t))type metadata accessor for Identifier, (uint64_t)&unk_1AC5F6888);
  sub_1AC4FB5B0(&qword_1EEC83848, (uint64_t (*)(uint64_t))type metadata accessor for Identifier, (uint64_t)&unk_1AC5F6828);
  return sub_1AC5DD870();
}

uint64_t sub_1AC4FB558()
{
  return sub_1AC4FB5B0(&qword_1EEC837D8, (uint64_t (*)(uint64_t))type metadata accessor for Identifier, (uint64_t)&unk_1AC5F67EC);
}

uint64_t sub_1AC4FB584()
{
  return sub_1AC4FB5B0(&qword_1EEC837E0, (uint64_t (*)(uint64_t))type metadata accessor for Identifier, (uint64_t)&unk_1AC5F67C0);
}

uint64_t sub_1AC4FB5B0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1AF43EC7C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AC4FB5F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1AC5DD6F0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1AC4FB634()
{
  sub_1AC4FB5B0(&qword_1EEC83820, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataIdentifier, (uint64_t)&unk_1AC5F6B10);
  sub_1AC4FB5B0(&qword_1EEC83828, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataIdentifier, (uint64_t)&unk_1AC5F6AB8);
  return sub_1AC5DD870();
}

uint64_t sub_1AC4FB6B8()
{
  sub_1AC4FB5B0(&qword_1EEC83830, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaCharacteristic, (uint64_t)&unk_1AC5F69D0);
  sub_1AC4FB5B0(&qword_1EEC83838, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaCharacteristic, (uint64_t)&unk_1AC5F6978);
  return sub_1AC5DD870();
}

uint64_t sub_1AC4FB73C(uint64_t a1, uint64_t a2)
{
  return sub_1AC4FB750(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1AC4FB750(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1AC5DD714();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1AC4FB78C()
{
  sub_1AC5DD714();
  sub_1AC5DD720();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AC4FB7CC()
{
  uint64_t v0;

  sub_1AC5DD714();
  sub_1AC5DD888();
  sub_1AC5DD720();
  v0 = sub_1AC5DD8A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1AC4FB83C()
{
  return sub_1AC4FB5B0(&qword_1EEC837E8, (uint64_t (*)(uint64_t))type metadata accessor for Identifier, (uint64_t)&unk_1AC5F685C);
}

uint64_t sub_1AC4FB868()
{
  return sub_1AC4FB5B0(&qword_1EEC837F0, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaCharacteristic, (uint64_t)&unk_1AC5F6940);
}

uint64_t sub_1AC4FB894()
{
  return sub_1AC4FB5B0(&qword_1EEC837F8, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaCharacteristic, (uint64_t)&unk_1AC5F6918);
}

uint64_t sub_1AC4FB8C0()
{
  return sub_1AC4FB5B0(&qword_1EEC83800, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaCharacteristic, (uint64_t)&unk_1AC5F69A8);
}

uint64_t sub_1AC4FB8EC()
{
  return sub_1AC4FB5B0(&qword_1EEC83808, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataIdentifier, (uint64_t)&unk_1AC5F6A80);
}

uint64_t sub_1AC4FB918()
{
  return sub_1AC4FB5B0(&qword_1EEC83810, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataIdentifier, (uint64_t)&unk_1AC5F6A58);
}

uint64_t sub_1AC4FB944()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1AC5DD714();
  v2 = v1;
  if (v0 == sub_1AC5DD714() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1AC5DD87C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1AC4FB9CC()
{
  return sub_1AC4FB5B0(&qword_1EEC83818, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataIdentifier, (uint64_t)&unk_1AC5F6AE8);
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

uint64_t sub_1AC4FBA0C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AC4FBA2C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 40) = v3;
  return result;
}

void type metadata accessor for AudioStreamBasicDescription(uint64_t a1)
{
  sub_1AC4FBDD0(a1, &qword_1EEC83850);
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
  sub_1AC4FBDD0(a1, &qword_1EEC83858);
}

uint64_t sub_1AC4FBA88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC5DD5D0();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_1AC4FBAC4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1AC5DD5D0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_1AC4FBAF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC5DD5D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1AC4FBB3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC5DD5D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1AC4FBB80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC5DD5D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1AC4FBBC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC5DD5D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1AC4FBC08()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC4FBC14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC5DD5D0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_1AC4FBC50()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC4FBC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC5DD5D0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AVInfoTabBadgeModifier()
{
  uint64_t result;

  result = qword_1EEC83860;
  if (!qword_1EEC83860)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1AC4FBCD8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AC5DD5D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1AC4FBD4C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AC4FBD6C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_1AC4FBDD0(a1, &qword_1EEC83870);
}

uint64_t sub_1AC4FBDAC()
{
  return swift_getOpaqueTypeConformance2();
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1AC4FBDD0(a1, &qword_1EEC83878);
}

void sub_1AC4FBDD0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1AC4FBE18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC83880;
  if (!qword_1EEC83880)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83888);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CDFCB8], v1);
    atomic_store(result, (unint64_t *)&qword_1EEC83880);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF43EC70](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AVSizePreferenceKey()
{
  return &type metadata for AVSizePreferenceKey;
}

ValueMetadata *type metadata accessor for AVSizeModifier()
{
  return &type metadata for AVSizeModifier;
}

void sub_1AC4FBEDC()
{
  xmmword_1EEC88A70 = 0uLL;
}

double sub_1AC4FBEEC@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_1EEC83778 != -1)
    swift_once();
  result = *(double *)&xmmword_1EEC88A70;
  *a1 = xmmword_1EEC88A70;
  return result;
}

double sub_1AC4FBF3C(_OWORD *a1, void (*a2)(__int128 *__return_ptr))
{
  double result;
  __int128 v4;

  a2(&v4);
  result = *(double *)&v4;
  *a1 = v4;
  return result;
}

uint64_t sub_1AC4FBF74()
{
  return sub_1AC5DD198() & 1;
}

uint64_t sub_1AC4FBF8C()
{
  return sub_1AC5DD198() & 1;
}

uint64_t sub_1AC4FBFA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC4FBFB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_1AC5DD588();
  result = sub_1AC5DD174();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_1AC4FBFF0()
{
  return sub_1AC5DD144();
}

uint64_t sub_1AC4FC004()
{
  return sub_1AC5DD150();
}

uint64_t sub_1AC4FC018()
{
  return sub_1AC5DD15C();
}

uint64_t sub_1AC4FC030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t (*v5)@<X0>(uint64_t *@<X8>);
  uint64_t (*v6)@<X0>(uint64_t *@<X8>);
  uint64_t v7;
  uint64_t result;
  uint64_t (**v9)@<X0>(uint64_t *@<X8>);

  v4 = sub_1AC5DD678();
  v6 = v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a2, a1, v7);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83898);
  v9 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(a2 + *(int *)(result + 36));
  *v9 = sub_1AC4FBFB4;
  v9[1] = 0;
  v9[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v4;
  v9[3] = v6;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF43EC64]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1AC4FC0F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC838A0;
  if (!qword_1EEC838A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83898);
    v2[0] = sub_1AC4FC18C(&qword_1EEC838A8, &qword_1EEC83890, MEMORY[0x1E0CDBF18]);
    v2[1] = sub_1AC4FC18C(&qword_1EEC838B0, &qword_1EEC838B8, MEMORY[0x1E0CDA288]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC838A0);
  }
  return result;
}

uint64_t sub_1AC4FC18C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1AF43EC7C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AC4FC314(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  unsigned __int8 v8;

  v2 = OBJC_IVAR___AVInfoTabCoordinator_actions;
  *(_QWORD *)(v1 + OBJC_IVAR___AVInfoTabCoordinator_actions) = a1;
  result = swift_bridgeObjectRelease();
  v4 = *(void **)(v1 + OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController);
  if (v4)
  {
    type metadata accessor for AVInfoTabViewController();
    result = swift_dynamicCastClass();
    if (result)
    {
      v5 = *(_QWORD *)(v1 + v2);
      v6 = *(_QWORD *)(result + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions);
      *(_QWORD *)(result + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions) = v5;
      v7 = v4;
      swift_bridgeObjectRetain_n();
      v8 = sub_1AC51B828(v6, v5);
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0)
        sub_1AC51B314();

      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

char *sub_1AC4FC3EC(void *a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  id v9;
  char *v10;
  id v11;
  id v12;
  void *v13;
  objc_super v15;

  *(_QWORD *)&v2[OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController] = 0;
  v5 = OBJC_IVAR___AVInfoTabCoordinator_playerItem;
  *(_QWORD *)&v2[OBJC_IVAR___AVInfoTabCoordinator_playerItem] = 0;
  v6 = OBJC_IVAR___AVInfoTabCoordinator_actions;
  *(_QWORD *)&v2[OBJC_IVAR___AVInfoTabCoordinator_actions] = MEMORY[0x1E0DEE9D8];
  v7 = *(void **)&v2[v5];
  *(_QWORD *)&v2[v5] = a1;
  v8 = v2;
  v9 = a1;

  *(_QWORD *)&v2[v6] = a2;
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for AVInfoTabCoordinator();
  v10 = (char *)objc_msgSendSuper2(&v15, sel_init);
  v11 = objc_allocWithZone((Class)type metadata accessor for AVInfoTabViewController());
  v12 = sub_1AC51A340(v9, a2);
  v13 = *(void **)&v10[OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController];
  *(_QWORD *)&v10[OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController] = v12;

  return v10;
}

id sub_1AC4FC55C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AVInfoTabCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AVInfoTabCoordinator()
{
  return objc_opt_self();
}

unint64_t sub_1AC4FC5F4()
{
  unint64_t result;

  result = qword_1EEC831B8;
  if (!qword_1EEC831B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEC831B8);
  }
  return result;
}

void sub_1AC4FC630(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = OBJC_IVAR___AVInfoTabCoordinator_playerItem;
  v3 = *(void **)(v1 + OBJC_IVAR___AVInfoTabCoordinator_playerItem);
  *(_QWORD *)(v1 + OBJC_IVAR___AVInfoTabCoordinator_playerItem) = a1;
  v4 = a1;

  v5 = *(void **)(v1 + OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController);
  if (v5)
  {
    type metadata accessor for AVInfoTabViewController();
    if (swift_dynamicCastClass())
    {
      v6 = *(void **)(v1 + v2);
      v8 = v6;
      v7 = v5;
      sub_1AC51BCA4(v6);

    }
  }
}

uint64_t sub_1AC4FC6D8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_1AC4FC6EC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AVInfoDescriptionView()
{
  return &type metadata for AVInfoDescriptionView;
}

uint64_t sub_1AC4FC734()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC4FC744@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  sub_1AC5DD480();
  v2 = sub_1AC5DD4A4();
  v4 = v3;
  v6 = v5;
  swift_release();
  v7 = sub_1AC5DD498();
  v9 = v8;
  v11 = v10 & 1;
  sub_1AC4FC6EC(v2, v4, v6 & 1);
  swift_bridgeObjectRelease();
  sub_1AC5DD354();
  v12 = sub_1AC5DD48C();
  v31 = v13;
  v32 = v12;
  v33 = v14;
  v16 = v15 & 1;
  sub_1AC4FC6EC(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_1AC5DD45C();
  v17 = sub_1AC5DD4A4();
  v19 = v18;
  v21 = v20;
  swift_release();
  LOBYTE(v9) = v21 & 1;
  sub_1AC5DD354();
  v22 = sub_1AC5DD48C();
  v24 = v23;
  v26 = v25;
  v28 = v27 & 1;
  sub_1AC4FC6EC(v17, v19, v9);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  *(_QWORD *)a1 = v32;
  *(_QWORD *)(a1 + 8) = v31;
  *(_BYTE *)(a1 + 16) = v16;
  *(_QWORD *)(a1 + 24) = v33;
  *(_QWORD *)(a1 + 32) = v22;
  *(_QWORD *)(a1 + 40) = v24;
  *(_BYTE *)(a1 + 48) = v28;
  *(_QWORD *)(a1 + 56) = v26;
  *(_QWORD *)(a1 + 64) = KeyPath;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 80) = 1;
  sub_1AC4FC6D8(v32, v31, v16);
  swift_bridgeObjectRetain();
  sub_1AC4FC6D8(v22, v24, v28);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1AC4FC6EC(v22, v24, v28);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1AC4FC6EC(v32, v31, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AC4FC9AC()
{
  return sub_1AC5DD4D4();
}

uint64_t sub_1AC4FC9C0()
{
  return sub_1AC5DD4E0();
}

uint64_t sub_1AC4FC9D4()
{
  return sub_1AC5DD510();
}

__n128 sub_1AC4FC9EC@<Q0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  __n128 result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  uint64_t v16;
  __int128 v17;
  char v18;
  __n128 v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v3 = v1[1];
  v22 = *v1;
  v23 = v3;
  v4 = v1[3];
  v24 = v1[2];
  v25 = v4;
  v5 = sub_1AC5DD2F4();
  sub_1AC4FC744((uint64_t)&v14);
  v6 = v15;
  v7 = v16;
  v8 = v18;
  v9 = v20;
  v10 = v21;
  result = v19;
  v12 = v14;
  v13 = v17;
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v12;
  *(_BYTE *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 56) = v13;
  *(_BYTE *)(a1 + 72) = v8;
  *(__n128 *)(a1 + 80) = result;
  *(_QWORD *)(a1 + 96) = v9;
  *(_BYTE *)(a1 + 104) = v10;
  return result;
}

uint64_t _s5AVKit34AVInfoDescriptionViewConfigurationVwxx_0(uint64_t a1)
{
  sub_1AC4FC6EC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_1AC4FC6EC(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  return swift_bridgeObjectRelease();
}

uint64_t _s5AVKit34AVInfoDescriptionViewConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_1AC4FC6D8(*(_QWORD *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_1AC4FC6D8(v7, v8, v9);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s5AVKit34AVInfoDescriptionViewConfigurationVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_1AC4FC6D8(*(_QWORD *)a2, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_1AC4FC6EC(v7, v8, v9);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_QWORD *)(a2 + 40);
  v12 = *(_BYTE *)(a2 + 48);
  sub_1AC4FC6D8(v10, v11, v12);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(_BYTE *)(a1 + 48);
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  *(_BYTE *)(a1 + 48) = v12;
  sub_1AC4FC6EC(v13, v14, v15);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5AVKit34AVInfoDescriptionViewConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_1AC4FC6EC(v5, v6, v7);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v8 = *(_BYTE *)(a2 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_BYTE *)(a1 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = v8;
  sub_1AC4FC6EC(v9, v10, v11);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5AVKit34AVInfoDescriptionViewConfigurationVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1AC4FCCDC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AVInfoDescriptionViewConfiguration()
{
  return &type metadata for AVInfoDescriptionViewConfiguration;
}

unint64_t sub_1AC4FCD40()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC838D8;
  if (!qword_1EEC838D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC838E0);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CDFCB8], v1);
    atomic_store(result, (unint64_t *)&qword_1EEC838D8);
  }
  return result;
}

void sub_1AC4FCD8C()
{
  qword_1EEC88A80 = 0x4028000000000000;
}

uint64_t sub_1AC4FCD9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;

  v33 = a1;
  v2 = type metadata accessor for AVInfoTabMetadataStripView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x1E0C80A78](v2);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC838F8);
  v31 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v30 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC5059E4(v1, (uint64_t)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVInfoTabMetadataStripView);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v29 = swift_allocObject();
  sub_1AC506DF0((uint64_t)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v29 + v6, type metadata accessor for AVInfoTabMetadataStripView);
  type metadata accessor for AVObservableBundle();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = AVBundle();
  sub_1AC505590(&qword_1EEC83900, v8, (uint64_t (*)(uint64_t))type metadata accessor for AVObservableBundle, (uint64_t)&unk_1AC5F6E34);
  v28 = sub_1AC5DD0FC();
  v27 = sub_1AC5DD5A0();
  KeyPath = swift_getKeyPath();
  if (qword_1EEC83780 != -1)
    swift_once();
  sub_1AC5DD678();
  sub_1AC5DD168();
  v10 = v48;
  v11 = v49;
  v12 = v50;
  v13 = v51;
  v14 = v52;
  v15 = v53;
  sub_1AC5DD474();
  v16 = sub_1AC5DD468();
  swift_release();
  v17 = swift_getKeyPath();
  v34 = sub_1AC504B98;
  v35 = v29;
  v36 = v28;
  v37 = v7;
  v38 = KeyPath;
  v39 = v27;
  v40 = v10;
  v41 = v11;
  v42 = v12;
  v43 = v13;
  v44 = v14;
  v45 = v15;
  v46 = v17;
  v47 = v16;
  v18 = sub_1AC5DD1B0();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E0CD9920], v18);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83908);
  v23 = sub_1AC5052A4();
  v24 = v30;
  sub_1AC5DD51C();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v34 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v22;
  v35 = v23;
  swift_getOpaqueTypeConformance2();
  v25 = v32;
  sub_1AC5DD570();
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v24, v25);
}

uint64_t sub_1AC4FD134@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83988);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = sub_1AC5DD2AC();
  *((_QWORD *)v8 + 1) = 0x4020000000000000;
  v8[16] = 0;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83990);
  sub_1AC4FD224(a2, a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  sub_1AC507378((uint64_t)v8, a3, &qword_1EEC83988);
  v10 = (_QWORD *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83998) + 36));
  *v10 = 0xD000000000000021;
  v10[1] = 0x80000001AC5F9710;
  return sub_1AC5073BC((uint64_t)v8, &qword_1EEC83988);
}

uint64_t sub_1AC4FD224@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
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
  uint64_t *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  void *v145;
  void *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char v154;
  char v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  uint64_t *v181;
  uint64_t *v182;
  uint64_t *v183;
  uint64_t *v184;
  uint64_t *v185;
  char *v186;
  char *v187;
  int v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  uint64_t *v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  char *v200;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  void *v206;
  id v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  char v215;
  char v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  char *v220;
  uint64_t v221;
  void (*v222)(char *, uint64_t);
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  int v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  unint64_t v245;
  uint64_t v246;
  uint64_t *v247;
  char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  char *v253;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  void *v259;
  id v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  char v267;
  char v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  char *v272;
  char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void (*v284)(char *, uint64_t);
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  char *v293;
  uint64_t v294;
  unint64_t v295;
  uint64_t v296;
  char *v297;
  uint64_t v298;
  char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  int *v304;
  _QWORD *v305;
  uint64_t v306;
  uint64_t v307;
  unint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t **v312;
  uint64_t *v313;
  uint64_t *v314;
  uint64_t *v315;
  uint64_t v316;
  uint64_t v318;
  char *v319;
  uint64_t *v320;
  uint64_t *v321;
  uint64_t v322;
  uint64_t *v323;
  uint64_t *v324;
  uint64_t *v325;
  uint64_t *v326;
  uint64_t *v327;
  uint64_t *v328;
  uint64_t v329;
  char *v330;
  uint64_t *v331;
  uint64_t *v332;
  uint64_t *v333;
  uint64_t *v334;
  uint64_t *v335;
  uint64_t *v336;
  uint64_t *v337;
  uint64_t *v338;
  uint64_t *v339;
  uint64_t *v340;
  uint64_t v341;
  uint64_t *v342;
  char *v343;
  uint64_t v344;
  uint64_t v345;
  int *v346;
  uint64_t v347;
  uint64_t v348;
  char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t *v356;
  uint64_t *v357;
  uint64_t *v358;
  uint64_t v359;
  unint64_t v360;
  __int128 v361;
  __int128 v362;
  uint64_t v363;

  v6 = type metadata accessor for AVInfoTabMetadataStripView(0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v338 = (uint64_t *)((char *)&v318 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v7);
  v356 = (uint64_t *)((char *)&v318 - v9);
  v347 = type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
  v10 = MEMORY[0x1E0C80A78](v347);
  v333 = (uint64_t *)((char *)&v318 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = MEMORY[0x1E0C80A78](v10);
  v357 = (uint64_t *)((char *)&v318 - v13);
  MEMORY[0x1E0C80A78](v12);
  v358 = (uint64_t *)((char *)&v318 - v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839A0);
  v16 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v318 - (((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v334 = v17;
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v318 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839A8);
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)&v318 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v23 = sub_1AC5DD2AC();
  *((_QWORD *)v23 + 1) = 0x4008000000000000;
  v23[16] = 0;
  v24 = (uint64_t *)&v23[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839B0) + 44)];
  v348 = a2;
  sub_1AC4FF5E4(a1, v24);
  sub_1AC507378((uint64_t)v23, (uint64_t)v20, &qword_1EEC839A8);
  *(_QWORD *)&v20[*(int *)(v15 + 36)] = 0x3FF0000000000000;
  sub_1AC5073BC((uint64_t)v23, &qword_1EEC839A8);
  v349 = v18;
  v25 = (uint64_t)v18;
  v26 = a1;
  sub_1AC5073F8((uint64_t)v20, v25, &qword_1EEC839A0);
  v27 = (int *)type metadata accessor for AVInfoTabMetadata();
  v28 = *(unsigned int *)(a1 + v27[11]) | ((unint64_t)*(unsigned __int8 *)(a1 + v27[11] + 4) << 32);
  v341 = a3;
  if ((v28 & 0xFF00000000) != 0x400000000 && (*(_BYTE *)(a1 + *(int *)(v6 + 20)) & 0x40) != 0)
  {
    v360 = v28;
    type metadata accessor for AVObservableBundle();
    sub_1AC505590(&qword_1EEC83900, v29, (uint64_t (*)(uint64_t))type metadata accessor for AVObservableBundle, (uint64_t)&unk_1AC5F6E34);
    v355 = sub_1AC5DD210();
    v345 = v30;
    type metadata accessor for CGSize(0);
    v361 = 0uLL;
    sub_1AC5DD600();
    v344 = *((_QWORD *)&v362 + 1);
    v354 = v362;
    v353 = v363;
    v31 = sub_1AC5DD330();
    v32 = *(_QWORD *)(v31 - 8);
    MEMORY[0x1E0C80A78](v31);
    v34 = (char *)&v318 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_QWORD *)&v362 = 0xD000000000000021;
    *((_QWORD *)&v362 + 1) = 0x80000001AC5F9710;
    sub_1AC5DD384();
    sub_1AC5DD180();
    v36 = v35;
    v38 = v37;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v31);
    LOBYTE(v361) = 0;
    sub_1AC5DD600();
    v350 = v362;
    v322 = *((_QWORD *)&v362 + 1);
    v351 = v38;
    v352 = v36;
  }
  else
  {
    v345 = 0;
    v354 = 0;
    v344 = 0;
    v352 = 0;
    v353 = 0;
    v360 = 0;
    v350 = 0;
    v351 = 0;
    v322 = 0;
    v355 = 1;
  }
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839B8);
  v340 = &v318;
  v40 = *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64);
  MEMORY[0x1E0C80A78](v39);
  v359 = (uint64_t)&v318 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = *(unsigned __int8 *)(a1 + v27[13]);
  v346 = v27;
  v342 = (uint64_t *)v6;
  if (v41 == 2)
  {
    v42 = 1145597551;
  }
  else
  {
    if (v41 != 3)
    {
LABEL_11:
      v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C0);
      v45 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v359, 1, 1, v44);
      goto LABEL_16;
    }
    v42 = 1261727343;
  }
  v43 = v42 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
  if ((*(_BYTE *)(a1 + *(int *)(v6 + 20)) & 4) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v343 = (char *)a1;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C0);
  v339 = &v318;
  v47 = v46;
  v337 = *(uint64_t **)(v46 - 8);
  v48 = MEMORY[0x1E0C80A78](v46);
  v336 = (uint64_t *)((char *)&v318 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0));
  v335 = &v318;
  MEMORY[0x1E0C80A78](v48);
  v51 = (char *)&v318 - v50;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839D0);
  v332 = &v318;
  MEMORY[0x1E0C80A78](v52);
  v54 = (char *)&v318 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = v347;
  v56 = v358;
  v57 = (char *)v358 + *(int *)(v347 + 24);
  v58 = *MEMORY[0x1E0CDF778];
  v59 = sub_1AC5DD5D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 104))(v57, v58, v59);
  type metadata accessor for AVObservableBundle();
  sub_1AC505590(&qword_1EEC83900, v60, (uint64_t (*)(uint64_t))type metadata accessor for AVObservableBundle, (uint64_t)&unk_1AC5F6E34);
  *v56 = sub_1AC5DD210();
  v56[1] = v61;
  v62 = (char *)v56 + *(int *)(v55 + 28);
  __asm { FMOV            V0.2D, #1.0 }
  v361 = _Q0;
  type metadata accessor for CGSize(0);
  sub_1AC5DD600();
  v68 = v363;
  *(_OWORD *)v62 = v362;
  *((_QWORD *)v62 + 2) = v68;
  v56[2] = 0x6974756C6F736552;
  v56[3] = v43;
  if (v41 == 3)
    v69 = "CONTENT_TABS_ACCESSIBILITY_4k";
  else
    v69 = "CONTENT_TABS_ACCESSIBILITY_HD";
  v70 = (uint64_t)v358;
  sub_1AC5013A0(0xD00000000000001DLL, (unint64_t)(v69 - 32) | 0x8000000000000000);
  swift_bridgeObjectRelease();
  sub_1AC5055D0(v70, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
  v71 = sub_1AC5DD330();
  v72 = *(_QWORD *)(v71 - 8);
  MEMORY[0x1E0C80A78](v71);
  v74 = (char *)&v318 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v362 = 0xD000000000000021;
  *((_QWORD *)&v362 + 1) = 0x80000001AC5F9710;
  sub_1AC5DD384();
  sub_1AC5DD180();
  v76 = v75;
  v78 = v77;
  (*(void (**)(char *, uint64_t))(v72 + 8))(v74, v71);
  LOBYTE(v361) = 0;
  sub_1AC5DD600();
  LOBYTE(v71) = v362;
  v79 = *((_QWORD *)&v362 + 1);
  sub_1AC507378((uint64_t)v54, (uint64_t)v51, &qword_1EEC839D0);
  v80 = &v51[*(int *)(v47 + 36)];
  *(_QWORD *)v80 = v76;
  *((_QWORD *)v80 + 1) = v78;
  v80[16] = v71;
  *((_QWORD *)v80 + 3) = v79;
  sub_1AC5073BC((uint64_t)v54, &qword_1EEC839D0);
  v81 = (uint64_t)v336;
  sub_1AC5073F8((uint64_t)v51, (uint64_t)v336, &qword_1EEC839C0);
  v82 = v81;
  v83 = v359;
  sub_1AC5073F8(v82, v359, &qword_1EEC839C0);
  v45 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v337[7])(v83, 0, 1, v47);
  v6 = (uint64_t)v342;
  v26 = (uint64_t)v343;
  v27 = v346;
LABEL_16:
  v339 = &v318;
  MEMORY[0x1E0C80A78](v45);
  v358 = (uint64_t *)((char *)&v318 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0));
  v84 = *(unsigned __int8 *)(v26 + v27[14]);
  if (v84 == 2)
  {
    v86 = 0xE800000000000000;
    v85 = 0x524448726F6C6F43;
  }
  else
  {
    if (v84 != 3)
      goto LABEL_22;
    v85 = 0xD000000000000010;
    v86 = 0x80000001AC5F9800;
  }
  if ((*(_BYTE *)(v26 + *(int *)(v6 + 20)) & 8) != 0)
  {
    v343 = (char *)v26;
    v89 = v85;
    v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C0);
    v337 = &v318;
    v330 = (char *)v90;
    v336 = *(uint64_t **)(v90 - 8);
    v91 = MEMORY[0x1E0C80A78](v90);
    v335 = (uint64_t *)((char *)&v318 - ((v92 + 15) & 0xFFFFFFFFFFFFFFF0));
    v332 = &v318;
    MEMORY[0x1E0C80A78](v91);
    v94 = (char *)&v318 - v93;
    v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839D0);
    v331 = &v318;
    MEMORY[0x1E0C80A78](v95);
    v97 = (char *)&v318 - ((v96 + 15) & 0xFFFFFFFFFFFFFFF0);
    v98 = v347;
    v99 = v357;
    v100 = (char *)v357 + *(int *)(v347 + 24);
    v101 = *MEMORY[0x1E0CDF778];
    v102 = sub_1AC5DD5D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v102 - 8) + 104))(v100, v101, v102);
    type metadata accessor for AVObservableBundle();
    sub_1AC505590(&qword_1EEC83900, v103, (uint64_t (*)(uint64_t))type metadata accessor for AVObservableBundle, (uint64_t)&unk_1AC5F6E34);
    *v99 = sub_1AC5DD210();
    v99[1] = v104;
    v105 = (char *)v99 + *(int *)(v98 + 28);
    __asm { FMOV            V0.2D, #1.0 }
    v361 = _Q0;
    type metadata accessor for CGSize(0);
    sub_1AC5DD600();
    v107 = v363;
    *(_OWORD *)v105 = v362;
    *((_QWORD *)v105 + 2) = v107;
    v99[2] = v89;
    v99[3] = v86;
    if (v84 == 3)
    {
      v108 = 0xD000000000000027;
      v109 = "CONTENT_TABS_ACCESSIBILITY_DOLBY_VISION";
    }
    else
    {
      v108 = 0xD00000000000001ELL;
      v109 = "CONTENT_TABS_ACCESSIBILITY_HDR";
    }
    v110 = (uint64_t)v357;
    sub_1AC5013A0(v108, (unint64_t)(v109 - 32) | 0x8000000000000000);
    swift_bridgeObjectRelease();
    sub_1AC5055D0(v110, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    v111 = sub_1AC5DD330();
    v112 = *(_QWORD *)(v111 - 8);
    MEMORY[0x1E0C80A78](v111);
    v114 = (char *)&v318 - ((v113 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_QWORD *)&v362 = 0xD000000000000021;
    *((_QWORD *)&v362 + 1) = 0x80000001AC5F9710;
    sub_1AC5DD384();
    sub_1AC5DD180();
    v116 = v115;
    v118 = v117;
    (*(void (**)(char *, uint64_t))(v112 + 8))(v114, v111);
    LOBYTE(v361) = 0;
    sub_1AC5DD600();
    LOBYTE(v111) = v362;
    v119 = *((_QWORD *)&v362 + 1);
    sub_1AC507378((uint64_t)v97, (uint64_t)v94, &qword_1EEC839D0);
    v120 = (uint64_t)v330;
    v121 = &v94[*((int *)v330 + 9)];
    *(_QWORD *)v121 = v116;
    *((_QWORD *)v121 + 1) = v118;
    v121[16] = v111;
    *((_QWORD *)v121 + 3) = v119;
    sub_1AC5073BC((uint64_t)v97, &qword_1EEC839D0);
    v122 = (uint64_t)v335;
    sub_1AC5073F8((uint64_t)v94, (uint64_t)v335, &qword_1EEC839C0);
    v123 = v122;
    v124 = (uint64_t)v358;
    sub_1AC5073F8(v123, (uint64_t)v358, &qword_1EEC839C0);
    v88 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v336[7])(v124, 0, 1, v120);
    v6 = (uint64_t)v342;
    v26 = (uint64_t)v343;
    v27 = v346;
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_22:
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C0);
  v88 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 56))(v358, 1, 1, v87);
LABEL_27:
  v125 = (uint64_t)v356;
  MEMORY[0x1E0C80A78](v88);
  v357 = (uint64_t *)((char *)&v318 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0));
  _ZF = *(_BYTE *)(v26 + v27[15]) == 4;
  v337 = v126;
  if (_ZF && (*(_BYTE *)(v26 + *(int *)(v6 + 20)) & 0x10) != 0)
  {
    v332 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C0);
    v336 = &v318;
    v335 = (uint64_t *)*(v332 - 1);
    MEMORY[0x1E0C80A78](v332);
    v329 = (uint64_t)&v318 - ((v129 + 15) & 0xFFFFFFFFFFFFFFF0);
    v330 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839D0);
    v331 = &v318;
    v130 = *(_QWORD *)(*((_QWORD *)v330 - 1) + 64);
    MEMORY[0x1E0C80A78](v330);
    v131 = (v130 + 15) & 0xFFFFFFFFFFFFFFF0;
    v328 = (uint64_t *)((char *)&v318 - v131);
    v132 = *(int *)(v347 + 24);
    v133 = v347;
    v343 = (char *)v26;
    v134 = v333;
    v135 = (char *)v333 + v132;
    v136 = *MEMORY[0x1E0CDF778];
    v137 = sub_1AC5DD5D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v137 - 8) + 104))(v135, v136, v137);
    type metadata accessor for AVObservableBundle();
    sub_1AC505590(&qword_1EEC83900, v138, (uint64_t (*)(uint64_t))type metadata accessor for AVObservableBundle, (uint64_t)&unk_1AC5F6E34);
    *v134 = sub_1AC5DD210();
    v134[1] = v139;
    v140 = (char *)v134 + *(int *)(v133 + 28);
    __asm { FMOV            V0.2D, #1.0 }
    v361 = _Q0;
    type metadata accessor for CGSize(0);
    v142 = sub_1AC5DD600();
    v327 = &v318;
    v143 = v363;
    *(_OWORD *)v140 = v362;
    *((_QWORD *)v140 + 2) = v143;
    v134[2] = 0x6C6F446F69647541;
    v134[3] = 0xEF736F6D74417962;
    MEMORY[0x1E0C80A78](v142);
    v144 = (char *)&v318 - v131;
    v145 = (void *)sub_1AC5DD6F0();
    v146 = (void *)sub_1AC5DD6F0();
    v147 = AVLocalizedString(v145);

    v148 = sub_1AC5DD714();
    v150 = v149;

    *(_QWORD *)&v362 = v148;
    *((_QWORD *)&v362 + 1) = v150;
    sub_1AC50554C();
    v151 = sub_1AC5DD4C8();
    v153 = v152;
    v155 = v154 & 1;
    sub_1AC505590(&qword_1EEC839D8, 255, type metadata accessor for AVInfoTabMetadataStripView.BadgeView, (uint64_t)&unk_1AC5F72CC);
    sub_1AC5DD54C();
    sub_1AC4FC6EC(v151, v153, v155);
    swift_bridgeObjectRelease();
    v156 = sub_1AC5DD2DC();
    v157 = *(_QWORD *)(v156 - 8);
    MEMORY[0x1E0C80A78](v156);
    v159 = (char *)&v318 - ((v158 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1AC5DD2D0();
    v160 = (uint64_t)v328;
    sub_1AC5DD1C8();
    (*(void (**)(char *, uint64_t))(v157 + 8))(v159, v156);
    sub_1AC5073BC((uint64_t)v144, &qword_1EEC839D0);
    v161 = (uint64_t)v134;
    v26 = (uint64_t)v343;
    v6 = (uint64_t)v342;
    v330 = (char *)v40;
    sub_1AC5055D0(v161, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    v162 = sub_1AC5DD330();
    v163 = *(_QWORD *)(v162 - 8);
    MEMORY[0x1E0C80A78](v162);
    v165 = (char *)&v318 - ((v164 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_QWORD *)&v362 = 0xD000000000000021;
    *((_QWORD *)&v362 + 1) = 0x80000001AC5F9710;
    sub_1AC5DD384();
    sub_1AC5DD180();
    v167 = v166;
    v169 = v168;
    v170 = v165;
    v27 = v346;
    (*(void (**)(char *, uint64_t))(v163 + 8))(v170, v162);
    v125 = (uint64_t)v356;
    LOBYTE(v361) = 0;
    sub_1AC5DD600();
    LOBYTE(v162) = v362;
    v171 = *((_QWORD *)&v362 + 1);
    v172 = v329;
    sub_1AC507378(v160, v329, &qword_1EEC839D0);
    v173 = v332;
    v174 = v172 + *((int *)v332 + 9);
    *(_QWORD *)v174 = v167;
    *(_QWORD *)(v174 + 8) = v169;
    *(_BYTE *)(v174 + 16) = v162;
    *(_QWORD *)(v174 + 24) = v171;
    sub_1AC5073BC(v160, &qword_1EEC839D0);
    v175 = (uint64_t)v357;
    sub_1AC5073F8(v172, (uint64_t)v357, &qword_1EEC839C0);
    v40 = (uint64_t)v330;
    v128 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t *))v335[7])(v175, 0, 1, v173);
  }
  else
  {
    v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C0);
    v128 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v127 - 8) + 56))(v357, 1, 1, v127);
  }
  if (*(_QWORD *)(v26 + v27[12]) && (*(_BYTE *)(v26 + *(int *)(v6 + 20)) & 0x20) != 0)
  {
    v176 = *(uint64_t **)(v26 + v27[12]);
    v177 = sub_1AC5DD330();
    v178 = *(_QWORD *)(v177 - 8);
    MEMORY[0x1E0C80A78](v177);
    v180 = (char *)&v318 - ((v179 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_QWORD *)&v362 = 0xD000000000000021;
    *((_QWORD *)&v362 + 1) = 0x80000001AC5F9710;
    v327 = v176;
    v181 = v176;
    sub_1AC5DD384();
    sub_1AC5DD180();
    v183 = v182;
    v185 = v184;
    v186 = v180;
    v27 = v346;
    (*(void (**)(char *, uint64_t))(v178 + 8))(v186, v177);
    LOBYTE(v361) = 0;
    sub_1AC5DD600();

    v125 = (uint64_t)v356;
    v326 = (uint64_t *)v362;
    v324 = (uint64_t *)*((_QWORD *)&v362 + 1);
    v325 = v183;
    v323 = v185;
  }
  else
  {
    v327 = 0;
    v325 = 0;
    v323 = 0;
    v326 = 0;
    v324 = 0;
  }
  MEMORY[0x1E0C80A78](v128);
  v187 = (char *)&v318 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v188 = *(unsigned __int8 *)(v26 + v27[17]);
  sub_1AC5059E4(v26, v125, type metadata accessor for AVInfoTabMetadataStripView);
  v336 = &v318;
  v343 = v187;
  if (v188 == 1)
  {
    v189 = *(_QWORD *)(v125 + *(int *)(v6 + 20));
    sub_1AC5055D0(v125, type metadata accessor for AVInfoTabMetadataStripView);
    if ((v189 & 0x80) != 0)
    {
      v332 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C0);
      v356 = &v318;
      v335 = (uint64_t *)*(v332 - 1);
      MEMORY[0x1E0C80A78](v332);
      v330 = (char *)&v318 - ((v190 + 15) & 0xFFFFFFFFFFFFFFF0);
      v328 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839D0);
      v331 = &v318;
      v191 = *(_QWORD *)(*(v328 - 1) + 64);
      MEMORY[0x1E0C80A78](v328);
      v192 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
      v329 = (uint64_t)&v318 - v192;
      v193 = v347;
      v194 = v333;
      v195 = (char *)v333 + *(int *)(v347 + 24);
      v196 = *MEMORY[0x1E0CDF778];
      v197 = sub_1AC5DD5D0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v197 - 8) + 104))(v195, v196, v197);
      type metadata accessor for AVObservableBundle();
      sub_1AC505590(&qword_1EEC83900, v198, (uint64_t (*)(uint64_t))type metadata accessor for AVObservableBundle, (uint64_t)&unk_1AC5F6E34);
      *v194 = sub_1AC5DD210();
      v194[1] = v199;
      v200 = (char *)v194 + *(int *)(v193 + 28);
      __asm { FMOV            V0.2D, #1.0 }
      v361 = _Q0;
      type metadata accessor for CGSize(0);
      v202 = sub_1AC5DD600();
      v321 = &v318;
      v203 = v363;
      *(_OWORD *)v200 = v362;
      *((_QWORD *)v200 + 2) = v203;
      v194[2] = 0x6B73616D5F6363;
      v194[3] = 0xE700000000000000;
      v204 = MEMORY[0x1E0C80A78](v202);
      v319 = (char *)&v318 - v192;
      v320 = &v318;
      MEMORY[0x1E0C80A78](v204);
      v205 = (void *)sub_1AC5DD6F0();
      v206 = (void *)sub_1AC5DD6F0();
      v207 = AVLocalizedString(v205);

      v208 = sub_1AC5DD714();
      v210 = v209;

      *(_QWORD *)&v362 = v208;
      *((_QWORD *)&v362 + 1) = v210;
      sub_1AC50554C();
      v211 = sub_1AC5DD4C8();
      v213 = v212;
      v214 = v26;
      v216 = v215 & 1;
      sub_1AC505590(&qword_1EEC839D8, 255, type metadata accessor for AVInfoTabMetadataStripView.BadgeView, (uint64_t)&unk_1AC5F72CC);
      sub_1AC5DD54C();
      sub_1AC4FC6EC(v211, v213, v216);
      swift_bridgeObjectRelease();
      v217 = sub_1AC5DD2DC();
      v218 = *(_QWORD *)(v217 - 8);
      MEMORY[0x1E0C80A78](v217);
      v220 = (char *)&v318 - ((v219 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_1AC5DD2D0();
      v221 = (uint64_t)v319;
      sub_1AC5DD1C8();
      v222 = *(void (**)(_QWORD, _QWORD))(v218 + 8);
      v26 = v214;
      v222(v220, v217);
      sub_1AC5073BC((uint64_t)&v318 - v192, &qword_1EEC839D0);
      v223 = v329;
      sub_1AC5073F8(v221, v329, &qword_1EEC839D0);
      v224 = (uint64_t)v343;
      sub_1AC5055D0((uint64_t)v194, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
      v225 = sub_1AC5DD330();
      v226 = *(_QWORD *)(v225 - 8);
      MEMORY[0x1E0C80A78](v225);
      v228 = (char *)&v318 - ((v227 + 15) & 0xFFFFFFFFFFFFFFF0);
      *(_QWORD *)&v362 = 0xD000000000000021;
      *((_QWORD *)&v362 + 1) = 0x80000001AC5F9710;
      sub_1AC5DD384();
      sub_1AC5DD180();
      v230 = v229;
      v232 = v231;
      v233 = v228;
      v27 = v346;
      (*(void (**)(char *, uint64_t))(v226 + 8))(v233, v225);
      LOBYTE(v361) = 0;
      sub_1AC5DD600();
      LOBYTE(v225) = v362;
      v234 = *((_QWORD *)&v362 + 1);
      v235 = (uint64_t)v330;
      sub_1AC507378(v223, (uint64_t)v330, &qword_1EEC839D0);
      v236 = v332;
      v237 = v235 + *((int *)v332 + 9);
      *(_QWORD *)v237 = v230;
      *(_QWORD *)(v237 + 8) = v232;
      *(_BYTE *)(v237 + 16) = v225;
      *(_QWORD *)(v237 + 24) = v234;
      sub_1AC5073BC(v223, &qword_1EEC839D0);
      sub_1AC5073F8(v235, v224, &qword_1EEC839C0);
      v187 = (char *)v224;
      v238 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t *))v335[7])(v224, 0, 1, v236);
      goto LABEL_41;
    }
  }
  else
  {
    sub_1AC5055D0(v125, type metadata accessor for AVInfoTabMetadataStripView);
  }
  v239 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C0);
  v238 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v239 - 8) + 56))((char *)&v318 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v239);
LABEL_41:
  MEMORY[0x1E0C80A78](v238);
  v356 = (uint64_t *)((char *)&v318 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0));
  v240 = *(unsigned __int8 *)(v26 + v27[18]);
  v241 = (uint64_t)v338;
  sub_1AC5059E4(v26, (uint64_t)v338, type metadata accessor for AVInfoTabMetadataStripView);
  v335 = &v318;
  if (v240 != 1)
  {
    sub_1AC5055D0(v241, type metadata accessor for AVInfoTabMetadataStripView);
    goto LABEL_45;
  }
  v242 = *(_QWORD *)(v241 + *((int *)v342 + 5));
  sub_1AC5055D0(v241, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v242 & 0x100) == 0)
  {
LABEL_45:
    v291 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C0);
    v290 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v291 - 8) + 56))(v356, 1, 1, v291);
    goto LABEL_46;
  }
  v338 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C0);
  v346 = (int *)&v318;
  v342 = (uint64_t *)*(v338 - 1);
  MEMORY[0x1E0C80A78](v338);
  v331 = (uint64_t *)((char *)&v318 - ((v243 + 15) & 0xFFFFFFFFFFFFFFF0));
  v329 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839D0);
  v332 = &v318;
  v244 = *(_QWORD *)(*(_QWORD *)(v329 - 8) + 64);
  MEMORY[0x1E0C80A78](v329);
  v245 = (v244 + 15) & 0xFFFFFFFFFFFFFFF0;
  v330 = (char *)&v318 - v245;
  v246 = v347;
  v247 = v333;
  v248 = (char *)v333 + *(int *)(v347 + 24);
  v249 = *MEMORY[0x1E0CDF778];
  v250 = sub_1AC5DD5D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v250 - 8) + 104))(v248, v249, v250);
  type metadata accessor for AVObservableBundle();
  sub_1AC505590(&qword_1EEC83900, v251, (uint64_t (*)(uint64_t))type metadata accessor for AVObservableBundle, (uint64_t)&unk_1AC5F6E34);
  *v247 = sub_1AC5DD210();
  v247[1] = v252;
  v253 = (char *)v247 + *(int *)(v246 + 28);
  __asm { FMOV            V0.2D, #1.0 }
  v361 = _Q0;
  type metadata accessor for CGSize(0);
  v255 = sub_1AC5DD600();
  v328 = &v318;
  v256 = v363;
  *(_OWORD *)v253 = v362;
  *((_QWORD *)v253 + 2) = v256;
  v247[2] = 0xD000000000000011;
  v247[3] = 0x80000001AC5F9740;
  v257 = MEMORY[0x1E0C80A78](v255);
  v321 = &v318;
  MEMORY[0x1E0C80A78](v257);
  v258 = (void *)sub_1AC5DD6F0();
  v259 = (void *)sub_1AC5DD6F0();
  v260 = AVLocalizedString(v258);

  v261 = sub_1AC5DD714();
  v263 = v262;

  *(_QWORD *)&v362 = v261;
  *((_QWORD *)&v362 + 1) = v263;
  sub_1AC50554C();
  v264 = sub_1AC5DD4C8();
  v266 = v265;
  v268 = v267 & 1;
  sub_1AC505590(&qword_1EEC839D8, 255, type metadata accessor for AVInfoTabMetadataStripView.BadgeView, (uint64_t)&unk_1AC5F72CC);
  sub_1AC5DD54C();
  sub_1AC4FC6EC(v264, v266, v268);
  swift_bridgeObjectRelease();
  v269 = sub_1AC5DD2DC();
  v270 = *(_QWORD *)(v269 - 8);
  MEMORY[0x1E0C80A78](v269);
  v272 = (char *)&v318 - ((v271 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC5DD2D0();
  sub_1AC5DD1C8();
  v273 = v272;
  v274 = (uint64_t)v356;
  (*(void (**)(char *, uint64_t))(v270 + 8))(v273, v269);
  sub_1AC5073BC((uint64_t)&v318 - v245, &qword_1EEC839D0);
  v275 = (uint64_t)v330;
  sub_1AC5073F8((uint64_t)&v318 - v245, (uint64_t)v330, &qword_1EEC839D0);
  sub_1AC5055D0((uint64_t)v247, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
  v276 = sub_1AC5DD330();
  v277 = *(_QWORD *)(v276 - 8);
  MEMORY[0x1E0C80A78](v276);
  v279 = (char *)&v318 - ((v278 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v362 = 0xD000000000000021;
  *((_QWORD *)&v362 + 1) = 0x80000001AC5F9710;
  sub_1AC5DD384();
  sub_1AC5DD180();
  v281 = v280;
  v283 = v282;
  v284 = *(void (**)(_QWORD, _QWORD))(v277 + 8);
  v187 = v343;
  v284(v279, v276);
  LOBYTE(v361) = 0;
  sub_1AC5DD600();
  LOBYTE(v276) = v362;
  v285 = *((_QWORD *)&v362 + 1);
  v286 = v275;
  v287 = (uint64_t)v331;
  sub_1AC507378(v275, (uint64_t)v331, &qword_1EEC839D0);
  v288 = (uint64_t)v338;
  v289 = v287 + *((int *)v338 + 9);
  *(_QWORD *)v289 = v281;
  *(_QWORD *)(v289 + 8) = v283;
  *(_BYTE *)(v289 + 16) = v276;
  *(_QWORD *)(v289 + 24) = v285;
  sub_1AC5073BC(v286, &qword_1EEC839D0);
  sub_1AC5073F8(v287, v274, &qword_1EEC839C0);
  v290 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v342[7])(v274, 0, 1, v288);
LABEL_46:
  v342 = &v318;
  MEMORY[0x1E0C80A78](v290);
  v293 = (char *)&v318 - ((v292 + 15) & 0xFFFFFFFFFFFFFFF0);
  v330 = v293;
  v294 = sub_1AC507378((uint64_t)v349, (uint64_t)v293, &qword_1EEC839A0);
  v338 = &v318;
  MEMORY[0x1E0C80A78](v294);
  v295 = (v40 + 15) & 0xFFFFFFFFFFFFFFF0;
  v348 = (uint64_t)&v318 - v295;
  v296 = sub_1AC507378(v359, (uint64_t)&v318 - v295, &qword_1EEC839B8);
  v334 = &v318;
  MEMORY[0x1E0C80A78](v296);
  v297 = (char *)&v318 - v295;
  v329 = (uint64_t)&v318 - v295;
  v298 = sub_1AC507378((uint64_t)v358, (uint64_t)&v318 - v295, &qword_1EEC839B8);
  v333 = &v318;
  MEMORY[0x1E0C80A78](v298);
  v299 = (char *)&v318 - v295;
  v328 = (uint64_t *)((char *)&v318 - v295);
  v300 = sub_1AC507378((uint64_t)v357, (uint64_t)&v318 - v295, &qword_1EEC839B8);
  v332 = &v318;
  MEMORY[0x1E0C80A78](v300);
  v347 = (uint64_t)&v318 - v295;
  v301 = sub_1AC507378((uint64_t)v187, (uint64_t)&v318 - v295, &qword_1EEC839B8);
  v331 = &v318;
  MEMORY[0x1E0C80A78](v301);
  v346 = (int *)((char *)&v318 - v295);
  sub_1AC507378((uint64_t)v356, (uint64_t)&v318 - v295, &qword_1EEC839B8);
  v302 = (uint64_t)v293;
  v303 = v341;
  sub_1AC507378(v302, v341, &qword_1EEC839A0);
  v304 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839C8);
  v305 = (_QWORD *)(v303 + v304[12]);
  v306 = v345;
  *v305 = v355;
  v305[1] = v306;
  v307 = v344;
  v305[2] = v354;
  v305[3] = v307;
  v308 = v360;
  v305[4] = v353;
  v305[5] = v308;
  v310 = v350;
  v309 = v351;
  v305[6] = v352;
  v305[7] = v309;
  v350 = v310;
  v311 = v322;
  v305[8] = v310;
  v305[9] = v311;
  sub_1AC507378(v348, v303 + v304[16], &qword_1EEC839B8);
  sub_1AC507378((uint64_t)v297, v303 + v304[20], &qword_1EEC839B8);
  sub_1AC507378((uint64_t)v299, v303 + v304[24], &qword_1EEC839B8);
  v312 = (uint64_t **)(v303 + v304[28]);
  v313 = v327;
  v314 = v325;
  *v312 = v327;
  v312[1] = v314;
  v315 = v326;
  v312[2] = v323;
  v312[3] = v315;
  v312[4] = v324;
  sub_1AC507378(v347, v303 + v304[32], &qword_1EEC839B8);
  sub_1AC507378((uint64_t)v346, v303 + v304[36], &qword_1EEC839B8);
  v316 = v303 + v304[40];
  *(_QWORD *)v316 = 0;
  *(_BYTE *)(v316 + 8) = 1;
  sub_1AC505474(v355);
  sub_1AC5054B4(v313);
  sub_1AC5073BC((uint64_t)v356, &qword_1EEC839B8);
  sub_1AC5073BC((uint64_t)v343, &qword_1EEC839B8);
  sub_1AC5073BC((uint64_t)v357, &qword_1EEC839B8);
  sub_1AC5073BC((uint64_t)v358, &qword_1EEC839B8);
  sub_1AC5073BC(v359, &qword_1EEC839B8);
  sub_1AC5073BC((uint64_t)v349, &qword_1EEC839A0);
  sub_1AC5073BC((uint64_t)v346, &qword_1EEC839B8);
  sub_1AC5073BC(v347, &qword_1EEC839B8);
  sub_1AC5054E4(v313);
  sub_1AC5073BC((uint64_t)v328, &qword_1EEC839B8);
  sub_1AC5073BC(v329, &qword_1EEC839B8);
  sub_1AC5073BC(v348, &qword_1EEC839B8);
  sub_1AC505510(v355);
  return sub_1AC5073BC((uint64_t)v330, &qword_1EEC839A0);
}

uint64_t sub_1AC4FF5E4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  unint64_t *v79;
  unint64_t *v80;
  void (*v81)(char *, uint64_t);
  unint64_t v82;
  unint64_t v83;
  _QWORD *v84;
  unint64_t *v85;
  unint64_t v86;
  unint64_t *v87;
  unint64_t *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  unint64_t v97;
  unint64_t v98;

  v4 = type metadata accessor for AVInfoTabMetadataStripView(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for AVInfoTabMetadata();
  v8 = (unint64_t *)(a1 + *(int *)(v7 + 36));
  v9 = v8[1];
  v89 = a2;
  if (!v9)
    goto LABEL_7;
  v10 = v7;
  v11 = *v8;
  v12 = *(_QWORD *)(a1 + *(int *)(v4 + 20));
  sub_1AC5059E4(a1, (uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v12 & 1) == 0)
  {
    sub_1AC5055D0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
LABEL_7:
    v77 = 0;
    v95 = 0;
    v92 = 0;
    v76 = 0;
    v94 = 0;
    v90 = 0;
    v91 = 0;
    v75 = 0;
    v74 = 0;
    goto LABEL_8;
  }
  v13 = *(_QWORD *)&v6[*(int *)(v10 + 36) + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AC5055D0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  v97 = v11;
  v98 = v9;
  sub_1AC50554C();
  v77 = sub_1AC5DD4C8();
  v95 = v14;
  v76 = v15;
  v92 = v16 & 1;
  v17 = sub_1AC5DD330();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = 0xD000000000000021;
  v98 = 0x80000001AC5F9710;
  sub_1AC5DD384();
  sub_1AC5DD180();
  v22 = v21;
  v24 = v23;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  v96 = 0;
  sub_1AC5DD600();
  v75 = v97;
  v74 = v98;
  v90 = v24;
  v91 = v22;
  v94 = 257;
LABEL_8:
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839E0);
  v88 = &v74;
  v87 = *(unint64_t **)(*(_QWORD *)(v25 - 8) + 64);
  v26 = MEMORY[0x1E0C80A78](v25);
  v86 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  v28 = (char *)&v74 - v86;
  v93 = &v74;
  MEMORY[0x1E0C80A78](v26);
  v30 = (char *)&v74 - v29;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839E8);
  v85 = &v74;
  MEMORY[0x1E0C80A78](v31);
  v33 = (char *)&v74 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC4FFDD0(a1, (uint64_t)v33);
  v34 = sub_1AC5DD330();
  v84 = (_QWORD *)a1;
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(_QWORD *)(v35 + 64);
  MEMORY[0x1E0C80A78](v34);
  v82 = 0x80000001AC5F9710;
  v83 = (v36 + 15) & 0xFFFFFFFFFFFFFFF0;
  v97 = 0xD000000000000021;
  v98 = 0x80000001AC5F9710;
  sub_1AC5DD384();
  sub_1AC5DD180();
  v38 = v37;
  v40 = v39;
  v81 = *(void (**)(char *, uint64_t))(v35 + 8);
  v81((char *)&v74 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), v34);
  v96 = 0;
  sub_1AC5DD600();
  v41 = v97;
  v42 = v98;
  sub_1AC507378((uint64_t)v33, (uint64_t)v30, &qword_1EEC839E8);
  v43 = &v30[*(int *)(v25 + 36)];
  *(_QWORD *)v43 = v38;
  *((_QWORD *)v43 + 1) = v40;
  v43[16] = v41;
  *((_QWORD *)v43 + 3) = v42;
  sub_1AC5073BC((uint64_t)v33, &qword_1EEC839E8);
  v44 = (uint64_t)v28;
  v78 = v28;
  sub_1AC5073F8((uint64_t)v30, (uint64_t)v28, &qword_1EEC839E0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839F0);
  v85 = &v74;
  v46 = *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64);
  v47 = MEMORY[0x1E0C80A78](v45);
  v48 = (v46 + 15) & 0xFFFFFFFFFFFFFFF0;
  v93 = (unint64_t *)((char *)&v74 - v48);
  v80 = &v74;
  MEMORY[0x1E0C80A78](v47);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839F8);
  v79 = &v74;
  MEMORY[0x1E0C80A78](v49);
  v51 = (char *)&v74 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_1AC50093C((uint64_t)v84, (uint64_t)v51);
  MEMORY[0x1E0C80A78](v52);
  v53 = (char *)&v74 - v83;
  v97 = 0xD000000000000021;
  v98 = v82;
  sub_1AC5DD384();
  sub_1AC5DD180();
  v55 = v54;
  v57 = v56;
  v81(v53, v34);
  v96 = 0;
  sub_1AC5DD600();
  LOBYTE(v28) = v97;
  v58 = v98;
  sub_1AC507378((uint64_t)v51, (uint64_t)&v74 - v48, &qword_1EEC839F8);
  v59 = (char *)&v74 + *(int *)(v45 + 36) - v48;
  *(_QWORD *)v59 = v55;
  *((_QWORD *)v59 + 1) = v57;
  v59[16] = (char)v28;
  *((_QWORD *)v59 + 3) = v58;
  sub_1AC5073BC((uint64_t)v51, &qword_1EEC839F8);
  v60 = (uint64_t)v93;
  v61 = sub_1AC5073F8((uint64_t)&v74 - v48, (uint64_t)v93, &qword_1EEC839F0);
  v84 = &v74;
  MEMORY[0x1E0C80A78](v61);
  v62 = (char *)&v74 - v86;
  v63 = sub_1AC507378(v44, (uint64_t)&v74 - v86, &qword_1EEC839E0);
  v87 = &v74;
  MEMORY[0x1E0C80A78](v63);
  v64 = (char *)&v74 - v48;
  sub_1AC507378(v60, (uint64_t)&v74 - v48, &qword_1EEC839F0);
  v65 = v89;
  v66 = v77;
  v67 = v94;
  v68 = v95;
  *v89 = v77;
  v65[1] = v68;
  v95 = v68;
  v69 = v76;
  v65[2] = v92;
  v65[3] = v69;
  v94 = v67;
  v70 = v91;
  v65[4] = v67;
  v65[5] = v70;
  v71 = v75;
  v65[6] = v90;
  v65[7] = v71;
  v65[8] = v74;
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A00);
  sub_1AC507378((uint64_t)v62, (uint64_t)v65 + *(int *)(v72 + 48), &qword_1EEC839E0);
  sub_1AC507378((uint64_t)v64, (uint64_t)v65 + *(int *)(v72 + 64), &qword_1EEC839F0);
  LOBYTE(v72) = v92;
  sub_1AC50560C(v66, v68, v92, v69);
  sub_1AC5073BC((uint64_t)v93, &qword_1EEC839F0);
  sub_1AC5073BC((uint64_t)v78, &qword_1EEC839E0);
  sub_1AC5073BC((uint64_t)v64, &qword_1EEC839F0);
  sub_1AC5073BC((uint64_t)v62, &qword_1EEC839E0);
  return sub_1AC505648(v66, v95, v72, v69);
}

uint64_t sub_1AC4FFDD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;

  v4 = type metadata accessor for AVInfoTabMetadataStripView.ReleaseDateView(0);
  MEMORY[0x1E0C80A78](v4);
  v81 = (uint64_t *)((char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for AVInfoTabMetadataStripView(0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v79 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v68 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v14);
  v80 = (uint64_t)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v68 - v18;
  v20 = type metadata accessor for AVInfoTabMetadata();
  sub_1AC507378(a1 + *(int *)(v20 + 24), (uint64_t)v13, &qword_1EEC830A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_1AC5073BC((uint64_t)v13, &qword_1EEC830A0);
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A78);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(a2, 1, 1, v21);
  }
  v77 = a2;
  v23 = *(int *)(v14 + 48);
  v24 = &v19[v23];
  v70 = v14;
  v25 = *(int *)(v14 + 64);
  v26 = &v19[v25];
  v27 = (uint64_t)v19;
  v28 = &v13[v23];
  v29 = &v13[v25];
  v78 = v27;
  sub_1AC5073F8((uint64_t)v13, v27, &qword_1EEC830B0);
  v30 = *((_QWORD *)v28 + 1);
  v74 = *(_QWORD *)v28;
  *(_QWORD *)v24 = v74;
  *((_QWORD *)v24 + 1) = v30;
  v31 = *((_QWORD *)v29 + 1);
  v72 = *(_QWORD *)v29;
  *(_QWORD *)v26 = v72;
  *((_QWORD *)v26 + 1) = v31;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A10);
  v33 = *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64);
  MEMORY[0x1E0C80A78](v32);
  v34 = (char *)&v68 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = *(_QWORD *)(a1 + *(int *)(v6 + 20));
  sub_1AC5059E4(a1, (uint64_t)v10, type metadata accessor for AVInfoTabMetadataStripView);
  v75 = v33;
  v76 = &v68;
  v73 = v30;
  v71 = v31;
  v69 = v34;
  if ((v35 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1AC5055D0((uint64_t)v10, type metadata accessor for AVInfoTabMetadataStripView);
    v37 = v78;
    v36 = (uint64_t)v79;
LABEL_8:
    sub_1AC5059E4(a1, v36, type metadata accessor for AVInfoTabMetadataStripView);
    sub_1AC5055D0(v36, type metadata accessor for AVInfoTabMetadataStripView);
    goto LABEL_9;
  }
  v38 = *(_QWORD *)&v10[*(int *)(v20 + 36) + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AC5055D0((uint64_t)v10, type metadata accessor for AVInfoTabMetadataStripView);
  v37 = v78;
  v36 = (uint64_t)v79;
  if (!v38)
    goto LABEL_8;
  swift_bridgeObjectRelease();
  sub_1AC5059E4(a1, v36, type metadata accessor for AVInfoTabMetadataStripView);
  v39 = sub_1AC5004B0();
  sub_1AC5055D0(v36, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v39 & 1) == 0)
  {
LABEL_9:
    v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A18);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v34, 1, 1, v47);
    goto LABEL_10;
  }
  sub_1AC5DD2B8();
  v40 = sub_1AC5DD4BC();
  v42 = v41;
  v82 = v40;
  v83 = v41;
  v44 = v43 & 1;
  v84 = v43 & 1;
  v85 = v45;
  sub_1AC5DD558();
  sub_1AC4FC6EC(v40, v42, v44);
  swift_bridgeObjectRelease();
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v34, 0, 1, v46);
LABEL_10:
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A80);
  v79 = (char *)&v68;
  v49 = *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64);
  v50 = MEMORY[0x1E0C80A78](v48);
  v68 = (uint64_t)&v68;
  MEMORY[0x1E0C80A78](v50);
  v51 = (char *)&v68 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = v80;
  sub_1AC507378(v37, v80, &qword_1EEC830B0);
  v53 = (uint64_t)v81;
  v54 = (uint64_t *)((char *)v81 + *(int *)(v70 + 48));
  v55 = (uint64_t *)((char *)v81 + *(int *)(v70 + 64));
  sub_1AC5073F8(v52, (uint64_t)v81, &qword_1EEC830B0);
  v56 = v73;
  *v54 = v74;
  v54[1] = v56;
  v57 = v71;
  *v55 = v72;
  v55[1] = v57;
  sub_1AC5059E4(v53, (uint64_t)v51, type metadata accessor for AVInfoTabMetadataStripView.ReleaseDateView);
  *(_WORD *)&v51[*(int *)(v48 + 36)] = 257;
  sub_1AC5055D0(v53, type metadata accessor for AVInfoTabMetadataStripView.ReleaseDateView);
  sub_1AC5073F8((uint64_t)v51, (uint64_t)v51, &qword_1EEC83A80);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A88);
  v81 = &v68;
  v59 = MEMORY[0x1E0C80A78](v58);
  v61 = (char *)&v68 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v59);
  v63 = (char *)&v68 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = (uint64_t)v69;
  v65 = sub_1AC507378((uint64_t)v69, (uint64_t)v63, &qword_1EEC83A10);
  MEMORY[0x1E0C80A78](v65);
  sub_1AC507378((uint64_t)v51, (uint64_t)v51, &qword_1EEC83A80);
  sub_1AC507378((uint64_t)v63, (uint64_t)v61, &qword_1EEC83A10);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A90);
  sub_1AC507378((uint64_t)v51, (uint64_t)&v61[*(int *)(v66 + 48)], &qword_1EEC83A80);
  sub_1AC5073BC((uint64_t)v51, &qword_1EEC83A80);
  sub_1AC5073BC(v64, &qword_1EEC83A10);
  sub_1AC5073BC(v78, &qword_1EEC83098);
  sub_1AC5073BC((uint64_t)v51, &qword_1EEC83A80);
  sub_1AC5073BC((uint64_t)v63, &qword_1EEC83A10);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A78);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56))(v61, 0, 1, v67);
  return sub_1AC5073F8((uint64_t)v61, v77, &qword_1EEC83A88);
}

uint64_t sub_1AC5004B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v1 = type metadata accessor for AVInfoTabMetadataStripView(0);
  v2 = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v33 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v33 - v12;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v33 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for AVInfoTabMetadata();
  sub_1AC507378(v0 + *(int *)(v19 + 24), (uint64_t)v15, &qword_1EEC830A0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48);
  if (v21(v15, 1, v20) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1AC5073F8((uint64_t)v15, (uint64_t)v18, &qword_1EEC830B0);
    v23 = sub_1AC5DD060();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48))(v18, 1, v23) == 1)
      goto LABEL_4;
    sub_1AC5073BC((uint64_t)v18, &qword_1EEC830B0);
    sub_1AC5059E4(v0, (uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
    sub_1AC507378((uint64_t)&v6[*(int *)(v19 + 24)], (uint64_t)v13, &qword_1EEC830A0);
    if (v21(v13, 1, v20) == 1)
    {
      sub_1AC5073BC((uint64_t)v13, &qword_1EEC830A0);
    }
    else
    {
      v26 = &v13[*(int *)(v20 + 48)];
      v28 = *(_QWORD *)v26;
      v27 = *((_QWORD *)v26 + 1);
      swift_bridgeObjectRelease();
      sub_1AC5073BC((uint64_t)v13, &qword_1EEC830B0);
      if (v27)
      {
        if (!v28 && v27 == 0xE000000000000000)
        {
          sub_1AC5055D0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
          swift_bridgeObjectRelease();
          goto LABEL_5;
        }
        v32 = sub_1AC5DD87C();
        sub_1AC5055D0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
        swift_bridgeObjectRelease();
        sub_1AC5059E4(v0, (uint64_t)v4, type metadata accessor for AVInfoTabMetadataStripView);
        if ((v32 & 1) != 0)
          goto LABEL_6;
LABEL_15:
        sub_1AC507378((uint64_t)&v4[*(int *)(v19 + 24)], (uint64_t)v10, &qword_1EEC830A0);
        if (v21(v10, 1, v20) == 1)
        {
          sub_1AC5073BC((uint64_t)v10, &qword_1EEC830A0);
        }
        else
        {
          swift_bridgeObjectRelease();
          v29 = &v10[*(int *)(v20 + 64)];
          v31 = *(_QWORD *)v29;
          v30 = *((_QWORD *)v29 + 1);
          sub_1AC5073BC((uint64_t)v10, &qword_1EEC830B0);
          if (v30)
          {
            if (v31 || v30 != 0xE000000000000000)
              v24 = sub_1AC5DD87C() ^ 1;
            else
              v24 = 0;
            goto LABEL_22;
          }
        }
        v24 = 1;
LABEL_22:
        sub_1AC5055D0((uint64_t)v4, type metadata accessor for AVInfoTabMetadataStripView);
        swift_bridgeObjectRelease();
        return v24 & 1;
      }
    }
    sub_1AC5055D0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
    swift_bridgeObjectRelease();
    sub_1AC5059E4(v0, (uint64_t)v4, type metadata accessor for AVInfoTabMetadataStripView);
    goto LABEL_15;
  }
  sub_1AC5073BC((uint64_t)v15, &qword_1EEC830A0);
  v22 = sub_1AC5DD060();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v18, 1, 1, v22);
LABEL_4:
  sub_1AC5073BC((uint64_t)v18, &qword_1EEC830B0);
  sub_1AC5059E4(v0, (uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
  sub_1AC5055D0((uint64_t)v6, type metadata accessor for AVInfoTabMetadataStripView);
LABEL_5:
  sub_1AC5059E4(v0, (uint64_t)v4, type metadata accessor for AVInfoTabMetadataStripView);
LABEL_6:
  sub_1AC5055D0((uint64_t)v4, type metadata accessor for AVInfoTabMetadataStripView);
  v24 = 0;
  return v24 & 1;
}

uint64_t sub_1AC50093C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int16 v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unsigned __int16 v87;
  char v88;

  v75 = a2;
  v3 = sub_1AC5DD090();
  MEMORY[0x1E0C80A78](v3);
  v73 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1AC5DD078();
  MEMORY[0x1E0C80A78](v5);
  v71 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1AC5DD000();
  MEMORY[0x1E0C80A78](v7);
  v69 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_1AC5DD03C();
  MEMORY[0x1E0C80A78](v72);
  v70 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A08);
  MEMORY[0x1E0C80A78](v10);
  v68 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for AVInfoTabMetadataStripView(0);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = (char *)&v67 - v17;
  v19 = MEMORY[0x1E0C80A78](v16);
  v21 = (char *)&v67 - v20;
  v22 = MEMORY[0x1E0C80A78](v19);
  v24 = (char *)&v67 - v23;
  MEMORY[0x1E0C80A78](v22);
  v26 = (char *)&v67 - v25;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A10);
  MEMORY[0x1E0C80A78](v27);
  v76 = v28;
  v74 = (char *)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = *(int *)(v12 + 20);
  v30 = *(_QWORD *)(a1 + v29);
  sub_1AC5059E4(a1, (uint64_t)v26, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v30 & 1) != 0)
  {
    v31 = *(_QWORD *)&v26[*(int *)(type metadata accessor for AVInfoTabMetadata() + 36) + 8];
    swift_bridgeObjectRetain();
    sub_1AC5055D0((uint64_t)v26, type metadata accessor for AVInfoTabMetadataStripView);
    if (v31)
    {
      swift_bridgeObjectRelease();
      sub_1AC5059E4(a1, (uint64_t)v24, type metadata accessor for AVInfoTabMetadataStripView);
      sub_1AC5055D0((uint64_t)v24, type metadata accessor for AVInfoTabMetadataStripView);
      sub_1AC5059E4(a1, (uint64_t)v21, type metadata accessor for AVInfoTabMetadataStripView);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1AC5055D0((uint64_t)v26, type metadata accessor for AVInfoTabMetadataStripView);
  }
  sub_1AC5059E4(a1, (uint64_t)v24, type metadata accessor for AVInfoTabMetadataStripView);
  v32 = sub_1AC5004B0();
  sub_1AC5055D0((uint64_t)v24, type metadata accessor for AVInfoTabMetadataStripView);
  sub_1AC5059E4(a1, (uint64_t)v21, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v32 & 1) == 0)
    goto LABEL_9;
LABEL_6:
  v33 = type metadata accessor for AVInfoTabMetadata();
  v34 = v21[*(int *)(v33 + 64) + 24];
  sub_1AC5059E4((uint64_t)v21, (uint64_t)v18, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v34 & 1) != 0)
  {
    v35 = *(_QWORD *)&v18[*(int *)(v33 + 28) + 8];
    swift_bridgeObjectRetain();
    sub_1AC5055D0((uint64_t)v18, type metadata accessor for AVInfoTabMetadataStripView);
    if (v35)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
LABEL_9:
    sub_1AC5055D0((uint64_t)v21, type metadata accessor for AVInfoTabMetadataStripView);
    sub_1AC5059E4(a1, (uint64_t)v15, type metadata accessor for AVInfoTabMetadataStripView);
    sub_1AC5055D0((uint64_t)v15, type metadata accessor for AVInfoTabMetadataStripView);
    v37 = (uint64_t)v74;
    v36 = v75;
LABEL_12:
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A18);
    v40 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v37, 1, 1, v39);
    goto LABEL_14;
  }
  sub_1AC5055D0((uint64_t)v18, type metadata accessor for AVInfoTabMetadataStripView);
LABEL_11:
  v37 = (uint64_t)v74;
  v36 = v75;
  sub_1AC5055D0((uint64_t)v21, type metadata accessor for AVInfoTabMetadataStripView);
  sub_1AC5059E4(a1, (uint64_t)v15, type metadata accessor for AVInfoTabMetadataStripView);
  v38 = *(_QWORD *)&v15[*(int *)(v12 + 20)];
  sub_1AC5055D0((uint64_t)v15, type metadata accessor for AVInfoTabMetadataStripView);
  if ((v38 & 2) == 0)
    goto LABEL_12;
  sub_1AC5DD2B8();
  v41 = sub_1AC5DD4BC();
  v43 = v42;
  v83 = v41;
  v84 = v42;
  v45 = v44 & 1;
  LOBYTE(v85) = v44 & 1;
  v86 = v46;
  sub_1AC5DD558();
  sub_1AC4FC6EC(v41, v43, v45);
  swift_bridgeObjectRelease();
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A18);
  v40 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v37, 0, 1, v47);
LABEL_14:
  if ((*(_BYTE *)(a1 + v29) & 2) != 0)
  {
    v40 = type metadata accessor for AVInfoTabMetadata();
    v53 = (uint64_t *)(a1 + *(int *)(v40 + 28));
    v54 = v53[1];
    if (v54)
    {
      v83 = *v53;
      v84 = v54;
      sub_1AC50554C();
      swift_bridgeObjectRetain();
      v77 = sub_1AC5DD4C8();
      v78 = v55;
      v79 = v56 & 1;
      v80 = v57;
      v81 = 257;
      v82 = 0;
    }
    else
    {
      if ((*(_BYTE *)(a1 + *(int *)(v40 + 64) + 24) & 1) != 0)
      {
        v48 = 0;
        v49 = 0;
        v50 = 0;
        v51 = 0;
        v52 = 16711680;
        goto LABEL_25;
      }
      sub_1AC5DD7C8();
      sub_1AC501184(v68);
      sub_1AC5DCFF4();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A28);
      sub_1AC5DD024();
      v58 = swift_allocObject();
      *(_OWORD *)(v58 + 16) = xmmword_1AC5F6DF0;
      sub_1AC5DD00C();
      sub_1AC5DD018();
      sub_1AC50572C(v58);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_1AC5DD06C();
      sub_1AC5DD084();
      sub_1AC5DD030();
      sub_1AC505590(&qword_1EEC83A30, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB07A8], MEMORY[0x1E0CB07A0]);
      sub_1AC4FC18C(&qword_1EEC83A38, &qword_1EEC83A08, MEMORY[0x1E0DEB898]);
      v77 = sub_1AC5DD4B0();
      v78 = v59;
      v79 = v60 & 1;
      v80 = v61;
      v81 = 257;
      v82 = 1;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A40);
    sub_1AC5072E0(&qword_1EEC83A48, &qword_1EEC83A40, MEMORY[0x1E0CDA1E8], MEMORY[0x1E0CD9C18]);
    v40 = sub_1AC5DD324();
    v48 = v83;
    v49 = v84;
    v50 = v85;
    v51 = v86;
    if (v88)
      v62 = 0x10000;
    else
      v62 = 0;
    v52 = v62 | v87;
  }
  else
  {
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = 0;
    v52 = 16646144;
  }
LABEL_25:
  MEMORY[0x1E0C80A78](v40);
  v64 = (char *)&v67 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC507378(v37, (uint64_t)v64, &qword_1EEC83A10);
  sub_1AC507378((uint64_t)v64, v36, &qword_1EEC83A10);
  v65 = v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A20) + 48);
  *(_QWORD *)v65 = v48;
  *(_QWORD *)(v65 + 8) = v49;
  *(_QWORD *)(v65 + 16) = v50;
  *(_QWORD *)(v65 + 24) = v51;
  *(_BYTE *)(v65 + 34) = BYTE2(v52);
  *(_WORD *)(v65 + 32) = v52;
  sub_1AC505684(v48, v49, v50, v51, v52);
  sub_1AC5073BC(v37, &qword_1EEC83A10);
  sub_1AC5056D8(v48, v49, v50, v51, v52);
  return sub_1AC5073BC((uint64_t)v64, &qword_1EEC83A10);
}

uint64_t sub_1AC501184@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  char *v17;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A68);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v24 - v6;
  v8 = sub_1AC5DD060();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v10 = *(_QWORD **)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v24 - v14;
  sub_1AC5DD048();
  sub_1AC5DD048();
  sub_1AC505590(&qword_1EEC83A70, 255, v9, MEMORY[0x1E0CB08B0]);
  result = sub_1AC5DD6D8();
  if ((result & 1) != 0)
  {
    v17 = &v7[*(int *)(v2 + 48)];
    v18 = (void (*)(char *, char *, uint64_t))v10[4];
    v18(v7, v15, v8);
    v18(v17, v13, v8);
    v19 = &v5[*(int *)(v2 + 48)];
    v20 = (void (*)(char *, char *, uint64_t))v10[2];
    v20(v5, v7, v8);
    v20(v19, v17, v8);
    v18(a1, v5, v8);
    v21 = (void (*)(char *, uint64_t))v10[1];
    v21(v19, v8);
    v22 = &v5[*(int *)(v2 + 48)];
    v18(v5, v7, v8);
    v18(v22, v17, v8);
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A08);
    v18(&a1[*(int *)(v23 + 36)], v22, v8);
    return ((uint64_t (*)(char *, uint64_t))v21)(v5, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1AC5013A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD v21[4];

  if (a2)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC839D0);
    MEMORY[0x1E0C80A78](v2);
    v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    v5 = (void *)sub_1AC5DD6F0();
    v6 = (void *)sub_1AC5DD6F0();
    v7 = AVLocalizedString(v5);

    v8 = sub_1AC5DD714();
    v10 = v9;

    v21[2] = v8;
    v21[3] = v10;
    sub_1AC50554C();
    v11 = sub_1AC5DD4C8();
    v13 = v12;
    v15 = v14 & 1;
    type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
    sub_1AC505590(&qword_1EEC839D8, 255, type metadata accessor for AVInfoTabMetadataStripView.BadgeView, (uint64_t)&unk_1AC5F72CC);
    sub_1AC5DD54C();
    sub_1AC4FC6EC(v11, v13, v15);
    swift_bridgeObjectRelease();
    v16 = sub_1AC5DD2DC();
    v17 = *(_QWORD *)(v16 - 8);
    MEMORY[0x1E0C80A78](v16);
    v19 = (char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1AC5DD2D0();
    sub_1AC5DD1C8();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    return sub_1AC5073BC((uint64_t)v4, &qword_1EEC839D0);
  }
  else
  {
    sub_1AC5DD2B8();
    type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
    sub_1AC505590(&qword_1EEC839D8, 255, type metadata accessor for AVInfoTabMetadataStripView.BadgeView, (uint64_t)&unk_1AC5F72CC);
    sub_1AC5DD540();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1AC501638(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD v21[4];

  if (a2)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B20);
    MEMORY[0x1E0C80A78](v2);
    v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    v5 = (void *)sub_1AC5DD6F0();
    v6 = (void *)sub_1AC5DD6F0();
    v7 = AVLocalizedString(v5);

    v8 = sub_1AC5DD714();
    v10 = v9;

    v21[2] = v8;
    v21[3] = v10;
    sub_1AC50554C();
    v11 = sub_1AC5DD4C8();
    v13 = v12;
    v15 = v14 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B38);
    sub_1AC506F78();
    sub_1AC5DD54C();
    sub_1AC4FC6EC(v11, v13, v15);
    swift_bridgeObjectRelease();
    v16 = sub_1AC5DD2DC();
    v17 = *(_QWORD *)(v16 - 8);
    MEMORY[0x1E0C80A78](v16);
    v19 = (char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1AC5DD2D0();
    sub_1AC5DD1C8();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    return sub_1AC5073BC((uint64_t)v4, &qword_1EEC83B20);
  }
  else
  {
    sub_1AC5DD2B8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B38);
    sub_1AC506F78();
    sub_1AC5DD540();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

_QWORD *sub_1AC5018A4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1AC5018B0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1AC5018B8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1AC5018CC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1AC5018E0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1AC5018F4(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1AC501924@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1AC501950@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_1AC501974(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1AC501988(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_1AC50199C(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1AC5019B0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1AC5019C4(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1AC5019D8(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1AC5019EC(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1AC501A00()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1AC501A10()
{
  return sub_1AC5DD7EC();
}

_QWORD *sub_1AC501A28(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_1AC501A3C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1AC501A4C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_1AC501A58(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1AC501A6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_1AC5074F8(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void sub_1AC501AA8()
{
  qword_1EEC88A88 = 511;
}

uint64_t sub_1AC501B30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
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
  char v43;
  __int128 v44;

  v3 = type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
  v36 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v37 = v4;
  v38 = (uint64_t)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for AVInfoTabBadgeModifier();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)v1)
  {
    v8 = *(void **)(*(_QWORD *)v1 + 16);
    swift_bridgeObjectRetain();
    v9 = v8;
    sub_1AC5DD5E8();
    v10 = v1 + *(int *)(v3 + 24);
    v11 = sub_1AC5DD5D0();
    v35 = v3;
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v13(v7, v10, v11);
    v39 = sub_1AC5DD2E8();
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83AF8);
    MEMORY[0x1E0C80A78](v14);
    v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13(v16, (uint64_t)v7, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
    sub_1AC5DD5C4();
    sub_1AC5073BC((uint64_t)v16, &qword_1EEC83AF8);
    v17 = sub_1AC5DD5B8();
    v18 = *(_QWORD *)(v17 - 8);
    MEMORY[0x1E0C80A78](v17);
    v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *MEMORY[0x1E0CDF6F0], v17);
    v34 = sub_1AC5DD5DC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    sub_1AC5055D0((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for AVInfoTabBadgeModifier);
    swift_release();
    v21 = v38;
    sub_1AC5059E4(v1, v38, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    v22 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    v23 = swift_allocObject();
    sub_1AC506DF0(v21, v23 + v22, type metadata accessor for AVInfoTabMetadataStripView.BadgeView);
    if (qword_1EEC83780 != -1)
      swift_once();
    v24 = (uint64_t *)(v1 + *(int *)(v35 + 28));
    v26 = v24[1];
    v27 = v24[2];
    v40 = *v24;
    v25 = v40;
    v41 = v26;
    v42 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B00);
    sub_1AC5DD60C();
    v40 = v25;
    v41 = v26;
    v42 = v27;
    sub_1AC5DD60C();
    sub_1AC5DD678();
    result = sub_1AC5DD168();
    v29 = v40;
    v30 = v41;
    v31 = v42;
    v32 = v43;
    *(_QWORD *)a1 = v39;
    *(_QWORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = 1;
    *(_QWORD *)(a1 + 24) = v34;
    *(_QWORD *)(a1 + 32) = 0;
    *(_WORD *)(a1 + 40) = 1;
    *(_QWORD *)(a1 + 48) = sub_1AC506E34;
    *(_QWORD *)(a1 + 56) = v23;
    *(_QWORD *)(a1 + 64) = v29;
    *(_BYTE *)(a1 + 72) = v30;
    *(_QWORD *)(a1 + 80) = v31;
    *(_BYTE *)(a1 + 88) = v32;
    *(_OWORD *)(a1 + 96) = v44;
  }
  else
  {
    type metadata accessor for AVObservableBundle();
    sub_1AC505590(&qword_1EEC83900, v33, (uint64_t (*)(uint64_t))type metadata accessor for AVObservableBundle, (uint64_t)&unk_1AC5F6E34);
    swift_bridgeObjectRetain();
    result = sub_1AC5DD204();
    __break(1u);
  }
  return result;
}

uint64_t sub_1AC501F44()
{
  type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B00);
  return sub_1AC5DD618();
}

double sub_1AC501FB8@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unsigned int v12;
  unsigned int *v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  double result;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _QWORD v30[3];
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char v48;
  uint64_t v49;
  unsigned __int8 v50;
  uint64_t v51;
  unsigned __int8 v52;
  __int128 v53;

  v4 = type metadata accessor for AVInfoTabBadgeModifier();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(a1, sel_image);
  if (v7)
  {
    v35 = v7;
    v30[2] = sub_1AC5DD5AC();
    v8 = sub_1AC5DD5D0();
    v33 = v30;
    v9 = *(_QWORD *)(v8 - 8);
    MEMORY[0x1E0C80A78](v8);
    v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v31 = v11;
    v12 = objc_msgSend(a1, sel_isImageMask);
    v13 = (unsigned int *)MEMORY[0x1E0CDF768];
    if (v12)
      v13 = (unsigned int *)MEMORY[0x1E0CDF778];
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *v13, v8);
    v14 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v14(v6, v11, v8);
    v34 = sub_1AC5DD2E8();
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83AF8);
    MEMORY[0x1E0C80A78](v15);
    v17 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14(v17, v6, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v17, 0, 1, v8);
    sub_1AC5DD5C4();
    sub_1AC5073BC((uint64_t)v17, &qword_1EEC83AF8);
    v18 = sub_1AC5DD5B8();
    v30[1] = v30;
    v19 = *(_QWORD *)(v18 - 8);
    MEMORY[0x1E0C80A78](v18);
    v21 = (char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E0CDF6F0], v18);
    v32 = sub_1AC5DD5DC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    sub_1AC5055D0((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for AVInfoTabBadgeModifier);
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v31, v8);
    if (qword_1EEC83780 != -1)
      swift_once();
    v22 = v35;
    objc_msgSend(v35, sel_size);
    objc_msgSend(v22, sel_size);
    sub_1AC5DD678();
    sub_1AC5DD168();
    v36[0] = v34;
    *(_OWORD *)&v36[1] = xmmword_1AC5F6E00;
    v36[3] = v32;
    v37 = xmmword_1AC5F6E00;
    *(_QWORD *)&v38 = v49;
    *((_QWORD *)&v38 + 1) = v50;
    *(_QWORD *)&v39 = v51;
    *((_QWORD *)&v39 + 1) = v52;
    v40 = v53;
    v41 = 0;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B08);
    sub_1AC506E70();
    sub_1AC5DD324();
    swift_release();

  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    memset(v36, 0, sizeof(v36));
    v41 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B08);
    sub_1AC506E70();
    sub_1AC5DD324();
  }
  result = *(double *)&v42;
  v24 = v43;
  v25 = v44;
  v26 = v45;
  v27 = v46;
  v28 = v47;
  v29 = v48;
  *(_OWORD *)a2 = v42;
  *(_OWORD *)(a2 + 16) = v24;
  *(_OWORD *)(a2 + 32) = v25;
  *(_OWORD *)(a2 + 48) = v26;
  *(_OWORD *)(a2 + 64) = v27;
  *(_OWORD *)(a2 + 80) = v28;
  *(_BYTE *)(a2 + 96) = v29;
  return result;
}

double sub_1AC5023E8@<D0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_1AC501FB8(*v1, a1);
}

uint64_t sub_1AC5023F0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int16 v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  void (*v59)(char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int16 v68;
  __int16 v69;
  _QWORD *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  __int128 v83;
  __int128 v84;
  __int16 v85;
  __int128 v86;
  __int128 v87;
  unsigned __int8 v88;
  unsigned __int8 v89;

  v2 = v1;
  v82 = a1;
  v3 = sub_1AC5DCFDC();
  v76 = *(_QWORD *)(v3 - 8);
  v77 = v3;
  MEMORY[0x1E0C80A78](v3);
  v73 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_1AC5DCFE8();
  v74 = *(_QWORD *)(v78 - 8);
  v5 = MEMORY[0x1E0C80A78](v78);
  v72 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v75 = (char *)&v71 - v7;
  v8 = sub_1AC5DD060();
  v9 = *(_QWORD *)(v8 - 8);
  v80 = v8;
  v81 = v9;
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = (char *)&v71 - v17;
  v19 = MEMORY[0x1E0C80A78](v16);
  v21 = (char *)&v71 - v20;
  v22 = *(int *)(v19 + 48);
  v23 = *(int *)(v19 + 64);
  v24 = (uint64_t *)((char *)&v71 + v23 - v20);
  v25 = (uint64_t *)(v2 + v22);
  v26 = (uint64_t *)(v2 + v23);
  v79 = v2;
  sub_1AC507378(v2, (uint64_t)&v71 - v20, &qword_1EEC830B0);
  *(_OWORD *)&v21[v22] = *(_OWORD *)(v2 + v22);
  v28 = *v26;
  v27 = v26[1];
  *v24 = *v26;
  v24[1] = v27;
  if (v27)
  {
    swift_bridgeObjectRetain();
    sub_1AC5073BC((uint64_t)v21, &qword_1EEC830B0);
    *(_QWORD *)&v86 = v28;
    *((_QWORD *)&v86 + 1) = v27;
    sub_1AC50554C();
    v29 = sub_1AC5DD4C8();
    v31 = v30;
    *(_QWORD *)&v83 = v29;
    *((_QWORD *)&v83 + 1) = v30;
    v33 = v32 & 1;
    *(_QWORD *)&v84 = v32 & 1;
    *((_QWORD *)&v84 + 1) = v34;
    LOBYTE(v85) = 0;
    sub_1AC4FC6D8(v29, v30, v32 & 1);
    swift_bridgeObjectRetain();
    v35 = MEMORY[0x1E0CDDD50];
    sub_1AC5DD324();
    v83 = v86;
    v84 = v87;
    v85 = v88;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BC0);
    sub_1AC5072E0(&qword_1EEC83BC8, &qword_1EEC83BC0, v35, MEMORY[0x1E0CDB8A8]);
    sub_1AC5DD324();
    sub_1AC4FC6EC(v29, v31, v33);
    result = swift_bridgeObjectRelease();
    v38 = *((_QWORD *)&v86 + 1);
    v37 = v86;
    v40 = *((_QWORD *)&v87 + 1);
    v39 = v87;
    if (v89)
      v41 = 256;
    else
      v41 = 0;
    v42 = v41 | v88;
  }
  else
  {
    v43 = (uint64_t)v15;
    sub_1AC5073BC((uint64_t)v21, &qword_1EEC830B0);
    v44 = *(int *)(v12 + 48);
    v45 = *(int *)(v12 + 64);
    v46 = v79;
    sub_1AC507378(v79, (uint64_t)v18, &qword_1EEC830B0);
    *(_OWORD *)&v18[v44] = *(_OWORD *)v25;
    *(_OWORD *)&v18[v45] = *(_OWORD *)v26;
    v47 = v80;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v81 + 48))(v18, 1, v80) == 1)
    {
      sub_1AC5073BC((uint64_t)v18, &qword_1EEC830B0);
      v48 = (_QWORD *)(v43 + *(int *)(v12 + 48));
      v49 = *(int *)(v12 + 64);
      sub_1AC507378(v46, v43, &qword_1EEC830B0);
      v50 = *v25;
      v37 = v25[1];
      *v48 = *v25;
      v48[1] = v37;
      *(_OWORD *)(v43 + v49) = *(_OWORD *)v26;
      if (v37)
      {
        swift_bridgeObjectRetain();
        sub_1AC5073BC(v43, &qword_1EEC830B0);
        *(_QWORD *)&v86 = v50;
        *((_QWORD *)&v86 + 1) = v37;
        sub_1AC50554C();
        *(_QWORD *)&v83 = sub_1AC5DD4C8();
        *((_QWORD *)&v83 + 1) = v52;
        *(_QWORD *)&v84 = v51 & 1;
        *((_QWORD *)&v84 + 1) = v53;
        v85 = 256;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BC0);
        sub_1AC5072E0(&qword_1EEC83BC8, &qword_1EEC83BC0, MEMORY[0x1E0CDDD50], MEMORY[0x1E0CDB8A8]);
        result = sub_1AC5DD324();
        v38 = *((_QWORD *)&v86 + 1);
        v37 = v86;
        v40 = *((_QWORD *)&v87 + 1);
        v39 = v87;
        if (v89)
          v54 = 256;
        else
          v54 = 0;
        v42 = v54 | v88;
      }
      else
      {
        result = sub_1AC5073BC(v43, &qword_1EEC830B0);
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v42 = -256;
      }
    }
    else
    {
      v55 = (*(uint64_t (**)(char *, char *, uint64_t))(v81 + 32))(v11, v18, v47);
      v56 = v72;
      MEMORY[0x1AF43D470](v55);
      v57 = v73;
      sub_1AC5DCFD0();
      v58 = v75;
      sub_1AC5DCFC4();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v57, v77);
      v59 = *(void (**)(char *, uint64_t))(v74 + 8);
      v60 = v78;
      v59(v56, v78);
      sub_1AC505590(&qword_1EEC83BD0, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0568], MEMORY[0x1E0CB0560]);
      sub_1AC5DD054();
      v59(v58, v60);
      v83 = v86;
      sub_1AC50554C();
      v61 = sub_1AC5DD4C8();
      v63 = v62;
      *(_QWORD *)&v83 = v61;
      *((_QWORD *)&v83 + 1) = v62;
      LOBYTE(v58) = v64 & 1;
      *(_QWORD *)&v84 = v64 & 1;
      *((_QWORD *)&v84 + 1) = v65;
      LOBYTE(v85) = 1;
      sub_1AC4FC6D8(v61, v62, v64 & 1);
      swift_bridgeObjectRetain();
      v66 = v47;
      v67 = MEMORY[0x1E0CDDD50];
      sub_1AC5DD324();
      v83 = v86;
      v84 = v87;
      v85 = v88;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BC0);
      sub_1AC5072E0(&qword_1EEC83BC8, &qword_1EEC83BC0, v67, MEMORY[0x1E0CDB8A8]);
      sub_1AC5DD324();
      sub_1AC4FC6EC(v61, v63, (char)v58);
      swift_bridgeObjectRelease();
      v38 = *((_QWORD *)&v86 + 1);
      v37 = v86;
      v40 = *((_QWORD *)&v87 + 1);
      v39 = v87;
      v68 = v88;
      LODWORD(v67) = v89;
      result = (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v11, v66);
      if ((_DWORD)v67)
        v69 = 256;
      else
        v69 = 0;
      v42 = v69 | v68;
    }
  }
  v70 = v82;
  *v82 = v37;
  v70[1] = v38;
  v70[2] = v39;
  v70[3] = v40;
  *((_WORD *)v70 + 16) = v42;
  return result;
}

void sub_1AC502A68()
{
  __asm { BR              X9 }
}

uint64_t sub_1AC502AC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v35[96];

  *(_QWORD *)(v3 - 88) = v1;
  *(_QWORD *)(v3 - 120) = v0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B20);
  *(_QWORD *)(v3 - 96) = v4;
  v5 = MEMORY[0x1E0C80A78](v4);
  *(_QWORD *)(v3 - 104) = &v35[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)(v3 - 112) = v35;
  MEMORY[0x1E0C80A78](v5);
  *(_QWORD *)(v3 - 128) = &v35[-v7];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B38);
  *(_QWORD *)(v3 - 144) = v8;
  *(_QWORD *)(v3 - 136) = v35;
  MEMORY[0x1E0C80A78](v8);
  v10 = &v35[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B58);
  *(_QWORD *)(v3 - 160) = v11;
  *(_QWORD *)(v3 - 152) = v35;
  *(_QWORD *)(v3 - 168) = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v13 = &v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B40);
  *(_QWORD *)(v3 - 176) = v35;
  *(_QWORD *)(v3 - 184) = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = &v35[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = MEMORY[0x1E0C80A78](v15);
  *(_QWORD *)&v35[-16] = v2;
  MEMORY[0x1E0C80A78](v18);
  *(_QWORD *)&v35[-32] = 0x6E6574746F525452;
  *(_QWORD *)&v35[-24] = 0xE800000000000000;
  *(_QWORD *)&v35[-16] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B60);
  sub_1AC50707C(&qword_1EEC83B68, &qword_1EEC83B60, (uint64_t (*)(void))sub_1AC5070E8);
  sub_1AC5DD5F4();
  swift_bridgeObjectRelease();
  v19 = sub_1AC5DD36C();
  v20 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC0D8];
  v21 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v23 = &v35[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1AC5DD360();
  sub_1AC4FC18C(&qword_1EEC83B48, &qword_1EEC83B40, MEMORY[0x1E0CDF8D0]);
  sub_1AC4FB5B0(&qword_1EEC83B50, v20, MEMORY[0x1E0CDC0C8]);
  sub_1AC5DD4EC();
  (*(void (**)(_BYTE *, uint64_t))(v21 + 8))(v23, v19);
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v3 - 184) + 8))(v17, v14);
  v24 = *(_QWORD *)(v3 - 168);
  v25 = *(_QWORD *)(v3 - 160);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v24 + 16))(v10, v13, v25);
  *(_WORD *)&v10[*(int *)(*(_QWORD *)(v3 - 144) + 36)] = 1;
  (*(void (**)(_BYTE *, uint64_t))(v24 + 8))(v13, v25);
  v26 = *(_QWORD *)(v3 - 120);
  if (!(_DWORD)v26)
  {
    v28 = 0xD00000000000002FLL;
    v29 = "CONTENT_TABS_ACCESSIBILITY_ROTTEN_TOMATO_ROTTEN";
LABEL_6:
    v27 = (unint64_t)(v29 - 32) | 0x8000000000000000;
    goto LABEL_7;
  }
  if ((_DWORD)v26 != 1)
  {
    v28 = 0xD000000000000032;
    v29 = "CONTENT_TABS_ACCESSIBILITY_ROTTEN_TOMATO_CERTIFIED";
    goto LABEL_6;
  }
  v27 = 0x80000001AC5F9920;
  v28 = 0xD00000000000002ELL;
LABEL_7:
  v30 = *(_QWORD *)(v3 - 128);
  sub_1AC501638(v28, v27);
  swift_bridgeObjectRelease();
  sub_1AC5073BC((uint64_t)v10, &qword_1EEC83B38);
  v31 = *(_QWORD *)(v3 - 104);
  sub_1AC5073F8(v30, v31, &qword_1EEC83B20);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B18);
  MEMORY[0x1E0C80A78](v32);
  sub_1AC507378(v31, (uint64_t)&v35[-((v33 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_1EEC83B20);
  swift_storeEnumTagMultiPayload();
  sub_1AC506EF4();
  sub_1AC5DD324();
  return sub_1AC5073BC(v31, &qword_1EEC83B20);
}

uint64_t sub_1AC502FE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  float v14;
  uint64_t result;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _DWORD v19[4];

  v4 = sub_1AC5DCFAC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1AC5DD078();
  MEMORY[0x1E0C80A78](v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BA8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v14 = *(float *)(a1 + 40);
  if (v14 > 1.0)
    v14 = v14 / 100.0;
  *(float *)&v19[3] = v14;
  sub_1AC5DD06C();
  sub_1AC50729C();
  sub_1AC5DCF7C();
  sub_1AC5DCFA0();
  MEMORY[0x1AF43D4B8](v7, v9);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  sub_1AC4FC18C(&qword_1EEC83BB8, &qword_1EEC83BA8, MEMORY[0x1E0CAFAC8]);
  result = sub_1AC5DD4B0();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v16;
  *(_BYTE *)(a2 + 16) = v17 & 1;
  *(_QWORD *)(a2 + 24) = v18;
  return result;
}

uint64_t sub_1AC5031C0@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _OWORD *v21;
  __int128 v22;
  uint64_t result;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v4 = type metadata accessor for AVInfoTabBadgeModifier();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)a1)
  {
    v7 = *(void **)(*(_QWORD *)a1 + 16);
    swift_bridgeObjectRetain();
    v8 = v7;
    v31 = sub_1AC5DD5E8();
    v9 = sub_1AC5DD5D0();
    v33 = &v29;
    v10 = *(_QWORD *)(v9 - 8);
    MEMORY[0x1E0C80A78](v9);
    v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0CDF768], v9);
    v13 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    v13(v6, v12, v9);
    v34 = sub_1AC5DD2E8();
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83AF8);
    MEMORY[0x1E0C80A78](v14);
    v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13(v16, v6, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
    sub_1AC5DD5C4();
    sub_1AC5073BC((uint64_t)v16, &qword_1EEC83AF8);
    v17 = sub_1AC5DD5B8();
    v30 = v6;
    v18 = *(_QWORD *)(v17 - 8);
    MEMORY[0x1E0C80A78](v17);
    v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *MEMORY[0x1E0CDF6F0], v17);
    v32 = sub_1AC5DD5DC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    sub_1AC5055D0((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for AVInfoTabBadgeModifier);
    swift_release();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v21 = (_OWORD *)swift_allocObject();
    v22 = *(_OWORD *)(a1 + 16);
    v21[1] = *(_OWORD *)a1;
    v21[2] = v22;
    *(_OWORD *)((char *)v21 + 45) = *(_OWORD *)(a1 + 29);
    sub_1AC507268(a1);
    if (qword_1EEC83780 != -1)
      swift_once();
    v39 = *(_OWORD *)(a1 + 16);
    v40 = *(_QWORD *)(a1 + 32);
    v35 = *(_OWORD *)(a1 + 16);
    v36 = *(_QWORD *)(a1 + 32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B00);
    sub_1AC5DD60C();
    v35 = v39;
    v36 = v40;
    sub_1AC5DD60C();
    sub_1AC5DD678();
    result = sub_1AC5DD168();
    v24 = v35;
    v25 = BYTE8(v35);
    v26 = v36;
    v27 = v37;
    *(_QWORD *)a2 = v34;
    *(_QWORD *)(a2 + 8) = 0;
    *(_BYTE *)(a2 + 16) = 1;
    *(_QWORD *)(a2 + 24) = v32;
    *(_QWORD *)(a2 + 32) = 0;
    *(_WORD *)(a2 + 40) = 1;
    *(_QWORD *)(a2 + 48) = sub_1AC507260;
    *(_QWORD *)(a2 + 56) = v21;
    *(_QWORD *)(a2 + 64) = v24;
    *(_BYTE *)(a2 + 72) = v25;
    *(_QWORD *)(a2 + 80) = v26;
    *(_BYTE *)(a2 + 88) = v27;
    *(_OWORD *)(a2 + 96) = v38;
  }
  else
  {
    type metadata accessor for AVObservableBundle();
    sub_1AC505590(&qword_1EEC83900, v28, (uint64_t (*)(uint64_t))type metadata accessor for AVObservableBundle, (uint64_t)&unk_1AC5F6E34);
    swift_bridgeObjectRetain();
    result = sub_1AC5DD204();
    __break(1u);
  }
  return result;
}

uint64_t sub_1AC5035D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B00);
  return sub_1AC5DD618();
}

void sub_1AC503624()
{
  sub_1AC502A68();
}

uint64_t sub_1AC50365C()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AVObservableBundle()
{
  return objc_opt_self();
}

uint64_t sub_1AC5036A0()
{
  return MEMORY[0x1E0C96020];
}

uint64_t sub_1AC5036AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1AC5DD108();
  *a1 = result;
  return result;
}

_QWORD *sub_1AC5036D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
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
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _OWORD *v52;
  _OWORD *v53;
  id v54;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = (int *)type metadata accessor for AVInfoTabMetadata();
    v10 = v9[6];
    v11 = (char *)v4 + v10;
    v12 = (char *)a2 + v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      v17 = sub_1AC5DD060();
      v18 = *(_QWORD *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v17))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v11, v12, v17);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
      }
      v20 = *(int *)(v13 + 48);
      v21 = &v11[v20];
      v22 = &v12[v20];
      v23 = *((_QWORD *)v22 + 1);
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *((_QWORD *)v21 + 1) = v23;
      v24 = *(int *)(v13 + 64);
      v25 = &v11[v24];
      v26 = &v12[v24];
      v27 = *((_QWORD *)v26 + 1);
      *(_QWORD *)v25 = *(_QWORD *)v26;
      *((_QWORD *)v25 + 1) = v27;
      v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v11, 0, 1, v13);
    }
    v29 = v9[7];
    v30 = (_QWORD *)((char *)v4 + v29);
    v31 = (_QWORD *)((char *)a2 + v29);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = v9[8];
    v34 = (_QWORD *)((char *)v4 + v33);
    v35 = (_QWORD *)((char *)a2 + v33);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    v37 = v9[9];
    v38 = (_QWORD *)((char *)v4 + v37);
    v39 = (_QWORD *)((char *)a2 + v37);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    v41 = v9[10];
    v42 = (char *)v4 + v41;
    v43 = (_QWORD *)((char *)a2 + v41);
    v44 = *(_QWORD *)((char *)a2 + v41 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v44 >> 60 == 15)
    {
      *(_OWORD *)v42 = *(_OWORD *)v43;
    }
    else
    {
      v45 = *v43;
      sub_1AC5039B0(*v43, v44);
      *(_QWORD *)v42 = v45;
      *((_QWORD *)v42 + 1) = v44;
    }
    v46 = v9[11];
    v47 = (char *)v4 + v46;
    v48 = (char *)a2 + v46;
    *(_DWORD *)v47 = *(_DWORD *)v48;
    v47[4] = v48[4];
    v49 = v9[12];
    v50 = *(void **)((char *)a2 + v49);
    *(_QWORD *)((char *)v4 + v49) = v50;
    *((_BYTE *)v4 + v9[13]) = *((_BYTE *)a2 + v9[13]);
    *((_BYTE *)v4 + v9[14]) = *((_BYTE *)a2 + v9[14]);
    *((_BYTE *)v4 + v9[15]) = *((_BYTE *)a2 + v9[15]);
    v51 = v9[16];
    v52 = (_OWORD *)((char *)v4 + v51);
    v53 = (_OWORD *)((char *)a2 + v51);
    *v52 = *v53;
    *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)v53 + 9);
    *((_BYTE *)v4 + v9[17]) = *((_BYTE *)a2 + v9[17]);
    *((_BYTE *)v4 + v9[18]) = *((_BYTE *)a2 + v9[18]);
    *(_QWORD *)((char *)v4 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
    v54 = v50;
  }
  return v4;
}

uint64_t sub_1AC5039B0(uint64_t a1, unint64_t a2)
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

void sub_1AC5039F4(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = (int *)type metadata accessor for AVInfoTabMetadata();
  v3 = a1 + v2[6];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v3, 1, v4))
  {
    v5 = sub_1AC5DD060();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v3, 1, v5))
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = (uint64_t *)(a1 + v2[10]);
  v8 = v7[1];
  if (v8 >> 60 != 15)
    sub_1AC503B20(*v7, v8);

}

uint64_t sub_1AC503B20(uint64_t a1, unint64_t a2)
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

_QWORD *sub_1AC503B64(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  _OWORD *v50;
  _OWORD *v51;
  id v52;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = (int *)type metadata accessor for AVInfoTabMetadata();
  v9 = v8[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v15 = sub_1AC5DD060();
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v10, v11, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    }
    v18 = *(int *)(v12 + 48);
    v19 = &v10[v18];
    v20 = &v11[v18];
    v21 = *((_QWORD *)v20 + 1);
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *((_QWORD *)v19 + 1) = v21;
    v22 = *(int *)(v12 + 64);
    v23 = &v10[v22];
    v24 = &v11[v22];
    v25 = *((_QWORD *)v24 + 1);
    *(_QWORD *)v23 = *(_QWORD *)v24;
    *((_QWORD *)v23 + 1) = v25;
    v26 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v10, 0, 1, v12);
  }
  v27 = v8[7];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v31 = v8[8];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  v34 = v33[1];
  *v32 = *v33;
  v32[1] = v34;
  v35 = v8[9];
  v36 = (_QWORD *)((char *)a1 + v35);
  v37 = (_QWORD *)((char *)a2 + v35);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  v39 = v8[10];
  v40 = (char *)a1 + v39;
  v41 = (_QWORD *)((char *)a2 + v39);
  v42 = *(_QWORD *)((char *)a2 + v39 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v42 >> 60 == 15)
  {
    *(_OWORD *)v40 = *(_OWORD *)v41;
  }
  else
  {
    v43 = *v41;
    sub_1AC5039B0(*v41, v42);
    *(_QWORD *)v40 = v43;
    *((_QWORD *)v40 + 1) = v42;
  }
  v44 = v8[11];
  v45 = (char *)a1 + v44;
  v46 = (char *)a2 + v44;
  *(_DWORD *)v45 = *(_DWORD *)v46;
  v45[4] = v46[4];
  v47 = v8[12];
  v48 = *(void **)((char *)a2 + v47);
  *(_QWORD *)((char *)a1 + v47) = v48;
  *((_BYTE *)a1 + v8[13]) = *((_BYTE *)a2 + v8[13]);
  *((_BYTE *)a1 + v8[14]) = *((_BYTE *)a2 + v8[14]);
  *((_BYTE *)a1 + v8[15]) = *((_BYTE *)a2 + v8[15]);
  v49 = v8[16];
  v50 = (_OWORD *)((char *)a1 + v49);
  v51 = (_OWORD *)((char *)a2 + v49);
  *v50 = *v51;
  *(_OWORD *)((char *)v50 + 9) = *(_OWORD *)((char *)v51 + 9);
  *((_BYTE *)a1 + v8[17]) = *((_BYTE *)a2 + v8[17]);
  *((_BYTE *)a1 + v8[18]) = *((_BYTE *)a2 + v8[18]);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  v52 = v48;
  return a1;
}

_QWORD *sub_1AC503E14(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void (*v30)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  _OWORD *v57;
  __int128 *v58;
  __int128 v59;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char *v67;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = (int *)type metadata accessor for AVInfoTabMetadata();
  v6 = v5[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_1AC5073BC((uint64_t)v7, &qword_1EEC83098);
      goto LABEL_7;
    }
    v19 = sub_1AC5DD060();
    v20 = *(_QWORD *)(v19 - 8);
    v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
    v22 = v21(v7, 1, v19);
    v23 = v21(v8, 1, v19);
    if (v22)
    {
      if (!v23)
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v7, v8, v19);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v7, 0, 1, v19);
LABEL_25:
        v62 = *(int *)(v9 + 48);
        v63 = &v7[v62];
        v64 = &v8[v62];
        *(_QWORD *)v63 = *(_QWORD *)v64;
        *((_QWORD *)v63 + 1) = *((_QWORD *)v64 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v65 = *(int *)(v9 + 64);
        v66 = &v7[v65];
        v67 = &v8[v65];
        *(_QWORD *)v66 = *(_QWORD *)v67;
        *((_QWORD *)v66 + 1) = *((_QWORD *)v67 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    else
    {
      if (!v23)
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v7, v8, v19);
        goto LABEL_25;
      }
      (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v19);
    }
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    goto LABEL_25;
  }
  if (v13)
  {
LABEL_7:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
LABEL_8:
    v18 = a3;
    goto LABEL_14;
  }
  v14 = sub_1AC5DD060();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v7, v8, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
  }
  v18 = a3;
  v24 = *(int *)(v9 + 48);
  v25 = &v7[v24];
  v26 = &v8[v24];
  *(_QWORD *)v25 = *(_QWORD *)v26;
  *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
  v27 = *(int *)(v9 + 64);
  v28 = &v7[v27];
  v29 = &v8[v27];
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *((_QWORD *)v28 + 1) = *((_QWORD *)v29 + 1);
  v30 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v30(v7, 0, 1, v9);
LABEL_14:
  v31 = v5[7];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = v5[8];
  v35 = (_QWORD *)((char *)a1 + v34);
  v36 = (_QWORD *)((char *)a2 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = v5[9];
  v38 = (_QWORD *)((char *)a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  *v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = v5[10];
  v41 = (_QWORD *)((char *)a1 + v40);
  v42 = (_QWORD *)((char *)a2 + v40);
  v43 = *(_QWORD *)((char *)a2 + v40 + 8);
  if (*(_QWORD *)((char *)a1 + v40 + 8) >> 60 != 15)
  {
    if (v43 >> 60 != 15)
    {
      v45 = *v42;
      sub_1AC5039B0(v45, v43);
      v46 = *v41;
      v47 = v41[1];
      *v41 = v45;
      v41[1] = v43;
      sub_1AC503B20(v46, v47);
      goto LABEL_21;
    }
    sub_1AC5042C8((uint64_t)v41);
    goto LABEL_19;
  }
  if (v43 >> 60 == 15)
  {
LABEL_19:
    *(_OWORD *)v41 = *(_OWORD *)v42;
    goto LABEL_21;
  }
  v44 = *v42;
  sub_1AC5039B0(v44, v43);
  *v41 = v44;
  v41[1] = v43;
LABEL_21:
  v48 = v5[11];
  v49 = (char *)a1 + v48;
  v50 = (char *)a2 + v48;
  v51 = *(_DWORD *)v50;
  v49[4] = v50[4];
  *(_DWORD *)v49 = v51;
  v52 = v5[12];
  v53 = *(void **)((char *)a1 + v52);
  v54 = *(void **)((char *)a2 + v52);
  *(_QWORD *)((char *)a1 + v52) = v54;
  v55 = v54;

  *((_BYTE *)a1 + v5[13]) = *((_BYTE *)a2 + v5[13]);
  *((_BYTE *)a1 + v5[14]) = *((_BYTE *)a2 + v5[14]);
  *((_BYTE *)a1 + v5[15]) = *((_BYTE *)a2 + v5[15]);
  v56 = v5[16];
  v57 = (_OWORD *)((char *)a1 + v56);
  v58 = (__int128 *)((char *)a2 + v56);
  v59 = *v58;
  *(_OWORD *)((char *)v57 + 9) = *(__int128 *)((char *)v58 + 9);
  *v57 = v59;
  *((_BYTE *)a1 + v5[17]) = *((_BYTE *)a2 + v5[17]);
  *((_BYTE *)a1 + v5[18]) = *((_BYTE *)a2 + v5[18]);
  *(_QWORD *)((char *)a1 + *(int *)(v18 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v18 + 20));
  return a1;
}

uint64_t sub_1AC5042C8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0CB0338] - 8) + 8))();
  return a1;
}

_OWORD *sub_1AC5042FC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  _OWORD *v21;
  _OWORD *v22;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = (int *)type metadata accessor for AVInfoTabMetadata();
  v8 = v7[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = sub_1AC5DD060();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v9, v10, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v9, 0, 1, v14);
    }
    *(_OWORD *)&v9[*(int *)(v11 + 48)] = *(_OWORD *)&v10[*(int *)(v11 + 48)];
    *(_OWORD *)&v9[*(int *)(v11 + 64)] = *(_OWORD *)&v10[*(int *)(v11 + 64)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)((char *)a1 + v7[7]) = *(_OWORD *)((char *)a2 + v7[7]);
  *(_OWORD *)((char *)a1 + v7[8]) = *(_OWORD *)((char *)a2 + v7[8]);
  *(_OWORD *)((char *)a1 + v7[9]) = *(_OWORD *)((char *)a2 + v7[9]);
  *(_OWORD *)((char *)a1 + v7[10]) = *(_OWORD *)((char *)a2 + v7[10]);
  v17 = v7[11];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  *(_DWORD *)v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  *(_QWORD *)((char *)a1 + v7[12]) = *(_QWORD *)((char *)a2 + v7[12]);
  *((_BYTE *)a1 + v7[13]) = *((_BYTE *)a2 + v7[13]);
  *((_BYTE *)a1 + v7[14]) = *((_BYTE *)a2 + v7[14]);
  *((_BYTE *)a1 + v7[15]) = *((_BYTE *)a2 + v7[15]);
  v20 = v7[16];
  v21 = (_OWORD *)((char *)a1 + v20);
  v22 = (_OWORD *)((char *)a2 + v20);
  *v21 = *v22;
  *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)((char *)v22 + 9);
  *((_BYTE *)a1 + v7[17]) = *((_BYTE *)a2 + v7[17]);
  *((_BYTE *)a1 + v7[18]) = *((_BYTE *)a2 + v7[18]);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_1AC504518(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  _OWORD *v64;
  _OWORD *v65;
  uint64_t v67;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = (int *)type metadata accessor for AVInfoTabMetadata();
  v9 = v8[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1AC5073BC((uint64_t)v10, &qword_1EEC83098);
      goto LABEL_7;
    }
    v67 = a3;
    v21 = sub_1AC5DD060();
    v22 = *(_QWORD *)(v21 - 8);
    v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
    v24 = v23(v10, 1, v21);
    v25 = v23(v11, 1, v21);
    if (v24)
    {
      if (!v25)
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v10, v11, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v10, 0, 1, v21);
LABEL_16:
        a3 = v67;
        v27 = *(int *)(v12 + 48);
        v28 = &v10[v27];
        v29 = &v11[v27];
        v31 = *(_QWORD *)v29;
        v30 = *((_QWORD *)v29 + 1);
        *(_QWORD *)v28 = v31;
        *((_QWORD *)v28 + 1) = v30;
        swift_bridgeObjectRelease();
        v32 = *(int *)(v12 + 64);
        v33 = &v10[v32];
        v34 = &v11[v32];
        v36 = *(_QWORD *)v34;
        v35 = *((_QWORD *)v34 + 1);
        *(_QWORD *)v33 = v36;
        *((_QWORD *)v33 + 1) = v35;
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v25)
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v10, v11, v21);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v21);
    }
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_7:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  v17 = sub_1AC5DD060();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v10, v11, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  }
  *(_OWORD *)&v10[*(int *)(v12 + 48)] = *(_OWORD *)&v11[*(int *)(v12 + 48)];
  *(_OWORD *)&v10[*(int *)(v12 + 64)] = *(_OWORD *)&v11[*(int *)(v12 + 64)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_17:
  v37 = v8[7];
  v38 = (_QWORD *)((char *)a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  v41 = *v39;
  v40 = v39[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  v42 = v8[8];
  v43 = (_QWORD *)((char *)a1 + v42);
  v44 = (_QWORD *)((char *)a2 + v42);
  v46 = *v44;
  v45 = v44[1];
  *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  v47 = v8[9];
  v48 = (_QWORD *)((char *)a1 + v47);
  v49 = (_QWORD *)((char *)a2 + v47);
  v51 = *v49;
  v50 = v49[1];
  *v48 = v51;
  v48[1] = v50;
  swift_bridgeObjectRelease();
  v52 = v8[10];
  v53 = (_QWORD *)((char *)a1 + v52);
  v54 = (_QWORD *)((char *)a2 + v52);
  v55 = *(_QWORD *)((char *)a1 + v52 + 8);
  if (v55 >> 60 != 15)
  {
    v56 = v54[1];
    if (v56 >> 60 != 15)
    {
      v57 = *v53;
      *v53 = *v54;
      v53[1] = v56;
      sub_1AC503B20(v57, v55);
      goto LABEL_22;
    }
    sub_1AC5042C8((uint64_t)v53);
  }
  *(_OWORD *)v53 = *(_OWORD *)v54;
LABEL_22:
  v58 = v8[11];
  v59 = (char *)a1 + v58;
  v60 = (char *)a2 + v58;
  *(_DWORD *)v59 = *(_DWORD *)v60;
  v59[4] = v60[4];
  v61 = v8[12];
  v62 = *(void **)((char *)a1 + v61);
  *(_QWORD *)((char *)a1 + v61) = *(_QWORD *)((char *)a2 + v61);

  *((_BYTE *)a1 + v8[13]) = *((_BYTE *)a2 + v8[13]);
  *((_BYTE *)a1 + v8[14]) = *((_BYTE *)a2 + v8[14]);
  *((_BYTE *)a1 + v8[15]) = *((_BYTE *)a2 + v8[15]);
  v63 = v8[16];
  v64 = (_OWORD *)((char *)a1 + v63);
  v65 = (_OWORD *)((char *)a2 + v63);
  *v64 = *v65;
  *(_OWORD *)((char *)v64 + 9) = *(_OWORD *)((char *)v65 + 9);
  *((_BYTE *)a1 + v8[17]) = *((_BYTE *)a2 + v8[17]);
  *((_BYTE *)a1 + v8[18]) = *((_BYTE *)a2 + v8[18]);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1AC5048FC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC504908(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AVInfoTabMetadata();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_1AC504944()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC504950(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AVInfoTabMetadata();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AVInfoTabMetadataStripView(uint64_t a1)
{
  return sub_1AC5059B0(a1, (uint64_t *)&unk_1EEC838E8);
}

uint64_t sub_1AC5049A4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AVInfoTabMetadata();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1AC504A18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC504A28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AVInfoTabMetadataStripView(0) - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (int *)type metadata accessor for AVInfoTabMetadata();
  v4 = v2 + v3[6];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    v6 = sub_1AC5DD060();
    v7 = *(_QWORD *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6))
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = (uint64_t *)(v2 + v3[10]);
  v9 = v8[1];
  if (v9 >> 60 != 15)
    sub_1AC503B20(*v8, v9);

  return swift_deallocObject();
}

uint64_t sub_1AC504B98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AVInfoTabMetadataStripView(0) - 8) + 80);
  return sub_1AC4FD134(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_1AC504BE4@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  uint64_t (*v23)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  uint64_t (**v24)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  _BYTE v26[16];
  uint64_t v27;
  char v28;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BD8);
  MEMORY[0x1E0C80A78](v12);
  v14 = &v26[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BE0);
  MEMORY[0x1E0C80A78](v15);
  v17 = &v26[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26[8] = a2;
  v27 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BE8);
  sub_1AC5DD60C();
  if (v28)
    v18 = 0.0;
  else
    v18 = 1.0;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BF0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, a1, v19);
  *(double *)&v17[*(int *)(v15 + 36)] = v18;
  v20 = swift_allocObject();
  *(double *)(v20 + 16) = a5;
  *(double *)(v20 + 24) = a6;
  *(_BYTE *)(v20 + 32) = a2;
  *(_QWORD *)(v20 + 40) = a3;
  swift_retain();
  v21 = sub_1AC5DD678();
  v23 = v22;
  sub_1AC507378((uint64_t)v17, (uint64_t)v14, &qword_1EEC83BE0);
  v24 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))&v14[*(int *)(v12 + 36)];
  *v24 = sub_1AC507368;
  v24[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v20;
  v24[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v21;
  v24[3] = v23;
  sub_1AC5073BC((uint64_t)v17, &qword_1EEC83BE0);
  return sub_1AC5073F8((uint64_t)v14, a4, &qword_1EEC83BD8);
}

uint64_t sub_1AC504DA8@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (**v34)();
  uint64_t (*v35)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v39 = a4;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BF8);
  v11 = *(_QWORD *)(v38 - 8);
  MEMORY[0x1E0C80A78](v38);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_1AC5DD588();
  v14 = sub_1AC5DD330();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = 0xD000000000000021;
  v41 = 0x80000001AC5F9710;
  sub_1AC5DD384();
  sub_1AC5DD180();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v40 = v19;
  v41 = v21;
  v42 = v23;
  v43 = v25;
  v26 = swift_allocObject();
  *(double *)(v26 + 16) = a5;
  *(double *)(v26 + 24) = a6;
  *(_BYTE *)(v26 + 32) = a2;
  *(_QWORD *)(v26 + 40) = a3;
  type metadata accessor for CGRect(0);
  sub_1AC4FB5B0(&qword_1EEC83C00, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x1E0C9B9D8]);
  swift_retain();
  sub_1AC5DD57C();
  swift_release();
  swift_release();
  v27 = sub_1AC5DD18C();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(_QWORD *)(v28 + 64);
  MEMORY[0x1E0C80A78](v27);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))((char *)&v37 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v27);
  v30 = (*(unsigned __int8 *)(v28 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  v31 = swift_allocObject();
  *(double *)(v31 + 16) = a5;
  *(double *)(v31 + 24) = a6;
  *(_BYTE *)(v31 + 32) = a2;
  *(_QWORD *)(v31 + 40) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v28 + 32))(v31 + v30, (char *)&v37 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0), v27);
  v33 = v38;
  v32 = v39;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v39, v13, v38);
  v34 = (uint64_t (**)())(v32 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83C08) + 36));
  *v34 = sub_1AC5074C0;
  v34[1] = (uint64_t (*)())v31;
  v34[2] = 0;
  v34[3] = 0;
  v35 = *(uint64_t (**)(char *, uint64_t))(v11 + 8);
  swift_retain();
  return v35(v13, v33);
}

uint64_t sub_1AC505090(CGRect *a1, CGFloat *a2)
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  uint64_t result;
  CGRect v7;
  CGRect v8;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[2];
  v5 = a2[3];
  v8.origin.x = *a2;
  v8.origin.y = v3;
  v8.size.width = v4;
  v8.size.height = v5;
  result = CGRectEqualToRect(*a1, v8);
  if ((result & 1) == 0)
  {
    v7.origin.x = v2;
    v7.origin.y = v3;
    v7.size.width = v4;
    v7.size.height = v5;
    CGRectGetMaxX(v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BE8);
    return sub_1AC5DD618();
  }
  return result;
}

uint64_t sub_1AC505144(char a1, unint64_t a2, CGFloat a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat MaxX;
  _BYTE v20[16];
  unint64_t v21;
  unint64_t v22;
  CGRect v23;

  v6 = sub_1AC5DD330();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = 0xD000000000000021;
  v22 = 0x80000001AC5F9710;
  sub_1AC5DD384();
  sub_1AC5DD180();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  MaxX = CGRectGetMaxX(v23);
  LOBYTE(v21) = a1;
  v22 = a2;
  v20[15] = MaxX > a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83BE8);
  return sub_1AC5DD618();
}

uint64_t sub_1AC505284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1AC504BE4(a1, *(_BYTE *)(v2 + 16), *(_QWORD *)(v2 + 24), a2, *(double *)v2, *(double *)(v2 + 8));
}

unint64_t sub_1AC5052A4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83910;
  if (!qword_1EEC83910)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83908);
    v2[0] = sub_1AC50707C(&qword_1EEC83918, &qword_1EEC83920, (uint64_t (*)(void))sub_1AC505340);
    v2[1] = sub_1AC4FC18C(&qword_1EEC83978, &qword_1EEC83980, MEMORY[0x1E0CDCF88]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83910);
  }
  return result;
}

unint64_t sub_1AC505340()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83928;
  if (!qword_1EEC83928)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83930);
    v2[0] = sub_1AC5053C4();
    v2[1] = sub_1AC4FC18C(&qword_1EEC83968, &qword_1EEC83970, MEMORY[0x1E0CDCF88]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83928);
  }
  return result;
}

unint64_t sub_1AC5053C4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83938;
  if (!qword_1EEC83938)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83940);
    v2[0] = sub_1AC4FC18C(&qword_1EEC83948, &qword_1EEC83950, MEMORY[0x1E0CD9310]);
    v2[1] = sub_1AC4FC18C(&qword_1EEC83958, &qword_1EEC83960, MEMORY[0x1E0CDCF88]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83938);
  }
  return result;
}

uint64_t type metadata accessor for AVInfoTabMetadataStripView.BadgeView(uint64_t a1)
{
  return sub_1AC5059B0(a1, (uint64_t *)&unk_1EEC83A98);
}

uint64_t sub_1AC505474(uint64_t result)
{
  if (result != 1)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

id sub_1AC5054B4(id result)
{
  id v1;

  if (result)
  {
    v1 = result;
    swift_retain();
    return v1;
  }
  return result;
}

void *sub_1AC5054E4(void *result)
{
  if (result)
  {

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1AC505510(uint64_t result)
{
  if (result != 1)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_1AC50554C()
{
  unint64_t result;

  result = qword_1EEC831E8;
  if (!qword_1EEC831E8)
  {
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EEC831E8);
  }
  return result;
}

uint64_t sub_1AC505590(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x1AF43EC7C](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AC5055D0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1AC50560C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1AC4FC6D8(result, a2, a3 & 1);
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1AC505648(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1AC4FC6EC(result, a2, a3 & 1);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_1AC505684(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  if ((a5 & 0xFF0000) != 0xFE0000)
    return sub_1AC505698(a1, a2, a3, a4, a5);
  return a1;
}

uint64_t sub_1AC505698(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  if (BYTE2(a5) != 255)
    return sub_1AC5056B0(a1, a2, a3);
  return a1;
}

uint64_t sub_1AC5056B0(uint64_t a1, uint64_t a2, char a3)
{
  sub_1AC4FC6D8(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AC5056D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  if ((a5 & 0xFF0000) != 0xFE0000)
    return sub_1AC5056EC(a1, a2, a3, a4, a5);
  return a1;
}

uint64_t sub_1AC5056EC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  if (BYTE2(a5) != 255)
    return sub_1AC505704(a1, a2, a3);
  return a1;
}

uint64_t sub_1AC505704(uint64_t a1, uint64_t a2, char a3)
{
  sub_1AC4FC6EC(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AC50572C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_1AC5DD024();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83A50);
    v10 = sub_1AC5DD7F8();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_1AC505590(&qword_1EEC83A58, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0778], MEMORY[0x1E0CB0788]);
      v14 = sub_1AC5DD6CC();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_1AC505590(&qword_1EEC83A60, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0778], MEMORY[0x1E0CB0790]);
          v20 = sub_1AC5DD6E4();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E8];
  }
  return result;
}

uint64_t type metadata accessor for AVInfoTabMetadataStripView.ReleaseDateView(uint64_t a1)
{
  return sub_1AC5059B0(a1, (uint64_t *)&unk_1EEC83AA8);
}

uint64_t sub_1AC5059B0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1AC5059E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadataStripView.ContentRatingBadgeView()
{
  return &type metadata for AVInfoTabMetadataStripView.ContentRatingBadgeView;
}

uint64_t sub_1AC505A38(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
  }
  else
  {
    v7 = a1;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(_QWORD *)(a1 + 24) = a2[3];
    v8 = *(int *)(a3 + 24);
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_1AC5DD5D0();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 28);
    v14 = v7 + v13;
    v15 = (uint64_t)a2 + v13;
    *(_OWORD *)v14 = *(_OWORD *)v15;
    *(_QWORD *)(v14 + 16) = *(_QWORD *)(v15 + 16);
  }
  swift_retain();
  return v7;
}

uint64_t sub_1AC505B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_1AC5DD5D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_release();
}

uint64_t sub_1AC505B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_1AC5DD5D0();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = *(int *)(a3 + 28);
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v13 + 16);
  swift_retain();
  return a1;
}

_QWORD *sub_1AC505C44(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1AC5DD5D0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 28);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1AC505D1C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1AC5DD5D0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(a3 + 28);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_QWORD *)v12 + 2) = *((_QWORD *)v13 + 2);
  return a1;
}

uint64_t sub_1AC505DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_1AC5DD5D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = *(int *)(a3 + 28);
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_OWORD *)v11 = *(_OWORD *)v12;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
  swift_release();
  return a1;
}

uint64_t sub_1AC505E54()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC505E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1AC5DD5D0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_1AC505EDC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC505EE8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = sub_1AC5DD5D0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1AC505F5C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AC5DD5D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for AVInfoTabMetadataStripView.TomatoRatingView()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AVInfoTabMetadataStripView.TomatoRatingView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AVInfoTabMetadataStripView.TomatoRatingView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  return a1;
}

__n128 __swift_memcpy45_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 29) = *(_OWORD *)(a2 + 29);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AVInfoTabMetadataStripView.TomatoRatingView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVInfoTabMetadataStripView.TomatoRatingView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 45))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AVInfoTabMetadataStripView.TomatoRatingView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 44) = 0;
    *(_DWORD *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 45) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 45) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadataStripView.TomatoRatingView()
{
  return &type metadata for AVInfoTabMetadataStripView.TomatoRatingView;
}

uint64_t *sub_1AC506228(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = v4;
    v7 = sub_1AC5DD060();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = *(int *)(v6 + 48);
    v12 = (uint64_t *)((char *)a1 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    v15 = *(int *)(v6 + 64);
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1AC506344(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1AC5DD060();
  v3 = *(_QWORD *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *sub_1AC5063CC(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v4 = sub_1AC5DD060();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v8 = *(int *)(v7 + 48);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  v13 = *(int *)(v7 + 64);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *((_QWORD *)v15 + 1);
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *((_QWORD *)v14 + 1) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_1AC5064B4(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(char *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;

  v4 = sub_1AC5DD060();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 24))(a1, a2, v4);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
LABEL_7:
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v11 = *(int *)(v10 + 48);
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = *(int *)(v10 + 64);
  v15 = &a1[v14];
  v16 = &a2[v14];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_1AC50660C(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_1AC5DD060();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  *(_OWORD *)&a1[*(int *)(v7 + 48)] = *(_OWORD *)&a2[*(int *)(v7 + 48)];
  *(_OWORD *)&a1[*(int *)(v7 + 64)] = *(_OWORD *)&a2[*(int *)(v7 + 64)];
  return a1;
}

char *sub_1AC5066D4(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(char *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = sub_1AC5DD060();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 40))(a1, a2, v4);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
LABEL_7:
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v11 = *(int *)(v10 + 48);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v15 = *(_QWORD *)v13;
  v14 = *((_QWORD *)v13 + 1);
  *(_QWORD *)v12 = v15;
  *((_QWORD *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  v16 = *(int *)(v10 + 64);
  v17 = &a1[v16];
  v18 = &a2[v16];
  v20 = *(_QWORD *)v18;
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = v20;
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1AC50680C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC506818(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_1AC506858()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC506864(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_1AC5068A8()
{
  unint64_t v0;
  char v1;
  char *v2;

  sub_1AC506934();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v2 = &v1;
    swift_initStructMetadata();
  }
}

void sub_1AC506934()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEC83AB8)
  {
    sub_1AC5DD060();
    v0 = sub_1AC5DD7E0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEC83AB8);
  }
}

uint64_t destroy for AVDroppedIfNoSpace()
{
  return swift_release();
}

uint64_t initializeWithCopy for AVDroppedIfNoSpace(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AVDroppedIfNoSpace(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AVDroppedIfNoSpace(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVDroppedIfNoSpace(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AVDroppedIfNoSpace(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AVDroppedIfNoSpace()
{
  return &type metadata for AVDroppedIfNoSpace;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadataStripView.Badge()
{
  return &type metadata for AVInfoTabMetadataStripView.Badge;
}

unint64_t sub_1AC506B30()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_1EEC83AC0;
  if (!qword_1EEC83AC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83AC8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83908);
    v2[3] = sub_1AC5052A4();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_1AC4FB5B0(&qword_1EEC83AD0, MEMORY[0x1E0CDCFC8], MEMORY[0x1E0CDCFC0]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83AC0);
  }
  return result;
}

unint64_t sub_1AC506BE0()
{
  unint64_t result;

  result = qword_1EEC83AD8;
  if (!qword_1EEC83AD8)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F702C, &type metadata for AVInfoTabMetadataStripView.Badge);
    atomic_store(result, (unint64_t *)&qword_1EEC83AD8);
  }
  return result;
}

unint64_t sub_1AC506C28()
{
  unint64_t result;

  result = qword_1EEC83AE0;
  if (!qword_1EEC83AE0)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F6FFC, &type metadata for AVInfoTabMetadataStripView.Badge);
    atomic_store(result, (unint64_t *)&qword_1EEC83AE0);
  }
  return result;
}

unint64_t sub_1AC506C70()
{
  unint64_t result;

  result = qword_1EEC83AE8;
  if (!qword_1EEC83AE8)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F7054, &type metadata for AVInfoTabMetadataStripView.Badge);
    atomic_store(result, (unint64_t *)&qword_1EEC83AE8);
  }
  return result;
}

unint64_t sub_1AC506CB8()
{
  unint64_t result;

  result = qword_1EEC83AF0;
  if (!qword_1EEC83AF0)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F708C, &type metadata for AVInfoTabMetadataStripView.Badge);
    atomic_store(result, (unint64_t *)&qword_1EEC83AF0);
  }
  return result;
}

uint64_t sub_1AC506CFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC506D0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC506D1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC506D2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC506D3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC506D4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 24);
  v5 = sub_1AC5DD5D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC506DF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AC506E34()
{
  type metadata accessor for AVInfoTabMetadataStripView.BadgeView(0);
  return sub_1AC501F44();
}

unint64_t sub_1AC506E70()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83B10;
  if (!qword_1EEC83B10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83B08);
    v2[0] = sub_1AC4FC18C((unint64_t *)&qword_1EEC83880, &qword_1EEC83888, MEMORY[0x1E0CDFCB8]);
    v2[1] = MEMORY[0x1E0CD8D78];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83B10);
  }
  return result;
}

unint64_t sub_1AC506EF4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83B28;
  if (!qword_1EEC83B28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83B20);
    v2[0] = sub_1AC506F78();
    v2[1] = sub_1AC4FB5B0(&qword_1EEC83AD0, MEMORY[0x1E0CDCFC8], MEMORY[0x1E0CDCFC0]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83B28);
  }
  return result;
}

unint64_t sub_1AC506F78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_1EEC83B30;
  if (!qword_1EEC83B30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83B38);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83B40);
    v3 = sub_1AC5DD36C();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC0D8];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_1AC4FC18C(&qword_1EEC83B48, &qword_1EEC83B40, MEMORY[0x1E0CDF8D0]);
    v5[5] = sub_1AC4FB5B0(&qword_1EEC83B50, v4, MEMORY[0x1E0CDC0C8]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = MEMORY[0x1E0CDA1E8];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEC83B30);
  }
  return result;
}

uint64_t sub_1AC507068@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC502FE8(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1AC507070@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC5031C0(*(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_1AC50707C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x1E0CD8D78];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1AC5070E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83B70;
  if (!qword_1EEC83B70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83B78);
    v2[0] = sub_1AC50716C();
    v2[1] = sub_1AC4FC18C(&qword_1EEC83B98, &qword_1EEC83BA0, MEMORY[0x1E0CDC948]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83B70);
  }
  return result;
}

unint64_t sub_1AC50716C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83B80;
  if (!qword_1EEC83B80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83B88);
    v2[0] = sub_1AC4FC18C((unint64_t *)&qword_1EEC83880, &qword_1EEC83888, MEMORY[0x1E0CDFCB8]);
    v2[1] = sub_1AC5071F0();
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83B80);
  }
  return result;
}

unint64_t sub_1AC5071F0()
{
  unint64_t result;

  result = qword_1EEC83B90;
  if (!qword_1EEC83B90)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F6C8C, &type metadata for AVSizeModifier);
    atomic_store(result, (unint64_t *)&qword_1EEC83B90);
  }
  return result;
}

uint64_t sub_1AC507234()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC507260()
{
  return sub_1AC5035D4();
}

uint64_t sub_1AC507268(uint64_t a1)
{
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_1AC50729C()
{
  unint64_t result;

  result = qword_1EEC83BB0;
  if (!qword_1EEC83BB0)
  {
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0DEB190], MEMORY[0x1E0DEB188]);
    atomic_store(result, (unint64_t *)&qword_1EEC83BB0);
  }
  return result;
}

uint64_t sub_1AC5072E0(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = MEMORY[0x1E0CDDD50];
    v9[1] = a3;
    result = MEMORY[0x1AF43EC7C](a4, v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AC507344()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC507368@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1AC504DA8(a1, *(_BYTE *)(v2 + 32), *(_QWORD *)(v2 + 40), a2, *(double *)(v2 + 16), *(double *)(v2 + 24));
}

uint64_t sub_1AC507378(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AC5073BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1AC5073F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AC50743C(CGRect *a1, CGFloat *a2)
{
  return sub_1AC505090(a1, a2);
}

uint64_t sub_1AC50744C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1AC5DD18C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1AC5074C0()
{
  uint64_t v0;

  sub_1AC5DD18C();
  return sub_1AC505144(*(_BYTE *)(v0 + 32), *(_QWORD *)(v0 + 40), *(CGFloat *)(v0 + 16));
}

uint64_t sub_1AC5074F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1AC507530()
{
  return sub_1AC50707C(&qword_1EEC83B68, &qword_1EEC83B60, (uint64_t (*)(void))sub_1AC5070E8);
}

uint64_t sub_1AC50755C()
{
  return sub_1AC507588(&qword_1EEC83C10, &qword_1EEC83C18, (uint64_t (*)(void))sub_1AC506E70);
}

uint64_t sub_1AC507588(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x1E0CE0408];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CDB8A8], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AC5075F4()
{
  return sub_1AC507588(&qword_1EEC83C20, &qword_1EEC83C28, (uint64_t (*)(void))sub_1AC506EF4);
}

unint64_t sub_1AC507624()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1EEC83C30;
  if (!qword_1EEC83C30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83C38);
    v2 = sub_1AC507688();
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CE07A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83C30);
  }
  return result;
}

unint64_t sub_1AC507688()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEC83C40;
  if (!qword_1EEC83C40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83C48);
    v2 = MEMORY[0x1E0CDDD50];
    v3 = MEMORY[0x1E0CDB8A8];
    v4[0] = sub_1AC5072E0(&qword_1EEC83BC8, &qword_1EEC83BC0, MEMORY[0x1E0CDDD50], MEMORY[0x1E0CDB8A8]);
    v4[1] = v2;
    result = MEMORY[0x1AF43EC7C](v3, v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEC83C40);
  }
  return result;
}

unint64_t sub_1AC50771C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83C50;
  if (!qword_1EEC83C50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83BD8);
    v2[0] = sub_1AC5077A0();
    v2[1] = sub_1AC4FC18C(&qword_1EEC83C68, &qword_1EEC83C70, MEMORY[0x1E0CDA288]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83C50);
  }
  return result;
}

unint64_t sub_1AC5077A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83C58;
  if (!qword_1EEC83C58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83BE0);
    v2[0] = sub_1AC4FC18C(&qword_1EEC83C60, &qword_1EEC83BF0, MEMORY[0x1E0CDBF18]);
    v2[1] = MEMORY[0x1E0CD9730];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83C58);
  }
  return result;
}

_QWORD *sub_1AC507830(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
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
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _OWORD *v52;
  _OWORD *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = (int *)type metadata accessor for AVInfoTabMetadata();
    v10 = v9[6];
    v11 = (char *)v4 + v10;
    v12 = (char *)a2 + v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      v17 = sub_1AC5DD060();
      v18 = *(_QWORD *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v17))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v11, v12, v17);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
      }
      v20 = *(int *)(v13 + 48);
      v21 = &v11[v20];
      v22 = &v12[v20];
      v23 = *((_QWORD *)v22 + 1);
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *((_QWORD *)v21 + 1) = v23;
      v24 = *(int *)(v13 + 64);
      v25 = &v11[v24];
      v26 = &v12[v24];
      v27 = *((_QWORD *)v26 + 1);
      *(_QWORD *)v25 = *(_QWORD *)v26;
      *((_QWORD *)v25 + 1) = v27;
      v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v11, 0, 1, v13);
    }
    v29 = v9[7];
    v30 = (_QWORD *)((char *)v4 + v29);
    v31 = (_QWORD *)((char *)a2 + v29);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = v9[8];
    v34 = (_QWORD *)((char *)v4 + v33);
    v35 = (_QWORD *)((char *)a2 + v33);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    v37 = v9[9];
    v38 = (_QWORD *)((char *)v4 + v37);
    v39 = (_QWORD *)((char *)a2 + v37);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    v41 = v9[10];
    v42 = (char *)v4 + v41;
    v43 = (_QWORD *)((char *)a2 + v41);
    v44 = *(_QWORD *)((char *)a2 + v41 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v44 >> 60 == 15)
    {
      *(_OWORD *)v42 = *(_OWORD *)v43;
    }
    else
    {
      v45 = *v43;
      sub_1AC5039B0(*v43, v44);
      *(_QWORD *)v42 = v45;
      *((_QWORD *)v42 + 1) = v44;
    }
    v46 = v9[11];
    v47 = (char *)v4 + v46;
    v48 = (char *)a2 + v46;
    *(_DWORD *)v47 = *(_DWORD *)v48;
    v47[4] = v48[4];
    v49 = v9[12];
    v50 = *(void **)((char *)a2 + v49);
    *(_QWORD *)((char *)v4 + v49) = v50;
    *((_BYTE *)v4 + v9[13]) = *((_BYTE *)a2 + v9[13]);
    *((_BYTE *)v4 + v9[14]) = *((_BYTE *)a2 + v9[14]);
    *((_BYTE *)v4 + v9[15]) = *((_BYTE *)a2 + v9[15]);
    v51 = v9[16];
    v52 = (_OWORD *)((char *)v4 + v51);
    v53 = (_OWORD *)((char *)a2 + v51);
    *v52 = *v53;
    *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)v53 + 9);
    *((_BYTE *)v4 + v9[17]) = *((_BYTE *)a2 + v9[17]);
    *((_BYTE *)v4 + v9[18]) = *((_BYTE *)a2 + v9[18]);
    v54 = type metadata accessor for AVInfoTabViewConfiguration(0);
    *(_QWORD *)((char *)v4 + *(int *)(v54 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v54 + 20));
    v55 = a3[5];
    v56 = (_QWORD *)((char *)v4 + v55);
    v57 = (_QWORD *)((char *)a2 + v55);
    v58 = v50;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v59 = sub_1AC5DD378();
      v60 = *(_QWORD *)(v59 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v60 + 48))(v57, 1, v59))
      {
        v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
        memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v60 + 16))(v56, v57, v59);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v60 + 56))(v56, 0, 1, v59);
      }
    }
    else
    {
      *v56 = *v57;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v62 = a3[6];
    v63 = (_QWORD *)((char *)v4 + v62);
    v64 = (_QWORD *)((char *)a2 + v62);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v65 = sub_1AC5DD378();
      v66 = *(_QWORD *)(v65 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v66 + 48))(v64, 1, v65))
      {
        v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
        memcpy(v63, v64, *(_QWORD *)(*(_QWORD *)(v67 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v66 + 16))(v63, v64, v65);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v66 + 56))(v63, 0, 1, v65);
      }
    }
    else
    {
      *v63 = *v64;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v68 = a3[7];
    v69 = a3[8];
    v70 = (char *)v4 + v68;
    v71 = (char *)a2 + v68;
    *(_OWORD *)v70 = *(_OWORD *)v71;
    *((_QWORD *)v70 + 2) = *((_QWORD *)v71 + 2);
    v72 = (char *)v4 + v69;
    v73 = (char *)a2 + v69;
    *(_OWORD *)v72 = *(_OWORD *)v73;
    *((_QWORD *)v72 + 2) = *((_QWORD *)v73 + 2);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t type metadata accessor for AVInfoTabViewConfiguration(uint64_t a1)
{
  return sub_1AC5059B0(a1, (uint64_t *)&unk_1EEC83128);
}

uint64_t sub_1AC507D04(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (int *)type metadata accessor for AVInfoTabMetadata();
  v5 = a1 + v4[6];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
  {
    v7 = sub_1AC5DD060();
    v8 = *(_QWORD *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7))
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = (uint64_t *)(a1 + v4[10]);
  v10 = v9[1];
  if (v10 >> 60 != 15)
    sub_1AC503B20(*v9, v10);

  type metadata accessor for AVInfoTabViewConfiguration(0);
  swift_bridgeObjectRelease();
  v11 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_1AC5DD378();
    v13 = *(_QWORD *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  else
  {
    swift_release();
  }
  v14 = a1 + *(int *)(a2 + 24);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_1AC5DD378();
    v16 = *(_QWORD *)(v15 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_release();
}

_QWORD *sub_1AC507F40(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  _OWORD *v50;
  _OWORD *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = (int *)type metadata accessor for AVInfoTabMetadata();
  v9 = v8[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v15 = sub_1AC5DD060();
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v10, v11, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    }
    v18 = *(int *)(v12 + 48);
    v19 = &v10[v18];
    v20 = &v11[v18];
    v21 = *((_QWORD *)v20 + 1);
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *((_QWORD *)v19 + 1) = v21;
    v22 = *(int *)(v12 + 64);
    v23 = &v10[v22];
    v24 = &v11[v22];
    v25 = *((_QWORD *)v24 + 1);
    *(_QWORD *)v23 = *(_QWORD *)v24;
    *((_QWORD *)v23 + 1) = v25;
    v26 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v10, 0, 1, v12);
  }
  v27 = v8[7];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v31 = v8[8];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  v34 = v33[1];
  *v32 = *v33;
  v32[1] = v34;
  v35 = v8[9];
  v36 = (_QWORD *)((char *)a1 + v35);
  v37 = (_QWORD *)((char *)a2 + v35);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  v39 = v8[10];
  v40 = (char *)a1 + v39;
  v41 = (_QWORD *)((char *)a2 + v39);
  v42 = *(_QWORD *)((char *)a2 + v39 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v42 >> 60 == 15)
  {
    *(_OWORD *)v40 = *(_OWORD *)v41;
  }
  else
  {
    v43 = *v41;
    sub_1AC5039B0(*v41, v42);
    *(_QWORD *)v40 = v43;
    *((_QWORD *)v40 + 1) = v42;
  }
  v44 = v8[11];
  v45 = (char *)a1 + v44;
  v46 = (char *)a2 + v44;
  *(_DWORD *)v45 = *(_DWORD *)v46;
  v45[4] = v46[4];
  v47 = v8[12];
  v48 = *(void **)((char *)a2 + v47);
  *(_QWORD *)((char *)a1 + v47) = v48;
  *((_BYTE *)a1 + v8[13]) = *((_BYTE *)a2 + v8[13]);
  *((_BYTE *)a1 + v8[14]) = *((_BYTE *)a2 + v8[14]);
  *((_BYTE *)a1 + v8[15]) = *((_BYTE *)a2 + v8[15]);
  v49 = v8[16];
  v50 = (_OWORD *)((char *)a1 + v49);
  v51 = (_OWORD *)((char *)a2 + v49);
  *v50 = *v51;
  *(_OWORD *)((char *)v50 + 9) = *(_OWORD *)((char *)v51 + 9);
  *((_BYTE *)a1 + v8[17]) = *((_BYTE *)a2 + v8[17]);
  *((_BYTE *)a1 + v8[18]) = *((_BYTE *)a2 + v8[18]);
  v52 = type metadata accessor for AVInfoTabViewConfiguration(0);
  *(_QWORD *)((char *)a1 + *(int *)(v52 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v52 + 20));
  v53 = a3[5];
  v54 = (_QWORD *)((char *)a1 + v53);
  v55 = (_QWORD *)((char *)a2 + v53);
  v56 = v48;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v57 = sub_1AC5DD378();
    v58 = *(_QWORD *)(v57 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v58 + 48))(v55, 1, v57))
    {
      v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
      memcpy(v54, v55, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v58 + 16))(v54, v55, v57);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v54, 0, 1, v57);
    }
  }
  else
  {
    *v54 = *v55;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v60 = a3[6];
  v61 = (_QWORD *)((char *)a1 + v60);
  v62 = (_QWORD *)((char *)a2 + v60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v63 = sub_1AC5DD378();
    v64 = *(_QWORD *)(v63 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v64 + 48))(v62, 1, v63))
    {
      v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
      memcpy(v61, v62, *(_QWORD *)(*(_QWORD *)(v65 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v64 + 16))(v61, v62, v63);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v64 + 56))(v61, 0, 1, v63);
    }
  }
  else
  {
    *v61 = *v62;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v66 = a3[7];
  v67 = a3[8];
  v68 = (char *)a1 + v66;
  v69 = (char *)a2 + v66;
  *(_OWORD *)v68 = *(_OWORD *)v69;
  *((_QWORD *)v68 + 2) = *((_QWORD *)v69 + 2);
  v70 = (char *)a1 + v67;
  v71 = (char *)a2 + v67;
  *(_OWORD *)v70 = *(_OWORD *)v71;
  *((_QWORD *)v70 + 2) = *((_QWORD *)v71 + 2);
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_1AC5083D8(_QWORD *a1, _QWORD *a2, int *a3)
{
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  void (*v29)(char *, _QWORD, uint64_t, uint64_t);
  int *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  _OWORD *v57;
  __int128 *v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  _QWORD *v75;
  uint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = (int *)type metadata accessor for AVInfoTabMetadata();
  v6 = v5[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      v14 = sub_1AC5DD060();
      v15 = *(_QWORD *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
      {
        v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
        memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v7, v8, v14);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
      }
      v23 = *(int *)(v9 + 48);
      v24 = &v7[v23];
      v25 = &v8[v23];
      *(_QWORD *)v24 = *(_QWORD *)v25;
      *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
      v26 = *(int *)(v9 + 64);
      v27 = &v7[v26];
      v28 = &v8[v26];
      *(_QWORD *)v27 = *(_QWORD *)v28;
      *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
      v29 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v29(v7, 0, 1, v9);
      goto LABEL_13;
    }
LABEL_7:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
LABEL_13:
    v30 = a3;
    goto LABEL_14;
  }
  if (v13)
  {
    sub_1AC5073BC((uint64_t)v7, &qword_1EEC83098);
    goto LABEL_7;
  }
  v18 = sub_1AC5DD060();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v7, 1, v18);
  v22 = v20(v8, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v7, v8, v18);
      goto LABEL_37;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v18);
    goto LABEL_36;
  }
  if (v22)
  {
LABEL_36:
    v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v80 - 8) + 64));
    goto LABEL_37;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v7, v8, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v7, 0, 1, v18);
LABEL_37:
  v30 = a3;
  v81 = *(int *)(v9 + 48);
  v82 = &v7[v81];
  v83 = &v8[v81];
  *(_QWORD *)v82 = *(_QWORD *)v83;
  *((_QWORD *)v82 + 1) = *((_QWORD *)v83 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v84 = *(int *)(v9 + 64);
  v85 = &v7[v84];
  v86 = &v8[v84];
  *(_QWORD *)v85 = *(_QWORD *)v86;
  *((_QWORD *)v85 + 1) = *((_QWORD *)v86 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_14:
  v31 = v5[7];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = v5[8];
  v35 = (_QWORD *)((char *)a1 + v34);
  v36 = (_QWORD *)((char *)a2 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = v5[9];
  v38 = (_QWORD *)((char *)a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  *v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = v5[10];
  v41 = (_QWORD *)((char *)a1 + v40);
  v42 = (_QWORD *)((char *)a2 + v40);
  v43 = *(_QWORD *)((char *)a2 + v40 + 8);
  if (*(_QWORD *)((char *)a1 + v40 + 8) >> 60 == 15)
  {
    if (v43 >> 60 != 15)
    {
      v44 = *v42;
      sub_1AC5039B0(v44, v43);
      *v41 = v44;
      v41[1] = v43;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (v43 >> 60 == 15)
  {
    sub_1AC5042C8((uint64_t)v41);
LABEL_19:
    *(_OWORD *)v41 = *(_OWORD *)v42;
    goto LABEL_21;
  }
  v45 = *v42;
  sub_1AC5039B0(v45, v43);
  v46 = *v41;
  v47 = v41[1];
  *v41 = v45;
  v41[1] = v43;
  sub_1AC503B20(v46, v47);
LABEL_21:
  v48 = v5[11];
  v49 = (char *)a1 + v48;
  v50 = (char *)a2 + v48;
  v51 = *(_DWORD *)v50;
  v49[4] = v50[4];
  *(_DWORD *)v49 = v51;
  v52 = v5[12];
  v53 = *(void **)((char *)a1 + v52);
  v54 = *(void **)((char *)a2 + v52);
  *(_QWORD *)((char *)a1 + v52) = v54;
  v55 = v54;

  *((_BYTE *)a1 + v5[13]) = *((_BYTE *)a2 + v5[13]);
  *((_BYTE *)a1 + v5[14]) = *((_BYTE *)a2 + v5[14]);
  *((_BYTE *)a1 + v5[15]) = *((_BYTE *)a2 + v5[15]);
  v56 = v5[16];
  v57 = (_OWORD *)((char *)a1 + v56);
  v58 = (__int128 *)((char *)a2 + v56);
  v59 = *v58;
  *(_OWORD *)((char *)v57 + 9) = *(__int128 *)((char *)v58 + 9);
  *v57 = v59;
  *((_BYTE *)a1 + v5[17]) = *((_BYTE *)a2 + v5[17]);
  *((_BYTE *)a1 + v5[18]) = *((_BYTE *)a2 + v5[18]);
  v60 = type metadata accessor for AVInfoTabViewConfiguration(0);
  *(_QWORD *)((char *)a1 + *(int *)(v60 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v60 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v61 = v30[5];
    v62 = (_QWORD *)((char *)a1 + v61);
    v63 = (_QWORD *)((char *)a2 + v61);
    sub_1AC5073BC((uint64_t)a1 + v61, &qword_1EEC831E0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v64 = sub_1AC5DD378();
      v65 = *(_QWORD *)(v64 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v65 + 48))(v63, 1, v64))
      {
        v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
        memcpy(v62, v63, *(_QWORD *)(*(_QWORD *)(v66 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v65 + 16))(v62, v63, v64);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v65 + 56))(v62, 0, 1, v64);
      }
    }
    else
    {
      *v62 = *v63;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v67 = v30[6];
    v68 = (_QWORD *)((char *)a1 + v67);
    v69 = (_QWORD *)((char *)a2 + v67);
    sub_1AC5073BC((uint64_t)a1 + v67, &qword_1EEC831E0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v70 = sub_1AC5DD378();
      v71 = *(_QWORD *)(v70 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v71 + 48))(v69, 1, v70))
      {
        v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
        memcpy(v68, v69, *(_QWORD *)(*(_QWORD *)(v72 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v71 + 16))(v68, v69, v70);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v71 + 56))(v68, 0, 1, v70);
      }
    }
    else
    {
      *v68 = *v69;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v73 = v30[7];
  v74 = (_QWORD *)((char *)a1 + v73);
  v75 = (_QWORD *)((char *)a2 + v73);
  *v74 = *v75;
  v74[1] = v75[1];
  v74[2] = v75[2];
  swift_retain();
  swift_release();
  v76 = v30[8];
  v77 = (_QWORD *)((char *)a1 + v76);
  v78 = (_QWORD *)((char *)a2 + v76);
  *v77 = *v78;
  v77[1] = v78[1];
  v77[2] = v78[2];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1AC508ADC(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  _OWORD *v21;
  _OWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = (int *)type metadata accessor for AVInfoTabMetadata();
  v8 = v7[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = sub_1AC5DD060();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v9, v10, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v9, 0, 1, v14);
    }
    *(_OWORD *)&v9[*(int *)(v11 + 48)] = *(_OWORD *)&v10[*(int *)(v11 + 48)];
    *(_OWORD *)&v9[*(int *)(v11 + 64)] = *(_OWORD *)&v10[*(int *)(v11 + 64)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)((char *)a1 + v7[7]) = *(_OWORD *)((char *)a2 + v7[7]);
  *(_OWORD *)((char *)a1 + v7[8]) = *(_OWORD *)((char *)a2 + v7[8]);
  *(_OWORD *)((char *)a1 + v7[9]) = *(_OWORD *)((char *)a2 + v7[9]);
  *(_OWORD *)((char *)a1 + v7[10]) = *(_OWORD *)((char *)a2 + v7[10]);
  v17 = v7[11];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  *(_DWORD *)v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  *(_QWORD *)((char *)a1 + v7[12]) = *(_QWORD *)((char *)a2 + v7[12]);
  *((_BYTE *)a1 + v7[13]) = *((_BYTE *)a2 + v7[13]);
  *((_BYTE *)a1 + v7[14]) = *((_BYTE *)a2 + v7[14]);
  *((_BYTE *)a1 + v7[15]) = *((_BYTE *)a2 + v7[15]);
  v20 = v7[16];
  v21 = (_OWORD *)((char *)a1 + v20);
  v22 = (_OWORD *)((char *)a2 + v20);
  *v21 = *v22;
  *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)((char *)v22 + 9);
  *((_BYTE *)a1 + v7[17]) = *((_BYTE *)a2 + v7[17]);
  *((_BYTE *)a1 + v7[18]) = *((_BYTE *)a2 + v7[18]);
  v23 = type metadata accessor for AVInfoTabViewConfiguration(0);
  *(_QWORD *)((char *)a1 + *(int *)(v23 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v23 + 20));
  v24 = a3[5];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v28 = sub_1AC5DD378();
    v29 = *(_QWORD *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v26, 1, v28))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v25, v26, v28);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v25, 0, 1, v28);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  v31 = a3[6];
  v32 = (char *)a1 + v31;
  v33 = (char *)a2 + v31;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v34 = sub_1AC5DD378();
    v35 = *(_QWORD *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v32, v33, v34);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  v37 = a3[7];
  v38 = a3[8];
  v39 = (char *)a1 + v37;
  v40 = (char *)a2 + v37;
  *(_OWORD *)v39 = *(_OWORD *)v40;
  *((_QWORD *)v39 + 2) = *((_QWORD *)v40 + 2);
  v41 = (char *)a1 + v38;
  v42 = (char *)a2 + v38;
  *(_OWORD *)v41 = *(_OWORD *)v42;
  *((_QWORD *)v41 + 2) = *((_QWORD *)v42 + 2);
  return a1;
}

_QWORD *sub_1AC508EC4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  _OWORD *v63;
  _OWORD *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v87;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = (int *)type metadata accessor for AVInfoTabMetadata();
  v9 = v8[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1AC5073BC((uint64_t)v10, &qword_1EEC83098);
      goto LABEL_7;
    }
    v21 = sub_1AC5DD060();
    v87 = *(_QWORD *)(v21 - 8);
    v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v87 + 48);
    v23 = v22(v10, 1, v21);
    v24 = v22(v11, 1, v21);
    if (v23)
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v87 + 32))(v10, v11, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v87 + 56))(v10, 0, 1, v21);
LABEL_16:
        v26 = *(int *)(v12 + 48);
        v27 = &v10[v26];
        v28 = &v11[v26];
        v30 = *(_QWORD *)v28;
        v29 = *((_QWORD *)v28 + 1);
        *(_QWORD *)v27 = v30;
        *((_QWORD *)v27 + 1) = v29;
        swift_bridgeObjectRelease();
        v31 = *(int *)(v12 + 64);
        v32 = &v10[v31];
        v33 = &v11[v31];
        v35 = *(_QWORD *)v33;
        v34 = *((_QWORD *)v33 + 1);
        *(_QWORD *)v32 = v35;
        *((_QWORD *)v32 + 1) = v34;
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v87 + 40))(v10, v11, v21);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v87 + 8))(v10, v21);
    }
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_7:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  v17 = sub_1AC5DD060();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v10, v11, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  }
  *(_OWORD *)&v10[*(int *)(v12 + 48)] = *(_OWORD *)&v11[*(int *)(v12 + 48)];
  *(_OWORD *)&v10[*(int *)(v12 + 64)] = *(_OWORD *)&v11[*(int *)(v12 + 64)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_17:
  v36 = v8[7];
  v37 = (_QWORD *)((char *)a1 + v36);
  v38 = (_QWORD *)((char *)a2 + v36);
  v40 = *v38;
  v39 = v38[1];
  *v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  v41 = v8[8];
  v42 = (_QWORD *)((char *)a1 + v41);
  v43 = (_QWORD *)((char *)a2 + v41);
  v45 = *v43;
  v44 = v43[1];
  *v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  v46 = v8[9];
  v47 = (_QWORD *)((char *)a1 + v46);
  v48 = (_QWORD *)((char *)a2 + v46);
  v50 = *v48;
  v49 = v48[1];
  *v47 = v50;
  v47[1] = v49;
  swift_bridgeObjectRelease();
  v51 = v8[10];
  v52 = (uint64_t)a1 + v51;
  v53 = (char *)a2 + v51;
  v54 = *(_QWORD *)((char *)a1 + v51 + 8);
  if (v54 >> 60 == 15)
  {
LABEL_20:
    *(_OWORD *)v52 = *(_OWORD *)v53;
    goto LABEL_22;
  }
  v55 = *((_QWORD *)v53 + 1);
  if (v55 >> 60 == 15)
  {
    sub_1AC5042C8(v52);
    goto LABEL_20;
  }
  v56 = *(_QWORD *)v52;
  *(_QWORD *)v52 = *(_QWORD *)v53;
  *(_QWORD *)(v52 + 8) = v55;
  sub_1AC503B20(v56, v54);
LABEL_22:
  v57 = v8[11];
  v58 = (char *)a1 + v57;
  v59 = (char *)a2 + v57;
  *(_DWORD *)v58 = *(_DWORD *)v59;
  v58[4] = v59[4];
  v60 = v8[12];
  v61 = *(void **)((char *)a1 + v60);
  *(_QWORD *)((char *)a1 + v60) = *(_QWORD *)((char *)a2 + v60);

  *((_BYTE *)a1 + v8[13]) = *((_BYTE *)a2 + v8[13]);
  *((_BYTE *)a1 + v8[14]) = *((_BYTE *)a2 + v8[14]);
  *((_BYTE *)a1 + v8[15]) = *((_BYTE *)a2 + v8[15]);
  v62 = v8[16];
  v63 = (_OWORD *)((char *)a1 + v62);
  v64 = (_OWORD *)((char *)a2 + v62);
  *v63 = *v64;
  *(_OWORD *)((char *)v63 + 9) = *(_OWORD *)((char *)v64 + 9);
  *((_BYTE *)a1 + v8[17]) = *((_BYTE *)a2 + v8[17]);
  *((_BYTE *)a1 + v8[18]) = *((_BYTE *)a2 + v8[18]);
  v65 = type metadata accessor for AVInfoTabViewConfiguration(0);
  *(_QWORD *)((char *)a1 + *(int *)(v65 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v65 + 20));
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v66 = a3[5];
    v67 = (char *)a1 + v66;
    v68 = (char *)a2 + v66;
    sub_1AC5073BC((uint64_t)a1 + v66, &qword_1EEC831E0);
    v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v70 = sub_1AC5DD378();
      v71 = *(_QWORD *)(v70 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v68, 1, v70))
      {
        v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
        memcpy(v67, v68, *(_QWORD *)(*(_QWORD *)(v72 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v67, v68, v70);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v71 + 56))(v67, 0, 1, v70);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v67, v68, *(_QWORD *)(*(_QWORD *)(v69 - 8) + 64));
    }
    v73 = a3[6];
    v74 = (char *)a1 + v73;
    v75 = (char *)a2 + v73;
    sub_1AC5073BC((uint64_t)a1 + v73, &qword_1EEC831E0);
    v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v77 = sub_1AC5DD378();
      v78 = *(_QWORD *)(v77 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v78 + 48))(v75, 1, v77))
      {
        v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
        memcpy(v74, v75, *(_QWORD *)(*(_QWORD *)(v79 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v74, v75, v77);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v78 + 56))(v74, 0, 1, v77);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v74, v75, *(_QWORD *)(*(_QWORD *)(v76 - 8) + 64));
    }
  }
  v80 = a3[7];
  v81 = (char *)a1 + v80;
  v82 = (char *)a2 + v80;
  *(_OWORD *)v81 = *(_OWORD *)v82;
  *((_QWORD *)v81 + 2) = *((_QWORD *)v82 + 2);
  swift_release();
  v83 = a3[8];
  v84 = (char *)a1 + v83;
  v85 = (char *)a2 + v83;
  *(_OWORD *)v84 = *(_OWORD *)v85;
  *((_QWORD *)v84 + 2) = *((_QWORD *)v85 + 2);
  swift_release();
  return a1;
}

uint64_t sub_1AC5094D0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC5094DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int v15;

  v6 = type metadata accessor for AVInfoTabViewConfiguration(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83C98);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 28) + 16);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t sub_1AC509598()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC5095A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = type metadata accessor for AVInfoTabViewConfiguration(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83C98);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 28) + 16) = a2;
  return result;
}

uint64_t type metadata accessor for AVInfoTabView(uint64_t a1)
{
  return sub_1AC5059B0(a1, (uint64_t *)&unk_1EEC830E8);
}

void sub_1AC509664()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for AVInfoTabViewConfiguration(319);
  if (v0 <= 0x3F)
  {
    sub_1AC5096F4();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_1AC5096F4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEC83138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83140);
    v0 = sub_1AC5DD138();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEC83138);
  }
}

_QWORD *sub_1AC50974C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
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
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _OWORD *v52;
  _OWORD *v53;
  id v54;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = (int *)type metadata accessor for AVInfoTabMetadata();
    v10 = v9[6];
    v11 = (char *)v4 + v10;
    v12 = (char *)a2 + v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      v17 = sub_1AC5DD060();
      v18 = *(_QWORD *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v17))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v11, v12, v17);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
      }
      v20 = *(int *)(v13 + 48);
      v21 = &v11[v20];
      v22 = &v12[v20];
      v23 = *((_QWORD *)v22 + 1);
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *((_QWORD *)v21 + 1) = v23;
      v24 = *(int *)(v13 + 64);
      v25 = &v11[v24];
      v26 = &v12[v24];
      v27 = *((_QWORD *)v26 + 1);
      *(_QWORD *)v25 = *(_QWORD *)v26;
      *((_QWORD *)v25 + 1) = v27;
      v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v11, 0, 1, v13);
    }
    v29 = v9[7];
    v30 = (_QWORD *)((char *)v4 + v29);
    v31 = (_QWORD *)((char *)a2 + v29);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = v9[8];
    v34 = (_QWORD *)((char *)v4 + v33);
    v35 = (_QWORD *)((char *)a2 + v33);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    v37 = v9[9];
    v38 = (_QWORD *)((char *)v4 + v37);
    v39 = (_QWORD *)((char *)a2 + v37);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    v41 = v9[10];
    v42 = (char *)v4 + v41;
    v43 = (_QWORD *)((char *)a2 + v41);
    v44 = *(_QWORD *)((char *)a2 + v41 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v44 >> 60 == 15)
    {
      *(_OWORD *)v42 = *(_OWORD *)v43;
    }
    else
    {
      v45 = *v43;
      sub_1AC5039B0(*v43, v44);
      *(_QWORD *)v42 = v45;
      *((_QWORD *)v42 + 1) = v44;
    }
    v46 = v9[11];
    v47 = (char *)v4 + v46;
    v48 = (char *)a2 + v46;
    *(_DWORD *)v47 = *(_DWORD *)v48;
    v47[4] = v48[4];
    v49 = v9[12];
    v50 = *(void **)((char *)a2 + v49);
    *(_QWORD *)((char *)v4 + v49) = v50;
    *((_BYTE *)v4 + v9[13]) = *((_BYTE *)a2 + v9[13]);
    *((_BYTE *)v4 + v9[14]) = *((_BYTE *)a2 + v9[14]);
    *((_BYTE *)v4 + v9[15]) = *((_BYTE *)a2 + v9[15]);
    v51 = v9[16];
    v52 = (_OWORD *)((char *)v4 + v51);
    v53 = (_OWORD *)((char *)a2 + v51);
    *v52 = *v53;
    *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)v53 + 9);
    *((_BYTE *)v4 + v9[17]) = *((_BYTE *)a2 + v9[17]);
    *((_BYTE *)v4 + v9[18]) = *((_BYTE *)a2 + v9[18]);
    *(_QWORD *)((char *)v4 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
    v54 = v50;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1AC509A30(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = (int *)type metadata accessor for AVInfoTabMetadata();
  v3 = a1 + v2[6];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v3, 1, v4))
  {
    v5 = sub_1AC5DD060();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v3, 1, v5))
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = (uint64_t *)(a1 + v2[10]);
  v8 = v7[1];
  if (v8 >> 60 != 15)
    sub_1AC503B20(*v7, v8);

  return swift_bridgeObjectRelease();
}

_QWORD *sub_1AC509B74(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  _OWORD *v50;
  _OWORD *v51;
  id v52;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = (int *)type metadata accessor for AVInfoTabMetadata();
  v9 = v8[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v15 = sub_1AC5DD060();
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v10, v11, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    }
    v18 = *(int *)(v12 + 48);
    v19 = &v10[v18];
    v20 = &v11[v18];
    v21 = *((_QWORD *)v20 + 1);
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *((_QWORD *)v19 + 1) = v21;
    v22 = *(int *)(v12 + 64);
    v23 = &v10[v22];
    v24 = &v11[v22];
    v25 = *((_QWORD *)v24 + 1);
    *(_QWORD *)v23 = *(_QWORD *)v24;
    *((_QWORD *)v23 + 1) = v25;
    v26 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v10, 0, 1, v12);
  }
  v27 = v8[7];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v31 = v8[8];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  v34 = v33[1];
  *v32 = *v33;
  v32[1] = v34;
  v35 = v8[9];
  v36 = (_QWORD *)((char *)a1 + v35);
  v37 = (_QWORD *)((char *)a2 + v35);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  v39 = v8[10];
  v40 = (char *)a1 + v39;
  v41 = (_QWORD *)((char *)a2 + v39);
  v42 = *(_QWORD *)((char *)a2 + v39 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v42 >> 60 == 15)
  {
    *(_OWORD *)v40 = *(_OWORD *)v41;
  }
  else
  {
    v43 = *v41;
    sub_1AC5039B0(*v41, v42);
    *(_QWORD *)v40 = v43;
    *((_QWORD *)v40 + 1) = v42;
  }
  v44 = v8[11];
  v45 = (char *)a1 + v44;
  v46 = (char *)a2 + v44;
  *(_DWORD *)v45 = *(_DWORD *)v46;
  v45[4] = v46[4];
  v47 = v8[12];
  v48 = *(void **)((char *)a2 + v47);
  *(_QWORD *)((char *)a1 + v47) = v48;
  *((_BYTE *)a1 + v8[13]) = *((_BYTE *)a2 + v8[13]);
  *((_BYTE *)a1 + v8[14]) = *((_BYTE *)a2 + v8[14]);
  *((_BYTE *)a1 + v8[15]) = *((_BYTE *)a2 + v8[15]);
  v49 = v8[16];
  v50 = (_OWORD *)((char *)a1 + v49);
  v51 = (_OWORD *)((char *)a2 + v49);
  *v50 = *v51;
  *(_OWORD *)((char *)v50 + 9) = *(_OWORD *)((char *)v51 + 9);
  *((_BYTE *)a1 + v8[17]) = *((_BYTE *)a2 + v8[17]);
  *((_BYTE *)a1 + v8[18]) = *((_BYTE *)a2 + v8[18]);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  v52 = v48;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_1AC509E2C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void (*v30)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  _OWORD *v57;
  __int128 *v58;
  __int128 v59;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char *v67;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = (int *)type metadata accessor for AVInfoTabMetadata();
  v6 = v5[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_1AC5073BC((uint64_t)v7, &qword_1EEC83098);
      goto LABEL_7;
    }
    v19 = sub_1AC5DD060();
    v20 = *(_QWORD *)(v19 - 8);
    v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
    v22 = v21(v7, 1, v19);
    v23 = v21(v8, 1, v19);
    if (v22)
    {
      if (!v23)
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v7, v8, v19);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v7, 0, 1, v19);
LABEL_25:
        v62 = *(int *)(v9 + 48);
        v63 = &v7[v62];
        v64 = &v8[v62];
        *(_QWORD *)v63 = *(_QWORD *)v64;
        *((_QWORD *)v63 + 1) = *((_QWORD *)v64 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v65 = *(int *)(v9 + 64);
        v66 = &v7[v65];
        v67 = &v8[v65];
        *(_QWORD *)v66 = *(_QWORD *)v67;
        *((_QWORD *)v66 + 1) = *((_QWORD *)v67 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    else
    {
      if (!v23)
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v7, v8, v19);
        goto LABEL_25;
      }
      (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v19);
    }
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    goto LABEL_25;
  }
  if (v13)
  {
LABEL_7:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
LABEL_8:
    v18 = a3;
    goto LABEL_14;
  }
  v14 = sub_1AC5DD060();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v7, v8, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
  }
  v18 = a3;
  v24 = *(int *)(v9 + 48);
  v25 = &v7[v24];
  v26 = &v8[v24];
  *(_QWORD *)v25 = *(_QWORD *)v26;
  *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
  v27 = *(int *)(v9 + 64);
  v28 = &v7[v27];
  v29 = &v8[v27];
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *((_QWORD *)v28 + 1) = *((_QWORD *)v29 + 1);
  v30 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v30(v7, 0, 1, v9);
LABEL_14:
  v31 = v5[7];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = v5[8];
  v35 = (_QWORD *)((char *)a1 + v34);
  v36 = (_QWORD *)((char *)a2 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = v5[9];
  v38 = (_QWORD *)((char *)a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  *v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = v5[10];
  v41 = (_QWORD *)((char *)a1 + v40);
  v42 = (_QWORD *)((char *)a2 + v40);
  v43 = *(_QWORD *)((char *)a2 + v40 + 8);
  if (*(_QWORD *)((char *)a1 + v40 + 8) >> 60 != 15)
  {
    if (v43 >> 60 != 15)
    {
      v45 = *v42;
      sub_1AC5039B0(v45, v43);
      v46 = *v41;
      v47 = v41[1];
      *v41 = v45;
      v41[1] = v43;
      sub_1AC503B20(v46, v47);
      goto LABEL_21;
    }
    sub_1AC5042C8((uint64_t)v41);
    goto LABEL_19;
  }
  if (v43 >> 60 == 15)
  {
LABEL_19:
    *(_OWORD *)v41 = *(_OWORD *)v42;
    goto LABEL_21;
  }
  v44 = *v42;
  sub_1AC5039B0(v44, v43);
  *v41 = v44;
  v41[1] = v43;
LABEL_21:
  v48 = v5[11];
  v49 = (char *)a1 + v48;
  v50 = (char *)a2 + v48;
  v51 = *(_DWORD *)v50;
  v49[4] = v50[4];
  *(_DWORD *)v49 = v51;
  v52 = v5[12];
  v53 = *(void **)((char *)a1 + v52);
  v54 = *(void **)((char *)a2 + v52);
  *(_QWORD *)((char *)a1 + v52) = v54;
  v55 = v54;

  *((_BYTE *)a1 + v5[13]) = *((_BYTE *)a2 + v5[13]);
  *((_BYTE *)a1 + v5[14]) = *((_BYTE *)a2 + v5[14]);
  *((_BYTE *)a1 + v5[15]) = *((_BYTE *)a2 + v5[15]);
  v56 = v5[16];
  v57 = (_OWORD *)((char *)a1 + v56);
  v58 = (__int128 *)((char *)a2 + v56);
  v59 = *v58;
  *(_OWORD *)((char *)v57 + 9) = *(__int128 *)((char *)v58 + 9);
  *v57 = v59;
  *((_BYTE *)a1 + v5[17]) = *((_BYTE *)a2 + v5[17]);
  *((_BYTE *)a1 + v5[18]) = *((_BYTE *)a2 + v5[18]);
  *(_QWORD *)((char *)a1 + *(int *)(v18 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v18 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_1AC50A2F0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  _OWORD *v64;
  _OWORD *v65;
  uint64_t v67;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = (int *)type metadata accessor for AVInfoTabMetadata();
  v9 = v8[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1AC5073BC((uint64_t)v10, &qword_1EEC83098);
      goto LABEL_7;
    }
    v67 = a3;
    v21 = sub_1AC5DD060();
    v22 = *(_QWORD *)(v21 - 8);
    v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
    v24 = v23(v10, 1, v21);
    v25 = v23(v11, 1, v21);
    if (v24)
    {
      if (!v25)
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v10, v11, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v10, 0, 1, v21);
LABEL_16:
        a3 = v67;
        v27 = *(int *)(v12 + 48);
        v28 = &v10[v27];
        v29 = &v11[v27];
        v31 = *(_QWORD *)v29;
        v30 = *((_QWORD *)v29 + 1);
        *(_QWORD *)v28 = v31;
        *((_QWORD *)v28 + 1) = v30;
        swift_bridgeObjectRelease();
        v32 = *(int *)(v12 + 64);
        v33 = &v10[v32];
        v34 = &v11[v32];
        v36 = *(_QWORD *)v34;
        v35 = *((_QWORD *)v34 + 1);
        *(_QWORD *)v33 = v36;
        *((_QWORD *)v33 + 1) = v35;
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v25)
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v10, v11, v21);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v21);
    }
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_7:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  v17 = sub_1AC5DD060();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v10, v11, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  }
  *(_OWORD *)&v10[*(int *)(v12 + 48)] = *(_OWORD *)&v11[*(int *)(v12 + 48)];
  *(_OWORD *)&v10[*(int *)(v12 + 64)] = *(_OWORD *)&v11[*(int *)(v12 + 64)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_17:
  v37 = v8[7];
  v38 = (_QWORD *)((char *)a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  v41 = *v39;
  v40 = v39[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  v42 = v8[8];
  v43 = (_QWORD *)((char *)a1 + v42);
  v44 = (_QWORD *)((char *)a2 + v42);
  v46 = *v44;
  v45 = v44[1];
  *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  v47 = v8[9];
  v48 = (_QWORD *)((char *)a1 + v47);
  v49 = (_QWORD *)((char *)a2 + v47);
  v51 = *v49;
  v50 = v49[1];
  *v48 = v51;
  v48[1] = v50;
  swift_bridgeObjectRelease();
  v52 = v8[10];
  v53 = (_QWORD *)((char *)a1 + v52);
  v54 = (_QWORD *)((char *)a2 + v52);
  v55 = *(_QWORD *)((char *)a1 + v52 + 8);
  if (v55 >> 60 != 15)
  {
    v56 = v54[1];
    if (v56 >> 60 != 15)
    {
      v57 = *v53;
      *v53 = *v54;
      v53[1] = v56;
      sub_1AC503B20(v57, v55);
      goto LABEL_22;
    }
    sub_1AC5042C8((uint64_t)v53);
  }
  *(_OWORD *)v53 = *(_OWORD *)v54;
LABEL_22:
  v58 = v8[11];
  v59 = (char *)a1 + v58;
  v60 = (char *)a2 + v58;
  *(_DWORD *)v59 = *(_DWORD *)v60;
  v59[4] = v60[4];
  v61 = v8[12];
  v62 = *(void **)((char *)a1 + v61);
  *(_QWORD *)((char *)a1 + v61) = *(_QWORD *)((char *)a2 + v61);

  *((_BYTE *)a1 + v8[13]) = *((_BYTE *)a2 + v8[13]);
  *((_BYTE *)a1 + v8[14]) = *((_BYTE *)a2 + v8[14]);
  *((_BYTE *)a1 + v8[15]) = *((_BYTE *)a2 + v8[15]);
  v63 = v8[16];
  v64 = (_OWORD *)((char *)a1 + v63);
  v65 = (_OWORD *)((char *)a2 + v63);
  *v64 = *v65;
  *(_OWORD *)((char *)v64 + 9) = *(_OWORD *)((char *)v65 + 9);
  *((_BYTE *)a1 + v8[17]) = *((_BYTE *)a2 + v8[17]);
  *((_BYTE *)a1 + v8[18]) = *((_BYTE *)a2 + v8[18]);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1AC50A6DC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC50A6E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for AVInfoTabMetadata();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1AC50A764()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC50A770(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for AVInfoTabMetadata();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_1AC50A7E8()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AVInfoTabMetadata();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1AC50A85C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC50A86C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];
  char v43;
  uint64_t (*v44)(uint64_t);
  ValueMetadata *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;

  v3 = type metadata accessor for AVInfoTabView(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v42 - v8;
  sub_1AC5DD174();
  v11 = v10;
  v13 = v12;
  v14 = sub_1AC50D16C();
  sub_1AC5059E4(a2, (uint64_t)v9, type metadata accessor for AVInfoTabView);
  if ((v14 & 1) != 0)
  {
    sub_1AC5055D0((uint64_t)v9, type metadata accessor for AVInfoTabView);
LABEL_5:
    sub_1AC5059E4(a2, (uint64_t)v7, type metadata accessor for AVInfoTabView);
    v16 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v17 = swift_allocObject();
    sub_1AC50E794((uint64_t)v7, v17 + v16);
    v18 = sub_1AC5DD1D4();
    v19 = sub_1AC5DD42C();
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83CD0);
    MEMORY[0x1E0C80A78](v20);
    v22 = (char *)v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_QWORD *)v22 = sub_1AC50EC30;
    *((_QWORD *)v22 + 1) = v17;
    *((_QWORD *)v22 + 2) = v18;
    v22[24] = v19;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83CD8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83CA0);
    sub_1AC50EBA8();
    v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83CA8);
    v24 = sub_1AC50EAE0();
    v25 = sub_1AC50EB64();
    v44 = (uint64_t (*)(uint64_t))v23;
    v45 = &type metadata for AVChromelessButtonStyle;
    v46 = v24;
    v47 = v25;
    swift_getOpaqueTypeConformance2();
    return sub_1AC5DD324();
  }
  v15 = sub_1AC50E010();
  sub_1AC5055D0((uint64_t)v9, type metadata accessor for AVInfoTabView);
  if ((v15 & 1) != 0 && v13 < v11)
    goto LABEL_5;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83CA0);
  v42[2] = v42;
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x1E0C80A78](v27);
  v30 = (char *)v42 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC5059E4(a2, (uint64_t)v7, type metadata accessor for AVInfoTabView);
  v31 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v32 = swift_allocObject();
  sub_1AC50E794((uint64_t)v7, v32 + v31);
  LOBYTE(v31) = sub_1AC5DD42C();
  sub_1AC5DD114();
  v44 = sub_1AC50EA78;
  v45 = (ValueMetadata *)v32;
  LOBYTE(v46) = v31;
  v47 = v33;
  v48 = v34;
  v49 = v35;
  v50 = v36;
  v51 = 0;
  v43 = 1;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83CA8);
  v38 = sub_1AC50EAE0();
  v39 = sub_1AC50EB64();
  sub_1AC5DD4F8();
  swift_release();
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83CD0);
  v42[1] = v42;
  MEMORY[0x1E0C80A78](v40);
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))((char *)v42 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0), v30, v27);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83CD8);
  sub_1AC50EBA8();
  v44 = (uint64_t (*)(uint64_t))v37;
  v45 = &type metadata for AVChromelessButtonStyle;
  v46 = v38;
  v47 = v39;
  swift_getOpaqueTypeConformance2();
  sub_1AC5DD324();
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v30, v27);
}

void sub_1AC50ACA8()
{
  qword_1EEC83C78 = 0x4069000000000000;
}

void sub_1AC50ACB8()
{
  qword_1EEC83C80 = 0x4024000000000000;
}

void sub_1AC50ACC8()
{
  qword_1EEC83C88 = 0x3FFC71C71C71C71CLL;
}

double sub_1AC50ACE4()
{
  id v0;
  double v1;
  double v2;
  double result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4AD0]);
  objc_msgSend(v0, sel_lineHeight);
  v2 = v1;

  result = v2 * 4.0;
  *(double *)&qword_1EEC83C90 = v2 * 4.0;
  return result;
}

uint64_t sub_1AC50AD58(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83CF8);
  MEMORY[0x1E0C80A78](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_1EEC83798 != -1)
    swift_once();
  v6 = qword_1EEC83C80;
  *(_QWORD *)v5 = sub_1AC5DD2AC();
  *((_QWORD *)v5 + 1) = v6;
  v5[16] = 0;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D00);
  sub_1AC50AE80(a2, (uint64_t)&v5[*(int *)(v7 + 44)]);
  v9[15] = 0;
  sub_1AC4FC18C(&qword_1EEC83D08, &qword_1EEC83CF8, MEMORY[0x1E0CDFB08]);
  sub_1AC50EB64();
  sub_1AC5DD4F8();
  return sub_1AC5073BC((uint64_t)v5, &qword_1EEC83CF8);
}

uint64_t sub_1AC50AE80@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t (*v33)(void);
  uint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _OWORD *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char v79;
  char *v80;
  uint64_t (*v81)(void);
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  __int128 v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  uint64_t v137;
  int v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t *v143;
  uint64_t *v144;
  char *v145;
  char *v146;
  char *v147;
  uint64_t *v148;
  uint64_t *v149;
  uint64_t *v150;
  uint64_t *v151;
  uint64_t *v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;

  v154 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D10);
  MEMORY[0x1E0C80A78](v3);
  v153 = v4;
  v155 = (uint64_t)&v133 - (((unint64_t)v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(int *)(type metadata accessor for AVInfoTabMetadata() + 40);
  v152 = a1;
  v6 = (uint64_t *)((char *)a1 + v5);
  v7 = v6[1];
  if (v7 >> 60 != 15)
  {
    v8 = *v6;
    v9 = objc_allocWithZone(MEMORY[0x1E0DC3870]);
    sub_1AC5039B0(v8, v7);
    v10 = (void *)sub_1AC5DCFB8();
    v11 = objc_msgSend(v9, sel_initWithData_, v10);

    if (v11)
    {
      v150 = (uint64_t *)v8;
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D68);
      v151 = &v133;
      v148 = (uint64_t *)v12;
      v13 = MEMORY[0x1E0C80A78](v12);
      v149 = (uint64_t *)((char *)&v133 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
      v146 = (char *)&v133;
      MEMORY[0x1E0C80A78](v13);
      v145 = (char *)&v133 - v15;
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D80);
      v144 = &v133;
      v143 = (uint64_t *)v16;
      MEMORY[0x1E0C80A78](v16);
      v18 = (char *)&v133 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D90);
      v142 = &v133;
      v141 = v19;
      MEMORY[0x1E0C80A78](v19);
      v21 = (double *)((char *)&v133 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
      v22 = (char *)v11;
      sub_1AC5DD5AC();
      v23 = sub_1AC5DD5B8();
      v24 = *(_QWORD *)(v23 - 8);
      MEMORY[0x1E0C80A78](v23);
      v26 = (char *)&v133 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v26, *MEMORY[0x1E0CDF6F0], v23);
      v27 = sub_1AC5DD5DC();
      swift_release();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      objc_msgSend(v22, sel_size);
      v29 = v28;
      v147 = v22;
      objc_msgSend(v22, sel_size);
      v31 = v29 / v30;
      if (qword_1EEC83790 != -1)
        swift_once();
      sub_1AC5DD678();
      sub_1AC5DD168();
      v139 = v156;
      v138 = BYTE8(v156);
      v137 = v157;
      v136 = BYTE8(v157);
      v134 = *((_QWORD *)&v158 + 1);
      v135 = v158;
      v32 = sub_1AC5DD1E0();
      v140 = &v133;
      v33 = MEMORY[0x1E0CDA080];
      v34 = MEMORY[0x1E0C80A78](v32);
      v36 = (_OWORD *)((char *)&v133 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
      v37 = (char *)v36 + *(int *)(v34 + 20);
      v38 = *MEMORY[0x1E0CDB0C8];
      v39 = sub_1AC5DD2C4();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v37, v38, v39);
      __asm { FMOV            V0.2D, #5.0 }
      *v36 = _Q0;
      v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83DC0);
      MEMORY[0x1E0C80A78](v45);
      v47 = (char *)&v133 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_1AC5059E4((uint64_t)v36, (uint64_t)v47, (uint64_t (*)(_QWORD))v33);
      *(_WORD *)&v47[*(int *)(v45 + 36)] = 256;
      sub_1AC507378((uint64_t)v47, (uint64_t)v21 + *(int *)(v141 + 36), &qword_1EEC83DC0);
      *(_QWORD *)v21 = v27;
      v21[1] = v31;
      *((_WORD *)v21 + 8) = 0;
      *((_QWORD *)v21 + 3) = v139;
      *((_BYTE *)v21 + 32) = v138;
      *((_QWORD *)v21 + 5) = v137;
      *((_BYTE *)v21 + 48) = v136;
      v48 = v134;
      *((_QWORD *)v21 + 7) = v135;
      *((_QWORD *)v21 + 8) = v48;
      swift_retain();
      sub_1AC5073BC((uint64_t)v47, &qword_1EEC83DC0);
      sub_1AC5055D0((uint64_t)v36, (uint64_t (*)(_QWORD))v33);
      swift_release();
      sub_1AC507378((uint64_t)v21, (uint64_t)v18, &qword_1EEC83D90);
      v49 = &v18[*((int *)v143 + 9)];
      *(_QWORD *)v49 = 0;
      *((_WORD *)v49 + 4) = 257;
      sub_1AC5073BC((uint64_t)v21, &qword_1EEC83D90);
      sub_1AC50F158(&qword_1EEC83D78, &qword_1EEC83D80, (uint64_t (*)(void))sub_1AC50ED7C, MEMORY[0x1E0CDB160]);
      v50 = (uint64_t)v145;
      sub_1AC5DD558();
      sub_1AC5073BC((uint64_t)v18, &qword_1EEC83D80);
      v51 = &qword_1EEC83D68;
      v52 = (uint64_t)v149;
      sub_1AC5073F8(v50, (uint64_t)v149, &qword_1EEC83D68);
      v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D60);
      MEMORY[0x1E0C80A78](v53);
      sub_1AC507378(v52, (uint64_t)&v133 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1EEC83D68);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D18);
      sub_1AC50ECD8();
      sub_1AC50F158(&qword_1EEC83DC8, &qword_1EEC83D18, (uint64_t (*)(void))sub_1AC50EE84, MEMORY[0x1E0CD8D78]);
      sub_1AC5DD324();

      sub_1AC50F024((uint64_t)v150, v7);
      v55 = v52;
      goto LABEL_12;
    }
    sub_1AC50F024(v8, v7);
  }
  v150 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D18);
  v151 = &v133;
  v56 = MEMORY[0x1E0C80A78](v150);
  v149 = (uint64_t *)((char *)&v133 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0));
  v148 = &v133;
  MEMORY[0x1E0C80A78](v56);
  v147 = (char *)&v133 - v58;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D20);
  v146 = (char *)&v133;
  MEMORY[0x1E0C80A78](v59);
  v145 = (char *)&v133 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D28);
  v144 = &v133;
  MEMORY[0x1E0C80A78](v61);
  v63 = (char *)&v133 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D30);
  v143 = &v133;
  MEMORY[0x1E0C80A78](v64);
  v66 = (char *)&v133 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_1AC5DD1E0();
  v142 = &v133;
  v68 = MEMORY[0x1E0C80A78](v67);
  v70 = (_OWORD *)((char *)&v133 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0));
  v71 = (char *)v70 + *(int *)(v68 + 20);
  v72 = *MEMORY[0x1E0CDB0C8];
  v73 = sub_1AC5DD2C4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 104))(v71, v72, v73);
  __asm { FMOV            V0.2D, #5.0 }
  *v70 = _Q0;
  v75 = sub_1AC5DD66C();
  v76 = *(_QWORD *)(v75 - 8);
  MEMORY[0x1E0C80A78](v75);
  v78 = (char *)&v133 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC5DD660();
  v79 = sub_1AC5DD42C();
  v80 = &v66[*(int *)(v64 + 36)];
  (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v80, v78, v75);
  v80[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D38) + 36)] = v79;
  v81 = MEMORY[0x1E0CDA080];
  sub_1AC5059E4((uint64_t)v70, (uint64_t)v66, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDA080]);
  (*(void (**)(char *, uint64_t))(v76 + 8))(v78, v75);
  sub_1AC5055D0((uint64_t)v70, (uint64_t (*)(_QWORD))v81);
  if (qword_1EEC837A0 != -1)
    swift_once();
  v82 = qword_1EEC83C88;
  sub_1AC507378((uint64_t)v66, (uint64_t)v63, &qword_1EEC83D30);
  v83 = &v63[*(int *)(v61 + 36)];
  *(_QWORD *)v83 = v82;
  *((_WORD *)v83 + 4) = 0;
  sub_1AC5073BC((uint64_t)v66, &qword_1EEC83D30);
  sub_1AC50F158(&qword_1EEC83D40, &qword_1EEC83D28, (uint64_t (*)(void))sub_1AC50EC3C, MEMORY[0x1E0CDB160]);
  v84 = (uint64_t)v145;
  sub_1AC5DD558();
  sub_1AC5073BC((uint64_t)v63, &qword_1EEC83D28);
  if (qword_1EEC83790 != -1)
    swift_once();
  sub_1AC5DD678();
  sub_1AC5DD168();
  v85 = v147;
  sub_1AC507378(v84, (uint64_t)v147, &qword_1EEC83D20);
  v86 = &v85[*((int *)v150 + 9)];
  v87 = v157;
  *(_OWORD *)v86 = v156;
  *((_OWORD *)v86 + 1) = v87;
  *((_OWORD *)v86 + 2) = v158;
  sub_1AC5073BC(v84, &qword_1EEC83D20);
  v51 = &qword_1EEC83D18;
  v88 = (uint64_t)v149;
  sub_1AC5073F8((uint64_t)v85, (uint64_t)v149, &qword_1EEC83D18);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D60);
  MEMORY[0x1E0C80A78](v89);
  sub_1AC507378(v88, (uint64_t)&v133 - ((v90 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1EEC83D18);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D68);
  sub_1AC50ECD8();
  sub_1AC50F158(&qword_1EEC83DC8, &qword_1EEC83D18, (uint64_t (*)(void))sub_1AC50EE84, MEMORY[0x1E0CD8D78]);
  sub_1AC5DD324();
  v55 = v88;
LABEL_12:
  sub_1AC5073BC(v55, v51);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83DD8);
  v151 = &v133;
  v92 = *(uint64_t **)(*(_QWORD *)(v91 - 8) + 64);
  v93 = MEMORY[0x1E0C80A78](v91);
  v94 = (char *)&v133 - (((unint64_t)v92 + 15) & 0xFFFFFFFFFFFFFFF0);
  v150 = &v133;
  MEMORY[0x1E0C80A78](v93);
  v96 = (char *)&v133 - v95;
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83DE0);
  v149 = &v133;
  MEMORY[0x1E0C80A78](v97);
  v99 = (char *)&v133 - ((v98 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v99 = sub_1AC5DD2F4();
  *((_QWORD *)v99 + 1) = 0x4020000000000000;
  v99[16] = 0;
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83DE8);
  v101 = v152;
  sub_1AC50C0BC(v152, (uint64_t)&v99[*(int *)(v100 + 44)]);
  sub_1AC5DD684();
  sub_1AC50C4E0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v96, 0.0, 1, 0.0, 1);
  sub_1AC5073BC((uint64_t)v99, &qword_1EEC83DE0);
  sub_1AC5073F8((uint64_t)v96, (uint64_t)v94, &qword_1EEC83DD8);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83DF0);
  v148 = &v133;
  MEMORY[0x1E0C80A78](v102);
  v147 = v103;
  v104 = (char *)&v133 - ((unint64_t)(v103 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = *(uint64_t *)((char *)v101 + *(int *)(type metadata accessor for AVInfoTabViewConfiguration(0) + 20));
  if (v105 >> 62)
  {
    swift_bridgeObjectRetain();
    v106 = sub_1AC5DD864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v106 = *(_QWORD *)((v105 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83DF8);
  v108 = v107;
  v109 = *(_QWORD *)(v107 - 8);
  if (v106 < 1)
  {
    v120 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56))(v104, 1, 1, v107);
  }
  else
  {
    v146 = v104;
    v152 = v92;
    v145 = (char *)&v133;
    v144 = (uint64_t *)v109;
    MEMORY[0x1E0C80A78](v107);
    v111 = (char *)&v133 - ((v110 + 15) & 0xFFFFFFFFFFFFFFF0);
    v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E08);
    v143 = &v133;
    MEMORY[0x1E0C80A78](v112);
    v114 = (char *)&v133 - ((v113 + 15) & 0xFFFFFFFFFFFFFFF0);
    v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E10);
    v142 = &v133;
    MEMORY[0x1E0C80A78](v115);
    v117 = (char *)&v133 - ((v116 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_QWORD *)v117 = sub_1AC5DD300();
    *((_QWORD *)v117 + 1) = 0x4020000000000000;
    v117[16] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E18);
    *(_QWORD *)&v159 = v105;
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831F0);
    sub_1AC50EF94();
    sub_1AC50EFE0();
    sub_1AC5DD654();
    sub_1AC4FC18C(&qword_1EEC83E30, &qword_1EEC83E10, MEMORY[0x1E0CDFCB8]);
    sub_1AC5DD570();
    sub_1AC5073BC((uint64_t)v117, &qword_1EEC83E10);
    if (qword_1EEC83790 != -1)
      swift_once();
    sub_1AC5DD678();
    sub_1AC5DD168();
    sub_1AC507378((uint64_t)v114, (uint64_t)v111, &qword_1EEC83E08);
    v118 = &v111[*(int *)(v108 + 36)];
    v119 = v160;
    *(_OWORD *)v118 = v159;
    *((_OWORD *)v118 + 1) = v119;
    *((_OWORD *)v118 + 2) = v161;
    sub_1AC5073BC((uint64_t)v114, &qword_1EEC83E08);
    v104 = v146;
    sub_1AC5073F8((uint64_t)v111, (uint64_t)v146, &qword_1EEC83DF8);
    v120 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v144[7])(v104, 0, 1, v108);
    v92 = v152;
  }
  v152 = &v133;
  MEMORY[0x1E0C80A78](v120);
  v122 = (char *)&v133 - ((v121 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = v155;
  v124 = sub_1AC507378(v155, (uint64_t)v122, &qword_1EEC83D10);
  v153 = &v133;
  MEMORY[0x1E0C80A78](v124);
  v125 = (char *)&v133 - (((unint64_t)v92 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = sub_1AC507378((uint64_t)v94, (uint64_t)v125, &qword_1EEC83DD8);
  v146 = (char *)&v133;
  MEMORY[0x1E0C80A78](v126);
  v128 = (char *)&v133 - ((v127 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC507378((uint64_t)v104, (uint64_t)v128, &qword_1EEC83DF0);
  v129 = (uint64_t)v104;
  v130 = v154;
  sub_1AC507378((uint64_t)v122, v154, &qword_1EEC83D10);
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E00);
  sub_1AC507378((uint64_t)v125, v130 + *(int *)(v131 + 48), &qword_1EEC83DD8);
  sub_1AC507378((uint64_t)v128, v130 + *(int *)(v131 + 64), &qword_1EEC83DF0);
  sub_1AC5073BC(v129, &qword_1EEC83DF0);
  sub_1AC5073BC((uint64_t)v94, &qword_1EEC83DD8);
  sub_1AC5073BC(v123, &qword_1EEC83D10);
  sub_1AC5073BC((uint64_t)v128, &qword_1EEC83DF0);
  sub_1AC5073BC((uint64_t)v125, &qword_1EEC83DD8);
  return sub_1AC5073BC((uint64_t)v122, &qword_1EEC83D10);
}

uint64_t sub_1AC50C0BC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  char v54;
  __int128 v55;

  v36 = type metadata accessor for AVInfoTabMetadataStripView(0);
  v4 = MEMORY[0x1E0C80A78](v36);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v33 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E38);
  v10 = *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64);
  v11 = MEMORY[0x1E0C80A78](v9);
  v35 = (uint64_t)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v33 - v12;
  v14 = a1[1];
  if (v14)
  {
    v34 = *a1;
    v15 = v14;
  }
  else
  {
    v34 = 0;
    v15 = 0xE000000000000000;
  }
  v16 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for AVInfoTabMetadata() + 32));
  v17 = v16[1];
  v38 = v6;
  v37 = a2;
  if (v17)
  {
    v18 = *v16;
    v19 = v17;
LABEL_8:
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  v19 = a1[3];
  if (v19)
  {
    v18 = a1[2];
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  v18 = 0;
  v19 = 0xE000000000000000;
LABEL_9:
  v20 = (char *)a1 + *(int *)(type metadata accessor for AVInfoTabView(0) + 28);
  v21 = *((_QWORD *)v20 + 2);
  v52 = *(_OWORD *)v20;
  v53 = v21;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B00);
  sub_1AC5DD624();
  v22 = v39;
  v23 = v40;
  v24 = v41;
  v25 = v42;
  if (qword_1EEC837A8 != -1)
    swift_once();
  sub_1AC5DD678();
  sub_1AC5DD168();
  v39 = v34;
  v40 = v15;
  v41 = v18;
  v42 = v19;
  v43 = v22;
  v44 = v23;
  v45 = v24;
  v46 = v25;
  v47 = v52;
  v48 = BYTE8(v52);
  v49 = v53;
  v50 = v54;
  v51 = v55;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E40);
  sub_1AC50F158(&qword_1EEC83E48, &qword_1EEC83E40, (uint64_t (*)(void))sub_1AC50F038, MEMORY[0x1E0CD8D78]);
  sub_1AC5DD570();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v26 = v35;
  sub_1AC5073F8((uint64_t)v13, v35, &qword_1EEC83E38);
  v27 = sub_1AC5059E4((uint64_t)a1, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for AVInfoTabMetadata);
  if (qword_1EEC83788 != -1)
    v27 = swift_once();
  *(_QWORD *)&v8[*(int *)(v36 + 20)] = qword_1EEC88A88;
  MEMORY[0x1E0C80A78](v27);
  v28 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC507378(v26, (uint64_t)v28, &qword_1EEC83E38);
  v29 = (uint64_t)v38;
  sub_1AC5059E4((uint64_t)v8, (uint64_t)v38, type metadata accessor for AVInfoTabMetadataStripView);
  v30 = v37;
  sub_1AC507378((uint64_t)v28, v37, &qword_1EEC83E38);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E58);
  sub_1AC5059E4(v29, v30 + *(int *)(v31 + 48), type metadata accessor for AVInfoTabMetadataStripView);
  sub_1AC5055D0((uint64_t)v8, type metadata accessor for AVInfoTabMetadataStripView);
  sub_1AC5073BC(v26, &qword_1EEC83E38);
  sub_1AC5055D0(v29, type metadata accessor for AVInfoTabMetadataStripView);
  return sub_1AC5073BC((uint64_t)v28, &qword_1EEC83E38);
}

__n128 sub_1AC50C4E0@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  _OWORD *v24;
  __n128 result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1AC5DD78C();
    v23 = (void *)sub_1AC5DD3FC();
    sub_1AC5DD0F0();

  }
  sub_1AC5DD1EC();
  sub_1AC507378(v13, a9, &qword_1EEC83DE0);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83DD8) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *v24 = v26;
  v24[1] = v27;
  result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

__n128 sub_1AC50C69C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t *v19;
  void *v28;
  uint64_t v29;
  _OWORD *v30;
  __n128 result;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __n128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v19 = a16;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1AC5DD78C();
    v28 = (void *)sub_1AC5DD3FC();
    sub_1AC5DD0F0();

    v19 = a16;
  }
  sub_1AC5DD1EC();
  v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(a9, v17, v29);
  v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *v30 = v32;
  v30[1] = v33;
  result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

id sub_1AC50C87C@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_1AC50C888@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_1AC5DD2F4();
  *(_QWORD *)(a2 + 8) = 0x402C000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E60);
  return sub_1AC50C8E4(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_1AC50C8E4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t (**v22)(uint64_t);
  uint64_t v23;
  uint64_t v25;

  v4 = type metadata accessor for AVInfoTabView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E68);
  v8 = *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64);
  v9 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v25 - v11;
  *(_QWORD *)v12 = sub_1AC5DD2F4();
  *((_QWORD *)v12 + 1) = 0x4018000000000000;
  v12[16] = 0;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E70);
  sub_1AC50CB58(a1, (uint64_t)&v12[*(int *)(v13 + 44)]);
  sub_1AC5073F8((uint64_t)v12, (uint64_t)v10, &qword_1EEC83E68);
  v14 = type metadata accessor for AVInfoTabViewConfiguration(0);
  v15 = *(uint64_t *)((char *)a1 + *(int *)(v14 + 20));
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_1AC5DD864();
    v14 = swift_bridgeObjectRelease();
    if (v19 >= 1)
      goto LABEL_3;
LABEL_5:
    v18 = 0;
    v17 = 0;
    goto LABEL_6;
  }
  if (*(uint64_t *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10) < 1)
    goto LABEL_5;
LABEL_3:
  sub_1AC5059E4((uint64_t)a1, (uint64_t)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVInfoTabView);
  v16 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v17 = swift_allocObject();
  v14 = sub_1AC50E794((uint64_t)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  v18 = sub_1AC50F0A0;
LABEL_6:
  MEMORY[0x1E0C80A78](v14);
  v20 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC507378((uint64_t)v10, (uint64_t)v20, &qword_1EEC83E68);
  sub_1AC507378((uint64_t)v20, a2, &qword_1EEC83E68);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E78);
  v22 = (uint64_t (**)(uint64_t))(a2 + *(int *)(v21 + 48));
  *v22 = v18;
  v22[1] = (uint64_t (*)(uint64_t))v17;
  v23 = a2 + *(int *)(v21 + 64);
  *(_QWORD *)v23 = 0;
  *(_BYTE *)(v23 + 8) = 1;
  sub_1AC50F07C((uint64_t)v18);
  sub_1AC5073BC((uint64_t)v10, &qword_1EEC83E68);
  sub_1AC50F08C((uint64_t)v18);
  return sub_1AC5073BC((uint64_t)v20, &qword_1EEC83E68);
}

uint64_t sub_1AC50CB58@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v4 = type metadata accessor for AVInfoTabMetadataStripView(0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v31 - v8;
  if (a1[1])
  {
    v10 = *a1;
    v11 = a1[1];
  }
  else
  {
    v10 = 0;
    v11 = 0xE000000000000000;
  }
  v12 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for AVInfoTabMetadata() + 32));
  v13 = v12[1];
  v40 = v9;
  v41 = v7;
  v38 = v10;
  v39 = v4;
  if (v13)
  {
    v32 = *v12;
    v33 = v13;
LABEL_8:
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  v14 = a1[3];
  if (v14)
  {
    v32 = a1[2];
    v33 = v14;
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  v32 = 0;
  v33 = 0xE000000000000000;
LABEL_9:
  v15 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for AVInfoTabView(0) + 32));
  v16 = *v15;
  v17 = v15[1];
  v18 = v15[2];
  v42 = *v15;
  v43 = v17;
  v44 = v18;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83B00);
  sub_1AC5DD624();
  v19 = v46;
  v37 = v45;
  v20 = v47;
  v21 = v48;
  sub_1AC5DD174();
  if (*(unint64_t *)((char *)a1 + *(int *)(type metadata accessor for AVInfoTabViewConfiguration(0) + 20)) >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1AC5DD864();
    swift_bridgeObjectRelease();
  }
  if (qword_1EEC83780 != -1)
    swift_once();
  v45 = v16;
  v46 = v17;
  v47 = v18;
  sub_1AC5DD60C();
  sub_1AC5DD678();
  sub_1AC5DD168();
  v36 = v45;
  v35 = v46;
  v22 = v47;
  v34 = v48;
  v23 = v49;
  v24 = v50;
  v25 = (uint64_t)v40;
  sub_1AC5059E4((uint64_t)a1, (uint64_t)v40, (uint64_t (*)(_QWORD))type metadata accessor for AVInfoTabMetadata);
  *(_QWORD *)(v25 + *(int *)(v39 + 20)) = 99;
  v26 = (uint64_t)v41;
  sub_1AC5059E4(v25, (uint64_t)v41, type metadata accessor for AVInfoTabMetadataStripView);
  v27 = v37;
  *(_QWORD *)a2 = v38;
  *(_QWORD *)(a2 + 8) = v11;
  v28 = v33;
  *(_QWORD *)(a2 + 16) = v32;
  *(_QWORD *)(a2 + 24) = v28;
  *(_QWORD *)(a2 + 32) = v27;
  *(_QWORD *)(a2 + 40) = v19;
  *(_QWORD *)(a2 + 48) = v20;
  *(_QWORD *)(a2 + 56) = v21;
  *(_QWORD *)(a2 + 64) = v36;
  *(_BYTE *)(a2 + 72) = v35;
  *(_QWORD *)(a2 + 80) = v22;
  *(_BYTE *)(a2 + 88) = v34;
  *(_QWORD *)(a2 + 96) = v23;
  *(_QWORD *)(a2 + 104) = v24;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E98);
  sub_1AC5059E4(v26, a2 + *(int *)(v29 + 48), type metadata accessor for AVInfoTabMetadataStripView);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AC5055D0(v25, type metadata accessor for AVInfoTabMetadataStripView);
  sub_1AC5055D0(v26, type metadata accessor for AVInfoTabMetadataStripView);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AC50CF28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  *(_QWORD *)a3 = sub_1AC5DD2AC();
  *(_QWORD *)(a3 + 8) = 0x4024000000000000;
  *(_BYTE *)(a3 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E80);
  v12[1] = *(_QWORD *)(a2 + *(int *)(type metadata accessor for AVInfoTabViewConfiguration(0) + 20));
  swift_getKeyPath();
  v6 = sub_1AC5DD18C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83E88);
  sub_1AC50EF94();
  sub_1AC50F158(&qword_1EEC83E90, &qword_1EEC83E88, (uint64_t (*)(void))sub_1AC50EFE0, MEMORY[0x1E0CD8D78]);
  return sub_1AC5DD654();
}

double sub_1AC50D0CC@<D0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  double result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  __int128 v9;

  v3 = *a1;
  sub_1AC5DD174();
  sub_1AC5DD678();
  sub_1AC5DD168();
  *(_QWORD *)a2 = v3;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v7;
  *(_BYTE *)(a2 + 32) = v8;
  result = *(double *)&v9;
  *(_OWORD *)(a2 + 40) = v9;
  return result;
}

uint64_t sub_1AC50D16C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _BYTE *v33;
  void (*v34)(_BYTE *, uint64_t);
  unint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  int v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  _BYTE *v65;
  char v66;
  _QWORD *v67;
  uint64_t v68;
  _BYTE *v69;
  char v70;
  void (*v71)(_BYTE *, uint64_t);
  unint64_t v72;
  _BYTE *v73;
  uint64_t v74;
  _BYTE *v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  uint64_t v79;
  uint64_t *v80;
  unsigned int (*v81)(uint64_t, uint64_t, uint64_t);
  uint64_t v82;
  _BYTE *v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  _BYTE *v87;
  void (*v88)(_BYTE *, uint64_t);
  _QWORD *v89;
  uint64_t v90;
  _BYTE *v91;
  void (*v92)(_BYTE *, uint64_t);
  _BYTE v94[12];
  int v95;
  _BYTE *v96;
  _BYTE *v97;
  _BYTE *v98;
  _BYTE *v99;
  _BYTE *v100;
  _BYTE *v101;
  unsigned int v102;
  _QWORD *v103;
  _BYTE *v104;
  uint64_t v105;
  uint64_t v106;
  _BYTE *v107;
  _BYTE *v108;
  uint64_t (*v109)(uint64_t, uint64_t, uint64_t);
  _BYTE *v110;
  _BYTE *v111;

  v1 = type metadata accessor for AVInfoTabView(0);
  v2 = MEMORY[0x1E0C80A78](v1);
  v101 = &v94[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = MEMORY[0x1E0C80A78](v2);
  v111 = &v94[-v5];
  MEMORY[0x1E0C80A78](v4);
  v7 = &v94[-v6];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
  v9 = *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64);
  MEMORY[0x1E0C80A78](v8);
  v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = &v94[-v10];
  v110 = (_BYTE *)v1;
  v104 = (_BYTE *)v0;
  v12 = sub_1AC50FE10((uint64_t)&v94[-v10]);
  MEMORY[0x1E0C80A78](v12);
  v13 = &v94[-v10];
  v14 = *MEMORY[0x1E0CDC168];
  v15 = sub_1AC5DD378();
  v16 = *(_QWORD **)(v15 - 8);
  v17 = (_BYTE *)v16[13];
  v102 = v14;
  v107 = v17;
  ((void (*)(_BYTE *, uint64_t, uint64_t))v17)(&v94[-v10], v14, v15);
  v108 = (_BYTE *)v16[7];
  ((void (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v108)(&v94[-v10], 0, 1, v15);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83EA0);
  v19 = MEMORY[0x1E0C80A78](v18);
  v105 = v20;
  v106 = v19;
  v21 = &v94[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = (uint64_t)&v21[*(int *)(v19 + 48)];
  sub_1AC507378((uint64_t)&v94[-v10], (uint64_t)v21, &qword_1EEC83140);
  sub_1AC507378((uint64_t)&v94[-v10], v22, &qword_1EEC83140);
  v103 = v16;
  v23 = (_BYTE *)v16[6];
  v24 = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v23)(v21, 1, v15);
  v109 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v23;
  if ((_DWORD)v24 == 1)
  {
    sub_1AC5073BC((uint64_t)&v94[-v10], &qword_1EEC83140);
    sub_1AC5073BC((uint64_t)&v94[-v10], &qword_1EEC83140);
    v25 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v23)(v22, 1, v15);
    v26 = (uint64_t)v111;
    if (v25 == 1)
    {
      sub_1AC5073BC((uint64_t)v21, &qword_1EEC83140);
      v27 = sub_1AC5059E4((uint64_t)v104, (uint64_t)v7, type metadata accessor for AVInfoTabView);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v100 = v94;
  MEMORY[0x1E0C80A78](v24);
  v28 = &v94[-v10];
  sub_1AC507378((uint64_t)v21, (uint64_t)&v94[-v10], &qword_1EEC83140);
  v29 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v23)(v22, 1, v15);
  if ((_DWORD)v29 == 1)
  {
    sub_1AC5073BC((uint64_t)&v94[-v10], &qword_1EEC83140);
    sub_1AC5073BC((uint64_t)&v94[-v10], &qword_1EEC83140);
    ((void (*)(_BYTE *, uint64_t))v103[1])(&v94[-v10], v15);
    v26 = (uint64_t)v111;
LABEL_6:
    sub_1AC5073BC((uint64_t)v21, &qword_1EEC83EA0);
    v30 = (uint64_t)v104;
    sub_1AC5059E4((uint64_t)v104, (uint64_t)v7, type metadata accessor for AVInfoTabView);
LABEL_11:
    sub_1AC5055D0((uint64_t)v7, type metadata accessor for AVInfoTabView);
LABEL_15:
    v48 = sub_1AC5059E4(v30, v26, type metadata accessor for AVInfoTabView);
    goto LABEL_16;
  }
  v99 = v94;
  v31 = v103;
  MEMORY[0x1E0C80A78](v29);
  v33 = &v94[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  ((void (*)(_BYTE *, uint64_t, uint64_t))v31[4])(v33, v22, v15);
  sub_1AC4FB5B0(&qword_1EEC83EA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC178], MEMORY[0x1E0CDC198]);
  LODWORD(v98) = sub_1AC5DD6E4();
  v34 = (void (*)(_BYTE *, uint64_t))v31[1];
  v34(v33, v15);
  sub_1AC5073BC((uint64_t)v13, &qword_1EEC83140);
  sub_1AC5073BC((uint64_t)v11, &qword_1EEC83140);
  v34(v28, v15);
  v26 = (uint64_t)v111;
  sub_1AC5073BC((uint64_t)v21, &qword_1EEC83140);
  v30 = (uint64_t)v104;
  v27 = sub_1AC5059E4((uint64_t)v104, (uint64_t)v7, type metadata accessor for AVInfoTabView);
  if ((v98 & 1) == 0)
    goto LABEL_11;
LABEL_8:
  v100 = v94;
  MEMORY[0x1E0C80A78](v27);
  v35 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v36 = &v94[-v35];
  v37 = sub_1AC50FE10((uint64_t)&v94[-v35]);
  v99 = v94;
  MEMORY[0x1E0C80A78](v37);
  v38 = &v94[-v35];
  ((void (*)(_BYTE *, _QWORD, uint64_t))v107)(&v94[-v35], *MEMORY[0x1E0CDC150], v15);
  v39 = ((uint64_t (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v108)(&v94[-v35], 0, 1, v15);
  v98 = v94;
  MEMORY[0x1E0C80A78](v39);
  v41 = &v94[-((v40 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v42 = (uint64_t)&v41[*(int *)(v106 + 48)];
  sub_1AC507378((uint64_t)&v94[-v35], (uint64_t)v41, &qword_1EEC83140);
  sub_1AC507378((uint64_t)&v94[-v35], v42, &qword_1EEC83140);
  v43 = v109;
  v44 = v109((uint64_t)v41, 1, v15);
  if ((_DWORD)v44 == 1)
  {
    sub_1AC5073BC((uint64_t)&v94[-v35], &qword_1EEC83140);
    sub_1AC5073BC((uint64_t)&v94[-v35], &qword_1EEC83140);
    sub_1AC5055D0((uint64_t)v7, type metadata accessor for AVInfoTabView);
    v45 = v43(v42, 1, v15);
    v26 = (uint64_t)v111;
    if (v45 == 1)
    {
      sub_1AC5073BC((uint64_t)v41, &qword_1EEC83140);
      sub_1AC5059E4((uint64_t)v104, v26, type metadata accessor for AVInfoTabView);
LABEL_31:
      sub_1AC5055D0(v26, type metadata accessor for AVInfoTabView);
      v66 = 1;
      return v66 & 1;
    }
    goto LABEL_14;
  }
  MEMORY[0x1E0C80A78](v44);
  v46 = &v94[-v35];
  sub_1AC507378((uint64_t)v41, (uint64_t)v46, &qword_1EEC83140);
  v47 = v43(v42, 1, v15);
  if ((_DWORD)v47 == 1)
  {
    sub_1AC5073BC((uint64_t)v38, &qword_1EEC83140);
    sub_1AC5073BC((uint64_t)v36, &qword_1EEC83140);
    sub_1AC5055D0((uint64_t)v7, type metadata accessor for AVInfoTabView);
    ((void (*)(_BYTE *, uint64_t))v103[1])(v46, v15);
    v26 = (uint64_t)v111;
LABEL_14:
    sub_1AC5073BC((uint64_t)v41, &qword_1EEC83EA0);
    v30 = (uint64_t)v104;
    goto LABEL_15;
  }
  v97 = v94;
  v85 = v103;
  MEMORY[0x1E0C80A78](v47);
  v96 = v94;
  v87 = &v94[-((v86 + 15) & 0xFFFFFFFFFFFFFFF0)];
  ((void (*)(_BYTE *, uint64_t, uint64_t))v85[4])(v87, v42, v15);
  sub_1AC4FB5B0(&qword_1EEC83EA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC178], MEMORY[0x1E0CDC198]);
  v95 = sub_1AC5DD6E4();
  v26 = (uint64_t)v111;
  v88 = (void (*)(_BYTE *, uint64_t))v85[1];
  v88(v87, v15);
  sub_1AC5073BC((uint64_t)v38, &qword_1EEC83140);
  sub_1AC5073BC((uint64_t)v36, &qword_1EEC83140);
  sub_1AC5055D0((uint64_t)v7, type metadata accessor for AVInfoTabView);
  v88(v46, v15);
  sub_1AC5073BC((uint64_t)v41, &qword_1EEC83140);
  v48 = sub_1AC5059E4((uint64_t)v104, v26, type metadata accessor for AVInfoTabView);
  if ((v95 & 1) != 0)
    goto LABEL_31;
LABEL_16:
  v104 = v94;
  MEMORY[0x1E0C80A78](v48);
  v49 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v50 = &v94[-v49];
  v51 = v26;
  v52 = sub_1AC50FE10((uint64_t)&v94[-v49]);
  v100 = v94;
  MEMORY[0x1E0C80A78](v52);
  v53 = &v94[-v49];
  ((void (*)(_BYTE *, _QWORD, uint64_t))v107)(&v94[-v49], v102, v15);
  v54 = ((uint64_t (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v108)(&v94[-v49], 0, 1, v15);
  v99 = v94;
  MEMORY[0x1E0C80A78](v54);
  v56 = &v94[-((v55 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v57 = (uint64_t)&v56[*(int *)(v106 + 48)];
  sub_1AC507378((uint64_t)&v94[-v49], (uint64_t)v56, &qword_1EEC83140);
  sub_1AC507378((uint64_t)&v94[-v49], v57, &qword_1EEC83140);
  v58 = v109;
  v59 = v109((uint64_t)v56, 1, v15);
  if ((_DWORD)v59 != 1)
  {
    v98 = v94;
    MEMORY[0x1E0C80A78](v59);
    v63 = &v94[-v49];
    sub_1AC507378((uint64_t)v56, (uint64_t)&v94[-v49], &qword_1EEC83140);
    v64 = v58(v57, 1, v15);
    if ((_DWORD)v64 != 1)
    {
      v97 = v94;
      v67 = v103;
      MEMORY[0x1E0C80A78](v64);
      v69 = &v94[-((v68 + 15) & 0xFFFFFFFFFFFFFFF0)];
      ((void (*)(_BYTE *, uint64_t, uint64_t))v67[4])(v69, v57, v15);
      sub_1AC4FB5B0(&qword_1EEC83EA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC178], MEMORY[0x1E0CDC198]);
      v70 = sub_1AC5DD6E4();
      v71 = (void (*)(_BYTE *, uint64_t))v67[1];
      v71(v69, v15);
      sub_1AC5073BC((uint64_t)v53, &qword_1EEC83140);
      sub_1AC5073BC((uint64_t)v50, &qword_1EEC83140);
      v71(v63, v15);
      v61 = (uint64_t)v111;
      sub_1AC5073BC((uint64_t)v56, &qword_1EEC83140);
      v65 = v101;
      v62 = sub_1AC5059E4(v61, (uint64_t)v101, type metadata accessor for AVInfoTabView);
      if ((v70 & 1) != 0)
        goto LABEL_24;
LABEL_22:
      sub_1AC5055D0((uint64_t)v65, type metadata accessor for AVInfoTabView);
      sub_1AC5055D0(v61, type metadata accessor for AVInfoTabView);
      v66 = 0;
      return v66 & 1;
    }
    sub_1AC5073BC((uint64_t)&v94[-v49], &qword_1EEC83140);
    sub_1AC5073BC((uint64_t)&v94[-v49], &qword_1EEC83140);
    ((void (*)(_BYTE *, uint64_t))v103[1])(&v94[-v49], v15);
    v61 = v51;
LABEL_21:
    sub_1AC5073BC((uint64_t)v56, &qword_1EEC83EA0);
    v65 = v101;
    sub_1AC5059E4(v61, (uint64_t)v101, type metadata accessor for AVInfoTabView);
    goto LABEL_22;
  }
  sub_1AC5073BC((uint64_t)&v94[-v49], &qword_1EEC83140);
  sub_1AC5073BC((uint64_t)&v94[-v49], &qword_1EEC83140);
  v60 = v58(v57, 1, v15);
  v61 = v51;
  if (v60 != 1)
    goto LABEL_21;
  sub_1AC5073BC((uint64_t)v56, &qword_1EEC83140);
  v62 = sub_1AC5059E4(v51, (uint64_t)v101, type metadata accessor for AVInfoTabView);
LABEL_24:
  v104 = v94;
  MEMORY[0x1E0C80A78](v62);
  v72 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v73 = &v94[-v72];
  v74 = sub_1AC50FE10((uint64_t)&v94[-v72]);
  v110 = v94;
  MEMORY[0x1E0C80A78](v74);
  v75 = &v94[-v72];
  ((void (*)(_BYTE *, _QWORD, uint64_t))v107)(&v94[-v72], v102, v15);
  v76 = ((uint64_t (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v108)(&v94[-v72], 0, 1, v15);
  v108 = v94;
  MEMORY[0x1E0C80A78](v76);
  v78 = &v94[-((v77 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v79 = (uint64_t)&v78[*(int *)(v106 + 48)];
  v80 = &qword_1EEC83140;
  sub_1AC507378((uint64_t)&v94[-v72], (uint64_t)v78, &qword_1EEC83140);
  sub_1AC507378((uint64_t)&v94[-v72], v79, &qword_1EEC83140);
  v81 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v109;
  v82 = v109((uint64_t)v78, 1, v15);
  if ((_DWORD)v82 == 1)
  {
    sub_1AC5073BC((uint64_t)&v94[-v72], &qword_1EEC83140);
    sub_1AC5073BC((uint64_t)&v94[-v72], &qword_1EEC83140);
    sub_1AC5055D0((uint64_t)v101, type metadata accessor for AVInfoTabView);
    sub_1AC5055D0(v61, type metadata accessor for AVInfoTabView);
    if (v81(v79, 1, v15) == 1)
    {
      v66 = -1;
    }
    else
    {
      v80 = &qword_1EEC83EA0;
      v66 = 0;
    }
  }
  else
  {
    v107 = v94;
    MEMORY[0x1E0C80A78](v82);
    v83 = &v94[-v72];
    sub_1AC507378((uint64_t)v78, (uint64_t)&v94[-v72], &qword_1EEC83140);
    v84 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v81)(v79, 1, v15);
    if ((_DWORD)v84 == 1)
    {
      sub_1AC5073BC((uint64_t)&v94[-v72], &qword_1EEC83140);
      sub_1AC5073BC((uint64_t)&v94[-v72], &qword_1EEC83140);
      sub_1AC5055D0((uint64_t)v101, type metadata accessor for AVInfoTabView);
      sub_1AC5055D0(v61, type metadata accessor for AVInfoTabView);
      ((void (*)(_BYTE *, uint64_t))v103[1])(&v94[-v72], v15);
      v80 = &qword_1EEC83EA0;
      v66 = 0;
    }
    else
    {
      v109 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v94;
      v89 = v103;
      MEMORY[0x1E0C80A78](v84);
      v91 = &v94[-((v90 + 15) & 0xFFFFFFFFFFFFFFF0)];
      ((void (*)(_BYTE *, uint64_t, uint64_t))v89[4])(v91, v79, v15);
      sub_1AC4FB5B0(&qword_1EEC83EA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC178], MEMORY[0x1E0CDC198]);
      v66 = sub_1AC5DD6E4();
      v92 = (void (*)(_BYTE *, uint64_t))v89[1];
      v92(v91, v15);
      v80 = &qword_1EEC83140;
      sub_1AC5073BC((uint64_t)v75, &qword_1EEC83140);
      sub_1AC5073BC((uint64_t)v73, &qword_1EEC83140);
      sub_1AC5055D0((uint64_t)v101, type metadata accessor for AVInfoTabView);
      sub_1AC5055D0(v61, type metadata accessor for AVInfoTabView);
      v92(v83, v15);
    }
  }
  sub_1AC5073BC((uint64_t)v78, v80);
  return v66 & 1;
}

uint64_t sub_1AC50E010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void (*v12)(_BYTE *, _QWORD, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  char v22;
  _QWORD *v23;
  uint64_t v24;
  _BYTE *v25;
  void (*v26)(_BYTE *, uint64_t);
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t *v32;
  unsigned int (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _BYTE *v38;
  void (*v39)(_BYTE *, uint64_t);
  _BYTE v41[4];
  int v42;
  _BYTE *v43;
  unsigned int (*v44)(uint64_t, uint64_t, uint64_t);
  _BYTE *v45;
  void (*v46)(_BYTE *, _QWORD, uint64_t);
  uint64_t v47;
  void (*v48)(_BYTE *, _QWORD, uint64_t, uint64_t);
  _BYTE *v49;
  _BYTE *v50;
  _QWORD *v51;
  _BYTE *v52;
  _BYTE *v53;

  v1 = type metadata accessor for AVInfoTabView(0);
  MEMORY[0x1E0C80A78](v1);
  v53 = &v41[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  MEMORY[0x1E0C80A78](v3);
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = &v41[-v5];
  v50 = (_BYTE *)v1;
  v52 = (_BYTE *)v0;
  v7 = sub_1AC50FE10((uint64_t)&v41[-v5]);
  MEMORY[0x1E0C80A78](v7);
  v8 = &v41[-v5];
  v9 = *MEMORY[0x1E0CDC150];
  v10 = sub_1AC5DD378();
  v11 = *(_QWORD **)(v10 - 8);
  v12 = (void (*)(_BYTE *, _QWORD, uint64_t))v11[13];
  LODWORD(v49) = v9;
  v46 = v12;
  v12(&v41[-v5], v9, v10);
  v48 = (void (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v11[7];
  v48(&v41[-v5], 0, 1, v10);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83EA0);
  v14 = *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64);
  v47 = MEMORY[0x1E0C80A78](v13);
  v15 = &v41[*(int *)(v47 + 48) - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1AC507378((uint64_t)&v41[-v5], (uint64_t)&v41[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_1EEC83140);
  sub_1AC507378((uint64_t)&v41[-v5], (uint64_t)v15, &qword_1EEC83140);
  v51 = v11;
  v16 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v11[6];
  v17 = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v16)(&v41[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, v10);
  if ((_DWORD)v17 != 1)
  {
    v45 = v41;
    MEMORY[0x1E0C80A78](v17);
    v19 = &v41[-v5];
    sub_1AC507378((uint64_t)&v41[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t)&v41[-v5], &qword_1EEC83140);
    v20 = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v16)(v15, 1, v10);
    if ((_DWORD)v20 != 1)
    {
      v43 = v41;
      v44 = v16;
      v23 = v51;
      MEMORY[0x1E0C80A78](v20);
      v25 = &v41[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
      ((void (*)(_BYTE *, _BYTE *, uint64_t))v23[4])(v25, v15, v10);
      sub_1AC4FB5B0(&qword_1EEC83EA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC178], MEMORY[0x1E0CDC198]);
      v42 = sub_1AC5DD6E4();
      v26 = (void (*)(_BYTE *, uint64_t))v23[1];
      v26(v25, v10);
      sub_1AC5073BC((uint64_t)v8, &qword_1EEC83140);
      sub_1AC5073BC((uint64_t)v6, &qword_1EEC83140);
      v26(v19, v10);
      sub_1AC5073BC((uint64_t)&v41[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_1EEC83140);
      v21 = v53;
      v18 = sub_1AC5059E4((uint64_t)v52, (uint64_t)v53, type metadata accessor for AVInfoTabView);
      if ((v42 & 1) != 0)
        goto LABEL_9;
LABEL_7:
      sub_1AC5055D0((uint64_t)v21, type metadata accessor for AVInfoTabView);
      v22 = 0;
      return v22 & 1;
    }
    sub_1AC5073BC((uint64_t)&v41[-v5], &qword_1EEC83140);
    sub_1AC5073BC((uint64_t)&v41[-v5], &qword_1EEC83140);
    ((void (*)(_BYTE *, uint64_t))v51[1])(&v41[-v5], v10);
LABEL_6:
    sub_1AC5073BC((uint64_t)&v41[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_1EEC83EA0);
    v21 = v53;
    sub_1AC5059E4((uint64_t)v52, (uint64_t)v53, type metadata accessor for AVInfoTabView);
    goto LABEL_7;
  }
  sub_1AC5073BC((uint64_t)&v41[-v5], &qword_1EEC83140);
  sub_1AC5073BC((uint64_t)&v41[-v5], &qword_1EEC83140);
  if (v16((uint64_t)v15, 1, v10) != 1)
    goto LABEL_6;
  v44 = v16;
  sub_1AC5073BC((uint64_t)&v41[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_1EEC83140);
  v18 = sub_1AC5059E4((uint64_t)v52, (uint64_t)v53, type metadata accessor for AVInfoTabView);
LABEL_9:
  v52 = v41;
  MEMORY[0x1E0C80A78](v18);
  v27 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v28 = sub_1AC50FE10((uint64_t)&v41[-v27]);
  v50 = v41;
  MEMORY[0x1E0C80A78](v28);
  v46(&v41[-v27], v49, v10);
  v29 = ((uint64_t (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v48)(&v41[-v27], 0, 1, v10);
  v49 = v41;
  MEMORY[0x1E0C80A78](v29);
  v30 = &v41[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v31 = (uint64_t)&v30[*(int *)(v47 + 48)];
  v32 = &qword_1EEC83140;
  sub_1AC507378((uint64_t)&v41[-v27], (uint64_t)v30, &qword_1EEC83140);
  sub_1AC507378((uint64_t)&v41[-v27], v31, &qword_1EEC83140);
  v33 = v44;
  v34 = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v44)(v30, 1, v10);
  if ((_DWORD)v34 == 1)
  {
    sub_1AC5073BC((uint64_t)&v41[-v27], &qword_1EEC83140);
    sub_1AC5073BC((uint64_t)&v41[-v27], &qword_1EEC83140);
    sub_1AC5055D0((uint64_t)v53, type metadata accessor for AVInfoTabView);
    if (v33(v31, 1, v10) == 1)
    {
      v22 = -1;
    }
    else
    {
      v32 = &qword_1EEC83EA0;
      v22 = 0;
    }
  }
  else
  {
    MEMORY[0x1E0C80A78](v34);
    sub_1AC507378((uint64_t)v30, (uint64_t)&v41[-v27], &qword_1EEC83140);
    v35 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v33)(v31, 1, v10);
    if ((_DWORD)v35 == 1)
    {
      sub_1AC5073BC((uint64_t)&v41[-v27], &qword_1EEC83140);
      sub_1AC5073BC((uint64_t)&v41[-v27], &qword_1EEC83140);
      sub_1AC5055D0((uint64_t)v53, type metadata accessor for AVInfoTabView);
      ((void (*)(_BYTE *, uint64_t))v51[1])(&v41[-v27], v10);
      v32 = &qword_1EEC83EA0;
      v22 = 0;
    }
    else
    {
      v36 = v51;
      MEMORY[0x1E0C80A78](v35);
      v38 = &v41[-((v37 + 15) & 0xFFFFFFFFFFFFFFF0)];
      ((void (*)(_BYTE *, uint64_t, uint64_t))v36[4])(v38, v31, v10);
      sub_1AC4FB5B0(&qword_1EEC83EA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC178], MEMORY[0x1E0CDC198]);
      v22 = sub_1AC5DD6E4();
      v39 = (void (*)(_BYTE *, uint64_t))v36[1];
      v39(v38, v10);
      v32 = &qword_1EEC83140;
      sub_1AC5073BC((uint64_t)&v41[-v27], &qword_1EEC83140);
      sub_1AC5073BC((uint64_t)&v41[-v27], &qword_1EEC83140);
      sub_1AC5055D0((uint64_t)v53, type metadata accessor for AVInfoTabView);
      v39(&v41[-v27], v10);
    }
  }
  sub_1AC5073BC((uint64_t)v30, v32);
  return v22 & 1;
}

uint64_t sub_1AC50E6E4@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](a1);
  sub_1AC5059E4(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVInfoTabView);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  result = sub_1AC50E794((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_1AC50E7D8;
  a2[1] = (uint64_t (*)(uint64_t))v7;
  return result;
}

uint64_t sub_1AC50E794(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AVInfoTabView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AC50E7D8(uint64_t a1)
{
  return sub_1AC50EA84(a1, sub_1AC50A86C);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = type metadata accessor for AVInfoTabView(0);
  v2 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (int *)type metadata accessor for AVInfoTabMetadata();
  v4 = v2 + v3[6];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    v6 = sub_1AC5DD060();
    v7 = *(_QWORD *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6))
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = (uint64_t *)(v2 + v3[10]);
  v9 = v8[1];
  if (v9 >> 60 != 15)
    sub_1AC503B20(*v8, v9);

  type metadata accessor for AVInfoTabViewConfiguration(0);
  swift_bridgeObjectRelease();
  v10 = v2 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_1AC5DD378();
    v12 = *(_QWORD *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  v13 = v2 + *(int *)(v1 + 24);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_1AC5DD378();
    v15 = *(_QWORD *)(v14 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC50EA78(uint64_t a1)
{
  return sub_1AC50EA84(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1AC50C888);
}

uint64_t sub_1AC50EA84(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AVInfoTabView(0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

unint64_t sub_1AC50EAE0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83CB0;
  if (!qword_1EEC83CB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83CA8);
    v2[0] = sub_1AC4FC18C(&qword_1EEC83CB8, &qword_1EEC83CC0, MEMORY[0x1E0CD9310]);
    v2[1] = MEMORY[0x1E0CD9750];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83CB0);
  }
  return result;
}

unint64_t sub_1AC50EB64()
{
  unint64_t result;

  result = qword_1EEC83CC8;
  if (!qword_1EEC83CC8)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F79D8, &type metadata for AVChromelessButtonStyle);
    atomic_store(result, (unint64_t *)&qword_1EEC83CC8);
  }
  return result;
}

unint64_t sub_1AC50EBA8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83CE0;
  if (!qword_1EEC83CE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83CD8);
    v2[0] = sub_1AC4FC18C(&qword_1EEC83CE8, &qword_1EEC83CF0, MEMORY[0x1E0CD9310]);
    v2[1] = MEMORY[0x1E0CDCF98];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83CE0);
  }
  return result;
}

uint64_t sub_1AC50EC30(uint64_t a1)
{
  return sub_1AC50EA84(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1AC50AD58);
}

unint64_t sub_1AC50EC3C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83D48;
  if (!qword_1EEC83D48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83D30);
    v2[0] = sub_1AC4FB5B0(&qword_1EEC83D50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDA080], MEMORY[0x1E0CDA068]);
    v2[1] = sub_1AC4FC18C(&qword_1EEC83D58, &qword_1EEC83D38, MEMORY[0x1E0CDC6C8]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83D48);
  }
  return result;
}

unint64_t sub_1AC50ECD8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83D70;
  if (!qword_1EEC83D70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83D68);
    v2[0] = sub_1AC50F158(&qword_1EEC83D78, &qword_1EEC83D80, (uint64_t (*)(void))sub_1AC50ED7C, MEMORY[0x1E0CDB160]);
    v2[1] = sub_1AC4FB5B0(&qword_1EEC83AD0, MEMORY[0x1E0CDCFC8], MEMORY[0x1E0CDCFC0]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83D70);
  }
  return result;
}

unint64_t sub_1AC50ED7C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83D88;
  if (!qword_1EEC83D88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83D90);
    v2[0] = sub_1AC50F158(&qword_1EEC83D98, &qword_1EEC83DA0, (uint64_t (*)(void))sub_1AC50EE20, MEMORY[0x1E0CD8D78]);
    v2[1] = sub_1AC4FC18C(&qword_1EEC83DB8, &qword_1EEC83DC0, MEMORY[0x1E0CD89F8]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83D88);
  }
  return result;
}

unint64_t sub_1AC50EE20()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83DA8;
  if (!qword_1EEC83DA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83DB0);
    v2[0] = MEMORY[0x1E0CDF818];
    v2[1] = MEMORY[0x1E0CDB160];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83DA8);
  }
  return result;
}

unint64_t sub_1AC50EE84()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83DD0;
  if (!qword_1EEC83DD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83D20);
    v2[0] = sub_1AC50F158(&qword_1EEC83D40, &qword_1EEC83D28, (uint64_t (*)(void))sub_1AC50EC3C, MEMORY[0x1E0CDB160]);
    v2[1] = sub_1AC4FB5B0(&qword_1EEC83AD0, MEMORY[0x1E0CDCFC8], MEMORY[0x1E0CDCFC0]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83DD0);
  }
  return result;
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

id sub_1AC50EF34@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_identifier);
  *a2 = result;
  return result;
}

uint64_t sub_1AC50EF6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1AC5DD714();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1AC50EF94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC83E20;
  if (!qword_1EEC83E20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC831F0);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0DEAF48], v1);
    atomic_store(result, (unint64_t *)&qword_1EEC83E20);
  }
  return result;
}

unint64_t sub_1AC50EFE0()
{
  unint64_t result;

  result = qword_1EEC83E28;
  if (!qword_1EEC83E28)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F748C, &type metadata for AVInfoTabView.ActionButton);
    atomic_store(result, (unint64_t *)&qword_1EEC83E28);
  }
  return result;
}

uint64_t sub_1AC50F024(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1AC503B20(a1, a2);
  return a1;
}

unint64_t sub_1AC50F038()
{
  unint64_t result;

  result = qword_1EEC83E50;
  if (!qword_1EEC83E50)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F743C, &type metadata for AVInfoTabView.ScrollableDescriptionView);
    atomic_store(result, (unint64_t *)&qword_1EEC83E50);
  }
  return result;
}

uint64_t sub_1AC50F07C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1AC50F08C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1AC50F0A0(uint64_t a1)
{
  return sub_1AC50EA84(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1AC50CF28);
}

uint64_t sub_1AC50F0AC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1AC5DD18C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

double sub_1AC50F10C@<D0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1AC5DD18C();
  return sub_1AC50D0CC(a1, a2);
}

uint64_t sub_1AC50F158(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AC50F1C0(void *a1)
{
  objc_msgSend(a1, sel_performWithSender_target_, objc_msgSend(a1, sel_sender), 0);
  return swift_unknownObjectRelease();
}

uint64_t sub_1AC50F210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  _BYTE v16[16];
  uint64_t v17;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83EF0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83ED8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = a1;
  v17 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83EF8);
  sub_1AC5108B8();
  sub_1AC5DD5F4();
  sub_1AC4FC18C(&qword_1EEC83EE0, &qword_1EEC83ED8, MEMORY[0x1E0CDF8D0]);
  sub_1AC510864();
  sub_1AC5DD4EC();
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
  v12 = sub_1AC5DD678();
  v14 = sub_1AC50C69C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a2, 0.0, 1, 0.0, 1, v12, v13, &qword_1EEC83EF0, &qword_1EEC83EC8);
  return (*(uint64_t (**)(_BYTE *, uint64_t, __n128))(v5 + 8))(v7, v4, v14);
}

uint64_t sub_1AC50F3E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v3 = objc_msgSend(a1, sel_title);
  sub_1AC5DD714();

  sub_1AC50554C();
  result = sub_1AC5DD4C8();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  *(_QWORD *)(a2 + 24) = v7;
  return result;
}

id sub_1AC50F468@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id result;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = objc_msgSend(a1, sel_image);
  if (result)
  {
    v4 = result;
    sub_1AC5DD5AC();
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83AF8);
    MEMORY[0x1E0C80A78](v5);
    v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v8 = *MEMORY[0x1E0CDF778];
    v9 = sub_1AC5DD5D0();
    v10 = *(_QWORD *)(v9 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 104))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    v11 = sub_1AC5DD5C4();

    swift_release();
    result = (id)sub_1AC5073BC((uint64_t)v7, &qword_1EEC83AF8);
  }
  else
  {
    v11 = 0;
  }
  *a2 = v11;
  return result;
}

uint64_t sub_1AC50F590()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83EC8);
  sub_1AC51079C();
  return sub_1AC5DD630();
}

uint64_t sub_1AC50F620@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  char *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __n128 v33;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[3];

  v43 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83F08);
  MEMORY[0x1E0C80A78](v2);
  v42 = (uint64_t)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83F10);
  v40 = *(_QWORD *)(v4 - 8);
  v41 = v4;
  MEMORY[0x1E0C80A78](v4);
  v38 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83F18);
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83F20);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v1;
  v44 = v1;
  sub_1AC5DD420();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83F28);
  sub_1AC51091C();
  sub_1AC5DD120();
  v13 = sub_1AC5DD348();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC5DD33C();
  v17 = sub_1AC5DD420();
  sub_1AC5DD414();
  sub_1AC5DD414();
  if (sub_1AC5DD414() != v17)
    sub_1AC5DD414();
  v18 = sub_1AC4FC18C(&qword_1EEC83F60, &qword_1EEC83F20, MEMORY[0x1E0CD8560]);
  sub_1AC5DD564();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = sub_1AC5DD3F0();
  v35[1] = v35;
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v22 = (char *)v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC5DD33C();
  v23 = sub_1AC5DD420();
  v24 = sub_1AC5DD408();
  sub_1AC5DD414();
  sub_1AC5DD414();
  if (sub_1AC5DD414() != v23)
    sub_1AC5DD414();
  sub_1AC5DD414();
  if (sub_1AC5DD414() != v24)
    sub_1AC5DD414();
  *(_QWORD *)&v45 = v9;
  *((_QWORD *)&v45 + 1) = v18;
  swift_getOpaqueTypeConformance2();
  v26 = v37;
  v25 = v38;
  sub_1AC5DD534();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v26);
  v27 = *(_OWORD *)(v39 + 48);
  v45 = *(_OWORD *)(v39 + 32);
  v46 = v27;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83F68);
  MEMORY[0x1AF43DB6C](v47, v28);
  v29 = *(double *)&v47[1];
  v30 = sub_1AC5DD678();
  v31 = v42;
  v33 = sub_1AC50C69C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v42, 0.0, 1, v29, 0, v30, v32, &qword_1EEC83F10, &qword_1EEC83F08);
  (*(void (**)(char *, uint64_t, __n128))(v40 + 8))(v25, v41, v33);
  return sub_1AC5073F8(v31, v43, &qword_1EEC83F08);
}

uint64_t sub_1AC50FA38@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  __int128 v28;
  __int128 v29;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  char v34;
  char v35;

  v4 = *a1;
  v32 = a1[1];
  v33 = v4;
  sub_1AC510A70((uint64_t)&v33);
  sub_1AC510A70((uint64_t)&v32);
  sub_1AC50554C();
  v31 = sub_1AC5DD4C8();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = sub_1AC5DD4C8();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = sub_1AC5DD42C();
  sub_1AC5DD114();
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = (_OWORD *)swift_allocObject();
  v28 = a1[1];
  v27[1] = *a1;
  v27[2] = v28;
  v29 = a1[3];
  v27[3] = a1[2];
  v27[4] = v29;
  v35 = v15 & 1;
  v34 = 0;
  *(_QWORD *)a2 = v31;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v8 & 1;
  *(_QWORD *)(a2 + 24) = v10;
  *(_QWORD *)(a2 + 32) = v11;
  *(_QWORD *)(a2 + 40) = v13;
  *(_BYTE *)(a2 + 48) = v15 & 1;
  *(_QWORD *)(a2 + 56) = v17;
  *(_BYTE *)(a2 + 64) = v18;
  *(_QWORD *)(a2 + 72) = v20;
  *(_QWORD *)(a2 + 80) = v22;
  *(_QWORD *)(a2 + 88) = v24;
  *(_QWORD *)(a2 + 96) = v26;
  *(_BYTE *)(a2 + 104) = 0;
  *(_QWORD *)(a2 + 112) = sub_1AC510AD4;
  *(_QWORD *)(a2 + 120) = v27;
  return sub_1AC510ADC((uint64_t)a1);
}

uint64_t sub_1AC50FBA0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83F68);
  return sub_1AC5DD648();
}

uint64_t sub_1AC50FBEC@<X0>(uint64_t a1@<X8>)
{
  return sub_1AC50F620(a1);
}

uint64_t sub_1AC50FC24@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  void (*v11)(char *, char *, uint64_t);
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  void (*v15)(char *, uint64_t);
  char *v17;
  _QWORD *v18;

  v17 = a1;
  v1 = sub_1AC5DD390();
  v18 = *(_QWORD **)(v1 - 8);
  v2 = v18[8];
  MEMORY[0x1E0C80A78](v1);
  sub_1AC5DD39C();
  v3 = sub_1AC5DD3A8();
  v4 = *(_QWORD **)(v3 - 8);
  v5 = v4[8];
  MEMORY[0x1E0C80A78](v3);
  v6 = sub_1AC5DD3B4();
  MEMORY[0x1E0C80A78](v6);
  v7 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(char *, char *, uint64_t))v18[2];
  v9 = v8(v7, v7, v1);
  MEMORY[0x1E0C80A78](v9);
  v10 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void (*)(char *, char *, uint64_t))v4[2];
  v11(v10, v10, v3);
  v12 = v17;
  v8(v17, v7, v1);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83F90);
  v11(&v12[*(int *)(v13 + 48)], v10, v3);
  v14 = (void (*)(char *, uint64_t))v4[1];
  v14(v10, v3);
  v15 = (void (*)(char *, uint64_t))v18[1];
  v15(v7, v1);
  v14(v10, v3);
  return ((uint64_t (*)(char *, uint64_t))v15)(v7, v1);
}

uint64_t sub_1AC50FDC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = sub_1AC5DD2AC();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83F88);
  return sub_1AC50FC24((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_1AC50FE10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC507378(v2, (uint64_t)v6, &qword_1EEC831E0);
  if (swift_getEnumCaseMultiPayload() == 1)
    return sub_1AC5073F8((uint64_t)v6, a1, &qword_1EEC83140);
  v8 = sub_1AC5DD78C();
  v9 = sub_1AC5DD3FC();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v17 = v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_1AC51000C(0xD000000000000020, 0x80000001AC5F9980, &v17);
    _os_log_impl(&dword_1AC4B1000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF43ECE8](v11, -1, -1);
    MEMORY[0x1AF43ECE8](v10, -1, -1);
  }

  v12 = sub_1AC5DD2A0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v16 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC5DD294();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

unint64_t sub_1AC51000C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1AC5100DC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1AC5101F8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1AC5101F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_1AC5100DC(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1AC510234(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_1AC5DD81C();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1AC5101F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1AC510234(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1AC5102C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1AC5103C4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1AC5103C4((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1AC5102C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1AC510360(v2, 0);
      result = sub_1AC5DD804();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_1AC5DD72C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1AC510360(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83EB0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1AC5103C4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83EB0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

ValueMetadata *type metadata accessor for AVInfoTabView.ActionButton()
{
  return &type metadata for AVInfoTabView.ActionButton;
}

uint64_t destroy for AVInfoTabView.ScrollableDescriptionView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AVInfoTabView.ScrollableDescriptionView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AVInfoTabView.ScrollableDescriptionView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

uint64_t assignWithTake for AVInfoTabView.ScrollableDescriptionView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVInfoTabView.ScrollableDescriptionView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AVInfoTabView.ScrollableDescriptionView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AVInfoTabView.ScrollableDescriptionView()
{
  return &type metadata for AVInfoTabView.ScrollableDescriptionView;
}

uint64_t sub_1AC51071C()
{
  return sub_1AC4FC18C(&qword_1EEC83EB8, &qword_1EEC83EC0, MEMORY[0x1E0CD9310]);
}

uint64_t sub_1AC510748()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC510758()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC510768()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1AC51078C()
{
  uint64_t v0;

  return sub_1AC50F1C0(*(void **)(v0 + 16));
}

uint64_t sub_1AC510794@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC50F210(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_1AC51079C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_1EEC83ED0;
  if (!qword_1EEC83ED0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83EC8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83ED8);
    v2[3] = &type metadata for AVCenteredLabelStyle;
    v2[4] = sub_1AC4FC18C(&qword_1EEC83EE0, &qword_1EEC83ED8, MEMORY[0x1E0CDF8D0]);
    v2[5] = sub_1AC510864();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x1E0CDA220];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83ED0);
  }
  return result;
}

unint64_t sub_1AC510864()
{
  unint64_t result;

  result = qword_1EEC83EE8;
  if (!qword_1EEC83EE8)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F74F8, &type metadata for AVCenteredLabelStyle);
    atomic_store(result, (unint64_t *)&qword_1EEC83EE8);
  }
  return result;
}

uint64_t sub_1AC5108A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC50F3E8(*(void **)(v1 + 16), a1);
}

id sub_1AC5108B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1AC50F468(*(void **)(v1 + 16), a1);
}

unint64_t sub_1AC5108B8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EEC83F00;
  if (!qword_1EEC83F00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83EF8);
    v2 = MEMORY[0x1E0CDF818];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CE07A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83F00);
  }
  return result;
}

uint64_t sub_1AC510914@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC50FA38(*(__int128 **)(v1 + 16), a1);
}

unint64_t sub_1AC51091C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83F30;
  if (!qword_1EEC83F30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83F28);
    v2[0] = sub_1AC5109A0();
    v2[1] = sub_1AC4FC18C(&qword_1EEC83B98, &qword_1EEC83BA0, MEMORY[0x1E0CDC948]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83F30);
  }
  return result;
}

unint64_t sub_1AC5109A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC83F38;
  if (!qword_1EEC83F38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83F40);
    v2[0] = sub_1AC50F158(&qword_1EEC83F48, &qword_1EEC83F50, (uint64_t (*)(void))sub_1AC510A2C, MEMORY[0x1E0CD9750]);
    v2[1] = sub_1AC5071F0();
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC83F38);
  }
  return result;
}

unint64_t sub_1AC510A2C()
{
  unint64_t result;

  result = qword_1EEC83F58;
  if (!qword_1EEC83F58)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F6D38, &type metadata for AVInfoDescriptionView);
    atomic_store(result, (unint64_t *)&qword_1EEC83F58);
  }
  return result;
}

uint64_t sub_1AC510A70(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1AC510A98()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC510AD4()
{
  return sub_1AC50FBA0();
}

uint64_t sub_1AC510ADC(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

ValueMetadata *type metadata accessor for AVCenteredLabelStyle()
{
  return &type metadata for AVCenteredLabelStyle;
}

uint64_t sub_1AC510B3C()
{
  return sub_1AC4FC18C(&qword_1EEC83F70, &qword_1EEC83F78, MEMORY[0x1E0CDFA50]);
}

unint64_t sub_1AC510B6C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];

  result = qword_1EEC83F80;
  if (!qword_1EEC83F80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83F08);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83F18);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83F20);
    sub_1AC4FC18C(&qword_1EEC83F60, &qword_1EEC83F20, MEMORY[0x1E0CD8560]);
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = MEMORY[0x1E0CDA220];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEC83F80);
  }
  return result;
}

uint64_t sub_1AC510C48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC510C58()
{
  return sub_1AC4FC18C(&qword_1EEC83F98, &qword_1EEC83FA0, MEMORY[0x1E0CDFB08]);
}

_QWORD *sub_1AC510C84(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD *v52;
  _OWORD *v53;
  uint64_t v54;
  id v55;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v16 = sub_1AC5DD060();
      v17 = *(_QWORD *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v11, 1, v16))
      {
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v10, v11, v16);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v10, 0, 1, v16);
      }
      v19 = *(int *)(v12 + 48);
      v20 = &v10[v19];
      v21 = &v11[v19];
      v22 = *((_QWORD *)v21 + 1);
      *(_QWORD *)v20 = *(_QWORD *)v21;
      *((_QWORD *)v20 + 1) = v22;
      v23 = *(int *)(v12 + 64);
      v24 = &v10[v23];
      v25 = &v11[v23];
      v26 = *((_QWORD *)v25 + 1);
      *(_QWORD *)v24 = *(_QWORD *)v25;
      *((_QWORD *)v24 + 1) = v26;
      v27 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v27(v10, 0, 1, v12);
    }
    v28 = a3[7];
    v29 = a3[8];
    v30 = (_QWORD *)((char *)a1 + v28);
    v31 = (_QWORD *)((char *)a2 + v28);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = (_QWORD *)((char *)a1 + v29);
    v34 = (_QWORD *)((char *)a2 + v29);
    v35 = v34[1];
    *v33 = *v34;
    v33[1] = v35;
    v36 = a3[9];
    v37 = a3[10];
    v38 = (_QWORD *)((char *)a1 + v36);
    v39 = (_QWORD *)((char *)a2 + v36);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    v41 = (char *)a1 + v37;
    v42 = (_QWORD *)((char *)a2 + v37);
    v43 = *(_QWORD *)((char *)a2 + v37 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v43 >> 60 == 15)
    {
      *(_OWORD *)v41 = *(_OWORD *)v42;
    }
    else
    {
      v44 = *v42;
      sub_1AC5039B0(*v42, v43);
      *(_QWORD *)v41 = v44;
      *((_QWORD *)v41 + 1) = v43;
    }
    v45 = a3[11];
    v46 = a3[12];
    v47 = (char *)a1 + v45;
    v48 = (char *)a2 + v45;
    *(_DWORD *)v47 = *(_DWORD *)v48;
    v47[4] = v48[4];
    v49 = *(void **)((char *)a2 + v46);
    *(_QWORD *)((char *)a1 + v46) = v49;
    v50 = a3[14];
    *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
    *((_BYTE *)a1 + v50) = *((_BYTE *)a2 + v50);
    v51 = a3[16];
    *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
    v52 = (_OWORD *)((char *)a1 + v51);
    v53 = (_OWORD *)((char *)a2 + v51);
    *v52 = *v53;
    *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)v53 + 9);
    v54 = a3[18];
    *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
    *((_BYTE *)a1 + v54) = *((_BYTE *)a2 + v54);
    v55 = v49;
  }
  return a1;
}

void sub_1AC510F2C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    v6 = sub_1AC5DD060();
    v7 = *(_QWORD *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6))
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = (uint64_t *)(a1 + a2[10]);
  v9 = v8[1];
  if (v9 >> 60 != 15)
    sub_1AC503B20(*v8, v9);

}

_QWORD *sub_1AC511050(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  char *v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  _OWORD *v50;
  _OWORD *v51;
  uint64_t v52;
  id v53;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = sub_1AC5DD060();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v9, v10, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v9, 0, 1, v14);
    }
    v17 = *(int *)(v11 + 48);
    v18 = &v9[v17];
    v19 = &v10[v17];
    v20 = *((_QWORD *)v19 + 1);
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *((_QWORD *)v18 + 1) = v20;
    v21 = *(int *)(v11 + 64);
    v22 = &v9[v21];
    v23 = &v10[v21];
    v24 = *((_QWORD *)v23 + 1);
    *(_QWORD *)v22 = *(_QWORD *)v23;
    *((_QWORD *)v22 + 1) = v24;
    v25 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25(v9, 0, 1, v11);
  }
  v26 = a3[7];
  v27 = a3[8];
  v28 = (_QWORD *)((char *)a1 + v26);
  v29 = (_QWORD *)((char *)a2 + v26);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v31 = (_QWORD *)((char *)a1 + v27);
  v32 = (_QWORD *)((char *)a2 + v27);
  v33 = v32[1];
  *v31 = *v32;
  v31[1] = v33;
  v34 = a3[9];
  v35 = a3[10];
  v36 = (_QWORD *)((char *)a1 + v34);
  v37 = (_QWORD *)((char *)a2 + v34);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  v39 = (char *)a1 + v35;
  v40 = (_QWORD *)((char *)a2 + v35);
  v41 = *(_QWORD *)((char *)a2 + v35 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v41 >> 60 == 15)
  {
    *(_OWORD *)v39 = *(_OWORD *)v40;
  }
  else
  {
    v42 = *v40;
    sub_1AC5039B0(*v40, v41);
    *(_QWORD *)v39 = v42;
    *((_QWORD *)v39 + 1) = v41;
  }
  v43 = a3[11];
  v44 = a3[12];
  v45 = (char *)a1 + v43;
  v46 = (char *)a2 + v43;
  *(_DWORD *)v45 = *(_DWORD *)v46;
  v45[4] = v46[4];
  v47 = *(void **)((char *)a2 + v44);
  *(_QWORD *)((char *)a1 + v44) = v47;
  v48 = a3[14];
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  *((_BYTE *)a1 + v48) = *((_BYTE *)a2 + v48);
  v49 = a3[16];
  *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
  v50 = (_OWORD *)((char *)a1 + v49);
  v51 = (_OWORD *)((char *)a2 + v49);
  *v50 = *v51;
  *(_OWORD *)((char *)v50 + 9) = *(_OWORD *)((char *)v51 + 9);
  v52 = a3[18];
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  *((_BYTE *)a1 + v52) = *((_BYTE *)a2 + v52);
  v53 = v47;
  return a1;
}

_QWORD *sub_1AC5112CC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  void (*v29)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  _OWORD *v63;
  __int128 *v64;
  __int128 v65;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_1AC5073BC((uint64_t)v7, &qword_1EEC83098);
      goto LABEL_7;
    }
    v18 = sub_1AC5DD060();
    v19 = *(_QWORD *)(v18 - 8);
    v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
    v21 = v20(v7, 1, v18);
    v22 = v20(v8, 1, v18);
    if (v21)
    {
      if (!v22)
      {
        (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v7, v8, v18);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v7, 0, 1, v18);
LABEL_16:
        v31 = *(int *)(v9 + 48);
        v32 = &v7[v31];
        v33 = &v8[v31];
        *(_QWORD *)v32 = *(_QWORD *)v33;
        *((_QWORD *)v32 + 1) = *((_QWORD *)v33 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v34 = *(int *)(v9 + 64);
        v35 = &v7[v34];
        v36 = &v8[v34];
        *(_QWORD *)v35 = *(_QWORD *)v36;
        *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v22)
      {
        (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v7, v8, v18);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v18);
    }
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_16;
  }
  if (v13)
  {
LABEL_7:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_17;
  }
  v14 = sub_1AC5DD060();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v7, v8, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
  }
  v23 = *(int *)(v9 + 48);
  v24 = &v7[v23];
  v25 = &v8[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  v26 = *(int *)(v9 + 64);
  v27 = &v7[v26];
  v28 = &v8[v26];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
  v29 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29(v7, 0, 1, v9);
LABEL_17:
  v37 = a3[7];
  v38 = (_QWORD *)((char *)a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  *v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = a3[8];
  v41 = (_QWORD *)((char *)a1 + v40);
  v42 = (_QWORD *)((char *)a2 + v40);
  *v41 = *v42;
  v41[1] = v42[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v43 = a3[9];
  v44 = (_QWORD *)((char *)a1 + v43);
  v45 = (_QWORD *)((char *)a2 + v43);
  *v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v46 = a3[10];
  v47 = (_QWORD *)((char *)a1 + v46);
  v48 = (_QWORD *)((char *)a2 + v46);
  v49 = *(_QWORD *)((char *)a2 + v46 + 8);
  if (*(_QWORD *)((char *)a1 + v46 + 8) >> 60 != 15)
  {
    if (v49 >> 60 != 15)
    {
      v51 = *v48;
      sub_1AC5039B0(v51, v49);
      v52 = *v47;
      v53 = v47[1];
      *v47 = v51;
      v47[1] = v49;
      sub_1AC503B20(v52, v53);
      goto LABEL_24;
    }
    sub_1AC5042C8((uint64_t)v47);
    goto LABEL_22;
  }
  if (v49 >> 60 == 15)
  {
LABEL_22:
    *(_OWORD *)v47 = *(_OWORD *)v48;
    goto LABEL_24;
  }
  v50 = *v48;
  sub_1AC5039B0(v50, v49);
  *v47 = v50;
  v47[1] = v49;
LABEL_24:
  v54 = a3[11];
  v55 = (char *)a1 + v54;
  v56 = (char *)a2 + v54;
  v57 = *(_DWORD *)v56;
  v55[4] = v56[4];
  *(_DWORD *)v55 = v57;
  v58 = a3[12];
  v59 = *(void **)((char *)a1 + v58);
  v60 = *(void **)((char *)a2 + v58);
  *(_QWORD *)((char *)a1 + v58) = v60;
  v61 = v60;

  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
  v62 = a3[16];
  v63 = (_OWORD *)((char *)a1 + v62);
  v64 = (__int128 *)((char *)a2 + v62);
  v65 = *v64;
  *(_OWORD *)((char *)v63 + 9) = *(__int128 *)((char *)v64 + 9);
  *v63 = v65;
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  *((_BYTE *)a1 + a3[18]) = *((_BYTE *)a2 + a3[18]);
  return a1;
}

_OWORD *sub_1AC511758(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
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
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = sub_1AC5DD060();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v8, v9, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v8, 0, 1, v13);
    }
    *(_OWORD *)&v8[*(int *)(v10 + 48)] = *(_OWORD *)&v9[*(int *)(v10 + 48)];
    *(_OWORD *)&v8[*(int *)(v10 + 64)] = *(_OWORD *)&v9[*(int *)(v10 + 64)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v16 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v16) = *(_OWORD *)((char *)a2 + v16);
  v17 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  v18 = a3[11];
  v19 = a3[12];
  v20 = (char *)a1 + v18;
  v21 = (char *)a2 + v18;
  *(_DWORD *)v20 = *(_DWORD *)v21;
  v20[4] = v21[4];
  *(_QWORD *)((char *)a1 + v19) = *(_QWORD *)((char *)a2 + v19);
  v22 = a3[14];
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  *((_BYTE *)a1 + v22) = *((_BYTE *)a2 + v22);
  v23 = a3[16];
  *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
  v24 = (_OWORD *)((char *)a1 + v23);
  v25 = (_OWORD *)((char *)a2 + v23);
  *v24 = *v25;
  *(_OWORD *)((char *)v24 + 9) = *(_OWORD *)((char *)v25 + 9);
  v26 = a3[18];
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  *((_BYTE *)a1 + v26) = *((_BYTE *)a2 + v26);
  return a1;
}

_QWORD *sub_1AC511944(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  _OWORD *v64;
  _OWORD *v65;
  uint64_t v66;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_1AC5073BC((uint64_t)v9, &qword_1EEC83098);
      goto LABEL_7;
    }
    v20 = sub_1AC5DD060();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
    v23 = v22(v9, 1, v20);
    v24 = v22(v10, 1, v20);
    if (v23)
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v9, v10, v20);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v9, 0, 1, v20);
LABEL_16:
        v26 = *(int *)(v11 + 48);
        v27 = &v9[v26];
        v28 = &v10[v26];
        v30 = *(_QWORD *)v28;
        v29 = *((_QWORD *)v28 + 1);
        *(_QWORD *)v27 = v30;
        *((_QWORD *)v27 + 1) = v29;
        swift_bridgeObjectRelease();
        v31 = *(int *)(v11 + 64);
        v32 = &v9[v31];
        v33 = &v10[v31];
        v35 = *(_QWORD *)v33;
        v34 = *((_QWORD *)v33 + 1);
        *(_QWORD *)v32 = v35;
        *((_QWORD *)v32 + 1) = v34;
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v9, v10, v20);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v20);
    }
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_16;
  }
  if (v15)
  {
LABEL_7:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_17;
  }
  v16 = sub_1AC5DD060();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v9, v10, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
  }
  *(_OWORD *)&v9[*(int *)(v11 + 48)] = *(_OWORD *)&v10[*(int *)(v11 + 48)];
  *(_OWORD *)&v9[*(int *)(v11 + 64)] = *(_OWORD *)&v10[*(int *)(v11 + 64)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_17:
  v36 = a3[7];
  v37 = (_QWORD *)((char *)a1 + v36);
  v38 = (_QWORD *)((char *)a2 + v36);
  v40 = *v38;
  v39 = v38[1];
  *v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  v41 = a3[8];
  v42 = (_QWORD *)((char *)a1 + v41);
  v43 = (_QWORD *)((char *)a2 + v41);
  v45 = *v43;
  v44 = v43[1];
  *v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  v46 = a3[9];
  v47 = (_QWORD *)((char *)a1 + v46);
  v48 = (_QWORD *)((char *)a2 + v46);
  v50 = *v48;
  v49 = v48[1];
  *v47 = v50;
  v47[1] = v49;
  swift_bridgeObjectRelease();
  v51 = a3[10];
  v52 = (_QWORD *)((char *)a1 + v51);
  v53 = (_QWORD *)((char *)a2 + v51);
  v54 = *(_QWORD *)((char *)a1 + v51 + 8);
  if (v54 >> 60 != 15)
  {
    v55 = v53[1];
    if (v55 >> 60 != 15)
    {
      v56 = *v52;
      *v52 = *v53;
      v52[1] = v55;
      sub_1AC503B20(v56, v54);
      goto LABEL_22;
    }
    sub_1AC5042C8((uint64_t)v52);
  }
  *(_OWORD *)v52 = *(_OWORD *)v53;
LABEL_22:
  v57 = a3[11];
  v58 = a3[12];
  v59 = (char *)a1 + v57;
  v60 = (char *)a2 + v57;
  *(_DWORD *)v59 = *(_DWORD *)v60;
  v59[4] = v60[4];
  v61 = *(void **)((char *)a1 + v58);
  *(_QWORD *)((char *)a1 + v58) = *(_QWORD *)((char *)a2 + v58);

  v62 = a3[14];
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  *((_BYTE *)a1 + v62) = *((_BYTE *)a2 + v62);
  v63 = a3[16];
  *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
  v64 = (_OWORD *)((char *)a1 + v63);
  v65 = (_OWORD *)((char *)a2 + v63);
  *(_OWORD *)((char *)v64 + 9) = *(_OWORD *)((char *)v65 + 9);
  *v64 = *v65;
  v66 = a3[18];
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  *((_BYTE *)a1 + v66) = *((_BYTE *)a2 + v66);
  return a1;
}

uint64_t sub_1AC511CF0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC511CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t sub_1AC511D88()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC511D94(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AVInfoTabMetadata()
{
  uint64_t result;

  result = qword_1EEC830F8;
  if (!qword_1EEC830F8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1AC511E48()
{
  unint64_t v0;

  sub_1AC511F04();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1AC511F04()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEC830A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC83098);
    v0 = sub_1AC5DD7E0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEC830A8);
  }
}

void sub_1AC511F5C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return;
  v4 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v5 = 0;
  while (1)
  {
    v6 = *(id *)(a1 + 8 * v5 + 32);
    v7 = objc_msgSend(v1, sel_externalMetadata);
    if (!v7)
    {
      sub_1AC519B80(0, &qword_1EEC83160);
      sub_1AC5DD744();
      v7 = (id)sub_1AC5DD738();
      swift_bridgeObjectRelease();
    }
    v8 = objc_msgSend(v4, sel_metadataItemsFromArray_filteredByIdentifier_, v7, v6);

    sub_1AC519B80(0, &qword_1EEC83160);
    v9 = sub_1AC5DD744();

    if (v9 >> 62)
      break;
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_10;
LABEL_7:
    ++v5;
    swift_bridgeObjectRelease();

    if (v2 == v5)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  swift_bridgeObjectRetain();
  v10 = sub_1AC5DD864();
  swift_bridgeObjectRelease();
  if (!v10)
    goto LABEL_7;
LABEL_10:
  if ((v9 & 0xC000000000000001) != 0)
  {
    MEMORY[0x1AF43DD40](0, v9);
LABEL_13:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v11 = *(id *)(v9 + 32);
      goto LABEL_13;
    }
    __break(1u);
  }
}

uint64_t sub_1AC512134()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  sub_1AC5DD768();
  v1[4] = sub_1AC5DD75C();
  v1[5] = sub_1AC5DD750();
  v1[6] = v2;
  return swift_task_switch();
}

uint64_t sub_1AC5121A0()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 56) = objc_msgSend(*(id *)(v0 + 24), sel_asset);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830D8);
  *(_QWORD *)(v0 + 64) = sub_1AC5DD0D8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_1AC512240;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC512240()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  swift_task_dealloc();
  v3 = *(void **)(v2 + 56);
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC5122CC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  char v3;

  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)*MEMORY[0x1E0C8A770];
  v3 = sub_1AC51236C((uint64_t)v2, v1);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v3 & 1);
}

uint64_t sub_1AC512338()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1AC51236C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = sub_1AC5DD714();
  v5 = v4;
  if (v3 == sub_1AC5DD714() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  v8 = sub_1AC5DD87C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = 5;
  while (1)
  {
    v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
      break;
    v12 = sub_1AC5DD714();
    v14 = v13;
    if (v12 == sub_1AC5DD714() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    v17 = sub_1AC5DD87C();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
      goto LABEL_7;
    ++v10;
    if (v11 == v2)
      goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AC5124C0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  sub_1AC5DD768();
  v1[4] = sub_1AC5DD75C();
  v1[5] = sub_1AC5DD750();
  v1[6] = v2;
  return swift_task_switch();
}

uint64_t sub_1AC51252C()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 56) = objc_msgSend(*(id *)(v0 + 24), sel_asset);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830D8);
  *(_QWORD *)(v0 + 64) = sub_1AC5DD0D8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_1AC5125CC;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC5125CC()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  swift_task_dealloc();
  v3 = *(void **)(v2 + 56);
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC512658()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  char v3;

  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)*MEMORY[0x1E0C8A6F0];
  v3 = sub_1AC51236C((uint64_t)v2, v1);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v3 & 1);
}

char *sub_1AC5126C4(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
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
    v2 = sub_1AC5DD864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return (char *)v3;
  v13 = MEMORY[0x1E0DEE9D8];
  result = sub_1AC514A88(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1AF43DD40](i, a1);
        sub_1AC519B80(0, &qword_1EEC831B0);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1AC514A88(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1AC514A88((char *)(v6 > 1), v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_1AC519B70(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_1AC519B80(0, &qword_1EEC831B0);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1AC514A88(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1AC514A88((char *)(v10 > 1), v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_1AC519B70(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AC512924()
{
  uint64_t result;

  result = sub_1AC5DD6F0();
  qword_1EEC88A60 = result;
  return result;
}

uint64_t sub_1AC512958()
{
  uint64_t result;

  result = sub_1AC5DD6F0();
  qword_1EEC88A90 = result;
  return result;
}

uint64_t sub_1AC51298C()
{
  uint64_t result;

  result = sub_1AC5DD6F0();
  qword_1EEC88A68 = result;
  return result;
}

uint64_t sub_1AC5129C0()
{
  uint64_t result;

  result = sub_1AC5DD6F0();
  qword_1EEC88A58 = result;
  return result;
}

BOOL sub_1AC5129FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_1AC512A10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_1AC512A24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_1AC512A38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

BOOL sub_1AC512A4C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1AC512A60()
{
  return sub_1AC5DD894();
}

uint64_t sub_1AC512A88()
{
  sub_1AC5DD888();
  sub_1AC5DD894();
  return sub_1AC5DD8A0();
}

uint64_t sub_1AC512ACC()
{
  sub_1AC5DD888();
  sub_1AC5DD894();
  return sub_1AC5DD8A0();
}

unint64_t sub_1AC512B0C@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1AC516A18(*a1);
  *a2 = result;
  return result;
}

void sub_1AC512B34(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_1AC512B40(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v2[28] = a1;
  v2[29] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
  v2[30] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v2[31] = v4;
  v2[32] = *(_QWORD *)(v4 - 8);
  v2[33] = swift_task_alloc();
  v7 = (uint64_t (*)(uint64_t))((char *)&dword_1EEC83FB8 + dword_1EEC83FB8);
  v5 = (_QWORD *)swift_task_alloc();
  v2[34] = v5;
  *v5 = v2;
  v5[1] = sub_1AC512BF4;
  return v7(a2);
}

uint64_t sub_1AC512BF4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v3 = *v2;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = a2;
  v4 = *(_QWORD *)(v3 + 248);
  v5 = *v2;
  swift_task_dealloc();
  *(_DWORD *)(v3 + 544) = *(_DWORD *)(v4 + 48);
  *(_DWORD *)(v3 + 548) = *(_DWORD *)(v4 + 64);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 280) = v6;
  *v6 = v5;
  v6[1] = sub_1AC512C80;
  return sub_1AC5136E4(*(_QWORD *)(v3 + 264), *(_QWORD *)(v3 + 232));
}

uint64_t sub_1AC512C80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v16)(_QWORD);

  v9 = (_QWORD *)*v4;
  v10 = *(_QWORD *)(*v4 + 264);
  v11 = (_QWORD *)(v10 + *(int *)(*v4 + 548));
  v12 = (_QWORD *)(v10 + *(int *)(*v4 + 544));
  v13 = *v4;
  v9[36] = a1;
  v9[37] = a2;
  v9[38] = a3;
  v9[39] = a4;
  swift_task_dealloc();
  *v12 = a1;
  v12[1] = a2;
  *v11 = a3;
  v11[1] = a4;
  v16 = (uint64_t (*)(_QWORD))((char *)&dword_1EEC83FC8 + dword_1EEC83FC8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = (_QWORD *)swift_task_alloc();
  v9[40] = v14;
  *v14 = v13;
  v14[1] = sub_1AC512D64;
  return v16(v9[29]);
}

uint64_t sub_1AC512D64(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);
  _QWORD *v7;

  v3 = (_QWORD *)*v2;
  v3[5] = v2;
  v3[6] = a1;
  v3[7] = a2;
  v7 = (_QWORD *)*v2;
  swift_task_dealloc();
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1EEC83FD0 + dword_1EEC83FD0);
  v4 = (_QWORD *)swift_task_alloc();
  v3[41] = v4;
  *v4 = v7;
  v4[1] = sub_1AC512DE8;
  return v6(v3[29]);
}

uint64_t sub_1AC512DE8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);
  _QWORD *v7;

  v3 = (_QWORD *)*v2;
  v3[8] = v2;
  v3[9] = a1;
  v3[10] = a2;
  v7 = (_QWORD *)*v2;
  swift_task_dealloc();
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1EEC83FD8 + dword_1EEC83FD8);
  v4 = (_QWORD *)swift_task_alloc();
  v3[42] = v4;
  *v4 = v7;
  v4[1] = sub_1AC512E6C;
  return v6(v3[29]);
}

uint64_t sub_1AC512E6C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);
  _QWORD *v7;

  v3 = (_QWORD *)*v2;
  v3[11] = v2;
  v3[12] = a1;
  v3[13] = a2;
  v7 = (_QWORD *)*v2;
  swift_task_dealloc();
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1EEC83FE0 + dword_1EEC83FE0);
  v4 = (_QWORD *)swift_task_alloc();
  v3[43] = v4;
  *v4 = v7;
  v4[1] = sub_1AC512EF0;
  return v6(v3[29]);
}

uint64_t sub_1AC512EF0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);
  _QWORD *v7;

  v3 = (_QWORD *)*v2;
  v3[14] = v2;
  v3[15] = a1;
  v3[16] = a2;
  v7 = (_QWORD *)*v2;
  swift_task_dealloc();
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1EEC83FE8 + dword_1EEC83FE8);
  v4 = (_QWORD *)swift_task_alloc();
  v3[44] = v4;
  *v4 = v7;
  v4[1] = sub_1AC512F74;
  return v6(v3[29]);
}

uint64_t sub_1AC512F74(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);
  _QWORD *v7;

  v3 = (_QWORD *)*v2;
  v3[17] = v2;
  v3[18] = a1;
  v3[19] = a2;
  v7 = (_QWORD *)*v2;
  swift_task_dealloc();
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1EEC83FF0 + dword_1EEC83FF0);
  v4 = (_QWORD *)swift_task_alloc();
  v3[45] = v4;
  *v4 = v7;
  v4[1] = sub_1AC512FF8;
  return v6(v3[29]);
}

uint64_t sub_1AC512FF8(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);
  _QWORD *v6;

  v2 = (_QWORD *)*v1;
  v2[20] = v1;
  v2[21] = a1;
  v6 = (_QWORD *)*v1;
  swift_task_dealloc();
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_1EEC83FF8 + dword_1EEC83FF8);
  v3 = (_QWORD *)swift_task_alloc();
  v2[46] = v3;
  *v3 = v6;
  v3[1] = sub_1AC513078;
  return v5(v2[29]);
}

uint64_t sub_1AC513078(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);
  _QWORD *v6;

  v2 = (_QWORD *)*v1;
  v2[22] = v1;
  v2[23] = a1;
  v6 = (_QWORD *)*v1;
  swift_task_dealloc();
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_1EEC84000 + dword_1EEC84000);
  v3 = (_QWORD *)swift_task_alloc();
  v2[47] = v3;
  *v3 = v6;
  v3[1] = sub_1AC5130F8;
  return v5(v2[29]);
}

uint64_t sub_1AC5130F8(char a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_BYTE *)(v2 + 200) = a1;
  *(_QWORD *)(v2 + 192) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1AC513154()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t);

  *(_BYTE *)(v0 + 560) = sub_1AC518EF0(*(void **)(v0 + 232));
  v3 = (uint64_t (*)(uint64_t))((char *)&dword_1EEC84008 + dword_1EEC84008);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 384) = v1;
  *v1 = v0;
  v1[1] = sub_1AC5131C0;
  return v3(*(_QWORD *)(v0 + 232));
}

uint64_t sub_1AC5131C0(char a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_BYTE *)(v2 + 216) = a1;
  *(_QWORD *)(v2 + 208) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1AC51321C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  v12 = *(_BYTE *)(v0 + 216);
  v1 = *(_BYTE *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 128);
  v17 = *(_QWORD *)(v0 + 120);
  v18 = *(_QWORD *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 80);
  v15 = *(_QWORD *)(v0 + 72);
  v16 = *(_QWORD *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 56);
  v9 = *(_QWORD *)(v0 + 32);
  v13 = *(_QWORD *)(v0 + 24);
  v14 = *(_QWORD *)(v0 + 48);
  objc_msgSend(*(id *)(v0 + 232), sel_duration);
  *(_DWORD *)(v0 + 552) = v20;
  *(_DWORD *)(v0 + 556) = v21;
  *(_QWORD *)(v0 + 392) = v19;
  *(_QWORD *)(v0 + 400) = v22;
  *(_BYTE *)(v0 + 561) = sub_1AC5DD7BC() & 1;
  *(_BYTE *)(v0 + 562) = v12;
  *(_BYTE *)(v0 + 563) = v1;
  *(_QWORD *)(v0 + 408) = v2;
  *(_QWORD *)(v0 + 416) = v3;
  *(_QWORD *)(v0 + 424) = v4;
  *(_QWORD *)(v0 + 432) = v18;
  *(_QWORD *)(v0 + 440) = v5;
  *(_QWORD *)(v0 + 448) = v17;
  *(_QWORD *)(v0 + 456) = v6;
  *(_QWORD *)(v0 + 464) = v16;
  *(_QWORD *)(v0 + 472) = v7;
  *(_QWORD *)(v0 + 480) = v15;
  *(_QWORD *)(v0 + 488) = v8;
  *(_QWORD *)(v0 + 496) = v14;
  *(_QWORD *)(v0 + 504) = v9;
  *(_QWORD *)(v0 + 512) = v13;
  *(_QWORD *)(v0 + 520) = sub_1AC5DD768();
  sub_1AC5DD75C();
  swift_release();
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 528) = v10;
  *v10 = v0;
  v10[1] = sub_1AC513350;
  return sub_1AC512134();
}

uint64_t sub_1AC513350(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 564) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1AC5133AC()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1AC5DD75C();
  swift_release();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 536) = v1;
  *v1 = v0;
  v1[1] = sub_1AC513400;
  return sub_1AC5124C0();
}

uint64_t sub_1AC513400(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 565) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1AC51345C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  char *v18;
  char *v19;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;
  char v45;

  v44 = *(_BYTE *)(v0 + 564);
  v45 = *(_BYTE *)(v0 + 565);
  v25 = *(_QWORD *)(v0 + 504);
  v26 = *(_QWORD *)(v0 + 512);
  v30 = *(_QWORD *)(v0 + 488);
  v31 = *(_QWORD *)(v0 + 496);
  v23 = *(_QWORD *)(v0 + 472);
  v24 = *(_QWORD *)(v0 + 480);
  v28 = *(_QWORD *)(v0 + 456);
  v29 = *(_QWORD *)(v0 + 464);
  v33 = *(_QWORD *)(v0 + 440);
  v34 = *(_QWORD *)(v0 + 448);
  v37 = *(_QWORD *)(v0 + 432);
  v36 = *(_QWORD *)(v0 + 424);
  v38 = *(_QWORD *)(v0 + 416);
  v1 = *(_QWORD *)(v0 + 400);
  v41 = *(_QWORD *)(v0 + 408);
  v42 = *(_BYTE *)(v0 + 563);
  v43 = *(_BYTE *)(v0 + 562);
  v2 = *(_QWORD *)(v0 + 552);
  v39 = *(_BYTE *)(v0 + 561);
  v40 = *(_BYTE *)(v0 + 560);
  v3 = *(_QWORD *)(v0 + 296);
  v21 = *(_QWORD *)(v0 + 304);
  v22 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 240);
  v5 = *(_QWORD *)(v0 + 248);
  if (!v39)
    v1 = 0;
  v35 = v1;
  if (!*(_BYTE *)(v0 + 561))
    v2 = 0;
  v32 = v2;
  if (*(_BYTE *)(v0 + 561))
    v6 = *(_QWORD *)(v0 + 392);
  else
    v6 = 0;
  v27 = v6;
  v7 = (_QWORD *)(v4 + *(int *)(v5 + 48));
  v8 = (_QWORD *)(v4 + *(int *)(v5 + 64));
  v9 = *(_QWORD *)(v0 + 288);
  v11 = *(_QWORD *)(v0 + 256);
  v10 = *(_QWORD *)(v0 + 264);
  v12 = *(_QWORD **)(v0 + 224);
  sub_1AC507378(v10, v4, &qword_1EEC830B0);
  sub_1AC5073BC(v10, &qword_1EEC83098);
  *v7 = v9;
  v7[1] = v3;
  *v8 = v21;
  v8[1] = v22;
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v4, 0, 1, v5);
  *v12 = v26;
  v12[1] = v25;
  v12[2] = v24;
  v12[3] = v23;
  v13 = (int *)type metadata accessor for AVInfoTabMetadata();
  sub_1AC5073F8(v4, (uint64_t)v12 + v13[6], &qword_1EEC830A0);
  v14 = (_QWORD *)((char *)v12 + v13[7]);
  *v14 = v31;
  v14[1] = v30;
  v15 = (_QWORD *)((char *)v12 + v13[8]);
  *v15 = v29;
  v15[1] = v28;
  v16 = (_QWORD *)((char *)v12 + v13[9]);
  *v16 = v34;
  v16[1] = v33;
  v17 = (_QWORD *)((char *)v12 + v13[10]);
  *v17 = v37;
  v17[1] = v36;
  v18 = (char *)v12 + v13[11];
  v18[4] = BYTE4(v38);
  *(_DWORD *)v18 = v38;
  *(_QWORD *)((char *)v12 + v13[12]) = v41;
  *((_BYTE *)v12 + v13[13]) = v42;
  *((_BYTE *)v12 + v13[14]) = v40;
  *((_BYTE *)v12 + v13[15]) = v43;
  v19 = (char *)v12 + v13[16];
  *(_QWORD *)v19 = v27;
  *((_QWORD *)v19 + 1) = v32;
  *((_QWORD *)v19 + 2) = v35;
  v19[24] = v39 ^ 1;
  *((_BYTE *)v12 + v13[17]) = v44;
  *((_BYTE *)v12 + v13[18]) = v45;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AC5136E4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[21] = a1;
  v2[22] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1AC513750()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t inited;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;

  v1 = v0[21];
  v2 = sub_1AC5DD060();
  v0[25] = v2;
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56);
  v0[26] = v3;
  v3(v1, 1, 1, v2);
  v4 = (void *)objc_opt_self();
  sub_1AC5DD714();
  v5 = (void *)sub_1AC5DD6F0();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_identifierForKey_keySpace_, v5, *MEMORY[0x1E0C8A9D0]);
  v0[27] = v6;

  if (v6)
  {
    sub_1AC5DD714();
    v7 = (void *)sub_1AC5DD6F0();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v4, sel_identifierForKey_keySpace_, v7, *MEMORY[0x1E0C8A9E8]);
    v0[28] = v8;

    if (v8)
    {
      sub_1AC5DD714();
      v9 = (void *)sub_1AC5DD6F0();
      swift_bridgeObjectRelease();
      v10 = objc_msgSend(v4, sel_identifierForKey_keySpace_, v9, *MEMORY[0x1E0C8A9F8]);
      v0[29] = v10;

      if (v10)
      {
        sub_1AC5DD714();
        v11 = (void *)sub_1AC5DD6F0();
        swift_bridgeObjectRelease();
        v12 = objc_msgSend(v4, sel_identifierForKey_keySpace_, v11, *MEMORY[0x1E0C8A9D8]);
        v0[30] = v12;

        if (v12)
        {
          sub_1AC5DD714();
          v13 = (void *)sub_1AC5DD6F0();
          swift_bridgeObjectRelease();
          v14 = objc_msgSend(v4, sel_identifierForKey_keySpace_, v13, *MEMORY[0x1E0C8A9E0]);
          v0[31] = v14;

          if (v14)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
            inited = swift_initStackObject();
            v0[32] = inited;
            *(_OWORD *)(inited + 16) = xmmword_1AC5F7540;
            *(_QWORD *)(inited + 32) = v6;
            *(_QWORD *)(inited + 40) = v8;
            *(_QWORD *)(inited + 48) = v10;
            *(_QWORD *)(inited + 56) = v12;
            *(_QWORD *)(inited + 64) = v14;
            v0[33] = sub_1AC5DD768();
            v16 = v6;
            v17 = v8;
            v18 = v10;
            v19 = v12;
            v20 = v14;
            v0[34] = sub_1AC5DD75C();
            sub_1AC5DD750();
            return swift_task_switch();
          }

        }
      }

    }
  }
  v0[49] = 0;
  v0[50] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  v21 = swift_initStackObject();
  v0[51] = v21;
  *(_OWORD *)(v21 + 16) = xmmword_1AC5F7550;
  if (qword_1EEC83180 != -1)
    swift_once();
  v22 = (void *)qword_1EEC88A58;
  *(_QWORD *)(v21 + 32) = qword_1EEC88A58;
  sub_1AC5DD768();
  v23 = v22;
  v0[52] = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC513AD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 256);
  swift_release();
  sub_1AC511F5C(v1);
  *(_QWORD *)(v0 + 280) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return swift_task_switch();
}

uint64_t sub_1AC513B50()
{
  _QWORD *v0;
  _QWORD *v1;

  if (v0[35])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84028);
    v0[36] = sub_1AC5DD0CC();
    v1 = (_QWORD *)swift_task_alloc();
    v0[37] = v1;
    *v1 = v0;
    v1[1] = sub_1AC513C1C;
    return sub_1AC5DD7B0();
  }
  else
  {
    v0[40] = 0;
    v0[41] = 0;
    v0[42] = sub_1AC5DD75C();
    sub_1AC5DD750();
    return swift_task_switch();
  }
}

uint64_t sub_1AC513C1C()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC513C98()
{
  uint64_t *v0;
  _QWORD *v1;

  sub_1AC5073BC(v0[21], &qword_1EEC830B0);
  sub_1AC5073F8(v0[24], v0[21], &qword_1EEC830B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830D0);
  v0[38] = sub_1AC5DD0B4();
  v1 = (_QWORD *)swift_task_alloc();
  v0[39] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_1AC513D40;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC513D40()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC513DBC()
{
  uint64_t v0;

  *(_OWORD *)(v0 + 320) = *(_OWORD *)(v0 + 144);
  *(_QWORD *)(v0 + 336) = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC513E2C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 176);
  swift_release();
  *(_QWORD *)(v0 + 344) = objc_msgSend(v1, sel_asset);
  return swift_task_switch();
}

uint64_t sub_1AC513E88()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830E0);
  *(_QWORD *)(v0 + 352) = sub_1AC5DD0E4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v1;
  *v1 = v0;
  v1[1] = sub_1AC513F08;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC513F08()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  swift_task_dealloc();
  v3 = *(void **)(v2 + 344);
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC513F94()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  void *v13;
  id v14;

  v1 = *(_QWORD *)(v0 + 160);
  *(_QWORD *)(v0 + 368) = v1;
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84028);
    *(_QWORD *)(v0 + 376) = sub_1AC5DD0CC();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 384) = v2;
    *v2 = v0;
    v2[1] = sub_1AC514170;
    return sub_1AC5DD7B0();
  }
  else
  {
    v5 = *(void **)(v0 + 240);
    v4 = *(void **)(v0 + 248);
    v7 = *(void **)(v0 + 224);
    v6 = *(void **)(v0 + 232);
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 208);
    v9 = *(void **)(v0 + 216);
    v10 = *(_QWORD *)(v0 + 200);
    v11 = *(_QWORD *)(v0 + 184);
    sub_1AC5073BC(*(_QWORD *)(v0 + 168), &qword_1EEC830B0);

    v8(v11, 1, 1, v10);
    sub_1AC5073F8(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168), &qword_1EEC830B0);
    *(_OWORD *)(v0 + 392) = *(_OWORD *)(v0 + 320);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
    inited = swift_initStackObject();
    *(_QWORD *)(v0 + 408) = inited;
    *(_OWORD *)(inited + 16) = xmmword_1AC5F7550;
    if (qword_1EEC83180 != -1)
      swift_once();
    v13 = (void *)qword_1EEC88A58;
    *(_QWORD *)(inited + 32) = qword_1EEC88A58;
    sub_1AC5DD768();
    v14 = v13;
    *(_QWORD *)(v0 + 416) = sub_1AC5DD75C();
    sub_1AC5DD750();
    return swift_task_switch();
  }
}

uint64_t sub_1AC514170()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    v3 = *(void **)(v2 + 368);

    swift_release();
  }
  else
  {
    v4 = *(void **)(v2 + 368);
    swift_release();

  }
  return swift_task_switch();
}

uint64_t sub_1AC5141FC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t inited;
  void *v7;
  id v8;

  v1 = *(void **)(v0 + 240);
  v3 = *(void **)(v0 + 224);
  v2 = *(void **)(v0 + 232);
  v4 = *(void **)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 168);

  sub_1AC5073BC(v5, &qword_1EEC830B0);
  sub_1AC5073F8(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168), &qword_1EEC830B0);
  *(_OWORD *)(v0 + 392) = *(_OWORD *)(v0 + 320);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 408) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F7550;
  if (qword_1EEC83180 != -1)
    swift_once();
  v7 = (void *)qword_1EEC88A58;
  *(_QWORD *)(inited + 32) = qword_1EEC88A58;
  sub_1AC5DD768();
  v8 = v7;
  *(_QWORD *)(v0 + 416) = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC51432C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 408);
  swift_release();
  sub_1AC511F5C(v1);
  *(_QWORD *)(v0 + 424) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return swift_task_switch();
}

uint64_t sub_1AC5143A8()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_QWORD *)(v0 + 424))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830D0);
    *(_QWORD *)(v0 + 432) = sub_1AC5DD0B4();
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 440) = v1;
    *v1 = v0;
    v1[1] = sub_1AC514464;
    return sub_1AC5DD7B0();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 400), 0, 0);
  }
}

uint64_t sub_1AC514464()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC5144E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 136);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v0 + 8))(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 400), v2, v1);
}

uint64_t sub_1AC514538()
{
  uint64_t *v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[25];
  v2 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[26];
  v3 = v0[24];
  sub_1AC5073BC(v0[21], &qword_1EEC830B0);
  v2(v3, 1, 1, v1);
  sub_1AC5073F8(v0[24], v0[21], &qword_1EEC830B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830D0);
  v0[38] = sub_1AC5DD0B4();
  v4 = (_QWORD *)swift_task_alloc();
  v0[39] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = sub_1AC513D40;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC514604()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 320) = 0;
  *(_QWORD *)(v0 + 328) = 0;
  *(_QWORD *)(v0 + 336) = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC514670()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  void *v10;
  id v11;

  v2 = *(void **)(v0 + 240);
  v1 = *(void **)(v0 + 248);
  v4 = *(void **)(v0 + 224);
  v3 = *(void **)(v0 + 232);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 208);
  v6 = *(_QWORD *)(v0 + 200);
  v7 = *(_QWORD *)(v0 + 184);
  v8 = *(_QWORD *)(v0 + 168);

  sub_1AC5073BC(v8, &qword_1EEC830B0);
  v5(v7, 1, 1, v6);
  sub_1AC5073F8(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168), &qword_1EEC830B0);
  *(_OWORD *)(v0 + 392) = *(_OWORD *)(v0 + 320);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 408) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F7550;
  if (qword_1EEC83180 != -1)
    swift_once();
  v10 = (void *)qword_1EEC88A58;
  *(_QWORD *)(inited + 32) = qword_1EEC88A58;
  sub_1AC5DD768();
  v11 = v10;
  *(_QWORD *)(v0 + 416) = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC5147CC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 400), 0, 0);
}

void sub_1AC514820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1AC514880(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x1AC514A64);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

char *sub_1AC514A88(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1AC514AA4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1AC514AA4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C8);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_1AC514BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_1AC514820((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_1AC514C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_1AC5DCF4C();
  v11 = result;
  if (result)
  {
    result = sub_1AC5DCF64();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_1AC5DCF58();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1AC514820(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_1AC514D30(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1AC514D7C()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1AC514DB0 + *((int *)qword_1AC514F88 + (v0 >> 62))))();
}

uint64_t sub_1AC514DC0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_1AC514FA8(_QWORD *a1, _QWORD *a2)
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
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
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
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
  char v109;
  char v111;
  uint64_t *v112;
  uint64_t v113;
  unsigned int (*v114)(char *, uint64_t, uint64_t);
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  unsigned int (*v126)(uint64_t, uint64_t, uint64_t);
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unsigned int (*v135)(uint64_t, uint64_t, uint64_t);
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, uint64_t, uint64_t);
  int v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  void (*v149)(char *, uint64_t);
  char *v150;
  uint64_t v151;
  uint64_t v152;
  _QWORD *v153;
  uint64_t v154;
  _QWORD *v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD *v158;
  uint64_t v159;
  _QWORD *v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  unint64_t v167;
  char v168;
  char v169;
  uint64_t v170;
  _QWORD *v171;
  uint64_t v172;
  _QWORD *v173;
  uint64_t v174;
  int *v175;
  uint64_t v176;
  uint64_t v177;
  int v178;
  int v179;
  uint64_t v180;
  BOOL v181;
  int *v182;
  uint64_t v183;
  int v184;
  uint64_t v185;
  int v186;
  uint64_t v187;
  int *v188;
  int v189;
  int v190;
  int *v191;
  int v192;
  int *v193;
  char v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  int *v198;
  char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  char *v215;
  char *v216;
  char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  char *v230;
  uint64_t v231;

  v4 = sub_1AC5DD060();
  v205 = *(_QWORD *)(v4 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v199 = (char *)&v195 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v202 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v209 = (uint64_t)&v195 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830B0);
  v7 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v203 = (char *)&v195 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v204 = (uint64_t)&v195 - v10;
  MEMORY[0x1E0C80A78](v9);
  v206 = (uint64_t)&v195 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830A0);
  v13 = MEMORY[0x1E0C80A78](v12);
  v201 = (uint64_t)&v195 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v13);
  v200 = (uint64_t)&v195 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v208 = (uint64_t)&v195 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v207 = (uint64_t)&v195 - v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v210 = (uint64_t)&v195 - v22;
  MEMORY[0x1E0C80A78](v21);
  v24 = (char *)&v195 - v23;
  v25 = type metadata accessor for AVInfoTabMetadata();
  v26 = MEMORY[0x1E0C80A78](v25);
  v28 = (char *)&v195 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x1E0C80A78](v26);
  v30 = MEMORY[0x1E0C80A78](v29);
  v217 = (char *)&v195 - v31;
  v32 = MEMORY[0x1E0C80A78](v30);
  v216 = (char *)&v195 - v33;
  v34 = MEMORY[0x1E0C80A78](v32);
  v215 = (char *)&v195 - v35;
  v36 = MEMORY[0x1E0C80A78](v34);
  v214 = (uint64_t)&v195 - v37;
  v38 = MEMORY[0x1E0C80A78](v36);
  v212 = (uint64_t)&v195 - v39;
  v40 = MEMORY[0x1E0C80A78](v38);
  v41 = MEMORY[0x1E0C80A78](v40);
  v42 = MEMORY[0x1E0C80A78](v41);
  v213 = (uint64_t)&v195 - v43;
  v44 = MEMORY[0x1E0C80A78](v42);
  v223 = (uint64_t)&v195 - v45;
  v46 = MEMORY[0x1E0C80A78](v44);
  v219 = (uint64_t)&v195 - v47;
  v48 = MEMORY[0x1E0C80A78](v46);
  v225 = (uint64_t)&v195 - v49;
  v50 = MEMORY[0x1E0C80A78](v48);
  v220 = (uint64_t)&v195 - v51;
  v52 = MEMORY[0x1E0C80A78](v50);
  v222 = (uint64_t)&v195 - v53;
  v54 = MEMORY[0x1E0C80A78](v52);
  v230 = (char *)&v195 - v55;
  v56 = MEMORY[0x1E0C80A78](v54);
  v224 = (uint64_t)&v195 - v57;
  v58 = MEMORY[0x1E0C80A78](v56);
  v226 = (uint64_t)&v195 - v59;
  MEMORY[0x1E0C80A78](v58);
  v61 = MEMORY[0x1E0C80A78]((char *)&v195 - v60);
  v229 = (uint64_t)&v195 - v62;
  v63 = MEMORY[0x1E0C80A78](v61);
  v231 = (uint64_t)&v195 - v64;
  v65 = MEMORY[0x1E0C80A78](v63);
  v228 = (uint64_t)&v195 - v66;
  v67 = MEMORY[0x1E0C80A78](v65);
  v69 = (char *)&v195 - v68;
  v70 = MEMORY[0x1E0C80A78](v67);
  v72 = (char *)&v195 - v71;
  v73 = MEMORY[0x1E0C80A78](v70);
  v75 = (char *)&v195 - v74;
  v76 = MEMORY[0x1E0C80A78](v73);
  v78 = (char *)&v195 - v77;
  v79 = a1[1];
  v80 = a2[1];
  v211 = v81;
  v218 = v82;
  v221 = v83;
  v227 = v76;
  if (!v79)
  {
    if (!v80)
    {
LABEL_10:
      v197 = v4;
      sub_1AC51693C((uint64_t)a1, (uint64_t)&v195 - v77);
      sub_1AC51693C((uint64_t)a2, (uint64_t)v75);
      goto LABEL_11;
    }
LABEL_8:
    sub_1AC51693C((uint64_t)a1, (uint64_t)&v195 - v77);
    sub_1AC51693C((uint64_t)a2, (uint64_t)v75);
    goto LABEL_9;
  }
  if (!v80)
    goto LABEL_8;
  if (*a1 == *a2 && v79 == v80)
    goto LABEL_10;
  v197 = v4;
  v84 = sub_1AC5DD87C();
  sub_1AC51693C((uint64_t)a1, (uint64_t)v78);
  sub_1AC51693C((uint64_t)a2, (uint64_t)v75);
  if ((v84 & 1) == 0)
  {
LABEL_9:
    sub_1AC516980((uint64_t)v75);
    sub_1AC516980((uint64_t)v78);
LABEL_20:
    v87 = v229;
    v88 = (uint64_t)v230;
    sub_1AC51693C((uint64_t)a1, (uint64_t)v72);
    sub_1AC51693C((uint64_t)a2, (uint64_t)v69);
    goto LABEL_21;
  }
LABEL_11:
  v198 = (int *)v25;
  v85 = *((_QWORD *)v78 + 3);
  v86 = *((_QWORD *)v75 + 3);
  if (!v85)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980((uint64_t)v75);
    sub_1AC516980((uint64_t)v78);
    if (!v86)
      goto LABEL_17;
    goto LABEL_19;
  }
  if (!v86)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980((uint64_t)v75);
    sub_1AC516980((uint64_t)v78);
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  if (*((_QWORD *)v78 + 2) == *((_QWORD *)v75 + 2) && v85 == v86)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980((uint64_t)v75);
    sub_1AC516980((uint64_t)v78);
    swift_bridgeObjectRelease();
LABEL_17:
    sub_1AC51693C((uint64_t)a1, (uint64_t)v72);
    sub_1AC51693C((uint64_t)a2, (uint64_t)v69);
    goto LABEL_45;
  }
  v111 = sub_1AC5DD87C();
  swift_bridgeObjectRetain();
  sub_1AC516980((uint64_t)v75);
  sub_1AC516980((uint64_t)v78);
  swift_bridgeObjectRelease();
  sub_1AC51693C((uint64_t)a1, (uint64_t)v72);
  sub_1AC51693C((uint64_t)a2, (uint64_t)v69);
  v87 = v229;
  v88 = (uint64_t)v230;
  if ((v111 & 1) == 0)
  {
LABEL_21:
    sub_1AC516980((uint64_t)v69);
    sub_1AC516980((uint64_t)v72);
    v89 = (uint64_t)v28;
    v90 = v211;
    v92 = v225;
    v91 = v226;
LABEL_22:
    v93 = v228;
    v94 = v231;
LABEL_23:
    sub_1AC51693C((uint64_t)a1, v93);
    sub_1AC51693C((uint64_t)a2, v94);
LABEL_24:
    sub_1AC516980(v94);
    sub_1AC516980(v93);
    v95 = v220;
LABEL_25:
    sub_1AC51693C((uint64_t)a1, v87);
    v96 = v227;
    sub_1AC51693C((uint64_t)a2, v227);
LABEL_26:
    sub_1AC516980(v96);
    sub_1AC516980(v87);
    v97 = v223;
LABEL_27:
    sub_1AC51693C((uint64_t)a1, v91);
    v98 = v224;
    sub_1AC51693C((uint64_t)a2, v224);
LABEL_28:
    sub_1AC516980(v98);
    sub_1AC516980(v91);
LABEL_29:
    v99 = v221;
    sub_1AC51693C((uint64_t)a1, v88);
    v100 = v222;
    sub_1AC51693C((uint64_t)a2, v222);
LABEL_30:
    sub_1AC516980(v100);
    sub_1AC516980(v88);
LABEL_31:
    sub_1AC51693C((uint64_t)a1, v95);
    sub_1AC51693C((uint64_t)a2, v92);
LABEL_32:
    sub_1AC516980(v92);
    sub_1AC516980(v95);
LABEL_33:
    v101 = v219;
    sub_1AC51693C((uint64_t)a1, v219);
    sub_1AC51693C((uint64_t)a2, v97);
LABEL_34:
    sub_1AC516980(v97);
    sub_1AC516980(v101);
    v103 = (uint64_t)v216;
    v102 = (uint64_t)v217;
    v104 = (uint64_t)v215;
LABEL_35:
    v105 = v213;
    sub_1AC51693C((uint64_t)a1, v213);
    sub_1AC51693C((uint64_t)a2, v99);
LABEL_36:
    sub_1AC516980(v99);
    sub_1AC516980(v105);
LABEL_37:
    v106 = v218;
    sub_1AC51693C((uint64_t)a1, v218);
    v107 = v212;
    sub_1AC51693C((uint64_t)a2, v212);
LABEL_38:
    sub_1AC516980(v107);
    sub_1AC516980(v106);
LABEL_39:
    v108 = v214;
    sub_1AC51693C((uint64_t)a1, v214);
    sub_1AC51693C((uint64_t)a2, v104);
LABEL_40:
    sub_1AC516980(v104);
    sub_1AC516980(v108);
    sub_1AC51693C((uint64_t)a1, v103);
    sub_1AC51693C((uint64_t)a2, v102);
LABEL_41:
    sub_1AC516980(v102);
    sub_1AC516980(v103);
    sub_1AC51693C((uint64_t)a1, v90);
    sub_1AC51693C((uint64_t)a2, v89);
    goto LABEL_42;
  }
LABEL_45:
  v112 = &qword_1EEC830A0;
  sub_1AC507378((uint64_t)&v72[v198[6]], (uint64_t)v24, &qword_1EEC830A0);
  v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v114 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v113 - 8) + 48);
  if (v114(v24, 1, v113) == 1)
  {
    v196 = 0;
    v115 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v116 = &v24[*(int *)(v113 + 64)];
    v115 = *((_QWORD *)v116 + 1);
    v196 = *(_QWORD *)v116;
    v112 = &qword_1EEC830B0;
  }
  sub_1AC5073BC((uint64_t)v24, v112);
  v117 = v210;
  sub_1AC507378((uint64_t)&v69[v198[6]], v210, &qword_1EEC830A0);
  if (v114((char *)v117, 1, v113) == 1)
  {
    sub_1AC5073BC(v117, &qword_1EEC830A0);
    v89 = (uint64_t)v28;
    v90 = v211;
    v91 = v226;
    if (!v115)
    {
      v118 = 0;
      goto LABEL_58;
    }
LABEL_56:
    swift_bridgeObjectRetain();
    sub_1AC516980((uint64_t)v69);
    sub_1AC516980((uint64_t)v72);
    swift_bridgeObjectRelease_n();
    v92 = v225;
    v87 = v229;
    v88 = (uint64_t)v230;
    goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  v119 = (uint64_t *)(v117 + *(int *)(v113 + 64));
  v120 = v117;
  v121 = *v119;
  v118 = v119[1];
  sub_1AC5073BC(v120, &qword_1EEC830B0);
  v89 = (uint64_t)v28;
  v90 = v211;
  if (!v115)
  {
    v91 = v226;
LABEL_58:
    v94 = v231;
    sub_1AC516980((uint64_t)v69);
    sub_1AC516980((uint64_t)v72);
    v88 = (uint64_t)v230;
    if (v118)
    {
      swift_bridgeObjectRelease();
      v92 = v225;
      v93 = v228;
      v87 = v229;
      goto LABEL_23;
    }
    goto LABEL_60;
  }
  v91 = v226;
  if (!v118)
    goto LABEL_56;
  if (v196 == v121 && v115 == v118)
  {
    swift_bridgeObjectRelease();
    sub_1AC516980((uint64_t)v69);
    sub_1AC516980((uint64_t)v72);
    swift_bridgeObjectRelease();
    v94 = v231;
LABEL_60:
    v93 = v228;
    sub_1AC51693C((uint64_t)a1, v228);
    sub_1AC51693C((uint64_t)a2, v94);
    goto LABEL_61;
  }
  LODWORD(v210) = sub_1AC5DD87C();
  swift_bridgeObjectRelease();
  sub_1AC516980((uint64_t)v69);
  sub_1AC516980((uint64_t)v72);
  swift_bridgeObjectRelease();
  v93 = v228;
  sub_1AC51693C((uint64_t)a1, v228);
  v94 = v231;
  sub_1AC51693C((uint64_t)a2, v231);
  v92 = v225;
  v87 = v229;
  v88 = (uint64_t)v230;
  if ((v210 & 1) == 0)
    goto LABEL_24;
LABEL_61:
  v122 = v93 + v198[6];
  v123 = &qword_1EEC830A0;
  v124 = v207;
  sub_1AC507378(v122, v207, &qword_1EEC830A0);
  v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v126 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v125 - 8) + 48);
  if (v126(v124, 1, v125) == 1)
  {
    v210 = 0;
    v127 = 0;
  }
  else
  {
    v128 = (uint64_t *)(v124 + *(int *)(v125 + 48));
    v127 = v128[1];
    v210 = *v128;
    swift_bridgeObjectRelease();
    v123 = &qword_1EEC830B0;
  }
  sub_1AC5073BC(v124, v123);
  v129 = v208;
  sub_1AC507378(v231 + v198[6], v208, &qword_1EEC830A0);
  if (v126(v129, 1, v125) == 1)
  {
    sub_1AC5073BC(v129, &qword_1EEC830A0);
    v95 = v220;
    if (!v127)
    {
      v130 = 0;
      goto LABEL_76;
    }
    goto LABEL_72;
  }
  v131 = (uint64_t *)(v129 + *(int *)(v125 + 48));
  v132 = *v131;
  v130 = v131[1];
  swift_bridgeObjectRelease();
  sub_1AC5073BC(v129, &qword_1EEC830B0);
  if (!v127)
  {
    v95 = v220;
LABEL_76:
    v88 = (uint64_t)v230;
    sub_1AC516980(v231);
    sub_1AC516980(v228);
    v87 = v229;
    if (v130)
    {
      swift_bridgeObjectRelease();
      v92 = v225;
      goto LABEL_25;
    }
    goto LABEL_78;
  }
  v95 = v220;
  if (!v130)
  {
LABEL_72:
    swift_bridgeObjectRetain();
    sub_1AC516980(v231);
    sub_1AC516980(v228);
    swift_bridgeObjectRelease_n();
    v92 = v225;
    v87 = v229;
    v88 = (uint64_t)v230;
    goto LABEL_25;
  }
  if (v210 == v132 && v127 == v130)
  {
    swift_bridgeObjectRelease();
    sub_1AC516980(v231);
    sub_1AC516980(v228);
    swift_bridgeObjectRelease();
    v87 = v229;
    v88 = (uint64_t)v230;
LABEL_78:
    sub_1AC51693C((uint64_t)a1, v87);
    sub_1AC51693C((uint64_t)a2, v227);
    v92 = v225;
    goto LABEL_79;
  }
  LODWORD(v210) = sub_1AC5DD87C();
  swift_bridgeObjectRelease();
  sub_1AC516980(v231);
  sub_1AC516980(v228);
  swift_bridgeObjectRelease();
  v87 = v229;
  sub_1AC51693C((uint64_t)a1, v229);
  v96 = v227;
  sub_1AC51693C((uint64_t)a2, v227);
  v92 = v225;
  v88 = (uint64_t)v230;
  if ((v210 & 1) == 0)
    goto LABEL_26;
LABEL_79:
  v133 = v200;
  sub_1AC507378(v87 + v198[6], v200, &qword_1EEC830A0);
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  v135 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v134 - 8) + 48);
  if (v135(v133, 1, v134) == 1)
  {
    sub_1AC5073BC(v133, &qword_1EEC830A0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v205 + 56))(v206, 1, 1, v197);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1AC5073F8(v133, v206, &qword_1EEC830B0);
  }
  v136 = v201;
  sub_1AC507378(v227 + v198[6], v201, &qword_1EEC830A0);
  if (v135(v136, 1, v134) == 1)
  {
    sub_1AC5073BC(v136, &qword_1EEC830A0);
    v137 = v205;
    v138 = v204;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v205 + 56))(v204, 1, 1, v197);
    v139 = v209;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v138 = v204;
    sub_1AC5073F8(v136, v204, &qword_1EEC830B0);
    v139 = v209;
    v137 = v205;
  }
  v140 = v139 + *(int *)(v202 + 48);
  sub_1AC507378(v206, v209, &qword_1EEC830B0);
  v231 = v140;
  v141 = v140;
  v142 = v209;
  sub_1AC507378(v138, v141, &qword_1EEC830B0);
  v143 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v137 + 48);
  if (v143(v142, 1, v197) == 1)
  {
    sub_1AC5073BC(v138, &qword_1EEC830B0);
    v142 = v209;
    sub_1AC5073BC(v206, &qword_1EEC830B0);
    sub_1AC516980(v227);
    sub_1AC516980(v229);
    v144 = v143(v231, 1, v197);
    v97 = v223;
    if (v144 == 1)
    {
      sub_1AC5073BC(v142, &qword_1EEC830B0);
      v91 = v226;
      sub_1AC51693C((uint64_t)a1, v226);
      v98 = v224;
      sub_1AC51693C((uint64_t)a2, v224);
      goto LABEL_94;
    }
LABEL_90:
    sub_1AC5073BC(v142, &qword_1EEC830B8);
    v91 = v226;
    goto LABEL_27;
  }
  sub_1AC507378(v142, (uint64_t)v203, &qword_1EEC830B0);
  v145 = v231;
  if (v143(v231, 1, v197) == 1)
  {
    sub_1AC5073BC(v204, &qword_1EEC830B0);
    sub_1AC5073BC(v206, &qword_1EEC830B0);
    sub_1AC516980(v227);
    sub_1AC516980(v229);
    (*(void (**)(char *, uint64_t))(v205 + 8))(v203, v197);
    v97 = v223;
    goto LABEL_90;
  }
  v146 = v199;
  v147 = v145;
  v148 = v197;
  (*(void (**)(char *, uint64_t, uint64_t))(v205 + 32))(v199, v147, v197);
  sub_1AC5169D0();
  v197 = v148;
  LODWORD(v231) = sub_1AC5DD6E4();
  v149 = *(void (**)(char *, uint64_t))(v205 + 8);
  v150 = v146;
  v151 = v197;
  v149(v150, v197);
  sub_1AC5073BC(v204, &qword_1EEC830B0);
  sub_1AC5073BC(v206, &qword_1EEC830B0);
  sub_1AC516980(v227);
  sub_1AC516980(v229);
  v149(v203, v151);
  sub_1AC5073BC(v209, &qword_1EEC830B0);
  v91 = v226;
  sub_1AC51693C((uint64_t)a1, v226);
  v98 = v224;
  sub_1AC51693C((uint64_t)a2, v224);
  v97 = v223;
  if ((v231 & 1) == 0)
    goto LABEL_28;
LABEL_94:
  v152 = v198[7];
  v153 = (_QWORD *)(v91 + v152);
  v154 = *(_QWORD *)(v91 + v152 + 8);
  v155 = (_QWORD *)(v98 + v152);
  v156 = v155[1];
  if (!v154)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980(v98);
    sub_1AC516980(v226);
    if (!v156)
      goto LABEL_100;
LABEL_102:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  if (!v156)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980(v98);
    sub_1AC516980(v226);
    goto LABEL_102;
  }
  if (*v153 == *v155 && v154 == v156)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980(v224);
    sub_1AC516980(v226);
    swift_bridgeObjectRelease();
LABEL_100:
    sub_1AC51693C((uint64_t)a1, v88);
    v100 = v222;
    sub_1AC51693C((uint64_t)a2, v222);
    goto LABEL_104;
  }
  LODWORD(v231) = sub_1AC5DD87C();
  swift_bridgeObjectRetain();
  sub_1AC516980(v224);
  sub_1AC516980(v226);
  swift_bridgeObjectRelease();
  sub_1AC51693C((uint64_t)a1, v88);
  v100 = v222;
  sub_1AC51693C((uint64_t)a2, v222);
  v99 = v221;
  if ((v231 & 1) == 0)
    goto LABEL_30;
LABEL_104:
  v157 = v198[8];
  v158 = (_QWORD *)(v88 + v157);
  v159 = *(_QWORD *)(v88 + v157 + 8);
  v160 = (_QWORD *)(v100 + v157);
  v161 = v160[1];
  if (!v159)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980(v100);
    sub_1AC516980(v88);
    if (!v161)
      goto LABEL_110;
LABEL_112:
    swift_bridgeObjectRelease();
    v99 = v221;
    goto LABEL_31;
  }
  if (!v161)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980(v100);
    sub_1AC516980(v88);
    goto LABEL_112;
  }
  if (*v158 == *v160 && v159 == v161)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980(v222);
    sub_1AC516980(v88);
    swift_bridgeObjectRelease();
LABEL_110:
    sub_1AC51693C((uint64_t)a1, v95);
    sub_1AC51693C((uint64_t)a2, v92);
    goto LABEL_114;
  }
  LODWORD(v231) = sub_1AC5DD87C();
  swift_bridgeObjectRetain();
  sub_1AC516980(v222);
  sub_1AC516980(v88);
  swift_bridgeObjectRelease();
  sub_1AC51693C((uint64_t)a1, v95);
  sub_1AC51693C((uint64_t)a2, v92);
  v99 = v221;
  if ((v231 & 1) == 0)
    goto LABEL_32;
LABEL_114:
  v162 = v198[10];
  v164 = *(_QWORD *)(v95 + v162);
  v163 = *(_QWORD *)(v95 + v162 + 8);
  v165 = (uint64_t *)(v92 + v162);
  v166 = *v165;
  v167 = v165[1];
  if (v163 >> 60 == 15)
  {
    sub_1AC5169BC(v166, v167);
    sub_1AC516980(v92);
    sub_1AC516980(v95);
    if (v167 >> 60 == 15)
    {
      sub_1AC50F024(v164, v163);
      v101 = v219;
      sub_1AC51693C((uint64_t)a1, v219);
      v97 = v223;
      sub_1AC51693C((uint64_t)a2, v223);
      goto LABEL_121;
    }
LABEL_119:
    sub_1AC50F024(v164, v163);
    sub_1AC50F024(v166, v167);
    v99 = v221;
    v97 = v223;
    goto LABEL_33;
  }
  if (v167 >> 60 == 15)
  {
    sub_1AC5039B0(v164, v163);
    sub_1AC5039B0(v164, v163);
    sub_1AC516980(v225);
    sub_1AC516980(v220);
    sub_1AC50F024(v164, v163);
    goto LABEL_119;
  }
  sub_1AC5169BC(v164, v163);
  sub_1AC5169BC(v166, v167);
  sub_1AC5169BC(v164, v163);
  sub_1AC514D30(v164, v163);
  v169 = v168;
  sub_1AC50F024(v166, v167);
  sub_1AC50F024(v164, v163);
  sub_1AC516980(v225);
  sub_1AC516980(v220);
  sub_1AC50F024(v164, v163);
  v101 = v219;
  sub_1AC51693C((uint64_t)a1, v219);
  v97 = v223;
  sub_1AC51693C((uint64_t)a2, v223);
  v99 = v221;
  if ((v169 & 1) == 0)
    goto LABEL_34;
LABEL_121:
  v170 = v198[9];
  v171 = (_QWORD *)(v101 + v170);
  v172 = *(_QWORD *)(v101 + v170 + 8);
  v173 = (_QWORD *)(v97 + v170);
  v174 = v173[1];
  if (!v172)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980(v97);
    sub_1AC516980(v219);
    v103 = (uint64_t)v216;
    v102 = (uint64_t)v217;
    v104 = (uint64_t)v215;
    if (!v174)
      goto LABEL_127;
LABEL_129:
    swift_bridgeObjectRelease();
    v99 = v221;
    goto LABEL_35;
  }
  v103 = (uint64_t)v216;
  v102 = (uint64_t)v217;
  v104 = (uint64_t)v215;
  if (!v174)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980(v223);
    sub_1AC516980(v219);
    goto LABEL_129;
  }
  if (*v171 == *v173 && v172 == v174)
  {
    swift_bridgeObjectRetain();
    sub_1AC516980(v223);
    sub_1AC516980(v219);
    swift_bridgeObjectRelease();
LABEL_127:
    v105 = v213;
    sub_1AC51693C((uint64_t)a1, v213);
    v99 = v221;
    sub_1AC51693C((uint64_t)a2, v221);
    goto LABEL_131;
  }
  LODWORD(v231) = sub_1AC5DD87C();
  swift_bridgeObjectRetain();
  sub_1AC516980(v223);
  sub_1AC516980(v219);
  swift_bridgeObjectRelease();
  v105 = v213;
  sub_1AC51693C((uint64_t)a1, v213);
  v99 = v221;
  sub_1AC51693C((uint64_t)a2, v221);
  if ((v231 & 1) == 0)
    goto LABEL_36;
LABEL_131:
  v175 = v198;
  v176 = v105;
  v177 = v99;
  v178 = *(unsigned __int8 *)(v176 + v198[13]);
  sub_1AC516980(v176);
  v179 = *(unsigned __int8 *)(v177 + v175[13]);
  sub_1AC516980(v177);
  if (v178 == 4)
  {
    if (v179 != 4)
      goto LABEL_37;
    v106 = v218;
    sub_1AC51693C((uint64_t)a1, v218);
    v107 = v212;
    sub_1AC51693C((uint64_t)a2, v212);
  }
  else
  {
    if (v179 == 4)
      goto LABEL_37;
    sub_1AC51693C((uint64_t)a1, v218);
    v180 = v212;
    sub_1AC51693C((uint64_t)a2, v212);
    v181 = v178 == v179;
    v106 = v218;
    v107 = v180;
    if (!v181)
      goto LABEL_38;
  }
  v182 = v198;
  v183 = v106;
  v184 = *(unsigned __int8 *)(v106 + v198[14]);
  sub_1AC516980(v183);
  v185 = v107;
  v186 = *(unsigned __int8 *)(v107 + v182[14]);
  sub_1AC516980(v185);
  if (v184 == 4)
  {
    if (v186 != 4)
      goto LABEL_39;
    v108 = v214;
    sub_1AC51693C((uint64_t)a1, v214);
    sub_1AC51693C((uint64_t)a2, v104);
  }
  else
  {
    if (v186 == 4)
      goto LABEL_39;
    v187 = v214;
    sub_1AC51693C((uint64_t)a1, v214);
    sub_1AC51693C((uint64_t)a2, v104);
    v181 = v184 == v186;
    v108 = v187;
    if (!v181)
      goto LABEL_40;
  }
  v188 = v198;
  v189 = *(unsigned __int8 *)(v108 + v198[15]);
  sub_1AC516980(v108);
  v190 = *(unsigned __int8 *)(v104 + v188[15]);
  sub_1AC516980(v104);
  sub_1AC51693C((uint64_t)a1, v103);
  sub_1AC51693C((uint64_t)a2, v102);
  if (v189 != v190)
    goto LABEL_41;
  v191 = v198;
  v192 = *(unsigned __int8 *)(v103 + v198[17]);
  sub_1AC516980(v103);
  LODWORD(v191) = *(unsigned __int8 *)(v102 + v191[17]);
  sub_1AC516980(v102);
  sub_1AC51693C((uint64_t)a1, v90);
  sub_1AC51693C((uint64_t)a2, v89);
  if (v192 == (_DWORD)v191)
  {
    v193 = v198;
    v194 = *(_BYTE *)(v90 + v198[18]);
    sub_1AC516980(v90);
    LOBYTE(v193) = *(_BYTE *)(v89 + v193[18]);
    sub_1AC516980(v89);
    v109 = v194 ^ v193 ^ 1;
    return v109 & 1;
  }
LABEL_42:
  sub_1AC516980(v89);
  sub_1AC516980(v90);
  v109 = 0;
  return v109 & 1;
}

uint64_t sub_1AC51693C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AVInfoTabMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AC516980(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AVInfoTabMetadata();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AC5169BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1AC5039B0(a1, a2);
  return a1;
}

unint64_t sub_1AC5169D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC83FA8;
  if (!qword_1EEC83FA8)
  {
    v1 = sub_1AC5DD060();
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CB08B8], v1);
    atomic_store(result, &qword_1EEC83FA8);
  }
  return result;
}

unint64_t sub_1AC516A18(unint64_t result)
{
  if (result >= 4)
    return 4;
  return result;
}

uint64_t sub_1AC516A28(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1AC516A40()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  id v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 80) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F7550;
  v2 = (void *)*MEMORY[0x1E0C8A870];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0C8A870];
  sub_1AC5DD768();
  v3 = v2;
  *(_QWORD *)(v0 + 88) = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC516AE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 80);
  swift_release();
  sub_1AC511F5C(v1);
  *(_QWORD *)(v0 + 96) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return swift_task_switch();
}

uint64_t sub_1AC516B60()
{
  uint64_t v0;
  _QWORD *v1;

  if (!*(_QWORD *)(v0 + 96))
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830D0);
  *(_QWORD *)(v0 + 104) = sub_1AC5DD0B4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_1AC516C08;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC516C08()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC516C84(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1AC516C9C()
{
  uint64_t v0;
  uint64_t inited;
  __CFString *v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 80) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F7550;
  *(_QWORD *)(inited + 32) = CFSTR("avkt/com.apple.avkit.programScheduledTime");
  sub_1AC5DD768();
  v2 = CFSTR("avkt/com.apple.avkit.programScheduledTime");
  *(_QWORD *)(v0 + 88) = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC516D40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 80);
  swift_release();
  sub_1AC511F5C(v1);
  *(_QWORD *)(v0 + 96) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return swift_task_switch();
}

uint64_t sub_1AC516DBC()
{
  uint64_t v0;
  _QWORD *v1;

  if (!*(_QWORD *)(v0 + 96))
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830D0);
  *(_QWORD *)(v0 + 104) = sub_1AC5DD0B4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_1AC516E64;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC516E64()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC516EE0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
}

uint64_t sub_1AC516F14()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
}

uint64_t sub_1AC516F4C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_1AC516F64()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  void *v3;
  id v4;
  id v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 88) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F6DF0;
  if (qword_1EEC83188 != -1)
    swift_once();
  v2 = (void *)qword_1EEC88A60;
  v3 = (void *)*MEMORY[0x1E0C8A9A0];
  *(_QWORD *)(inited + 32) = qword_1EEC88A60;
  *(_QWORD *)(inited + 40) = v3;
  sub_1AC5DD768();
  v4 = v2;
  v5 = v3;
  *(_QWORD *)(v0 + 96) = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC517048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 88);
  swift_release();
  sub_1AC511F5C(v1);
  *(_QWORD *)(v0 + 104) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return swift_task_switch();
}

uint64_t sub_1AC5170C4()
{
  uint64_t v0;
  _QWORD *v1;

  if (!*(_QWORD *)(v0 + 104))
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830D0);
  *(_QWORD *)(v0 + 112) = sub_1AC5DD0B4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v1;
  *v1 = v0;
  v1[1] = sub_1AC51716C;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC51716C()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC5171E8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
}

uint64_t sub_1AC517220(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1AC517238()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  id v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 80) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F7550;
  v2 = (void *)*MEMORY[0x1E0C8A848];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0C8A848];
  sub_1AC5DD768();
  v3 = v2;
  *(_QWORD *)(v0 + 88) = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC5172DC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = a1;
  return swift_task_switch();
}

void sub_1AC5172F4()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 88) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F6DF0;
  v2 = (void *)objc_opt_self();
  sub_1AC5DD714();
  v3 = (void *)sub_1AC5DD6F0();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v3, *MEMORY[0x1E0C8A9F8]);

  if (v4)
  {
    *(_QWORD *)(inited + 32) = v4;
    sub_1AC5DD714();
    v5 = (void *)sub_1AC5DD6F0();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v5, *MEMORY[0x1E0C8A9E8]);

    if (v6)
    {
      *(_QWORD *)(inited + 40) = v6;
      sub_1AC5DD768();
      *(_QWORD *)(v0 + 96) = sub_1AC5DD75C();
      sub_1AC5DD750();
      swift_task_switch();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1AC517464()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 88);
  swift_release();
  sub_1AC511F5C(v1);
  *(_QWORD *)(v0 + 104) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return swift_task_switch();
}

uint64_t sub_1AC5174E0()
{
  uint64_t v0;
  _QWORD *v1;

  if (!*(_QWORD *)(v0 + 104))
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830D0);
  *(_QWORD *)(v0 + 112) = sub_1AC5DD0B4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v1;
  *v1 = v0;
  v1[1] = sub_1AC517588;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC517588()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC517604(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = a1;
  return swift_task_switch();
}

void sub_1AC51761C()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 88) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F6DF0;
  v2 = (void *)objc_opt_self();
  sub_1AC5DD714();
  v3 = (void *)sub_1AC5DD6F0();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v3, *MEMORY[0x1E0C8A9D0]);

  if (v4)
  {
    *(_QWORD *)(inited + 32) = v4;
    sub_1AC5DD714();
    v5 = (void *)sub_1AC5DD6F0();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v5, *MEMORY[0x1E0C8A9F8]);

    if (v6)
    {
      *(_QWORD *)(inited + 40) = v6;
      sub_1AC5DD768();
      *(_QWORD *)(v0 + 96) = sub_1AC5DD75C();
      sub_1AC5DD750();
      swift_task_switch();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1AC51778C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 88);
  swift_release();
  sub_1AC511F5C(v1);
  *(_QWORD *)(v0 + 104) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return swift_task_switch();
}

uint64_t sub_1AC517808()
{
  uint64_t v0;
  _QWORD *v1;

  if (!*(_QWORD *)(v0 + 104))
    return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xF000000000000000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830C8);
  *(_QWORD *)(v0 + 112) = sub_1AC5DD0C0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v1;
  *v1 = v0;
  v1[1] = sub_1AC5178B0;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC5178B0()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC51792C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
}

uint64_t sub_1AC517960()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xF000000000000000);
}

uint64_t sub_1AC517998(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 112) = a1;
  return swift_task_switch();
}

uint64_t sub_1AC5179B0()
{
  _QWORD *v0;
  uint64_t inited;
  void *v2;
  id v3;

  v0[15] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  inited = swift_initStackObject();
  v0[16] = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F7550;
  if (qword_1EEC83190 != -1)
    swift_once();
  v2 = (void *)qword_1EEC88A68;
  *(_QWORD *)(inited + 32) = qword_1EEC88A68;
  v0[17] = sub_1AC5DD768();
  v3 = v2;
  v0[18] = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC517A8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[16];
  swift_release();
  sub_1AC511F5C(v1);
  v0[19] = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  v0[20] = v3;
  swift_arrayDestroy();
  return swift_task_switch();
}

uint64_t sub_1AC517B10()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  id v3;

  if (!*(_QWORD *)(v0 + 152))
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(0x400000000);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 168) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F7550;
  if (qword_1EEC837B0 != -1)
    swift_once();
  v2 = (void *)qword_1EEC88A90;
  *(_QWORD *)(inited + 32) = qword_1EEC88A90;
  v3 = v2;
  *(_QWORD *)(v0 + 176) = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC517BE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 168);
  swift_release();
  sub_1AC511F5C(v1);
  *(_QWORD *)(v0 + 184) = v2;
  swift_setDeallocating();
  swift_arrayDestroy();
  return swift_task_switch();
}

uint64_t sub_1AC517C5C()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_QWORD *)(v0 + 184))
  {
    *(_QWORD *)(v0 + 192) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84020);
    *(_QWORD *)(v0 + 200) = sub_1AC5DD0A8();
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v1;
    *v1 = v0;
    v1[1] = sub_1AC517D10;
    return sub_1AC5DD7B0();
  }
  else
  {

    return (*(uint64_t (**)(uint64_t))(v0 + 8))(0x400000000);
  }
}

uint64_t sub_1AC517D10()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC517D8C()
{
  uint64_t v0;
  void *v1;
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(void **)(v0 + 96);
  if (v1)
  {
    objc_msgSend(*(id *)(v0 + 96), sel_floatValue);
    v3 = v2;

    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  *(_BYTE *)(v0 + 240) = v1 == 0;
  *(_QWORD *)(v0 + 216) = v4;
  *(_QWORD *)(v0 + 224) = sub_1AC5DD0A8();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v5;
  *v5 = v0;
  v5[1] = sub_1AC517E40;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC517E40()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

void sub_1AC517EBC()
{
  uint64_t v0;
  void *v1;
  char v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v1 = *(void **)(v0 + 104);
  if (!v1)
  {
    v7 = *(void **)(v0 + 152);

    v6 = 0x400000000;
    goto LABEL_7;
  }
  v2 = *(_BYTE *)(v0 + 240);
  v3 = *(void **)(v0 + 184);
  v4 = *(void **)(v0 + 152);
  v5 = (unint64_t)objc_msgSend(*(id *)(v0 + 104), sel_integerValue);

  if ((v2 & 1) != 0)
  {
    v6 = 0x400000000;
LABEL_7:
    (*(void (**)(uint64_t))(v0 + 8))(v6);
    return;
  }
  if (v5 <= 3)
  {
    v6 = *(_QWORD *)(v0 + 216) | (v5 << 32);
    goto LABEL_7;
  }
  __break(1u);
}

uint64_t sub_1AC517F64()
{
  uint64_t v0;
  _QWORD *v1;

  *(_BYTE *)(v0 + 240) = 1;
  *(_QWORD *)(v0 + 216) = 0;
  *(_QWORD *)(v0 + 224) = sub_1AC5DD0A8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v1;
  *v1 = v0;
  v1[1] = sub_1AC517E40;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC517FE4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 152);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(0x400000000);
}

uint64_t sub_1AC518020(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = a1;
  return swift_task_switch();
}

void sub_1AC518038()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831C0);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 88) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1AC5F6DF0;
  v2 = (void *)objc_opt_self();
  sub_1AC5DD714();
  v3 = (void *)sub_1AC5DD6F0();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v3, *MEMORY[0x1E0C8A9F8]);

  if (v4)
  {
    *(_QWORD *)(inited + 32) = v4;
    sub_1AC5DD714();
    v5 = (void *)sub_1AC5DD6F0();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v2, sel_identifierForKey_keySpace_, v5, *MEMORY[0x1E0C8A9E0]);

    if (v6)
    {
      *(_QWORD *)(inited + 40) = v6;
      sub_1AC5DD768();
      *(_QWORD *)(v0 + 96) = sub_1AC5DD75C();
      sub_1AC5DD750();
      swift_task_switch();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1AC5181A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 88);
  swift_release();
  sub_1AC511F5C(v1);
  *(_QWORD *)(v0 + 104) = v2;
  swift_setDeallocating();
  type metadata accessor for AVMetadataIdentifier(0);
  swift_arrayDestroy();
  return swift_task_switch();
}

uint64_t sub_1AC518224()
{
  uint64_t v0;
  _QWORD *v1;

  if (!*(_QWORD *)(v0 + 104))
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830D0);
  *(_QWORD *)(v0 + 112) = sub_1AC5DD0B4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v1;
  *v1 = v0;
  v1[1] = sub_1AC5182C8;
  return sub_1AC5DD7B0();
}

uint64_t sub_1AC5182C8()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AC518344()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = *(id *)(v0 + 72);
  v2 = *(void **)(v0 + 104);
  if (v1)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_shared);
    v4 = (void *)sub_1AC5DD6F0();
    swift_bridgeObjectRelease();
    v1 = objc_msgSend(v3, sel_findRatingString_, v4);

  }
  else
  {

  }
  return (*(uint64_t (**)(id))(v0 + 8))(v1);
}

uint64_t sub_1AC5183F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1AC51842C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return swift_task_switch();
}

uint64_t sub_1AC518444()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = sub_1AC5DD768();
  *(_QWORD *)(v0 + 40) = sub_1AC5DD75C();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC5184B0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);
  swift_release();
  *(_QWORD *)(v0 + 48) = objc_msgSend(v1, sel_asset);
  return swift_task_switch();
}

void sub_1AC51850C()
{
  uint64_t v0;
  double v1;
  double v2;
  unsigned int v4;
  uint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;

  objc_msgSend(*(id *)(v0 + 48), sel_maximumVideoResolution);
  *(double *)(v0 + 56) = v1;
  *(double *)(v0 + 64) = v2;
  if (v2 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    if (v1 < 3648.0 && v2 < 3648.0)
      v4 = 2;
    else
      v4 = 3;
    if (v2 < 720.0 && v1 < 1280.0)
      v6 = 1;
    else
      v6 = v4;
  }
  v7 = objc_msgSend(*(id *)(v0 + 24), sel_tracks);
  sub_1AC519B80(0, &qword_1EEC83168);
  v8 = sub_1AC5DD744();

  v31 = MEMORY[0x1E0DEE9D8];
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_1AC5DD864();
    swift_bridgeObjectRelease();
    if (v9)
      goto LABEL_17;
LABEL_36:
    swift_bridgeObjectRelease();
    v22 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v0 + 72) = MEMORY[0x1E0DEE9D8];
    if ((v22 & 0x8000000000000000) == 0)
      goto LABEL_37;
    goto LABEL_51;
  }
  v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v9)
    goto LABEL_36;
LABEL_17:
  if (v9 < 1)
  {
    __break(1u);
    return;
  }
  v30 = v6;
  for (i = 0; i != v9; ++i)
  {
    if ((v8 & 0xC000000000000001) != 0)
      v11 = (id)MEMORY[0x1AF43DD40](i, v8);
    else
      v11 = *(id *)(v8 + 8 * i + 32);
    v12 = v11;
    v13 = objc_msgSend(v11, sel_assetTrack);
    if (!v13)
    {
LABEL_19:

      continue;
    }
    v14 = v13;
    v15 = objc_msgSend(v13, sel_mediaType);

    v16 = sub_1AC5DD714();
    v18 = v17;
    if (v16 == sub_1AC5DD714() && v18 == v19)
    {
      swift_bridgeObjectRelease_n();

    }
    else
    {
      v21 = sub_1AC5DD87C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      if ((v21 & 1) == 0)
        goto LABEL_19;
    }
    sub_1AC5DD828();
    sub_1AC5DD840();
    sub_1AC5DD84C();
    sub_1AC5DD834();
  }
  swift_bridgeObjectRelease();
  v22 = v31;
  v6 = v30;
  *(_QWORD *)(v0 + 72) = v31;
  if (v31 < 0)
    goto LABEL_51;
LABEL_37:
  if ((v22 & 0x4000000000000000) == 0)
  {
    v23 = *(_QWORD *)(v22 + 16);
    *(_QWORD *)(v0 + 80) = v23;
    if (v23)
      goto LABEL_39;
    goto LABEL_47;
  }
LABEL_51:
  while (1)
  {
    swift_bridgeObjectRetain();
    v29 = sub_1AC5DD864();
    swift_release();
    *(_QWORD *)(v0 + 80) = v29;
    if (!v29)
      break;
LABEL_39:
    v24 = 0;
    while (1)
    {
      *(_BYTE *)(v0 + 136) = v6;
      v25 = *(_QWORD *)(v0 + 72);
      if ((v25 & 0xC000000000000001) != 0)
      {
        v26 = (id)MEMORY[0x1AF43DD40](v24);
      }
      else
      {
        if (v24 >= *(_QWORD *)(v25 + 16))
          goto LABEL_50;
        v26 = *(id *)(v25 + 8 * v24 + 32);
      }
      v27 = v26;
      *(_QWORD *)(v0 + 88) = v26;
      *(_QWORD *)(v0 + 96) = v24 + 1;
      if (__OFADD__(v24, 1))
        break;
      if (!objc_msgSend(v26, sel_isEnabled))
      {
        *(_QWORD *)(v0 + 104) = sub_1AC5DD75C();
        sub_1AC5DD750();
        swift_task_switch();
        return;
      }

      v24 = *(_QWORD *)(v0 + 96);
      if (v24 == *(_QWORD *)(v0 + 80))
        goto LABEL_47;
    }
    __break(1u);
LABEL_50:
    __break(1u);
  }
LABEL_47:
  v28 = *(void **)(v0 + 48);
  swift_release();

  (*(void (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_1AC5188E0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 88);
  swift_release();
  *(_QWORD *)(v0 + 112) = objc_msgSend(v1, sel_assetTrack);
  return swift_task_switch();
}

void sub_1AC51893C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  if (*(_QWORD *)(v0 + 112))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830C0);
    *(_QWORD *)(v0 + 120) = sub_1AC5DD09C();
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v1;
    *v1 = v0;
    v1[1] = sub_1AC518AD0;
    sub_1AC5DD7B0();
  }
  else
  {

    v2 = *(unsigned __int8 *)(v0 + 136);
    v3 = *(_QWORD *)(v0 + 96);
    if (v3 == *(_QWORD *)(v0 + 80))
    {
LABEL_11:
      v7 = *(void **)(v0 + 48);
      swift_release();

      (*(void (**)(uint64_t))(v0 + 8))(v2);
    }
    else
    {
      while (1)
      {
        *(_BYTE *)(v0 + 136) = v2;
        v4 = *(_QWORD *)(v0 + 72);
        if ((v4 & 0xC000000000000001) != 0)
        {
          v5 = (id)MEMORY[0x1AF43DD40](v3);
        }
        else
        {
          if (v3 >= *(_QWORD *)(v4 + 16))
            goto LABEL_14;
          v5 = *(id *)(v4 + 8 * v3 + 32);
        }
        v6 = v5;
        *(_QWORD *)(v0 + 88) = v5;
        *(_QWORD *)(v0 + 96) = v3 + 1;
        if (__OFADD__(v3, 1))
          break;
        if (!objc_msgSend(v5, sel_isEnabled))
        {
          *(_QWORD *)(v0 + 104) = sub_1AC5DD75C();
          sub_1AC5DD750();
          swift_task_switch();
          return;
        }

        v3 = *(_QWORD *)(v0 + 96);
        if (v3 == *(_QWORD *)(v0 + 80))
          goto LABEL_11;
      }
      __break(1u);
LABEL_14:
      __break(1u);
    }
  }
}

uint64_t sub_1AC518AD0()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  swift_task_dealloc();
  v3 = *(void **)(v2 + 112);
  if (v0)

  swift_release();
  return swift_task_switch();
}

void sub_1AC518B5C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const opaqueCMFormatDescription *v5;
  const opaqueCMFormatDescription *v6;
  CMVideoDimensions Dimensions;
  double v8;
  double v9;
  unsigned int v11;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;

  v1 = *(_QWORD *)(v0 + 16);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1AC5DD864();
    swift_bridgeObjectRelease();
    if (v2)
      goto LABEL_3;
LABEL_27:
    v14 = *(void **)(v0 + 88);
    swift_bridgeObjectRelease();

    v4 = *(unsigned __int8 *)(v0 + 136);
    goto LABEL_28;
  }
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    goto LABEL_27;
LABEL_3:
  if (v2 < 1)
    goto LABEL_40;
  v3 = 0;
  v4 = *(unsigned __int8 *)(v0 + 136);
  do
  {
    if ((v1 & 0xC000000000000001) != 0)
      v5 = (const opaqueCMFormatDescription *)MEMORY[0x1AF43DD40](v3, v1);
    else
      v5 = (const opaqueCMFormatDescription *)*(id *)(v1 + 8 * v3 + 32);
    v6 = v5;
    Dimensions = CMVideoFormatDescriptionGetDimensions(v5);

    if (Dimensions.height >= 1)
    {
      v9 = *(double *)(v0 + 56);
      v8 = *(double *)(v0 + 64);
      if (v8 < 720.0 && v9 < 1280.0)
      {
        if ((v4 & 0xFE) != 0)
          v4 = v4;
        else
          v4 = 1;
      }
      else
      {
        v11 = v4;
        if (v4 <= 2u)
          v11 = 2;
        if (v9 < 3648.0 && v8 < 3648.0)
          v4 = v11;
        else
          v4 = 3;
      }
    }
    ++v3;
  }
  while (v2 != v3);
  v13 = *(void **)(v0 + 88);
  swift_bridgeObjectRelease();

LABEL_28:
  v15 = *(_QWORD *)(v0 + 96);
  if (v15 == *(_QWORD *)(v0 + 80))
  {
LABEL_36:
    v19 = *(void **)(v0 + 48);
    swift_release();

    (*(void (**)(uint64_t))(v0 + 8))(v4);
    return;
  }
  while (1)
  {
    *(_BYTE *)(v0 + 136) = v4;
    v16 = *(_QWORD *)(v0 + 72);
    if ((v16 & 0xC000000000000001) != 0)
    {
      v17 = (id)MEMORY[0x1AF43DD40](v15);
    }
    else
    {
      if (v15 >= *(_QWORD *)(v16 + 16))
        goto LABEL_39;
      v17 = *(id *)(v16 + 8 * v15 + 32);
    }
    v18 = v17;
    *(_QWORD *)(v0 + 88) = v17;
    *(_QWORD *)(v0 + 96) = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (!objc_msgSend(v17, sel_isEnabled))
    {
      *(_QWORD *)(v0 + 104) = sub_1AC5DD75C();
      sub_1AC5DD750();
      swift_task_switch();
      return;
    }

    v15 = *(_QWORD *)(v0 + 96);
    if (v15 == *(_QWORD *)(v0 + 80))
      goto LABEL_36;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
}

void sub_1AC518DCC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v1 = *(unsigned __int8 *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 96);
  if (v2 == *(_QWORD *)(v0 + 80))
  {
LABEL_9:
    v6 = *(void **)(v0 + 48);
    swift_release();

    (*(void (**)(uint64_t))(v0 + 8))(v1);
  }
  else
  {
    while (1)
    {
      *(_BYTE *)(v0 + 136) = v1;
      v3 = *(_QWORD *)(v0 + 72);
      if ((v3 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x1AF43DD40](v2);
      }
      else
      {
        if (v2 >= *(_QWORD *)(v3 + 16))
          goto LABEL_12;
        v4 = *(id *)(v3 + 8 * v2 + 32);
      }
      v5 = v4;
      *(_QWORD *)(v0 + 88) = v4;
      *(_QWORD *)(v0 + 96) = v2 + 1;
      if (__OFADD__(v2, 1))
        break;
      if (!objc_msgSend(v4, sel_isEnabled))
      {
        *(_QWORD *)(v0 + 104) = sub_1AC5DD75C();
        sub_1AC5DD750();
        swift_task_switch();
        return;
      }

      v2 = *(_QWORD *)(v0 + 96);
      if (v2 == *(_QWORD *)(v0 + 80))
        goto LABEL_9;
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
}

uint64_t sub_1AC518EF0(void *a1)
{
  id v1;
  id v2;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v10;
  _BYTE v11[32];

  v1 = objc_msgSend(a1, sel_asset);
  v2 = objc_msgSend(v1, sel_availableVideoDynamicRanges);
  sub_1AC519B80(0, &qword_1EEC831B0);
  v3 = sub_1AC5DD744();

  v4 = sub_1AC5126C4(v3);
  swift_bridgeObjectRelease();
  v5 = *((_QWORD *)v4 + 2);
  if (v5)
  {
    v6 = (uint64_t)(v4 + 32);
    v7 = 1;
    while (1)
    {
      sub_1AC5101F8(v6, (uint64_t)v11);
      if (!swift_dynamicCast())
        break;
      v8 = objc_msgSend(v10, sel_integerValue);

      if (v7 <= (uint64_t)v8)
        v7 = (uint64_t)v8;
      v6 += 32;
      if (!--v5)
      {

        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();

LABEL_10:
    if ((unint64_t)(v7 - 1) <= 7)
      return (0x300000302030201uLL >> (8 * (v7 - 1)));
    else
      return 0;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 1;
  }
}

uint64_t sub_1AC51906C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[17] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83148);
  v1[18] = swift_task_alloc();
  v2 = sub_1AC5DD6C0();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return swift_task_switch();
}

void sub_1AC5190F0()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v1 = objc_msgSend(*(id *)(v0 + 136), sel_tracks);
  sub_1AC519B80(0, &qword_1EEC83168);
  v2 = sub_1AC5DD744();

  v21 = MEMORY[0x1E0DEE9D8];
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1AC5DD864();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_3;
LABEL_22:
    swift_bridgeObjectRelease();
    v16 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v0 + 176) = MEMORY[0x1E0DEE9D8];
    if ((v16 & 0x8000000000000000) == 0)
      goto LABEL_23;
LABEL_30:
    swift_bridgeObjectRetain();
    v20 = sub_1AC5DD864();
    swift_release();
    if (!v20)
      goto LABEL_32;
    swift_bridgeObjectRetain();
    v17 = sub_1AC5DD864();
    swift_release();
    if (!v17)
      goto LABEL_32;
LABEL_25:
    *(_QWORD *)(v0 + 184) = v17;
    *(_QWORD *)(v0 + 192) = sub_1AC5DD768();
    *(_DWORD *)(v0 + 68) = 1;
    *(_WORD *)(v0 + 65) = 1;
    v18 = *(_QWORD *)(v0 + 176);
    if ((v18 & 0xC000000000000001) != 0)
    {
      v19 = (id)MEMORY[0x1AF43DD40](0);
LABEL_29:
      *(_QWORD *)(v0 + 200) = v19;
      *(_QWORD *)(v0 + 208) = 1;
      *(_QWORD *)(v0 + 216) = sub_1AC5DD75C();
      sub_1AC5DD750();
      swift_task_switch();
      return;
    }
    if (*(_QWORD *)(v18 + 16))
    {
      v19 = *(id *)(v18 + 32);
      goto LABEL_29;
    }
LABEL_34:
    __break(1u);
    return;
  }
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
    goto LABEL_22;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_34;
  }
  for (i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
      v5 = (id)MEMORY[0x1AF43DD40](i, v2);
    else
      v5 = *(id *)(v2 + 8 * i + 32);
    v6 = v5;
    v7 = objc_msgSend(v5, sel_assetTrack);
    if (!v7)
    {
LABEL_5:

      continue;
    }
    v8 = v7;
    v9 = objc_msgSend(v7, sel_mediaType);

    v10 = sub_1AC5DD714();
    v12 = v11;
    if (v10 == sub_1AC5DD714() && v12 == v13)
    {
      swift_bridgeObjectRelease_n();

    }
    else
    {
      v15 = sub_1AC5DD87C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      if ((v15 & 1) == 0)
        goto LABEL_5;
    }
    sub_1AC5DD828();
    sub_1AC5DD840();
    sub_1AC5DD84C();
    sub_1AC5DD834();
  }
  swift_bridgeObjectRelease();
  v16 = v21;
  *(_QWORD *)(v0 + 176) = v21;
  if (v21 < 0)
    goto LABEL_30;
LABEL_23:
  if ((v16 & 0x4000000000000000) != 0)
    goto LABEL_30;
  v17 = *(_QWORD *)(v16 + 16);
  if (v17)
    goto LABEL_25;
LABEL_32:
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1AC51944C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 200);
  swift_release();
  *(_QWORD *)(v0 + 224) = objc_msgSend(v1, sel_assetTrack);
  return swift_task_switch();
}

uint64_t sub_1AC5194A8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (*(_QWORD *)(v0 + 224))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC830C0);
    *(_QWORD *)(v0 + 232) = sub_1AC5DD09C();
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v1;
    *v1 = v0;
    v1[1] = sub_1AC5195AC;
    return sub_1AC5DD7B0();
  }
  else
  {

    swift_release();
    if (*(_BYTE *)(v0 + 65))
      v3 = 0;
    else
      v3 = 4;
    if ((*(_BYTE *)(v0 + 65) & 1) == 0 && (*(_BYTE *)(v0 + 66) & 1) == 0)
    {
      v4 = *(_DWORD *)(v0 + 68);
      if (v4 <= 1)
        v5 = 1;
      else
        v5 = 2;
      if (v4 <= 3)
        v3 = v5;
      else
        v3 = 3;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
  }
}

uint64_t sub_1AC5195AC()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  swift_task_dealloc();
  v3 = *(void **)(v2 + 224);
  if (v0)

  swift_release();
  return swift_task_switch();
}

void sub_1AC519638()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  const opaqueCMFormatDescription *v9;
  const opaqueCMFormatDescription *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  int v33;

  v1 = v0 + 128;
  v2 = *(_QWORD *)(v0 + 128);
  if (v2 >> 62)
    goto LABEL_24;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    if (v3 < 1)
    {
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return;
    }
    v4 = 0;
    v30 = v1 - 56;
    v31 = v1 - 112;
    v28 = v2;
    v29 = v2 & 0xC000000000000001;
    v5 = *(unsigned __int8 *)(v0 + 66);
    v6 = *(_DWORD *)(v0 + 68);
    v27 = v3;
    while (1)
    {
      v33 = v5;
      if (v29)
        v9 = (const opaqueCMFormatDescription *)MEMORY[0x1AF43DD40](v4, v2);
      else
        v9 = (const opaqueCMFormatDescription *)*(id *)(v2 + 8 * v4 + 32);
      v10 = v9;
      v11 = *(_QWORD *)(v0 + 152);
      v1 = *(_QWORD *)(v0 + 160);
      v12 = *(_QWORD *)(v0 + 144);
      v32 = CMAudioFormatDescriptionIsAtmos(v9) != 0;
      sub_1AC5DD7A4();
      sub_1AC5073F8(v30, v31, &qword_1EEC83178);
      v2 = *(unsigned __int8 *)(v0 + 64);
      v13 = *(_DWORD *)(v0 + 56);
      sub_1AC5DD798();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v12, 1, v11) == 1)
      {
        v7 = *(_QWORD *)(v0 + 144);

        sub_1AC5073BC(v7, &qword_1EEC83148);
LABEL_6:
        LODWORD(v8) = 0;
        goto LABEL_7;
      }
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 32))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152));
      if (v13)
        v14 = v2;
      else
        v14 = 1;
      v16 = *(_QWORD *)(v0 + 160);
      v15 = *(_QWORD *)(v0 + 168);
      v17 = *(_QWORD *)(v0 + 152);
      if ((v14 & 1) == 0)
      {

        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
        goto LABEL_6;
      }
      sub_1AC5DD6B4();
      v8 = sub_1AC5DD6A8();

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
      if ((v8 & 0x8000000000000000) != 0)
        break;
      if (HIDWORD(v8))
        goto LABEL_23;
LABEL_7:
      ++v4;
      v5 = v32 | v33;
      if (v6 <= v8)
        v6 = v8;
      v2 = v28;
      if (v27 == v4)
        goto LABEL_26;
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
    v3 = sub_1AC5DD864();
    swift_bridgeObjectRelease();
  }
  LOBYTE(v5) = *(_BYTE *)(v0 + 66);
  v6 = *(_DWORD *)(v0 + 68);
LABEL_26:
  v18 = *(void **)(v0 + 200);
  v19 = *(_QWORD *)(v0 + 208);
  v20 = *(_QWORD *)(v0 + 184);
  swift_bridgeObjectRelease();

  if (v19 == v20)
  {
    swift_release();
    if (v6 <= 1)
      v21 = 1;
    else
      v21 = 2;
    if (v6 <= 3)
      v22 = v21;
    else
      v22 = 3;
    if ((v5 & 1) != 0)
      v23 = 4;
    else
      v23 = v22;
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(uint64_t))(v0 + 8))(v23);
  }
  else
  {
    v24 = *(_QWORD *)(v0 + 208);
    *(_BYTE *)(v0 + 66) = v5 & 1;
    *(_DWORD *)(v0 + 68) = v6;
    *(_BYTE *)(v0 + 65) = 0;
    v25 = *(_QWORD *)(v0 + 176);
    if ((v25 & 0xC000000000000001) != 0)
    {
      v26 = (id)MEMORY[0x1AF43DD40](v24);
    }
    else
    {
      if (v24 >= *(_QWORD *)(v25 + 16))
        goto LABEL_45;
      v26 = *(id *)(v25 + 8 * v24 + 32);
    }
    *(_QWORD *)(v0 + 200) = v26;
    *(_QWORD *)(v0 + 208) = v24 + 1;
    if (__OFADD__(v24, 1))
      goto LABEL_44;
    *(_QWORD *)(v0 + 216) = sub_1AC5DD75C();
    sub_1AC5DD750();
    swift_task_switch();
  }
}

uint64_t sub_1AC51995C()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  unsigned int v3;

  swift_release();
  if (*(_BYTE *)(v0 + 65))
    v1 = 0;
  else
    v1 = 4;
  if ((*(_BYTE *)(v0 + 65) & 1) == 0 && (*(_BYTE *)(v0 + 66) & 1) == 0)
  {
    v2 = *(_DWORD *)(v0 + 68);
    if (v2 <= 1)
      v3 = 1;
    else
      v3 = 2;
    if (v2 <= 3)
      v1 = v3;
    else
      v1 = 3;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t CMAudioFormatDescriptionIsAtmos(const opaqueCMFormatDescription *a1)
{
  signed int MediaSubType;
  uint64_t result;
  int v4;
  int v5;
  const AudioFormatListItem *FormatList;
  size_t sizeOut;

  MediaSubType = CMFormatDescriptionGetMediaSubType(a1);
  result = 1;
  if (MediaSubType <= 1885692722)
  {
    if (MediaSubType > 1700997938)
    {
      if (MediaSubType == 1700997939)
        return result;
      if (MediaSubType != 1700998451)
      {
        v4 = 1885547315;
        goto LABEL_24;
      }
      goto LABEL_16;
    }
    if (MediaSubType == 1667574579)
      return result;
    v5 = 1667575091;
LABEL_12:
    if (MediaSubType != v5)
      return 0;
    goto LABEL_16;
  }
  if (MediaSubType > 1902469938)
  {
    if (MediaSubType == 2053464883)
      goto LABEL_16;
    if (MediaSubType == 2053319475)
      return result;
    v5 = 1902469939;
    goto LABEL_12;
  }
  if (MediaSubType != 1885692723)
  {
    v4 = 1902324531;
    goto LABEL_24;
  }
LABEL_16:
  sizeOut = 0;
  FormatList = CMAudioFormatDescriptionGetFormatList(a1, &sizeOut);
  result = 0;
  if (FormatList && sizeOut >= 0x30)
  {
    MediaSubType = FormatList->mASBD.mFormatID;
    result = 1;
    if (MediaSubType <= 1885547314)
    {
      if (MediaSubType == 1667574579)
        return result;
      v4 = 1700997939;
LABEL_24:
      if (MediaSubType == v4)
        return result;
      return 0;
    }
    if (MediaSubType != 1885547315 && MediaSubType != 1902324531)
    {
      v4 = 2053319475;
      goto LABEL_24;
    }
  }
  return result;
}

_OWORD *sub_1AC519B70(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1AC519B80(uint64_t a1, unint64_t *a2)
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

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AVInfoTabMetadata.AudioFormat(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AVInfoTabMetadata.AudioFormat(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1AC519CA0 + 4 * byte_1AC5F7565[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1AC519CD4 + 4 * byte_1AC5F7560[v4]))();
}

uint64_t sub_1AC519CD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC519CDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC519CE4);
  return result;
}

uint64_t sub_1AC519CF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC519CF8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1AC519CFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC519D04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadata.AudioFormat()
{
  return &type metadata for AVInfoTabMetadata.AudioFormat;
}

uint64_t sub_1AC519D2C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1AC519D34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadata.VideoRange()
{
  return &type metadata for AVInfoTabMetadata.VideoRange;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadata.VideoResolution()
{
  return &type metadata for AVInfoTabMetadata.VideoResolution;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AVInfoTabMetadata.TomatoRating(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 4);
  v4 = v3 >= 4;
  v5 = v3 - 4;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AVInfoTabMetadata.TomatoRating(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadata.TomatoRating()
{
  return &type metadata for AVInfoTabMetadata.TomatoRating;
}

unint64_t sub_1AC519E0C()
{
  unint64_t result;

  result = qword_1EEC84030;
  if (!qword_1EEC84030)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F7724, &type metadata for AVInfoTabMetadata.VideoResolution);
    atomic_store(result, (unint64_t *)&qword_1EEC84030);
  }
  return result;
}

unint64_t sub_1AC519E54()
{
  unint64_t result;

  result = qword_1EEC84038;
  if (!qword_1EEC84038)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F778C, &type metadata for AVInfoTabMetadata.VideoRange);
    atomic_store(result, (unint64_t *)&qword_1EEC84038);
  }
  return result;
}

unint64_t sub_1AC519E9C()
{
  unint64_t result;

  result = qword_1EEC84040;
  if (!qword_1EEC84040)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F77F4, &type metadata for AVInfoTabMetadata.AudioFormat);
    atomic_store(result, (unint64_t *)&qword_1EEC84040);
  }
  return result;
}

uint64_t _s5AVKit17AVInfoTabMetadataV12TomatoRatingV9FreshnessOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s5AVKit17AVInfoTabMetadataV12TomatoRatingV9FreshnessOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1AC519FBC + 4 * byte_1AC5F756F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1AC519FF0 + 4 * byte_1AC5F756A[v4]))();
}

uint64_t sub_1AC519FF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC519FF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC51A000);
  return result;
}

uint64_t sub_1AC51A00C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC51A014);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1AC51A018(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC51A020(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AVInfoTabMetadata.TomatoRating.Freshness()
{
  return &type metadata for AVInfoTabMetadata.TomatoRating.Freshness;
}

unint64_t sub_1AC51A040()
{
  unint64_t result;

  result = qword_1EEC84048;
  if (!qword_1EEC84048)
  {
    result = MEMORY[0x1AF43EC7C](&unk_1AC5F78A0, &type metadata for AVInfoTabMetadata.TomatoRating.Freshness);
    atomic_store(result, &qword_1EEC84048);
  }
  return result;
}

uint64_t sub_1AC51A1D0(unint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  unsigned __int8 v4;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions) = a1;
  swift_bridgeObjectRetain();
  v4 = sub_1AC51B828(v3, a1);
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
    sub_1AC51B314();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AC51A22C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _BYTE v11[24];

  v3 = type metadata accessor for AVInfoTabMetadata();
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v4);
  v8 = &v11[-v7];
  v9 = v1 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_metadata;
  swift_beginAccess();
  sub_1AC51693C(v9, (uint64_t)v8);
  swift_beginAccess();
  sub_1AC51BC60(a1, v9);
  swift_endAccess();
  sub_1AC51693C(v9, (uint64_t)v6);
  LOBYTE(v9) = sub_1AC514FA8(v8, v6);
  sub_1AC516980((uint64_t)v6);
  if ((v9 & 1) == 0)
    sub_1AC51B314();
  sub_1AC516980(a1);
  return sub_1AC516980((uint64_t)v8);
}

id sub_1AC51A340(void *a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  void *v6;
  char *v7;
  id v8;
  char *v9;
  int *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v23;

  v5 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem;
  *(_QWORD *)&v2[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken] = 0;
  v6 = *(void **)&v2[v5];
  *(_QWORD *)&v2[v5] = a1;
  v7 = v2;
  v8 = a1;

  *(_QWORD *)&v7[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions] = a2;
  v9 = &v7[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_metadata];
  v10 = (int *)type metadata accessor for AVInfoTabMetadata();
  v11 = &v9[v10[6]];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v13 = &v9[v10[7]];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = &v9[v10[8]];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = &v9[v10[9]];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  *(_OWORD *)&v9[v10[10]] = xmmword_1AC5F78D0;
  v16 = &v9[v10[11]];
  v16[4] = 4;
  *(_DWORD *)v16 = 0;
  *(_QWORD *)&v9[v10[12]] = 0;
  v9[v10[13]] = 0;
  v9[v10[14]] = 0;
  v9[v10[15]] = 0;
  v17 = &v9[v10[16]];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  *((_QWORD *)v17 + 2) = 0;
  v17[24] = 1;
  v9[v10[17]] = 0;
  v9[v10[18]] = 0;

  v23.receiver = v7;
  v23.super_class = (Class)type metadata accessor for AVInfoTabViewController();
  v18 = objc_msgSendSuper2(&v23, sel_initWithNibName_bundle_, 0, 0);
  v19 = (void *)sub_1AC5DD6F0();
  v20 = (void *)sub_1AC5DD6F0();
  v21 = AVLocalizedString(v19);

  if (!v21)
  {
    sub_1AC5DD714();
    v21 = (id)sub_1AC5DD6F0();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v18, sel_setTitle_, v21);

  return v18;
}

void sub_1AC51A734()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGAffineTransform v27;
  objc_super v28;

  v28.receiver = v0;
  v28.super_class = (Class)type metadata accessor for AVInfoTabViewController();
  objc_msgSendSuper2(&v28, sel_viewDidLayoutSubviews);
  v1 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController;
  v2 = *(void **)&v0[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController];
  if (v2)
  {
    v3 = objc_msgSend(v2, sel_view);
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v0, sel_view);
      if (v5)
      {
        v6 = v5;
        objc_msgSend(v5, sel_bounds);
        v8 = v7;
        v10 = v9;
        v12 = v11;
        v14 = v13;

        objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
        v15 = *(void **)&v0[v1];
        if (!v15)
          return;
        v16 = objc_msgSend(v15, sel_view);
        if (v16)
        {
          v17 = v16;
          objc_msgSend(v16, sel_transform);
          v25 = *(_OWORD *)&v27.c;
          v26 = *(_OWORD *)&v27.a;
          v24 = *(_OWORD *)&v27.tx;

          v18 = *(void **)&v0[v1];
          if (!v18)
            return;
          v19 = objc_msgSend(v18, sel_view);
          if (v19)
          {
            v20 = v19;
            CGAffineTransformMakeScale(&v27, 1.01, 1.01);
            objc_msgSend(v20, sel_setTransform_, &v27);

            v21 = *(void **)&v0[v1];
            if (!v21)
              return;
            v22 = objc_msgSend(v21, sel_view);
            if (v22)
            {
              v23 = v22;
              *(_OWORD *)&v27.a = v26;
              *(_OWORD *)&v27.c = v25;
              *(_OWORD *)&v27.tx = v24;
              objc_msgSend(v22, sel_setTransform_, &v27);

              return;
            }
LABEL_16:
            __break(1u);
            return;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

id sub_1AC51A94C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  objc_super v6;

  v1 = v0;
  v2 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken;
  v3 = *(void **)&v0[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken];
  if (v3)
  {
    v4 = v3;
    sub_1AC5DCF70();

    v3 = *(void **)&v1[v2];
  }
  *(_QWORD *)&v1[v2] = 0;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for AVInfoTabViewController();
  return objc_msgSendSuper2(&v6, sel_dealloc);
}

uint64_t sub_1AC51AA4C()
{
  return type metadata accessor for AVInfoTabViewController();
}

uint64_t type metadata accessor for AVInfoTabViewController()
{
  uint64_t result;

  result = qword_1EEC83118;
  if (!qword_1EEC83118)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1AC51AA90()
{
  char *v0;
  char *v1;
  int *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v1 = v0;
  v2 = (int *)type metadata accessor for AVInfoTabView(0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController;
  if (!*(_QWORD *)&v1[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController])
  {
    v6 = (uint64_t)&v1[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_metadata];
    swift_beginAccess();
    sub_1AC51693C(v6, (uint64_t)v4);
    v7 = *(_QWORD *)&v1[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions];
    *(_QWORD *)&v4[*(int *)(type metadata accessor for AVInfoTabViewConfiguration(0) + 20)] = v7;
    v8 = (uint64_t *)&v4[v2[5]];
    *v8 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
    swift_storeEnumTagMultiPayload();
    v9 = (uint64_t *)&v4[v2[6]];
    *v9 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    v10 = &v4[v2[7]];
    v28 = 0;
    v29 = 0;
    type metadata accessor for CGSize(0);
    swift_bridgeObjectRetain();
    sub_1AC5DD600();
    v11 = v31;
    *(_OWORD *)v10 = v30;
    *((_QWORD *)v10 + 2) = v11;
    v12 = &v4[v2[8]];
    v28 = 0;
    v29 = 0;
    sub_1AC5DD600();
    v13 = v31;
    *(_OWORD *)v12 = v30;
    *((_QWORD *)v12 + 2) = v13;
    v14 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84070));
    v15 = sub_1AC5DD30C();
    v16 = *(void **)&v1[v5];
    *(_QWORD *)&v1[v5] = v15;

    v17 = *(void **)&v1[v5];
    if (v17)
    {
      objc_msgSend(v17, sel_willMoveToParentViewController_, v1);
      v18 = *(void **)&v1[v5];
      if (v18)
      {
        v19 = objc_msgSend(v18, sel_view);
        if (v19)
        {
          v20 = v19;
          v21 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
          objc_msgSend(v20, sel_setBackgroundColor_, v21);

          if (*(_QWORD *)&v1[v5])
          {
            objc_msgSend(v1, sel_addChildViewController_);
            v22 = objc_msgSend(v1, sel_view);
            if (v22)
            {
              v23 = v22;
              v24 = *(void **)&v1[v5];
              if (v24)
              {
                v25 = objc_msgSend(v24, sel_view);
                if (v25)
                {
                  v26 = v25;
                  objc_msgSend(v23, sel_addSubview_, v25);

                  v27 = *(void **)&v1[v5];
                  if (v27)
                  {
                    objc_msgSend(v27, sel_didMoveToParentViewController_, v1);
                    return;
                  }
LABEL_19:
                  __break(1u);
                  return;
                }
LABEL_18:
                __break(1u);
                goto LABEL_19;
              }
LABEL_17:
              __break(1u);
              goto LABEL_18;
            }
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

void sub_1AC51AD78(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(*a1, sel_tracks);
  sub_1AC519B80(0, &qword_1EEC83168);
  v4 = sub_1AC5DD744();

  *a2 = v4;
}

void sub_1AC51ADE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a3 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1AF43ED6C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    sub_1AC51AE38();

  }
}

void sub_1AC51AE38()
{
  char *v0;
  int *v1;
  uint64_t v2;
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  id v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v1 = (int *)type metadata accessor for AVInfoTabMetadata();
  MEMORY[0x1E0C80A78](v1);
  v3 = (_OWORD *)((char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83150);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)&v0[OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem];
  if (v7)
  {
    v8 = sub_1AC5DD780();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
    sub_1AC5DD768();
    v9 = v7;
    v10 = v0;
    v11 = sub_1AC5DD75C();
    v12 = (_QWORD *)swift_allocObject();
    v13 = MEMORY[0x1E0DF06E8];
    v12[2] = v11;
    v12[3] = v13;
    v12[4] = v9;
    v12[5] = v10;
    sub_1AC51B1D0((uint64_t)v6, (uint64_t)&unk_1EEC84058, (uint64_t)v12);
    swift_release();

  }
  else
  {
    v14 = (char *)v3 + v1[6];
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83098);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
    *v3 = 0u;
    v3[1] = 0u;
    v16 = (_QWORD *)((char *)v3 + v1[7]);
    *v16 = 0;
    v16[1] = 0;
    v17 = (_QWORD *)((char *)v3 + v1[8]);
    *v17 = 0;
    v17[1] = 0;
    v18 = (_QWORD *)((char *)v3 + v1[9]);
    *v18 = 0;
    v18[1] = 0;
    *(_OWORD *)((char *)v3 + v1[10]) = xmmword_1AC5F78D0;
    v19 = (char *)v3 + v1[11];
    v19[4] = 4;
    *(_DWORD *)v19 = 0;
    *(_QWORD *)((char *)v3 + v1[12]) = 0;
    *((_BYTE *)v3 + v1[13]) = 0;
    *((_BYTE *)v3 + v1[14]) = 0;
    *((_BYTE *)v3 + v1[15]) = 0;
    v20 = (char *)v3 + v1[16];
    *(_QWORD *)v20 = 0;
    *((_QWORD *)v20 + 1) = 0;
    *((_QWORD *)v20 + 2) = 0;
    v20[24] = 1;
    *((_BYTE *)v3 + v1[17]) = 0;
    *((_BYTE *)v3 + v1[18]) = 0;
    sub_1AC51A22C((uint64_t)v3);
  }
}

uint64_t sub_1AC51B048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;

  v5[2] = a5;
  type metadata accessor for AVInfoTabMetadata();
  v5[3] = swift_task_alloc();
  v7 = swift_task_alloc();
  v5[4] = v7;
  v5[5] = sub_1AC5DD768();
  v5[6] = sub_1AC5DD75C();
  v8 = (_QWORD *)swift_task_alloc();
  v5[7] = v8;
  *v8 = v5;
  v8[1] = sub_1AC51B0F4;
  return sub_1AC512B40(v7, a4);
}

uint64_t sub_1AC51B0F4()
{
  swift_task_dealloc();
  sub_1AC5DD750();
  return swift_task_switch();
}

uint64_t sub_1AC51B164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  sub_1AC51693C(v1, v2);
  sub_1AC51A22C(v2);
  sub_1AC516980(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AC51B1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1AC5DD780();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1AC5DD774();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1AC51B7E8(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1AC5DD750();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_1AC51B314()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  char *v9;
  id v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v1 = (int *)type metadata accessor for AVInfoTabView(0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController);
  if (v4)
  {
    v5 = v0 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_metadata;
    swift_beginAccess();
    sub_1AC51693C(v5, (uint64_t)v3);
    v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_actions);
    *(_QWORD *)&v3[*(int *)(type metadata accessor for AVInfoTabViewConfiguration(0) + 20)] = v6;
    v7 = (uint64_t *)&v3[v1[5]];
    *v7 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC831E0);
    swift_storeEnumTagMultiPayload();
    v8 = (uint64_t *)&v3[v1[6]];
    *v8 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    v9 = &v3[v1[7]];
    v14 = 0;
    v15 = 0;
    type metadata accessor for CGSize(0);
    v10 = v4;
    swift_bridgeObjectRetain();
    sub_1AC5DD600();
    v11 = v17;
    *(_OWORD *)v9 = v16;
    *((_QWORD *)v9 + 2) = v11;
    v12 = &v3[v1[8]];
    v14 = 0;
    v15 = 0;
    sub_1AC5DD600();
    v13 = v17;
    *(_OWORD *)v12 = v16;
    *((_QWORD *)v12 + 2) = v13;
    sub_1AC5DD318();

  }
}

uint64_t sub_1AC51B530()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AVInfoTabMetadata();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1AC51B5B8()
{
  return sub_1AC5DD24C();
}

uint64_t sub_1AC51B5D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1AC51B614(a1, a2, a3, a4, MEMORY[0x1E0CDA708]);
}

uint64_t sub_1AC51B5F4()
{
  return sub_1AC5DD258();
}

uint64_t sub_1AC51B614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC51B6AC(a1, (uint64_t)v9);
  return a5(v9);
}

uint64_t sub_1AC51B690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1AC51B614(a1, a2, a3, a4, MEMORY[0x1E0CDA778]);
}

uint64_t sub_1AC51B6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AC51B6F4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1AC51B728(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1AC51B7A0;
  return sub_1AC51B048(a1, v4, v5, v7, v6);
}

uint64_t sub_1AC51B7A0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AC51B7E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83150);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_1AC51B828(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;

  v2 = a2;
  v3 = a1;
  v4 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v30 = sub_1AC5DD864();
    swift_bridgeObjectRelease();
    if (v5 == v30)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  swift_bridgeObjectRetain();
  v5 = sub_1AC5DD864();
  swift_bridgeObjectRelease();
  v6 = (unint64_t)v2 >> 62;
  if ((unint64_t)v2 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v5)
    goto LABEL_37;
  v7 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0)
    v7 = v3;
  if (!v4)
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = v2 & 0xFFFFFFFFFFFFFF8;
  v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v2 < 0)
    v10 = v2;
  else
    v10 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v6)
    v9 = v10;
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v31 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v3 + 32); ; result = (id)MEMORY[0x1AF43DD40](0, v3))
  {
    v12 = result;
    if ((v2 & 0xC000000000000001) == 0)
      break;
    v13 = (id)MEMORY[0x1AF43DD40](0, v2);
LABEL_21:
    v14 = v13;
    sub_1AC519B80(0, (unint64_t *)&qword_1EEC831B8);
    v15 = sub_1AC5DD7D4();

    if ((v15 & 1) == 0)
      goto LABEL_48;
    v16 = v5 - 1;
    if (v5 == 1)
      return (id)(v5 & 1);
    if (((v2 | v3) & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v18 = v5 - 2;
      while (v16 != v17)
      {
        v5 = v17 + 1;
        if (v31)
          v19 = (id)MEMORY[0x1AF43DD40](v17 + 1, v3);
        else
          v19 = *(id *)(v3 + 40 + 8 * v17);
        v20 = v19;
        if ((v2 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x1AF43DD40](v17 + 1, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v8 + 16))
            goto LABEL_53;
          v21 = *(id *)(v2 + 40 + 8 * v17);
        }
        v22 = v21;
        v5 = sub_1AC5DD7D4();

        if ((v5 & 1) != 0 && v18 != v17++)
          continue;
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v8 + 16);
      if (v24 <= 1)
        v24 = 1;
      v25 = v24 - 1;
      v26 = (void **)(v3 + 40);
      v8 = v2 + 40;
      while (v16)
      {
        if (!v25)
          goto LABEL_52;
        v28 = *v26++;
        v27 = v28;
        v29 = *(void **)v8;
        v8 += 8;
        v2 = v27;
        v3 = v29;
        v5 = sub_1AC5DD7D4();

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16)
            continue;
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v8 + 16))
  {
    v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AC51BB1C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1AC51BB80;
  return v6(a1);
}

uint64_t sub_1AC51BB80()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AC51BBCC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC51BBF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1AC51B7A0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EEC84060 + dword_1EEC84060))(a1, v4);
}

uint64_t sub_1AC51BC60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AVInfoTabMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_1AC51BCA4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v2 = v1;
  v4 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem;
  v5 = *(void **)(v1 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem);
  if (a1)
  {
    if (v5)
    {
      sub_1AC519B80(0, &qword_1EEC83158);
      v6 = v5;
      v7 = a1;
      v8 = sub_1AC5DD7D4();

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  v9 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken;
  v10 = *(void **)(v2 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken);
  if (v10)
  {
    v11 = v10;
    sub_1AC5DCF70();

    v10 = *(void **)(v2 + v9);
  }
  *(_QWORD *)(v2 + v9) = 0;

LABEL_9:
  v12 = *(void **)(v2 + v4);
  *(_QWORD *)(v2 + v4) = a1;
  v13 = a1;

  v14 = OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken;
  if (!*(_QWORD *)(v2 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken))
  {
    v15 = *(void **)(v2 + v4);
    if (v15)
    {
      v18 = *(void **)(v2 + v4);
      swift_getKeyPath();
      swift_allocObject();
      swift_unknownObjectWeakInit();
      v16 = v15;
      v15 = (void *)sub_1AC5DCF94();
      swift_release();
      swift_release();

      v17 = *(void **)(v2 + v14);
    }
    else
    {
      v17 = 0;
    }
    *(_QWORD *)(v2 + v14) = v15;

  }
  sub_1AC51AE38();
}

char *keypath_get_selector_tracks()
{
  return sel_tracks;
}

uint64_t sub_1AC51BE3C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AC51BE60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1AC51ADE8(a1, a2, v2);
}

uint64_t getEnumTagSinglePayload for AVChromelessButtonStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AVChromelessButtonStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1AC51BF54 + 4 * byte_1AC5F79B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1AC51BF88 + 4 * byte_1AC5F79B0[v4]))();
}

uint64_t sub_1AC51BF88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC51BF90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC51BF98);
  return result;
}

uint64_t sub_1AC51BFA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC51BFACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1AC51BFB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC51BFB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AVChromelessButtonStyle()
{
  return &type metadata for AVChromelessButtonStyle;
}

uint64_t sub_1AC51BFD4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC51BFE4(uint64_t a1)
{
  return sub_1AC51C00C(a1, (void (*)(void))MEMORY[0x1E0CDD768], &qword_1EEC88A98);
}

uint64_t sub_1AC51BFF8(uint64_t a1)
{
  return sub_1AC51C00C(a1, (void (*)(void))MEMORY[0x1E0CDD430], &qword_1EEC88AA0);
}

uint64_t sub_1AC51C00C(uint64_t a1, void (*a2)(void), uint64_t *a3)
{
  uint64_t v4;
  uint64_t result;

  a2();
  v4 = sub_1AC5DD468();
  result = swift_release();
  *a3 = v4;
  return result;
}

uint64_t sub_1AC51C04C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t KeyPath;
  char *v27;
  char *v28;
  __int128 v29;
  unsigned __int8 v30;
  char v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _OWORD *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t);
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t);
  char *v104;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  char *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;

  v115 = a2;
  v110 = a3;
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84078);
  v108 = *(_QWORD *)(v109 - 8);
  MEMORY[0x1E0C80A78](v109);
  v107 = (char *)&v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84080);
  MEMORY[0x1E0C80A78](v129);
  v130 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84088);
  MEMORY[0x1E0C80A78](v126);
  v128 = (char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84090);
  MEMORY[0x1E0C80A78](v124);
  v125 = (char *)&v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84098);
  v122 = *(_QWORD *)(v8 - 8);
  v123 = v8;
  MEMORY[0x1E0C80A78](v8);
  v121 = (char *)&v106 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC840A0);
  MEMORY[0x1E0C80A78](v119);
  v120 = (char *)&v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC840A8);
  MEMORY[0x1E0C80A78](v116);
  v118 = (char *)&v106 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC840B0);
  MEMORY[0x1E0C80A78](v114);
  v117 = (uint64_t)&v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC840B8);
  MEMORY[0x1E0C80A78](v112);
  v113 = (uint64_t)&v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC840C0);
  MEMORY[0x1E0C80A78](v111);
  v15 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC840C8);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v106 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC840D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v106 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1AC5DD3C0();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v25 = (char *)&v106 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = a1;
  sub_1AC5DD3CC();
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v21, v25, v22);
  v27 = &v21[*(int *)(v19 + 36)];
  *(_QWORD *)v27 = KeyPath;
  *((_QWORD *)v27 + 1) = 2;
  v27[16] = 0;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
  sub_1AC5DD678();
  sub_1AC5DD168();
  sub_1AC507378((uint64_t)v21, (uint64_t)v18, &qword_1EEC840D0);
  v28 = &v18[*(int *)(v16 + 36)];
  v29 = v132;
  *(_OWORD *)v28 = v131;
  *((_OWORD *)v28 + 1) = v29;
  *((_OWORD *)v28 + 2) = v133;
  sub_1AC5073BC((uint64_t)v21, &qword_1EEC840D0);
  LOBYTE(v21) = sub_1AC5DD438();
  v30 = sub_1AC5DD450();
  v31 = sub_1AC5DD444();
  sub_1AC5DD444();
  if (sub_1AC5DD444() != v21)
    v31 = sub_1AC5DD444();
  sub_1AC5DD444();
  if (sub_1AC5DD444() != v30)
    v31 = sub_1AC5DD444();
  v32 = v115 & 1;
  sub_1AC5DD114();
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  sub_1AC507378((uint64_t)v18, (uint64_t)v15, &qword_1EEC840C8);
  v41 = &v15[*(int *)(v111 + 36)];
  *v41 = v31;
  *((_QWORD *)v41 + 1) = v34;
  *((_QWORD *)v41 + 2) = v36;
  *((_QWORD *)v41 + 3) = v38;
  *((_QWORD *)v41 + 4) = v40;
  v41[40] = 0;
  sub_1AC5073BC((uint64_t)v18, &qword_1EEC840C8);
  if (!v32)
  {
    v42 = (uint64_t)v130;
    if (qword_1EEC837C0 != -1)
      swift_once();
    v43 = &qword_1EEC88AA0;
    goto LABEL_11;
  }
  v42 = (uint64_t)v130;
  if (qword_1EEC837B8 != -1)
    goto LABEL_17;
  while (1)
  {
    v43 = &qword_1EEC88A98;
LABEL_11:
    v44 = *v43;
    swift_retain();
    v45 = swift_getKeyPath();
    v46 = v113;
    sub_1AC507378((uint64_t)v15, v113, &qword_1EEC840C0);
    v47 = (uint64_t *)(v46 + *(int *)(v112 + 36));
    *v47 = v45;
    v47[1] = v44;
    sub_1AC5073BC((uint64_t)v15, &qword_1EEC840C0);
    v48 = sub_1AC5DD594();
    v49 = swift_getKeyPath();
    v50 = v117;
    sub_1AC507378(v46, v117, &qword_1EEC840B8);
    v51 = (uint64_t *)(v50 + *(int *)(v114 + 36));
    *v51 = v49;
    v51[1] = v48;
    sub_1AC5073BC(v46, &qword_1EEC840B8);
    v52 = sub_1AC5DD66C();
    v53 = *(_QWORD *)(v52 - 8);
    MEMORY[0x1E0C80A78](v52);
    v55 = (char *)&v106 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1AC5DD660();
    v56 = sub_1AC5DD42C();
    v57 = (uint64_t)v118;
    v58 = &v118[*(int *)(v116 + 36)];
    (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v58, v55, v52);
    v58[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83D38) + 36)] = v56;
    sub_1AC507378(v50, v57, &qword_1EEC840B0);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v52);
    sub_1AC5073BC(v50, &qword_1EEC840B0);
    v59 = sub_1AC5DD1E0();
    v60 = MEMORY[0x1E0C80A78](v59);
    v62 = (_OWORD *)((char *)&v106 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0));
    v63 = (char *)v62 + *(int *)(v60 + 20);
    v64 = *MEMORY[0x1E0CDB0D8];
    v65 = sub_1AC5DD2C4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 104))(v63, v64, v65);
    __asm { FMOV            V0.2D, #8.0 }
    *v62 = _Q0;
    v71 = (uint64_t)v120;
    v72 = (uint64_t)&v120[*(int *)(v119 + 36)];
    sub_1AC51CE4C((uint64_t)v62, v72);
    *(_WORD *)(v72 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC83DC0) + 36)) = 256;
    sub_1AC507378(v57, v71, &qword_1EEC840A8);
    sub_1AC51CE90((uint64_t)v62);
    sub_1AC5073BC(v57, &qword_1EEC840A8);
    v73 = sub_1AC5DD1BC();
    v74 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9AE0];
    v75 = *(_QWORD *)(v73 - 8);
    MEMORY[0x1E0C80A78](v73);
    v77 = (char *)&v106 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1AC5DD1F8();
    sub_1AC51CECC();
    sub_1AC4FB5B0(&qword_1EEC84128, v74, MEMORY[0x1E0CD9AC8]);
    v78 = v121;
    sub_1AC5DD504();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v77, v73);
    sub_1AC5073BC(v71, &qword_1EEC840A0);
    v79 = (sub_1AC5DD3D8() & 1) != 0 ? 0.75 : 1.0;
    sub_1AC5DD69C();
    v81 = v80;
    v83 = v82;
    v85 = v122;
    v84 = v123;
    v86 = (uint64_t)v125;
    (*(void (**)(char *, char *, uint64_t))(v122 + 16))(v125, v78, v123);
    v87 = v86 + *(int *)(v124 + 36);
    *(double *)v87 = v79;
    *(double *)(v87 + 8) = v79;
    *(_QWORD *)(v87 + 16) = v81;
    *(_QWORD *)(v87 + 24) = v83;
    (*(void (**)(char *, uint64_t))(v85 + 8))(v78, v84);
    v88 = sub_1AC5DD690();
    v89 = sub_1AC5DD3D8();
    v15 = v128;
    sub_1AC507378(v86, (uint64_t)v128, &qword_1EEC84090);
    v90 = &v15[*(int *)(v126 + 36)];
    *(_QWORD *)v90 = v88;
    v90[8] = v89 & 1;
    sub_1AC5073BC(v86, &qword_1EEC84090);
    v91 = swift_getKeyPath();
    v92 = sub_1AC5DD12C();
    v93 = *(_QWORD *)(v92 - 8);
    MEMORY[0x1E0C80A78](v92);
    v95 = (char *)&v106 - ((v94 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, _QWORD, uint64_t))(v93 + 104))(v95, *MEMORY[0x1E0CD86D8], v92);
    v96 = (uint64_t *)(v42 + *(int *)(v129 + 36));
    v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84130);
    (*(void (**)(char *, char *, uint64_t))(v93 + 16))((char *)v96 + *(int *)(v97 + 28), v95, v92);
    *v96 = v91;
    sub_1AC507378((uint64_t)v15, v42, &qword_1EEC84088);
    (*(void (**)(char *, uint64_t))(v93 + 8))(v95, v92);
    sub_1AC5073BC((uint64_t)v15, &qword_1EEC84088);
    v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC84138);
    MEMORY[0x1E0C80A78](v98);
    v100 = (char *)&v106 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0);
    v101 = *MEMORY[0x1E0CD9948];
    v102 = sub_1AC5DD1B0();
    v103 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9960];
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v102 - 8) + 104))(v100, v101, v102);
    sub_1AC4FB5B0(&qword_1EEC84140, v103, MEMORY[0x1E0CD9988]);
    if ((sub_1AC5DD6E4() & 1) != 0)
      break;
    __break(1u);
LABEL_17:
    swift_once();
  }
  sub_1AC51D1E0();
  sub_1AC51D3C0();
  v104 = v107;
  sub_1AC5DD528();
  sub_1AC5073BC((uint64_t)v100, &qword_1EEC84138);
  sub_1AC5073BC(v42, &qword_1EEC84080);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v108 + 32))(v110, v104, v109);
}

uint64_t sub_1AC51CBD0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1AC5DD12C();
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1AC5DD228();
}

uint64_t sub_1AC51CC4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v2;

  return sub_1AC51C04C(a1, *v2, a2);
}

uint64_t sub_1AC51CC54@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_1AC5DD27C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1AC51CC84@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_1AC5DD27C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1AC51CCB4()
{
  return sub_1AC5DD288();
}

uint64_t sub_1AC51CCE0()
{
  return sub_1AC5DD288();
}

uint64_t sub_1AC51CD0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1AC5DD234();
  *a1 = result;
  return result;
}

uint64_t sub_1AC51CD34()
{
  swift_retain();
  return sub_1AC5DD240();
}

uint64_t sub_1AC51CD5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1AC5DD264();
  *a1 = result;
  return result;
}

uint64_t sub_1AC51CD84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1AC5DD264();
  *a1 = result;
  return result;
}

uint64_t sub_1AC51CDAC()
{
  swift_retain();
  return sub_1AC5DD270();
}

uint64_t sub_1AC51CDD4()
{
  swift_retain();
  return sub_1AC5DD270();
}

uint64_t sub_1AC51CDFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1AC5DD234();
  *a1 = result;
  return result;
}

uint64_t sub_1AC51CE24()
{
  swift_retain();
  return sub_1AC5DD240();
}

uint64_t sub_1AC51CE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC5DD1E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AC51CE90(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1AC5DD1E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1AC51CECC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC840D8;
  if (!qword_1EEC840D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC840A0);
    v2[0] = sub_1AC51CF50();
    v2[1] = sub_1AC4FC18C(&qword_1EEC83DB8, &qword_1EEC83DC0, MEMORY[0x1E0CD89F8]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC840D8);
  }
  return result;
}

unint64_t sub_1AC51CF50()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC840E0;
  if (!qword_1EEC840E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC840A8);
    v2[0] = sub_1AC51CFD4();
    v2[1] = sub_1AC4FC18C(&qword_1EEC83D58, &qword_1EEC83D38, MEMORY[0x1E0CDC6C8]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC840E0);
  }
  return result;
}

unint64_t sub_1AC51CFD4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC840E8;
  if (!qword_1EEC840E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC840B0);
    v2[0] = sub_1AC51D058();
    v2[1] = sub_1AC4FC18C(&qword_1EEC83968, &qword_1EEC83970, MEMORY[0x1E0CDCF88]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC840E8);
  }
  return result;
}

unint64_t sub_1AC51D058()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC840F0;
  if (!qword_1EEC840F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC840B8);
    v2[0] = sub_1AC50F158(&qword_1EEC840F8, &qword_1EEC840C0, sub_1AC51D0FC, MEMORY[0x1E0CD9750]);
    v2[1] = sub_1AC4FC18C(&qword_1EEC83978, &qword_1EEC83980, MEMORY[0x1E0CDCF88]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC840F0);
  }
  return result;
}

uint64_t sub_1AC51D0FC()
{
  return sub_1AC50F158(&qword_1EEC84100, &qword_1EEC840C8, (uint64_t (*)(void))sub_1AC51D120, MEMORY[0x1E0CD8D78]);
}

unint64_t sub_1AC51D120()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC84108;
  if (!qword_1EEC84108)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC840D0);
    v2[0] = sub_1AC4FB5B0(&qword_1EEC84110, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC530], MEMORY[0x1E0CDC518]);
    v2[1] = sub_1AC4FC18C(&qword_1EEC84118, &qword_1EEC84120, MEMORY[0x1E0CDCF88]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC84108);
  }
  return result;
}

uint64_t sub_1AC51D1BC()
{
  return sub_1AC5DD21C();
}

unint64_t sub_1AC51D1E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC84148;
  if (!qword_1EEC84148)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC84080);
    v2[0] = sub_1AC51D264();
    v2[1] = sub_1AC4FC18C(&qword_1EEC84170, &qword_1EEC84130, MEMORY[0x1E0CDCF88]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC84148);
  }
  return result;
}

unint64_t sub_1AC51D264()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEC84150;
  if (!qword_1EEC84150)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC84088);
    v2[0] = sub_1AC51D2E8();
    v2[1] = sub_1AC4FC18C(&qword_1EEC84160, &qword_1EEC84168, MEMORY[0x1E0CDB150]);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEC84150);
  }
  return result;
}

unint64_t sub_1AC51D2E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_1EEC84158;
  if (!qword_1EEC84158)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC84090);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC840A0);
    v3 = sub_1AC5DD1BC();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9AE0];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_1AC51CECC();
    v5[5] = sub_1AC4FB5B0(&qword_1EEC84128, v4, MEMORY[0x1E0CD9AC8]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = MEMORY[0x1E0CD8DA0];
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0CD9C18], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEC84158);
  }
  return result;
}

unint64_t sub_1AC51D3C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC84178;
  if (!qword_1EEC84178)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC84138);
    result = MEMORY[0x1AF43EC7C](MEMORY[0x1E0DECD88], v1);
    atomic_store(result, (unint64_t *)&qword_1EEC84178);
  }
  return result;
}

uint64_t sub_1AC51D40C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC84080);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC84138);
  sub_1AC51D1E0();
  sub_1AC51D3C0();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AC51D47C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

id _ObservationForSharedAVKitSetting(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3800];
  AVKitUserDefaults();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "keyPathWithRootObject:path:", v9, objc_msgSend(v10, "cStringUsingEncoding:", 4));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ___ObservationForSharedAVKitSetting_block_invoke;
  v17[3] = &unk_1E5BB07E0;
  v18 = v10;
  v19 = v5;
  v20 = v7;
  v21 = 0;
  v12 = v7;
  v13 = v5;
  v14 = v10;
  objc_msgSend(v11, "addObserverBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id _AVMethodProem(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  _NSFullMethodName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(" "));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "substringToIndex:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "substringFromIndex:", v4 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%p) %@"), v6, v1, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v8;
  }

  return v2;
}

void sub_1AC523E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC525D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC526750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC527438(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AC527FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC529D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC52B00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC52C694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC52D4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _UpdatePreferredMediaSelectionOptions(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  char v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  id obj;
  void *v40;
  char v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v48;
    v6 = *MEMORY[0x1E0C8A770];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v48 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v8, "extendedLanguageTag");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "hasMediaCharacteristic:", v6))
          v10 = v9 == 0;
        else
          v10 = 0;
        if (v10)
        {
          _AVLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v52 = (const char *)v8;
            _os_log_error_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_ERROR, "missing extendedLanguageTag for option %{public}@", buf, 0xCu);
          }

        }
        else if (v9)
        {
          objc_msgSend(v40, "addObject:", v9);
        }
        objc_msgSend(v8, "avkit_setPreferredSortIndex:", 0x7FFFFFFFFFFFFFFFLL);
        objc_msgSend(v8, "avkit_setBestChoiceForRecentLanguage:", 0);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v4);
  }

  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredLanguages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "avkit_recentLanguageCode");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v13;
  v16 = v40;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v42)
  {
    v17 = 0;
    v41 = 0;
    v18 = *(_QWORD *)v44;
    v38 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v44 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        _MediaOptionIndexesFromAvailableOptionsForPreferredLanguage(v16, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count"))
        {
          v22 = objc_msgSend(v21, "firstIndex");
          if (v22 != 0x7FFFFFFFFFFFFFFFLL)
          {
            for (k = v22; k != 0x7FFFFFFFFFFFFFFFLL; k = objc_msgSend(v21, "indexGreaterThanIndex:", k))
            {
              objc_msgSend(v2, "objectAtIndexedSubscript:", k, v37);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v14, "containsObject:", v24);
              _AVLog();
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
              if ((v25 & 1) != 0)
              {
                if (v27)
                {
                  *(_DWORD *)buf = 136315394;
                  v52 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
                  v53 = 2114;
                  v54 = v24;
                  _os_log_impl(&dword_1AC4B1000, v26, OS_LOG_TYPE_DEFAULT, "%s NOT adding preferred option %{public}@ because we already have it!", buf, 0x16u);
                }

              }
              else
              {
                if (v27)
                {
                  *(_DWORD *)buf = 136315394;
                  v52 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
                  v53 = 2114;
                  v54 = v24;
                  _os_log_impl(&dword_1AC4B1000, v26, OS_LOG_TYPE_DEFAULT, "%s Adding preferred option %{public}@", buf, 0x16u);
                }

                objc_msgSend(v14, "addObject:", v24);
                ++v17;
              }
              objc_msgSend(v24, "avkit_setPreferredSortIndex:", v17);

            }
            v16 = v40;
            v18 = v38;
          }
        }
        else
        {
          if ((v41 & 1) == 0)
          {
            _AVLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v52 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
              v53 = 2112;
              v54 = v16;
              _os_log_impl(&dword_1AC4B1000, v28, OS_LOG_TYPE_DEFAULT, "%s Media option languages: %@", buf, 0x16u);
            }

          }
          _AVLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v52 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
            v53 = 2114;
            v54 = v20;
            _os_log_impl(&dword_1AC4B1000, v29, OS_LOG_TYPE_DEFAULT, "%s It appears none of the options matches preferred language %{public}@", buf, 0x16u);
          }

          v41 = 1;
        }

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v42);
  }

  _MediaOptionIndexesFromAvailableOptionsForPreferredLanguage(v16, v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count"))
  {
    v31 = objc_msgSend(v30, "firstIndex");
    if (v31 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v32 = v31;
      v33 = 0;
      do
      {
        objc_msgSend(v2, "objectAtIndexedSubscript:", v32, v37);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "avkit_preferredSortIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v34, "avkit_setBestChoiceForRecentLanguage:", 1);
        }
        else
        {
          if ((v33 & 1) == 0)
          {
            _AVLog();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v52 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
              v53 = 2114;
              v54 = v37;
              _os_log_impl(&dword_1AC4B1000, v35, OS_LOG_TYPE_DEFAULT, "%s The best choice for the recent language (%{public}@) is already in the preferred list", buf, 0x16u);
            }

          }
          v33 = 1;
        }

        v32 = objc_msgSend(v30, "indexGreaterThanIndex:", v32);
      }
      while (v32 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    _AVLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "void _UpdatePreferredMediaSelectionOptions(NSArray<AVMediaSelectionOption *> *__strong)";
      v53 = 2114;
      v54 = v37;
      _os_log_impl(&dword_1AC4B1000, v36, OS_LOG_TYPE_DEFAULT, "%s It appears none of the options matches recent language %{public}@", buf, 0x16u);
    }

  }
}

id _MediaOptionIndexesFromAvailableOptionsForPreferredLanguage(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CB34D0];
    v21[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredLocalizationsFromArray:forPreferences:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C997E8];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    if (v15 && v12)
    {
      if (objc_msgSend(v15, "isEqualToString:", v12))
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = ___MediaOptionIndexesFromAvailableOptionsForPreferredLanguage_block_invoke;
        v18[3] = &unk_1E5BB0CE0;
        v19 = v8;
        v20 = v9;
        objc_msgSend(v3, "indexesOfObjectsPassingTest:", v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void sub_1AC5351FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5358BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5365B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1AC537F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{

  _Unwind_Resume(a1);
}

void sub_1AC5386B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1AC538758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1AC538CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC539960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC53E6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC53EDB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;
  id *v22;

  v22 = v21;
  objc_destroyWeak(v22);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC53FCFC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AC5410A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC541824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1AC54498C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVKCImageAnalyzerClass_block_invoke_4315(uint64_t a1)
{
  Class result;
  uint64_t v3;

  VisionKitCoreLibrary();
  result = objc_getClass("VKCImageAnalyzer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVKCImageAnalyzerClass_softClass_4314 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)-[AVVideoFrameVisualAnalyzer _imageAnalysisQueue](v3);
  }
  return result;
}

uint64_t VisionKitCoreLibrary()
{
  uint64_t v0;
  void *v2;

  if (VisionKitCoreLibraryCore_frameworkLibrary_4318)
    return VisionKitCoreLibraryCore_frameworkLibrary_4318;
  VisionKitCoreLibraryCore_frameworkLibrary_4318 = _sl_dlopen();
  v0 = VisionKitCoreLibraryCore_frameworkLibrary_4318;
  if (!VisionKitCoreLibraryCore_frameworkLibrary_4318)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1AC544FD8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1AC545544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVKCImageAnalyzerRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  VisionKitCoreLibrary();
  result = objc_getClass("VKCImageAnalyzerRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVKCImageAnalyzerRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke_2(v3);
  }
  return result;
}

uint64_t __Block_byref_object_copy__4448(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4449(uint64_t a1)
{

}

uint64_t AVCaptureEventPhaseFromPhysicalButtonState(uint64_t result)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t buf[4];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (result == 3)
    {
      return 2;
    }
    else
    {
      if (result != 2)
      {
        v2 = result;
        _AVLog();
        v1 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v4 = v2;
          _os_log_impl(&dword_1AC4B1000, v1, OS_LOG_TYPE_DEFAULT, "Invalid _UIPhysicalButtonState %ld. Cannot be converted to AVCaptureEventPhase.", buf, 0xCu);
        }

        __assert_rtn("AVCaptureEventPhaseFromPhysicalButtonState", "AVCaptureEvent.m", 67, "NO");
      }
      return 1;
    }
  }
  return result;
}

void sub_1AC54B694(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1AC54C320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL isRunningEventThread()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVAirTransport eventThread](AVAirTransport, "eventThread");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v0 == v1;

  return v2;
}

uint64_t __Block_byref_object_copy__5343(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5344(uint64_t a1)
{

}

void sub_1AC54F164(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AC550378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5550BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AC55A344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC55B474(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1AC55DCCC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1AC55E3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC55EA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1AC55F710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC55FF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC560E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC561744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC562190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5623F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5625E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5627B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC562AB4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_1AC564A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC565418(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AC565C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8165(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8166(uint64_t a1)
{

}

void sub_1AC5683A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC568530(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AC568A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CMTime *AVTimeIntervalToCMTime(CMTime *result, Float64 a2)
{
  CMTime *v2;
  uint64_t v3;
  uint64_t v4;
  CMTimeEpoch epoch;
  CMTime v6;

  v2 = result;
  v3 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&result->value = *MEMORY[0x1E0CA2E18];
  result->epoch = *(_QWORD *)(v3 + 16);
  if (a2 == INFINITY)
  {
    v4 = MEMORY[0x1E0CA2E30];
  }
  else if (a2 == -INFINITY)
  {
    v4 = MEMORY[0x1E0CA2E28];
  }
  else
  {
    if (a2 != 0.0)
    {
      result = CMTimeMakeWithSeconds(&v6, a2, 90000);
      *(_OWORD *)&v2->value = *(_OWORD *)&v6.value;
      epoch = v6.epoch;
      goto LABEL_8;
    }
    v4 = MEMORY[0x1E0CA2E68];
  }
  *(_OWORD *)&result->value = *(_OWORD *)v4;
  epoch = *(_QWORD *)(v4 + 16);
LABEL_8:
  v2->epoch = epoch;
  return result;
}

void sub_1AC56ED48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void AVRequestConcreteImplementation(void *a1, const char *a2, objc_class *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;

  v12 = a1;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C99778];
  if (v5 == a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("*** -%@ cannot be sent to an abstract object of class %@: Create a concrete instance!"), v7, v6, v10, v11);
  }
  else
  {
    v9 = 45;
    if (v5 == v12)
      v9 = 43;
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("*** -%@ only defined for abstract class.  Define %c[%@ %@]!"), v7, v9, v6, v7);
  }

}

void sub_1AC5732B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5733F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1AC573BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC57609C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC577DAC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1AC57D70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC580030(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;
  void *v3;

  __destructor_8_s0_s8(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8(id *a1)
{

}

void sub_1AC58A8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC58B378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_1AC58C4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

Class __getMPMediaControlsConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  MediaPlayerLibrary();
  result = objc_getClass("MPMediaControlsConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaControlsConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getMPMediaControlsClass_block_invoke(v3);
  }
  return result;
}

Class __getMPMediaControlsClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  MediaPlayerLibrary();
  result = objc_getClass("MPMediaControls");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaControlsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__87__AVExternalPlaybackController_willBeginPlaybackFromAppWithBundleID_completionHandler___block_invoke(v3);
  }
  return result;
}

void MediaPlayerLibrary()
{
  void *v0;

  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MediaPlayerLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

void _CommonInit(void *a1, __int128 *a2)
{
  _QWORD *v3;
  CMTime *p_start;
  CMTime *p_duration;
  __int128 v6;
  __int128 v7;
  int v8;
  CMTimeEpoch v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  CMTimeEpoch v15;
  CMTime duration;
  CMTimeRange v17;
  CMTime start;

  v3 = a1;
  v3[2] = 0xBFF0000000000000;
  if ((*((_DWORD *)a2 + 3) & 1) == 0
    || (*((_DWORD *)a2 + 9) & 1) == 0
    || *((_QWORD *)a2 + 5)
    || (*((_QWORD *)a2 + 3) & 0x8000000000000000) != 0)
  {
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    duration = start;
    p_start = &start;
    p_duration = &duration;
  }
  else
  {
    if ((*((_DWORD *)a2 + 3) & 0x1D) == 1 && (*((_DWORD *)a2 + 9) & 0x1D) == 1
      || (dyld_program_sdk_at_least() & 1) == 0)
    {
      v10 = *a2;
      v11 = a2[2];
      *((_OWORD *)v3 + 5) = a2[1];
      *((_OWORD *)v3 + 6) = v11;
      *((_OWORD *)v3 + 4) = v10;
      goto LABEL_7;
    }
    if ((*((_DWORD *)a2 + 3) & 0x1D) != 1)
    {
      v12 = MEMORY[0x1E0CA2E50];
      v13 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
      *((_OWORD *)v3 + 4) = *MEMORY[0x1E0CA2E50];
      *((_OWORD *)v3 + 5) = v13;
      v7 = *(_OWORD *)(v12 + 32);
      goto LABEL_6;
    }
    v8 = *((_DWORD *)a2 + 9);
    if ((v8 & 0x1D) == 1 || (v8 & 0x11) == 0x11)
    {
      *(_OWORD *)&start.value = *(__int128 *)((char *)a2 + 24);
      v9 = *((_QWORD *)a2 + 5);
    }
    else
    {
      *(_OWORD *)&start.value = *MEMORY[0x1E0CA2E68];
      v9 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    }
    start.epoch = v9;
    duration = *(CMTime *)a2;
    v14 = *(_OWORD *)&start.value;
    v15 = v9;
    p_start = &duration;
    p_duration = (CMTime *)&v14;
  }
  CMTimeRangeMake(&v17, p_start, p_duration);
  v6 = *(_OWORD *)&v17.start.epoch;
  *((_OWORD *)v3 + 4) = *(_OWORD *)&v17.start.value;
  *((_OWORD *)v3 + 5) = v6;
  v7 = *(_OWORD *)&v17.duration.timescale;
LABEL_6:
  *((_OWORD *)v3 + 6) = v7;
LABEL_7:
  *((_BYTE *)v3 + 9) = 1;
  v3[6] = 0x7FF0000000000000;
  v3[7] = 0;

}

id _bestMatch(void *a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  if (!objc_msgSend(v11, "length"))
    __assert_rtn("_bestMatch", "AVRatingProviders.m", 98, "[countryCode length]");
  if (a4)
  {
    if (a4 == 2)
    {
      v12 = v10;
      v13 = v11;
      v14 = 2;
    }
    else
    {
      if (a4 != 1)
      {
        v23 = 0;
        goto LABEL_19;
      }
      v12 = v9;
      v13 = v11;
      v14 = 1;
    }
    _bestMatchForDomain(v12, v13, v14);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v9;
    v16 = v10;
    v17 = v11;
    if (!objc_msgSend(v17, "length"))
      __assert_rtn("_bestMatchForCountry", "AVRatingProviders.m", 89, "[countryCode length] > 0");
    _bestMatchForDomain(v15, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _bestMatchForDomain(v16, v17, 2);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = v18;
    if (v18)
      v22 = v18;
    else
      v22 = (void *)v19;
    if (!a5)
      v21 = v22;
    v23 = v21;

  }
LABEL_19:

  return v23;
}

AVMediaContentRating *_bestMatchForDomain(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  AVMediaContentRating *v9;

  v5 = a1;
  v6 = a2;
  if (!objc_msgSend(v6, "length"))
    __assert_rtn("_bestMatchForDomain", "AVRatingProviders.m", 72, "[countryCode length] > 0 && domain != AVMediaContentRatingDomainUnknown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ratingString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AVMediaContentRating initWithRating:rank:countryCode:domain:]([AVMediaContentRating alloc], "initWithRating:rank:countryCode:domain:", v8, objc_msgSend(v7, "integerValue"), v6, a3);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id _KeyForRating(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "uppercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E5BB5F88);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_1E5BB5F88);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E5BB5F88);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void _MakeReverseDictionaryForRatingDictionary(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a1;
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rank"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rating"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _KeyForRating(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v15, "uppercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v12);

    }
    else
    {
      v13 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(v15, "uppercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v7, v14, 0);

      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v9);
    }
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("ratingString"));

  }
}

void sub_1AC5920CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1AC594EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC595C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC59648C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1AC597298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC597BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 72));
  _Unwind_Resume(a1);
}

void sub_1AC597DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14895(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14896(uint64_t a1)
{

}

id getMPMediaControlsClass()
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
  v0 = (void *)getMPMediaControlsClass_softClass_14903;
  v7 = getMPMediaControlsClass_softClass_14903;
  if (!getMPMediaControlsClass_softClass_14903)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMPMediaControlsClass_block_invoke_14904;
    v3[3] = &unk_1E5BB4748;
    v3[4] = &v4;
    __getMPMediaControlsClass_block_invoke_14904((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AC598658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPMediaControlsClass_block_invoke_14904(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MediaPlayerLibraryCore_frameworkLibrary_14905)
  {
    MediaPlayerLibraryCore_frameworkLibrary_14905 = _sl_dlopen();
    if (!MediaPlayerLibraryCore_frameworkLibrary_14905)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MPMediaControls");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getMPMediaControlsClass_softClass_14903 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void _CommonInit_14937(void *a1)
{
  _QWORD *v1;
  AVObservationController *v2;
  void *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  id v8;

  v1 = a1;
  v2 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v1);
  v3 = (void *)v1[59];
  v1[59] = v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create("com.apple.avkit.avroutepickerview", v4);
  v6 = (void *)v1[52];
  v1[52] = v5;

  objc_msgSend(v1, "_createOrUpdateRoutePickerButton");
  objc_msgSend(v1, "_defaultActiveTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setActiveTintColor:", v7);

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v1, sel__routePickerButtonTapped_);
  objc_msgSend(v1, "addGestureRecognizer:", v8);
  objc_msgSend(v1, "_setupOutputContext");
  objc_msgSend(v1, "_registerNotifications");
  objc_msgSend(v1, "_updateAirPlayActive");

}

void sub_1AC59B4A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1AC59EEA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1AC5A4830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC5A602C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5A64E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5A6E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5A7174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5A88C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5A9700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5AA3C4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1AC5AB67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5AB970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5ADB34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5AF244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5AFB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5AFF18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5B027C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5B0528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5B06A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5B0828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5B0D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17301(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17302(uint64_t a1)
{

}

void sub_1AC5B3C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getMPVolumeHUDControllerClass()
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
  v0 = (void *)getMPVolumeHUDControllerClass_softClass;
  v7 = getMPVolumeHUDControllerClass_softClass;
  if (!getMPVolumeHUDControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMPVolumeHUDControllerClass_block_invoke;
    v3[3] = &unk_1E5BB4748;
    v3[4] = &v4;
    __getMPVolumeHUDControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AC5B4000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPVolumeHUDControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MediaPlayerLibraryCore_frameworkLibrary_17854)
  {
    MediaPlayerLibraryCore_frameworkLibrary_17854 = _sl_dlopen();
    if (!MediaPlayerLibraryCore_frameworkLibrary_17854)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MPVolumeHUDController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getMPVolumeHUDControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AC5B430C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5B510C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 32));
  _Unwind_Resume(a1);
}

void sub_1AC5B6DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  id *v12;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5B8C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5B95E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)(v18 - 104));
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5BC4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5BDE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVKCImageAnalysisInteractionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionKitCoreLibraryCore_frameworkLibrary_19890)
  {
    VisionKitCoreLibraryCore_frameworkLibrary_19890 = _sl_dlopen();
    if (!VisionKitCoreLibraryCore_frameworkLibrary_19890)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VKCImageAnalysisInteraction");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getVKCImageAnalysisInteractionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AC5C325C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5C817C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1AC5C8CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5CAE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5CB138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21494(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21495(uint64_t a1)
{

}

void playbackMinTimeForPlayerItem(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  if (!v3 || (v5 = v3, objc_msgSend(v3, "reversePlaybackEndTime"), v3 = v5, (*(_BYTE *)(a1 + 12) & 1) == 0))
  {
    v4 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)a1 = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(v4 + 16);
  }

}

void playbackMaxTimeForPlayerItemAndContentDuration(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  if (!v5 || (v6 = v5, objc_msgSend(v5, "forwardPlaybackEndTime"), v5 = v6, (*(_BYTE *)(a1 + 12) & 1) == 0))
  {
    *(_OWORD *)a1 = *(_OWORD *)a3;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a3 + 16);
  }

}

void sub_1AC5CCD4C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _captionAppearanceSettingsChangeNotificationCallback(uint64_t a1, void *a2)
{
  MACaptionAppearanceDisplayType DisplayType;
  id v3;

  v3 = a2;
  DisplayType = MACaptionAppearanceGetDisplayType(kMACaptionAppearanceDomainUser);
  if (DisplayType != objc_msgSend(v3, "captionAppearanceDisplayType"))
    objc_msgSend(v3, "setCaptionAppearanceDisplayType:", DisplayType);
  objc_msgSend(v3, "reloadLegibleOptions");

}

uint64_t _audibleMediaSettingsChangeNotificationCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadAudioOptions");
}

void sub_1AC5CF0E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1AC5D3218(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1AC5D3394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5D63C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5D6598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _CommonInit_23279(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(v1, "setContextMenuInteractionEnabled:", 1);
  objc_msgSend(v1, "setAppliesTransformToImageViewWhenHighlighted:", 1);

}

uint64_t __Block_byref_object_copy__23443(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23444(uint64_t a1)
{

}

void sub_1AC5DB678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC5DBFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  uint64_t v58;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v58 - 248), 8);
  _Block_object_dispose((const void *)(v58 - 184), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AC5DCF40()
{
  return MEMORY[0x1E0CADFA8]();
}

uint64_t sub_1AC5DCF4C()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1AC5DCF58()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1AC5DCF64()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1AC5DCF70()
{
  return MEMORY[0x1E0CAF8B0]();
}

uint64_t sub_1AC5DCF7C()
{
  return MEMORY[0x1E0CAFAA0]();
}

uint64_t sub_1AC5DCF88()
{
  return MEMORY[0x1E0CAFAB0]();
}

uint64_t sub_1AC5DCF94()
{
  return MEMORY[0x1E0CAFC18]();
}

uint64_t sub_1AC5DCFA0()
{
  return MEMORY[0x1E0CAFCA0]();
}

uint64_t sub_1AC5DCFAC()
{
  return MEMORY[0x1E0CAFCC0]();
}

uint64_t sub_1AC5DCFB8()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1AC5DCFC4()
{
  return MEMORY[0x1E0CB0460]();
}

uint64_t sub_1AC5DCFD0()
{
  return MEMORY[0x1E0CB04B8]();
}

uint64_t sub_1AC5DCFDC()
{
  return MEMORY[0x1E0CB04C0]();
}

uint64_t sub_1AC5DCFE8()
{
  return MEMORY[0x1E0CB0568]();
}

uint64_t sub_1AC5DCFF4()
{
  return MEMORY[0x1E0CB0728]();
}

uint64_t sub_1AC5DD000()
{
  return MEMORY[0x1E0CB0738]();
}

uint64_t sub_1AC5DD00C()
{
  return MEMORY[0x1E0CB0748]();
}

uint64_t sub_1AC5DD018()
{
  return MEMORY[0x1E0CB0768]();
}

uint64_t sub_1AC5DD024()
{
  return MEMORY[0x1E0CB0778]();
}

uint64_t sub_1AC5DD030()
{
  return MEMORY[0x1E0CB0798]();
}

uint64_t sub_1AC5DD03C()
{
  return MEMORY[0x1E0CB07A8]();
}

uint64_t sub_1AC5DD048()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1AC5DD054()
{
  return MEMORY[0x1E0CB0848]();
}

uint64_t sub_1AC5DD060()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1AC5DD06C()
{
  return MEMORY[0x1E0CB0BF8]();
}

uint64_t sub_1AC5DD078()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1AC5DD084()
{
  return MEMORY[0x1E0CB1030]();
}

uint64_t sub_1AC5DD090()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1AC5DD09C()
{
  return MEMORY[0x1E0DE9468]();
}

uint64_t sub_1AC5DD0A8()
{
  return MEMORY[0x1E0DE9488]();
}

uint64_t sub_1AC5DD0B4()
{
  return MEMORY[0x1E0DE9490]();
}

uint64_t sub_1AC5DD0C0()
{
  return MEMORY[0x1E0DE9498]();
}

uint64_t sub_1AC5DD0CC()
{
  return MEMORY[0x1E0DE94A0]();
}

uint64_t sub_1AC5DD0D8()
{
  return MEMORY[0x1E0DE94A8]();
}

uint64_t sub_1AC5DD0E4()
{
  return MEMORY[0x1E0DE94B0]();
}

uint64_t sub_1AC5DD0F0()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1AC5DD0FC()
{
  return MEMORY[0x1E0CD8230]();
}

uint64_t sub_1AC5DD108()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1AC5DD114()
{
  return MEMORY[0x1E0CD83B0]();
}

uint64_t sub_1AC5DD120()
{
  return MEMORY[0x1E0CD8548]();
}

uint64_t sub_1AC5DD12C()
{
  return MEMORY[0x1E0CD86F0]();
}

uint64_t sub_1AC5DD138()
{
  return MEMORY[0x1E0CD87C8]();
}

uint64_t sub_1AC5DD144()
{
  return MEMORY[0x1E0CD8C78]();
}

uint64_t sub_1AC5DD150()
{
  return MEMORY[0x1E0CD8C88]();
}

uint64_t sub_1AC5DD15C()
{
  return MEMORY[0x1E0CD8C98]();
}

uint64_t sub_1AC5DD168()
{
  return MEMORY[0x1E0CD8D68]();
}

uint64_t sub_1AC5DD174()
{
  return MEMORY[0x1E0CD8EE8]();
}

uint64_t sub_1AC5DD180()
{
  return MEMORY[0x1E0CD8F08]();
}

uint64_t sub_1AC5DD18C()
{
  return MEMORY[0x1E0CD8F20]();
}

uint64_t sub_1AC5DD198()
{
  return MEMORY[0x1E0CD9040]();
}

uint64_t sub_1AC5DD1A4()
{
  return MEMORY[0x1E0CD9058]();
}

uint64_t sub_1AC5DD1B0()
{
  return MEMORY[0x1E0CD9960]();
}

uint64_t sub_1AC5DD1BC()
{
  return MEMORY[0x1E0CD9AE0]();
}

uint64_t sub_1AC5DD1C8()
{
  return MEMORY[0x1E0CD9BC8]();
}

uint64_t sub_1AC5DD1D4()
{
  return MEMORY[0x1E0CD9C98]();
}

uint64_t sub_1AC5DD1E0()
{
  return MEMORY[0x1E0CDA080]();
}

uint64_t sub_1AC5DD1EC()
{
  return MEMORY[0x1E0CDA210]();
}

uint64_t sub_1AC5DD1F8()
{
  return MEMORY[0x1E0CDA420]();
}

uint64_t sub_1AC5DD204()
{
  return MEMORY[0x1E0CDA460]();
}

uint64_t sub_1AC5DD210()
{
  return MEMORY[0x1E0CDA470]();
}

uint64_t sub_1AC5DD21C()
{
  return MEMORY[0x1E0CDA4D8]();
}

uint64_t sub_1AC5DD228()
{
  return MEMORY[0x1E0CDA4F0]();
}

uint64_t sub_1AC5DD234()
{
  return MEMORY[0x1E0CDA628]();
}

uint64_t sub_1AC5DD240()
{
  return MEMORY[0x1E0CDA638]();
}

uint64_t sub_1AC5DD24C()
{
  return MEMORY[0x1E0CDA6F0]();
}

uint64_t sub_1AC5DD258()
{
  return MEMORY[0x1E0CDA770]();
}

uint64_t sub_1AC5DD264()
{
  return MEMORY[0x1E0CDA8D0]();
}

uint64_t sub_1AC5DD270()
{
  return MEMORY[0x1E0CDA8E8]();
}

uint64_t sub_1AC5DD27C()
{
  return MEMORY[0x1E0CDA9D8]();
}

uint64_t sub_1AC5DD288()
{
  return MEMORY[0x1E0CDA9E8]();
}

uint64_t sub_1AC5DD294()
{
  return MEMORY[0x1E0CDAA28]();
}

uint64_t sub_1AC5DD2A0()
{
  return MEMORY[0x1E0CDAA38]();
}

uint64_t sub_1AC5DD2AC()
{
  return MEMORY[0x1E0CDACD0]();
}

uint64_t sub_1AC5DD2B8()
{
  return MEMORY[0x1E0CDAFF0]();
}

uint64_t sub_1AC5DD2C4()
{
  return MEMORY[0x1E0CDB0F0]();
}

uint64_t sub_1AC5DD2D0()
{
  return MEMORY[0x1E0CDB250]();
}

uint64_t sub_1AC5DD2DC()
{
  return MEMORY[0x1E0CDB290]();
}

uint64_t sub_1AC5DD2E8()
{
  return MEMORY[0x1E0CDB418]();
}

uint64_t sub_1AC5DD2F4()
{
  return MEMORY[0x1E0CDB428]();
}

uint64_t sub_1AC5DD300()
{
  return MEMORY[0x1E0CDB440]();
}

uint64_t sub_1AC5DD30C()
{
  return MEMORY[0x1E0CDB600]();
}

uint64_t sub_1AC5DD318()
{
  return MEMORY[0x1E0CDB620]();
}

uint64_t sub_1AC5DD324()
{
  return MEMORY[0x1E0CDB868]();
}

uint64_t sub_1AC5DD330()
{
  return MEMORY[0x1E0CDB9E8]();
}

uint64_t sub_1AC5DD33C()
{
  return MEMORY[0x1E0CDBA10]();
}

uint64_t sub_1AC5DD348()
{
  return MEMORY[0x1E0CDBA20]();
}

uint64_t sub_1AC5DD354()
{
  return MEMORY[0x1E0CDBF90]();
}

uint64_t sub_1AC5DD360()
{
  return MEMORY[0x1E0CDC0D0]();
}

uint64_t sub_1AC5DD36C()
{
  return MEMORY[0x1E0CDC0D8]();
}

uint64_t sub_1AC5DD378()
{
  return MEMORY[0x1E0CDC178]();
}

uint64_t sub_1AC5DD384()
{
  return MEMORY[0x1E0CDC318]();
}

uint64_t sub_1AC5DD390()
{
  return MEMORY[0x1E0CDC348]();
}

uint64_t sub_1AC5DD39C()
{
  return MEMORY[0x1E0CDC370]();
}

uint64_t sub_1AC5DD3A8()
{
  return MEMORY[0x1E0CDC380]();
}

uint64_t sub_1AC5DD3B4()
{
  return MEMORY[0x1E0CDC3A0]();
}

uint64_t sub_1AC5DD3C0()
{
  return MEMORY[0x1E0CDC530]();
}

uint64_t sub_1AC5DD3CC()
{
  return MEMORY[0x1E0CDC548]();
}

uint64_t sub_1AC5DD3D8()
{
  return MEMORY[0x1E0CDC558]();
}

uint64_t sub_1AC5DD3E4()
{
  return MEMORY[0x1E0CDC858]();
}

uint64_t sub_1AC5DD3F0()
{
  return MEMORY[0x1E0CDC870]();
}

uint64_t sub_1AC5DD3FC()
{
  return MEMORY[0x1E0CDD2E0]();
}

uint64_t sub_1AC5DD408()
{
  return MEMORY[0x1E0CDD308]();
}

uint64_t sub_1AC5DD414()
{
  return MEMORY[0x1E0CDD318]();
}

uint64_t sub_1AC5DD420()
{
  return MEMORY[0x1E0CDD328]();
}

uint64_t sub_1AC5DD42C()
{
  return MEMORY[0x1E0CDD360]();
}

uint64_t sub_1AC5DD438()
{
  return MEMORY[0x1E0CDD388]();
}

uint64_t sub_1AC5DD444()
{
  return MEMORY[0x1E0CDD398]();
}

uint64_t sub_1AC5DD450()
{
  return MEMORY[0x1E0CDD3A8]();
}

uint64_t sub_1AC5DD45C()
{
  return MEMORY[0x1E0CDD430]();
}

uint64_t sub_1AC5DD468()
{
  return MEMORY[0x1E0CDD4E8]();
}

uint64_t sub_1AC5DD474()
{
  return MEMORY[0x1E0CDD768]();
}

uint64_t sub_1AC5DD480()
{
  return MEMORY[0x1E0CDD778]();
}

uint64_t sub_1AC5DD48C()
{
  return MEMORY[0x1E0CDDB90]();
}

uint64_t sub_1AC5DD498()
{
  return MEMORY[0x1E0CDDC30]();
}

uint64_t sub_1AC5DD4A4()
{
  return MEMORY[0x1E0CDDC50]();
}

uint64_t sub_1AC5DD4B0()
{
  return MEMORY[0x1E0CDDD90]();
}

uint64_t sub_1AC5DD4BC()
{
  return MEMORY[0x1E0CDDDA8]();
}

uint64_t sub_1AC5DD4C8()
{
  return MEMORY[0x1E0CDDDD8]();
}

uint64_t sub_1AC5DD4D4()
{
  return MEMORY[0x1E0CDDE50]();
}

uint64_t sub_1AC5DD4E0()
{
  return MEMORY[0x1E0CDDE60]();
}

uint64_t sub_1AC5DD4EC()
{
  return MEMORY[0x1E0CDDF10]();
}

uint64_t sub_1AC5DD4F8()
{
  return MEMORY[0x1E0CDDFF8]();
}

uint64_t sub_1AC5DD504()
{
  return MEMORY[0x1E0CDE068]();
}

uint64_t sub_1AC5DD510()
{
  return MEMORY[0x1E0CDE378]();
}

uint64_t sub_1AC5DD51C()
{
  return MEMORY[0x1E0CDE498]();
}

uint64_t sub_1AC5DD528()
{
  return MEMORY[0x1E0CDE4B0]();
}

uint64_t sub_1AC5DD534()
{
  return MEMORY[0x1E0CDE660]();
}

uint64_t sub_1AC5DD540()
{
  return MEMORY[0x1E0CDE770]();
}

uint64_t sub_1AC5DD54C()
{
  return MEMORY[0x1E0CDE780]();
}

uint64_t sub_1AC5DD558()
{
  return MEMORY[0x1E0CDE958]();
}

uint64_t sub_1AC5DD564()
{
  return MEMORY[0x1E0CDEAF0]();
}

uint64_t sub_1AC5DD570()
{
  return MEMORY[0x1E0CDECE0]();
}

uint64_t sub_1AC5DD57C()
{
  return MEMORY[0x1E0CDF140]();
}

uint64_t sub_1AC5DD588()
{
  return MEMORY[0x1E0CDF4B0]();
}

uint64_t sub_1AC5DD594()
{
  return MEMORY[0x1E0CDF4C8]();
}

uint64_t sub_1AC5DD5A0()
{
  return MEMORY[0x1E0CDF590]();
}

uint64_t sub_1AC5DD5AC()
{
  return MEMORY[0x1E0CDF6A0]();
}

uint64_t sub_1AC5DD5B8()
{
  return MEMORY[0x1E0CDF708]();
}

uint64_t sub_1AC5DD5C4()
{
  return MEMORY[0x1E0CDF738]();
}

uint64_t sub_1AC5DD5D0()
{
  return MEMORY[0x1E0CDF780]();
}

uint64_t sub_1AC5DD5DC()
{
  return MEMORY[0x1E0CDF808]();
}

uint64_t sub_1AC5DD5E8()
{
  return MEMORY[0x1E0CDF860]();
}

uint64_t sub_1AC5DD5F4()
{
  return MEMORY[0x1E0CDF870]();
}

uint64_t sub_1AC5DD600()
{
  return MEMORY[0x1E0CDF960]();
}

uint64_t sub_1AC5DD60C()
{
  return MEMORY[0x1E0CDF978]();
}

uint64_t sub_1AC5DD618()
{
  return MEMORY[0x1E0CDF980]();
}

uint64_t sub_1AC5DD624()
{
  return MEMORY[0x1E0CDF998]();
}

uint64_t sub_1AC5DD630()
{
  return MEMORY[0x1E0CDF9F8]();
}

uint64_t sub_1AC5DD63C()
{
  return MEMORY[0x1E0CDFD40]();
}

uint64_t sub_1AC5DD648()
{
  return MEMORY[0x1E0CDFD50]();
}

uint64_t sub_1AC5DD654()
{
  return MEMORY[0x1E0CDFEA0]();
}

uint64_t sub_1AC5DD660()
{
  return MEMORY[0x1E0CE01A0]();
}

uint64_t sub_1AC5DD66C()
{
  return MEMORY[0x1E0CE01B8]();
}

uint64_t sub_1AC5DD678()
{
  return MEMORY[0x1E0CE0218]();
}

uint64_t sub_1AC5DD684()
{
  return MEMORY[0x1E0CE0230]();
}

uint64_t sub_1AC5DD690()
{
  return MEMORY[0x1E0CE02B8]();
}

uint64_t sub_1AC5DD69C()
{
  return MEMORY[0x1E0CE06D8]();
}

uint64_t sub_1AC5DD6A8()
{
  return MEMORY[0x1E0DEF000]();
}

uint64_t sub_1AC5DD6B4()
{
  return MEMORY[0x1E0DEF010]();
}

uint64_t sub_1AC5DD6C0()
{
  return MEMORY[0x1E0DEF018]();
}

uint64_t sub_1AC5DD6CC()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1AC5DD6D8()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1AC5DD6E4()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1AC5DD6F0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1AC5DD6FC()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1AC5DD708()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1AC5DD714()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1AC5DD720()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1AC5DD72C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1AC5DD738()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1AC5DD744()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1AC5DD750()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1AC5DD75C()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1AC5DD768()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1AC5DD774()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1AC5DD780()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1AC5DD78C()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1AC5DD798()
{
  return MEMORY[0x1E0DEF2C0]();
}

uint64_t sub_1AC5DD7A4()
{
  return MEMORY[0x1E0DEF2C8]();
}

uint64_t sub_1AC5DD7B0()
{
  return MEMORY[0x1E0DE94F0]();
}

uint64_t sub_1AC5DD7BC()
{
  return MEMORY[0x1E0DEF330]();
}

uint64_t sub_1AC5DD7C8()
{
  return MEMORY[0x1E0DEF340]();
}

uint64_t sub_1AC5DD7D4()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1AC5DD7E0()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1AC5DD7EC()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1AC5DD7F8()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1AC5DD804()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1AC5DD810()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1AC5DD81C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1AC5DD828()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1AC5DD834()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1AC5DD840()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1AC5DD84C()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1AC5DD858()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1AC5DD864()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1AC5DD870()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1AC5DD87C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1AC5DD888()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1AC5DD894()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1AC5DD8A0()
{
  return MEMORY[0x1E0DEDF40]();
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C8A6E8]((__n128)aspectRatio, *(__n128 *)&aspectRatio.height, (__n128)boundingRect.origin, *(__n128 *)&boundingRect.origin.y, (__n128)boundingRect.size, *(__n128 *)&boundingRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1E0CD2330]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1E0CD2348]();
}

uint64_t CAColorMatrixMakeSaturation()
{
  return MEMORY[0x1E0CD2370]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x1E0CD25F8](a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
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

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
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

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
  MEMORY[0x1E0C9C398](c, allowsAntialiasing);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1E0C9C6B8]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x1E0C9D2B8](path1, m, path2);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

const AudioFormatListItem *__cdecl CMAudioFormatDescriptionGetFormatList(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioFormatListItem *)MEMORY[0x1E0C9EAA8](desc, sizeOut);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1E0C9EBA8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1E0C9EFB0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1E0C9EFD0](sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

CMTime *__cdecl CMTimeCodeFormatDescriptionGetFrameDuration(CMTime *__return_ptr retstr, CMTimeCodeFormatDescriptionRef timeCodeFormatDescription)
{
  return (CMTime *)MEMORY[0x1E0C9F2C0](retstr, timeCodeFormatDescription);
}

uint32_t CMTimeCodeFormatDescriptionGetTimeCodeFlags(CMTimeCodeFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9F2D0](desc);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
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

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F378](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F380](retstr, time, *(_QWORD *)&multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F3B0](range, allocator);
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

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3F0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

Float64 CMTimebaseGetEffectiveRate(CMTimebaseRef timebase)
{
  Float64 result;

  MEMORY[0x1E0C9F460](timebase);
  return result;
}

CMTime *__cdecl CMTimebaseGetTime(CMTime *__return_ptr retstr, CMTimebaseRef timebase)
{
  return (CMTime *)MEMORY[0x1E0C9F470](retstr, timebase);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

uint64_t CMVideoFormatDescriptionGetVideoDynamicRange()
{
  return MEMORY[0x1E0C9F588]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1E0CA7C10]();
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

uint64_t FigGetRotationAngleAndFlipsFromCGAffineTransform()
{
  return MEMORY[0x1E0CC2AD0]();
}

uint64_t FigIsHDRAllowedOnDevice()
{
  return MEMORY[0x1E0CA0D58]();
}

BOOL MACaptionAppearanceAddSelectedLanguage(MACaptionAppearanceDomain domain, CFStringRef language)
{
  return MEMORY[0x1E0CC1B58](domain, language);
}

CFArrayRef MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(MACaptionAppearanceDomain domain)
{
  return (CFArrayRef)MEMORY[0x1E0CC1B80](domain);
}

CFArrayRef MACaptionAppearanceCopySelectedLanguages(MACaptionAppearanceDomain domain)
{
  return (CFArrayRef)MEMORY[0x1E0CC1B88](domain);
}

MACaptionAppearanceDisplayType MACaptionAppearanceGetDisplayType(MACaptionAppearanceDomain domain)
{
  return MEMORY[0x1E0CC1BA8](domain);
}

uint64_t MACaptionAppearancePrefCopyPreferAccessibleCaptions()
{
  return MEMORY[0x1E0CC1BF0]();
}

void MACaptionAppearanceSetDisplayType(MACaptionAppearanceDomain domain, MACaptionAppearanceDisplayType displayType)
{
  MEMORY[0x1E0CC1C10](domain, displayType);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MRLanguageOptionCopyIdentifier()
{
  return MEMORY[0x1E0D4BCE8]();
}

uint64_t MRLanguageOptionCreate()
{
  return MEMORY[0x1E0D4BCF8]();
}

uint64_t MRLanguageOptionCreateAutomaticLanguageOptionForType()
{
  return MEMORY[0x1E0D4BD00]();
}

uint64_t MRLanguageOptionCreateFromExternalRepresentation()
{
  return MEMORY[0x1E0D4BD10]();
}

uint64_t MRLanguageOptionGetType()
{
  return MEMORY[0x1E0D4BD18]();
}

uint64_t MRLanguageOptionGroupCreate()
{
  return MEMORY[0x1E0D4BD28]();
}

uint64_t MRLanguageOptionGroupsCreateExternalRepresentation()
{
  return MEMORY[0x1E0D4BD48]();
}

uint64_t MRLanguageOptionsCreateExternalRepresentation()
{
  return MEMORY[0x1E0D4BD68]();
}

uint64_t MRMediaRemoteAddCommandHandlerBlock()
{
  return MEMORY[0x1E0D4BDD8]();
}

uint64_t MRMediaRemoteCommandInfoCreate()
{
  return MEMORY[0x1E0D4BE18]();
}

uint64_t MRMediaRemoteCommandInfoSetCommand()
{
  return MEMORY[0x1E0D4BE30]();
}

uint64_t MRMediaRemoteCommandInfoSetEnabled()
{
  return MEMORY[0x1E0D4BE38]();
}

uint64_t MRMediaRemoteCommandInfoSetOptions()
{
  return MEMORY[0x1E0D4BE40]();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return MEMORY[0x1E0D4BED0]();
}

uint64_t MRMediaRemoteGetDeviceInfo()
{
  return MEMORY[0x1E0D4BEE8]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x1E0D4BEF8]();
}

uint64_t MRMediaRemoteRemoveCommandHandlerBlock()
{
  return MEMORY[0x1E0D4C088]();
}

uint64_t MRMediaRemoteSetCanBeNowPlayingApplication()
{
  return MEMORY[0x1E0D4C0F8]();
}

uint64_t MRMediaRemoteSetNowPlayingInfoWithMergePolicy()
{
  return MEMORY[0x1E0D4C130]();
}

uint64_t MRMediaRemoteSetParentApplication()
{
  return MEMORY[0x1E0D4C148]();
}

uint64_t MRMediaRemoteSetSupportedCommands()
{
  return MEMORY[0x1E0D4C168]();
}

uint64_t MRMediaRemoteSetWantsOriginChangeNotifications()
{
  return MEMORY[0x1E0D4C188]();
}

uint64_t MRPairedDeviceCopyDeviceUID()
{
  return MEMORY[0x1E0D4C228]();
}

uint64_t MRPairedDeviceCopyGroupedDevices()
{
  return MEMORY[0x1E0D4C238]();
}

uint64_t MRPairedDeviceGetDeviceClass()
{
  return MEMORY[0x1E0D4C250]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
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

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88B8](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0DC4550]();
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x1E0DC4980]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0DC49A0]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1E0DC4A10]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0DC4BB8]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1E0DC4CF0]();
}

uint64_t UIPointIsDiscrete()
{
  return MEMORY[0x1E0DC51F8]();
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x1E0DC5200]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1E0DC5208]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1E0DC5398]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x1E0DC53A0]();
}

uint64_t _AXSAutomaticSubtitlesShowOnSkipBack()
{
  return MEMORY[0x1E0DDD5D8]();
}

uint64_t _AXSAutomaticSubtitlesShowWhenMuted()
{
  return MEMORY[0x1E0DDD5E0]();
}

uint64_t _AXSClosedCaptionsEnabled()
{
  return MEMORY[0x1E0DDD698]();
}

uint64_t _AXSExtendedVoiceIsolationMediaModesEnabled()
{
  return MEMORY[0x1E0DDD738]();
}

uint64_t _AXSPhotosensitiveMitigationEnabled()
{
  return MEMORY[0x1E0DDDAA0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1E0C9A260]();
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x1E0CB3BF8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
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

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
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

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C838F0](a1, a2);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
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

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

