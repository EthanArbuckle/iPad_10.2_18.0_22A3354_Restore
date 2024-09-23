@implementation CopyProperty

void __stream_CopyProperty_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t *v4;
  uint64_t DerivedStorage;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, const __CFString *, uint64_t, CFTypeRef *);
  int v11;
  CFTypeRef v12;
  uint64_t (*v13)(CFTypeRef);
  uint64_t v14;
  uint64_t CMBaseObject;
  uint64_t (*v16)(uint64_t, const void *, uint64_t, uint64_t *);
  int v17;
  CFTypeRef cf;

  v3 = (const void *)a1[6];
  v2 = a1[7];
  v4 = (uint64_t *)a1[8];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  cf = 0;
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    APSLogErrorAt();
    v17 = -16617;
    goto LABEL_17;
  }
  v6 = DerivedStorage;
  v7 = CFEqual(v3, CFSTR("LastDeliveredMessage"));
  v8 = *(_QWORD *)(v6 + 40);
  if (!v7)
  {
    CMBaseObject = APTransportConnectionGetCMBaseObject(v8);
    v16 = *(uint64_t (**)(uint64_t, const void *, uint64_t, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
    if (v16)
    {
      v17 = v16(CMBaseObject, v3, v2, v4);
      if (!v17)
        goto LABEL_17;
    }
    else
    {
      v17 = -12782;
    }
    goto LABEL_16;
  }
  v9 = APTransportConnectionGetCMBaseObject(v8);
  v10 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48);
  if (!v10)
  {
    v17 = -12782;
    goto LABEL_16;
  }
  v11 = v10(v9, CFSTR("LastDeliveredPackage"), v2, &cf);
  if (v11)
  {
    v17 = v11;
LABEL_16:
    APSLogErrorAt();
    goto LABEL_17;
  }
  v12 = cf;
  if (cf && (v13 = *(uint64_t (**)(CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8)) != 0)
    v14 = v13(v12);
  else
    v14 = 0;
  v17 = 0;
  *v4 = v14;
LABEL_17:
  if (cf)
    CFRelease(cf);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v17;
}

@end
