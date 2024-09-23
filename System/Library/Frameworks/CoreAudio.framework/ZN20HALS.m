@implementation ZN20HALS

CFDictionaryRef *___ZN20HALS_SettingsManager17ReadServerSettingEPK10__CFString_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  const __CFString *v5;
  uint64_t v6;
  CFDictionaryRef *result;
  void *v8;

  v6 = a1[5];
  v5 = (const __CFString *)a1[6];
  v8 = 0;
  result = *(CFDictionaryRef **)(v6 + 32);
  if (result)
    result = (CFDictionaryRef *)CASettingsStorage::CopyCFTypeValue(result, v5, (const void **)&v8, a4);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v8;
  return result;
}

@end
