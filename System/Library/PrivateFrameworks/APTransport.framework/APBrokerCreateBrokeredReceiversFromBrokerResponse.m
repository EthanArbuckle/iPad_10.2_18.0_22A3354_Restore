@implementation APBrokerCreateBrokeredReceiversFromBrokerResponse

const __CFArray *__APBrokerCreateBrokeredReceiversFromBrokerResponse_block_invoke(const __CFArray *result, CFTypeRef cf)
{
  uint64_t v2;
  CFTypeID v3;
  const __CFArray *v4;
  unint64_t Int64;
  uint64_t v6;
  unint64_t v7;

  if (cf)
  {
    v2 = (uint64_t)result;
    v3 = CFGetTypeID(cf);
    result = (const __CFArray *)CFDictionaryGetTypeID();
    if ((const __CFArray *)v3 == result)
    {
      CFStringGetTypeID();
      result = (const __CFArray *)CFDictionaryGetTypedValue();
      if (result)
      {
        CFArrayGetTypeID();
        result = (const __CFArray *)CFDictionaryGetTypedValue();
        if (result)
        {
          v4 = result;
          Int64 = CFDictionaryGetInt64();
          v6 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 8);
          v7 = *(_QWORD *)(v6 + 24);
          if (!v7 || Int64 && Int64 < v7)
            *(_QWORD *)(v6 + 24) = Int64;
          CFArrayGetCount(v4);
          return (const __CFArray *)CFArrayApplyBlock();
        }
      }
    }
  }
  return result;
}

void __APBrokerCreateBrokeredReceiversFromBrokerResponse_block_invoke_2(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  CFTypeRef v5;
  __CFDictionary *v6;
  const void *PublicReceiverUUID;
  uint64_t v8;

  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFDictionaryGetTypeID())
    {
      v8 = 0;
      APBrokerCreateBrokeredReceiverFromBrokerResponseReceiverEntry(*(const void **)(a1 + 32), *(const void **)(a1 + 40), (uint64_t)cf, (CFTypeRef *)&v8);
      v5 = (CFTypeRef)v8;
      if (v8)
      {
        v6 = *(__CFDictionary **)(a1 + 48);
        PublicReceiverUUID = (const void *)APBrokeredReceiverGetPublicReceiverUUID(v8);
        CFDictionarySetValue(v6, PublicReceiverUUID, v5);
        CFRelease(v5);
      }
    }
  }
}

@end
