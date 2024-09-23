@implementation FigAirPlaySecureStopRouterCommitToDisk

uint64_t __FigAirPlaySecureStopRouterCommitToDisk_block_invoke(uint64_t a1)
{
  uint64_t result;
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t);

  result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)sAirPlayManagerSingletonContext_0, *(const void **)(a1 + 40));
  if (result)
  {
    v3 = (const __CFDictionary *)result;
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("FigAirPlaySSM_SecureStopManager"));
    if (result)
    {
      v4 = result;
      result = (uint64_t)CFDictionaryGetValue(v3, CFSTR("FigAirPlaySSM_AppID"));
      if (result)
      {
        v5 = result;
        result = (uint64_t)CFDictionaryGetValue(v3, CFSTR("FigAirPlaySSM_AssetID"));
        if (result)
        {
          v6 = result;
          result = (uint64_t)CFDictionaryGetValue(v3, CFSTR("FigAirPlaySSM_SessionLifespanSPC"));
          if (result)
          {
            v7 = result;
            v8 = *(_QWORD *)(a1 + 40);
            v9 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
            if (v9)
              result = v9(v4, v5, 0, v8, v6, 0, 0, v7);
            else
              result = 4294954514;
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
          }
        }
      }
    }
  }
  return result;
}

@end
