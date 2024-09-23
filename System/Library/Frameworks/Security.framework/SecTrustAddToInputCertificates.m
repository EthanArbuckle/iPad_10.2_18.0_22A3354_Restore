@implementation SecTrustAddToInputCertificates

CFMutableArrayRef __SecTrustAddToInputCertificates_block_invoke(uint64_t a1)
{
  CFMutableArrayRef result;

  result = CFArrayCreateMutableCopy(0, 0, *(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 16));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __SecTrustAddToInputCertificates_block_invoke_2(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CFGetTypeID(cf);
  if (v4 == SecCertificateGetTypeID())
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), cf);
  }
  else
  {
    v5 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "BUG IN SECURITY CLIENT: certificates array contains non-certificate value", v6, 2u);
    }
  }
}

void __SecTrustAddToInputCertificates_block_invoke_47(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(const void **)(v2 + 16);
  if (v3)
  {
    *(_QWORD *)(v2 + 16) = 0;
    CFRelease(v3);
    v2 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
