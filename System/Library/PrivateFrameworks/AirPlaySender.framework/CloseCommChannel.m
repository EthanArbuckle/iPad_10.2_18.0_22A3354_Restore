@implementation CloseCommChannel

void __carEndpoint_CloseCommChannel_block_invoke(uint64_t a1)
{
  const __CFDictionary *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  int v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  uint64_t v11;
  int v12;

  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 64) + 440);
  if (!v2)
  {
    APSLogErrorAt();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = -16720;
LABEL_29:
    *(_DWORD *)(v11 + 24) = v12;
    return;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFDictionaryGetValue(v2, *(const void **)(a1 + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!v3)
  {
    APSLogErrorAt();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = -16725;
    goto LABEL_29;
  }
  v4 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v4)
    v5 = v4(v3);
  else
    v5 = -12782;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    APSLogErrorAt();
  }
  else if (FigCFEqual())
  {
    v6 = *(const void **)(*(_QWORD *)(a1 + 64) + 72);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(*(_QWORD *)(a1 + 64) + 72) = 0;
    }
  }
  else if (FigCFEqual())
  {
    v7 = *(const void **)(*(_QWORD *)(a1 + 64) + 88);
    if (v7)
    {
      CFRelease(v7);
      *(_QWORD *)(*(_QWORD *)(a1 + 64) + 88) = 0;
    }
  }
  else if (FigCFEqual())
  {
    v8 = *(const void **)(*(_QWORD *)(a1 + 64) + 96);
    if (v8)
    {
      CFRelease(v8);
      *(_QWORD *)(*(_QWORD *)(a1 + 64) + 96) = 0;
    }
  }
  else if (FigCFEqual())
  {
    v9 = *(const void **)(*(_QWORD *)(a1 + 64) + 112);
    if (v9)
    {
      CFRelease(v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 64) + 112) = 0;
    }
  }
  else if (FigCFEqual())
  {
    v10 = *(const void **)(*(_QWORD *)(a1 + 64) + 128);
    if (v10)
    {
      CFRelease(v10);
      *(_QWORD *)(*(_QWORD *)(a1 + 64) + 128) = 0;
    }
  }
}

@end
