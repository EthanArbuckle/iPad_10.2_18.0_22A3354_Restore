@implementation GetOfferingStatus

void __GetOfferingStatus_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  __SecKey *v5;
  CFTypeRef *v6;
  __SecKey *v7;
  __SecKey *v8;
  int v9;
  uint64_t v10;

  v4 = a1[5];
  v5 = (__SecKey *)a1[6];
  v6 = (CFTypeRef *)a1[7];
  v7 = (__SecKey *)_SOSPeerInfoCopyPubKey((CFDictionaryRef *)a2, CFSTR("PublicSigningKey"), v6);
  if (v7)
  {
    v8 = v7;
    if (a2 && SOSCircleHasActiveValidPeerWithID(v4, *(const void **)(a2 + 40), v5))
    {
      if (SOSCircleGetSignature(v4, (uint64_t)v8, v6))
      {
        if (SOSCircleVerify(v4, v8, v6))
          v9 = 0;
        else
          v9 = 6;
      }
      else
      {
        v9 = 7;
      }
    }
    else
    {
      v9 = 4;
    }
    CFRelease(v8);
  }
  else
  {
    v9 = 4;
  }
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v9;
  v10 = *(_QWORD *)(a1[4] + 8);
  if (*(_DWORD *)(v10 + 24))
    *(_DWORD *)(v10 + 24) = 4;
}

@end
