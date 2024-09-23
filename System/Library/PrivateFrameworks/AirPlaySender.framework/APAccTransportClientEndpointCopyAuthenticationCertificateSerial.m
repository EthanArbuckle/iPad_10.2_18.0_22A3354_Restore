@implementation APAccTransportClientEndpointCopyAuthenticationCertificateSerial

void __APAccTransportClientEndpointCopyAuthenticationCertificateSerial_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  const void *v5;
  const void *v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  if (v2
    && (v3 = ((uint64_t (*)(uint64_t))softLinkacc_transportClient_copyPropertiesForEndpointWithUUID[0])(v2)) != 0)
  {
    v4 = (const __CFDictionary *)v3;
    v5 = (const void *)getkCFACCProperties_Connection_MFi4Auth_AccessoryCertInfoToMatch[0]();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(v4, v5);
    v6 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v6)
      CFRetain(v6);
    CFRelease(v4);
  }
  else
  {
    APSLogErrorAt();
  }
}

@end
