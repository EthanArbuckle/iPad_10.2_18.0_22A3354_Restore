@implementation APCarPlayAnalyticsCollectFromFeedbackResponse

void __APCarPlayAnalyticsCollectFromFeedbackResponse_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  const __CFArray *TypedValue;
  const __CFDictionary *Value;
  const __CFDictionary *v7;
  int v8;
  BOOL v9;
  const void *v10;
  const void *v11;
  const void *v12;

  v2 = a1[4];
  if (*(_BYTE *)(v2 + 28))
  {
    v4 = (const __CFDictionary *)a1[5];
    v3 = a1[6];
    ++*(_DWORD *)(v2 + 24);
    if (*(_BYTE *)(v2 + 48))
    {
      CFArrayGetTypeID();
      TypedValue = (const __CFArray *)CFDictionaryGetTypedValue();
      if (!TypedValue)
        goto LABEL_16;
      CFArrayGetCount(TypedValue);
      CFArrayApplyBlock();
    }
    Value = (const __CFDictionary *)CFDictionaryGetValue(v4, CFSTR("statsDictionary"));
    v7 = Value;
    v8 = *(unsigned __int8 *)(v2 + 192);
    if (Value)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      CFDictionaryApplyFunction(Value, (CFDictionaryApplierFunction)carPlayAnalytics_collectAudioAnomaliesFromStreamIfPresent, (void *)v2);
      v8 = *(unsigned __int8 *)(v2 + 192);
    }
    if (v3 && v8)
    {
      carPlayAnalytics_updateAnomalyCounter(v2, v3, v2 + 328);
      carPlayAnalytics_updateAnomalyCounter(v2, v3, v2 + 360);
    }
    if (v7 && *(_BYTE *)(v2 + 392))
      CFDictionaryApplyFunction(v7, (CFDictionaryApplierFunction)carPlayAnalytics_collectAudioFormatsFromStreamIfPresent, (void *)v2);
  }
LABEL_16:
  v10 = (const void *)a1[4];
  if (v10)
    CFRelease(v10);
  v11 = (const void *)a1[5];
  if (v11)
    CFRelease(v11);
  v12 = (const void *)a1[6];
  if (v12)
    CFRelease(v12);
}

@end
