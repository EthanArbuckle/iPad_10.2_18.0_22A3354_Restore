@implementation MFAARemoveCertDataEntryFromCache

BOOL __MFAARemoveCertDataEntryFromCache_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 result;

  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 40), *(const void **)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = SyncCertCacheContentsToPreferencesFile(*(_QWORD *)(v2 + 32), *(const void **)(v2 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
