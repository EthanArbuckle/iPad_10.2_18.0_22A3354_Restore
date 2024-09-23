@implementation CFCachedURLResponseSetBecameFileBackedCallBackBlock

void ___CFCachedURLResponseSetBecameFileBackedCallBackBlock_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  __CFDictionary *v6;
  const void *v7;

  v2 = CFURLCacheCopySharedURLCache();
  if (v2)
  {
    v3 = (_QWORD *)v2;
    v4 = *(_QWORD *)(v2 + 16);
    if (v4)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v4 + 456));
      v5 = v3[2];
      v6 = *(__CFDictionary **)(v5 + 520);
      if (v6)
      {
        CFDictionaryRemoveValue(v6, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        v5 = v3[2];
      }
      pthread_mutex_unlock((pthread_mutex_t *)(v5 + 456));
    }
    CFRelease(v3);
  }
  v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v7)
    CFRelease(v7);
}

@end
