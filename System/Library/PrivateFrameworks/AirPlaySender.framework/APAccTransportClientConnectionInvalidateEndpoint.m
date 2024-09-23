@implementation APAccTransportClientConnectionInvalidateEndpoint

void __APAccTransportClientConnectionInvalidateEndpoint_block_invoke(uint64_t a1)
{
  const __CFDictionary *v2;
  uint64_t v3;
  NSObject *v4;
  const void *v5;
  _QWORD block[5];

  v2 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 40) + 32);
  if (v2 && CFDictionaryContainsValue(v2, *(const void **)(a1 + 48)))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(NSObject **)(v3 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __accTransportClientEndpointInvalidate_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v3;
    dispatch_sync(v4, block);
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 32), *(const void **)(*(_QWORD *)(a1 + 48) + 32));
    if (!CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 32)))
    {
      v5 = *(const void **)(*(_QWORD *)(a1 + 40) + 32);
      if (v5)
      {
        CFRelease(v5);
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = 0;
      }
    }
  }
  else
  {
    APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6736;
  }
}

@end
