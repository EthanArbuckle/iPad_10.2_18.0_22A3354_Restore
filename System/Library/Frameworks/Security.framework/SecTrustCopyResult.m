@implementation SecTrustCopyResult

void __SecTrustCopyResult_block_invoke(_QWORD *a1)
{
  const void *v2;
  CFNumberRef v3;
  CFNumberRef v4;
  uint64_t v5;
  const __CFDictionary *v6;
  BOOL v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *value;

  v2 = *(const void **)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v2)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[5] + 8) + 24), CFSTR("TrustResultDetails"), v2);
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1[4] + 8) + 24));
  }
  v3 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a1[6] + 112));
  if (v3)
  {
    v4 = v3;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[5] + 8) + 24), CFSTR("TrustResultValue"), v3);
    CFRelease(v4);
  }
  v5 = a1[6];
  v6 = *(const __CFDictionary **)(v5 + 96);
  if (*(_DWORD *)(v5 + 112))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = *(const void **)(v5 + 64);
    if (v8)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[5] + 8) + 24), CFSTR("TrustEvaluationDate"), v8);
    value = (void *)0xAAAAAAAAAAAAAAAALL;
    if (CFDictionaryGetValueIfPresent(v6, CFSTR("CertificateTransparency"), (const void **)&value))
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[5] + 8) + 24), CFSTR("TrustCertificateTransparency"), value);
    v13 = (void *)0xAAAAAAAAAAAAAAAALL;
    if (CFDictionaryGetValueIfPresent(v6, CFSTR("ExtendedValidation"), (const void **)&v13))
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[5] + 8) + 24), CFSTR("TrustExtendedValidation"), v13);
    v12 = (void *)0xAAAAAAAAAAAAAAAALL;
    if (CFDictionaryGetValueIfPresent(v6, CFSTR("CompanyName"), (const void **)&v12))
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[5] + 8) + 24), CFSTR("Organization"), v12);
    v11 = (void *)0xAAAAAAAAAAAAAAAALL;
    if (CFDictionaryGetValueIfPresent(v6, CFSTR("TrustRevocationChecked"), (const void **)&v11))
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[5] + 8) + 24), CFSTR("TrustRevocationChecked"), v11);
    v10 = (void *)0xAAAAAAAAAAAAAAAALL;
    if (CFDictionaryGetValueIfPresent(v6, CFSTR("TrustRevocationReason"), (const void **)&v10))
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[5] + 8) + 24), CFSTR("TrustRevocationReason"), v10);
    v9 = (void *)0xAAAAAAAAAAAAAAAALL;
    if (CFDictionaryGetValueIfPresent(v6, CFSTR("TrustExpirationDate"), (const void **)&v9))
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[5] + 8) + 24), CFSTR("TrustExpirationDate"), v9);
  }
}

@end
