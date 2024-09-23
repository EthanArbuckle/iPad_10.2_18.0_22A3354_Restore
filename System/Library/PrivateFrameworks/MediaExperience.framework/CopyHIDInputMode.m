@implementation CopyHIDInputMode

void __central_CopyHIDInputMode_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(const void *, uint64_t, uint64_t, uint64_t);
  int v8;

  v2 = a1[5];
  if (*(_BYTE *)v2)
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = FigSignalErrorAt();
  }
  else
  {
    v3 = *(const void **)(v2 + 8);
    if (v3 && (FigEndpointExtendedGetClassID(), CMBaseObjectIsMemberOfClass()))
    {
      v4 = a1[6];
      v5 = a1[7];
      v6 = a1[8];
      v7 = *(uint64_t (**)(const void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                             + 64);
      if (v7)
        v8 = v7(v3, v4, v5, v6);
      else
        v8 = -12782;
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v8;
      CFRelease(v3);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -12782;
    }
  }
}

@end
