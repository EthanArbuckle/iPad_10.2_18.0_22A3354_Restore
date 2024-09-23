@implementation APCarPlayAnalyticsSubmitToCarPlay

void __APCarPlayAnalyticsSubmitToCarPlay_block_invoke(uint64_t a1)
{
  uint64_t v2;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v4;
  const __CFAllocator *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  CFStringRef AnalyticsKeyForStreamType;
  CFMutableStringRef v10;
  unsigned int v11;
  unint64_t v12;
  CFIndex Length;
  CFMutableStringRef v14;
  size_t Count;
  const void **v16;
  CFIndex v17;
  CFIndex i;
  const void *v19;
  const char *v20;
  CFStringRef v21;
  int v22;
  const void *v23;

  v2 = *(_QWORD *)(a1 + 40);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    APSLogErrorAt();
    v22 = -6729;
    goto LABEL_39;
  }
  v4 = Mutable;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v7 = v6;
  if (*(int *)(v2 + 112) >= 1)
  {
    carPlayAnalytics_addValueToReportingString((uint64_t)CFSTR("nmnl"), v6, *(double *)(v2 + 184));
    carPlayAnalytics_addValueToReportingString((uint64_t)CFSTR("mean"), v7, *(double *)(v2 + 88));
    carPlayAnalytics_addValueToReportingString((uint64_t)CFSTR("stdv"), v7, *(double *)(v2 + 104));
    carPlayAnalytics_addValueToReportingString((uint64_t)CFSTR("imean"), v7, *(double *)(v2 + 152));
    carPlayAnalytics_addValueToReportingString((uint64_t)CFSTR("istdv"), v7, *(double *)(v2 + 168));
    AnalyticsKeyForStreamType = carPlayAnalytics_createAnalyticsKeyForStreamType(v8, CFSTR("APCarPlay_%s_audioSampleRateStatistics"), *(unsigned int *)(v2 + 32));
    CFDictionarySetValue(v4, AnalyticsKeyForStreamType, v7);
    if (!v7)
      goto LABEL_5;
    goto LABEL_4;
  }
  AnalyticsKeyForStreamType = 0;
  if (v6)
LABEL_4:
    CFRelease(v7);
LABEL_5:
  if (AnalyticsKeyForStreamType)
    CFRelease(AnalyticsKeyForStreamType);
  v10 = CFStringCreateMutable(v5, 0);
  v11 = 2 * *(_DWORD *)(v2 + 24);
  if (v11)
  {
    if (v11 % 0x3C)
      v12 = v11 / 0x3CuLL + 1;
    else
      v12 = v11 / 0x3CuLL;
    if (!v12)
    {
LABEL_14:
      if (!v10)
        goto LABEL_16;
      goto LABEL_15;
    }
    carPlayAnalytics_addAnomalyToReportingStringIfExists(v2 + 200, v12, v10);
    carPlayAnalytics_addAnomalyToReportingStringIfExists(v2 + 264, v12, v10);
    carPlayAnalytics_addAnomalyToReportingStringIfExists(v2 + 232, v12, v10);
    carPlayAnalytics_addAnomalyToReportingStringIfExists(v2 + 296, v12, v10);
    carPlayAnalytics_addAnomalyToReportingStringIfExists(v2 + 328, v12, v10);
    carPlayAnalytics_addAnomalyToReportingStringIfExists(v2 + 360, v12, v10);
    Length = CFStringGetLength(v10);
    if (Length >= 1)
    {
      v12 = (unint64_t)carPlayAnalytics_createAnalyticsKeyForStreamType(Length, CFSTR("APCarPlay_%s_audioPercentageWithAnomalies"), *(unsigned int *)(v2 + 32));
      CFDictionarySetValue(v4, (const void *)v12, v10);
      goto LABEL_14;
    }
  }
  v12 = 0;
  if (v10)
LABEL_15:
    CFRelease(v10);
LABEL_16:
  if (v12)
    CFRelease((CFTypeRef)v12);
  v14 = CFStringCreateMutable(v5, 0);
  if (*(_BYTE *)(v2 + 392) && CFSetGetCount(*(CFSetRef *)(v2 + 400)) >= 1)
  {
    Count = CFSetGetCount(*(CFSetRef *)(v2 + 400));
    v16 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
    CFSetGetValues(*(CFSetRef *)(v2 + 400), v16);
    v17 = CFSetGetCount(*(CFSetRef *)(v2 + 400));
    if (v17 >= 1)
    {
      for (i = 0; i < v17; ++i)
      {
        v19 = v16[i];
        if (CFStringGetLength(v14))
          v20 = " ";
        else
          v20 = "";
        CFStringAppendFormat(v14, 0, CFSTR("%s%@"), v20, v19);
        v17 = CFSetGetCount(*(CFSetRef *)(v2 + 400));
      }
    }
    v21 = carPlayAnalytics_createAnalyticsKeyForStreamType(v17, CFSTR("APCarPlay_%s_audioFormats"), *(unsigned int *)(v2 + 32));
    CFDictionarySetValue(v4, v21, v14);
    if (!v14)
      goto LABEL_28;
  }
  else
  {
    v16 = 0;
    v21 = 0;
    if (!v14)
      goto LABEL_28;
  }
  CFRelease(v14);
LABEL_28:
  if (v21)
    CFRelease(v21);
  free(v16);
  if (CFDictionaryGetCount(v4) >= 1)
  {
    if (gLogCategory_APCarPlayAnalytics <= 50
      && (gLogCategory_APCarPlayAnalytics != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    APCarPlay_AddAnalyticsValues(v4, CFSTR("SessionEnded"));
  }
  CFRelease(v4);
  v22 = 0;
LABEL_39:
  v23 = *(const void **)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v22;
  if (v23)
    CFRelease(v23);
}

@end
