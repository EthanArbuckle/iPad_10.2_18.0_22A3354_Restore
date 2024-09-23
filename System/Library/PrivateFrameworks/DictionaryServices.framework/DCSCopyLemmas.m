@implementation DCSCopyLemmas

uint64_t __DCSCopyLemmas_block_invoke()
{
  DCSCopyLemmas__AnalyzersForLanguage = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  return pthread_mutex_init(&DCSCopyLemmas__AnalyzersCacheMutex, 0);
}

uint64_t __DCSCopyLemmas_block_invoke_2(uint64_t a1)
{
  __CFDictionary *Mutable;
  const void *v3;
  const void *v4;
  const __CFDictionary *Value;
  __CFDictionary *v6;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, *(const void **)(*(_QWORD *)(a1 + 32) + 16), *(const void **)(a1 + 40));
  v3 = (const void *)(**(uint64_t (***)(__CFDictionary *))(a1 + 32))(Mutable);
  CFRelease(Mutable);
  v4 = 0;
  if (!*(_QWORD *)(a1 + 48))
    v4 = (const void *)LXLemmatizerCreate();
  pthread_mutex_lock(&DCSCopyLemmas__AnalyzersCacheMutex);
  Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)DCSCopyLemmas__AnalyzersForLanguage, *(const void **)(a1 + 40));
  if (Value)
  {
    v6 = Value;
    if (!v3)
    {
      if (!v4)
        return pthread_mutex_unlock(&DCSCopyLemmas__AnalyzersCacheMutex);
      if (!CFDictionaryGetValue(Value, CFSTR("Lemmatizer")))
        CFDictionarySetValue(v6, CFSTR("Lemmatizer"), v4);
      goto LABEL_10;
    }
    if (!CFDictionaryGetValue(Value, CFSTR("MorphologicalAnalyzer")))
      CFDictionarySetValue(v6, CFSTR("MorphologicalAnalyzer"), v3);
  }
  else if (!v3)
  {
    goto LABEL_9;
  }
  CFRelease(v3);
LABEL_9:
  if (v4)
LABEL_10:
    CFRelease(v4);
  return pthread_mutex_unlock(&DCSCopyLemmas__AnalyzersCacheMutex);
}

void __DCSCopyLemmas_block_invoke_3(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), a2);
}

void __DCSCopyLemmas_block_invoke_4(uint64_t a1, CFStringRef theString1)
{
  if (CFStringCompare(theString1, *(CFStringRef *)(a1 + 32), 1uLL))
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), theString1, &stru_1E8B587B0);
}

@end
