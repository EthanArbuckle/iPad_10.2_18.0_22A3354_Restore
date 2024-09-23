@implementation FigRouteDiscoveryManagerCopyRoutePresentForType

const __CFArray *__FigRouteDiscoveryManagerCopyRoutePresentForType_block_invoke(_QWORD *a1)
{
  CFIndex v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFArray *result;
  const __CFDictionary *ValueAtIndex;
  uint64_t v8;
  uint64_t CMBaseObject;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = 0;
  v3 = *MEMORY[0x1E0CA3A30];
  v4 = *MEMORY[0x1E0C9AE00];
  v5 = *MEMORY[0x1E0C9AE50];
  while (1)
  {
    result = *(const __CFArray **)(a1[5] + 240);
    if (result)
      result = (const __CFArray *)CFArrayGetCount(result);
    if (v2 >= (uint64_t)result)
      break;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[5] + 240), v2);
    CFDictionaryGetValue(ValueAtIndex, CFSTR("EndpointManager_SupportedEndpointFeaturesKey"));
    if ((a1[6] & FigCFNumberGetUInt64()) != 0)
    {
      if (CFDictionaryGetValue(ValueAtIndex, CFSTR("EndpointManager_RefKey")))
      {
        v8 = *(_QWORD *)(a1[4] + 8);
        CMBaseObject = FigEndpointManagerGetCMBaseObject();
        result = (const __CFArray *)CMBaseObjectGetVTable();
        v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*((_QWORD *)result + 1) + 48);
        if (v10)
          result = (const __CFArray *)v10(CMBaseObject, v3, v4, v8 + 24);
        if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) == v5)
          break;
      }
    }
    ++v2;
  }
  return result;
}

@end
