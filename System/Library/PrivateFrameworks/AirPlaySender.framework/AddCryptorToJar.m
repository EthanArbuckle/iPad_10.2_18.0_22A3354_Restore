@implementation AddCryptorToJar

void __audioHoseManagerBuffered_AddCryptorToJar_block_invoke(uint64_t a1)
{
  if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 448), *(const void **)(a1 + 48))
    && (CMNotificationCenterGetDefaultLocalCenter(),
        (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigNotificationCenterAddWeakListener()) != 0))
  {
    APSLogErrorAt();
  }
  else
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 448), *(const void **)(a1 + 48), *(const void **)(a1 + 64));
  }
}

@end
