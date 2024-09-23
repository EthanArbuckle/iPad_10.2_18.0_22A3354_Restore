@implementation SecCertificateCopyIPAddresses

void __SecCertificateCopyIPAddresses_block_invoke(uint64_t a1, CFDataRef theData)
{
  CFStringRef v4;
  CFStringRef v5;
  unsigned __int8 *v6[2];

  if ((CFDataGetLength(theData) & 0x8000000000000000) == 0)
  {
    v6[0] = (unsigned __int8 *)CFDataGetBytePtr(theData);
    v6[1] = (unsigned __int8 *)CFDataGetLength(theData);
    v4 = copyIPAddressContentDescription(0, v6);
    if (v4)
    {
      v5 = v4;
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v4);
      CFRelease(v5);
    }
  }
}

@end
