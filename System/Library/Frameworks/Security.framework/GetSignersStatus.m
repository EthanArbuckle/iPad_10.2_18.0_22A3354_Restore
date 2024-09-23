@implementation GetSignersStatus

void __GetSignersStatus_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  __SecKey *v5;
  CFTypeRef *v6;
  __SecKey *v7;
  __SecKey *v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v14;
  const void *v15;
  const void *v16;

  v4 = a1[5];
  v5 = (__SecKey *)a1[6];
  v6 = (CFTypeRef *)a1[7];
  v7 = (__SecKey *)_SOSPeerInfoCopyPubKey((CFDictionaryRef *)a2, CFSTR("PublicSigningKey"), v6);
  if (!v7)
    goto LABEL_29;
  v8 = v7;
  if (a2 && SOSCircleHasActiveValidPeerWithID(v4, *(const void **)(a2 + 40), v5))
  {
    if (SOSCircleGetSignature(v4, (uint64_t)v8, v6))
    {
      if (SOSCircleVerify(v4, v8, v6))
        v9 = 0;
      else
        v9 = 6;
      goto LABEL_8;
    }
    CFRelease(v8);
    v15 = *(const void **)(a2 + 40);
    v16 = (const void *)a1[8];
    if (v15 && v16)
    {
      if (!CFEqual(v15, v16))
      {
LABEL_28:
        if (!SOSPeerInfoIsCloudIdentity(a2))
        {
          v9 = 7;
          goto LABEL_9;
        }
      }
    }
    else if (v15 != v16)
    {
      goto LABEL_28;
    }
LABEL_29:
    v9 = 4;
    goto LABEL_9;
  }
  v9 = 4;
LABEL_8:
  CFRelease(v8);
LABEL_9:
  v10 = 0;
  v11 = *(_QWORD *)(a1[4] + 8);
  if (v9)
  {
    v12 = *(_DWORD *)(v11 + 24);
    if (v12)
    {
      v10 = 6;
      if (v9 != 6)
      {
        if (v12 == 7 || v9 == 7)
          v14 = 7;
        else
          v14 = *(_DWORD *)(v11 + 24);
        if (v12 == 6)
          v10 = 6;
        else
          v10 = v14;
      }
    }
  }
  *(_DWORD *)(v11 + 24) = v10;
}

@end
