@implementation SetHIDInputMode

void __central_SetHIDInputMode_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  CFTypeRef v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(const void *, uint64_t, uint64_t);
  int v9;

  v2 = a1[5];
  if (*(_BYTE *)v2)
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = FigSignalErrorAt();
  }
  else
  {
    v3 = *(const void **)(v2 + 8);
    if (v3
      && (FigEndpointExtendedGetClassID(), CMBaseObjectIsMemberOfClass())
      && (v4 = CFRetain(v3)) != 0)
    {
      v5 = v4;
      v6 = a1[6];
      v7 = a1[7];
      v8 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 56);
      if (v8)
        v9 = v8(v5, v6, v7);
      else
        v9 = -12782;
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v9;
      CFRelease(v5);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -12782;
    }
  }
}

@end
