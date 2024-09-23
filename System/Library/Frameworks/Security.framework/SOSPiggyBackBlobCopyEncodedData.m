@implementation SOSPiggyBackBlobCopyEncodedData

uint64_t __SOSPiggyBackBlobCopyEncodedData_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  const __CFNumber *v5;
  CFTypeRef *v6;
  const __CFData *v7;
  uint64_t v8;
  const __CFData *v9;
  uint64_t v10;
  CFTypeRef v11;
  CFTypeRef cf;

  v5 = (const __CFNumber *)a1[4];
  v4 = a1[5];
  v7 = (const __CFData *)a1[6];
  v6 = (CFTypeRef *)a1[7];
  cf = 0;
  if (SecKeyCopyPublicBytes(v4, (uint64_t)&cf))
  {
    SOSCreateErrorWithFormat(1034, 0, v6, 0, CFSTR("%@"), CFSTR("Failed to export public bytes"));
    return 0;
  }
  else
  {
    v9 = (const __CFData *)cf;
    der_encode_data_or_null(v7, v6);
    v10 = der_encode_data_or_null(v9, v6);
    der_encode_number(v5, v6, a3, v10);
    v8 = ccder_encode_constructed_tl();
    v11 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v11);
    }
  }
  return v8;
}

@end
