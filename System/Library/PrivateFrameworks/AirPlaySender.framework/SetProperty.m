@implementation SetProperty

void __localStream_SetProperty_block_invoke(_QWORD *a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD, uint64_t);
  const void *v8;
  const void *v9;

  MEMORY[0x1CAA400CC](*(_QWORD *)(a1[4] + 136));
  v3 = a1[4];
  v2 = (const void *)a1[5];
  v4 = *(const void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;
  if (v2)
    CFRetain(v2);
  if (v4)
    CFRelease(v4);
  MEMORY[0x1CAA400E4](*(_QWORD *)(a1[4] + 136));
  v5 = *(_QWORD *)(a1[4] + 216);
  if (v5)
  {
    v6 = a1[5];
    v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(v5, *MEMORY[0x1E0CF7430], v6);
  }
  v8 = (const void *)a1[5];
  if (v8)
    CFRelease(v8);
  v9 = (const void *)a1[6];
  if (v9)
    CFRelease(v9);
}

_QWORD *__localStream_SetProperty_block_invoke_2(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, _QWORD, uint64_t);

  v1 = *(_QWORD *)(result[4] + 216);
  if (v1)
  {
    v2 = result[5];
    result = (_QWORD *)CMBaseObjectGetVTable();
    v3 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result[1] + 56);
    if (v3)
      return (_QWORD *)v3(v1, *MEMORY[0x1E0CF7420], v2);
  }
  return result;
}

uint64_t __localStream_SetProperty_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);

  v1 = *MEMORY[0x1E0CF7418];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(CMBaseObjectGetDerivedStorage() + 216);
  if (v3)
  {
    v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v4)
      v4(v3, v1, v2);
  }
  return FigCFDictionarySetValue();
}

void __carEndpoint_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  CFTypeID TypeID;
  const __CFAllocator *v6;
  CFTypeRef v7;
  uint64_t v8;
  int v9;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 152))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = -16723;
    goto LABEL_34;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA4130]))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 324) = CFBooleanGetValue(*(CFBooleanRef *)(a1 + 56));
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA43B8]))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(const void **)(v2 + 296);
    v4 = *(const void **)(a1 + 56);
    *(_QWORD *)(v2 + 296) = v4;
    if (v4)
      CFRetain(v4);
    if (v3)
      CFRelease(v3);
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA4108]))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 412) = CFBooleanGetValue(*(CFBooleanRef *)(a1 + 56));
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("DisplayCornerMasks")))
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(*(CFTypeRef *)(a1 + 56)))
    {
      if (gLogCategory_APEndpointCarPlay <= 50
        && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
      {
        CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 56));
        LogPrintF();
      }
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 432))
      {
        v6 = CFGetAllocator(*(CFTypeRef *)(a1 + 64));
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 432) = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      }
      CFDictionaryApplyBlock();
      return;
    }
    APSLogErrorAt();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = -16720;
LABEL_34:
    *(_DWORD *)(v8 + 24) = v9;
    return;
  }
  if (!CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("PreviousSessionAnalytics")))
  {
    if (gLogCategory_APEndpointCarPlay <= 30
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = -12784;
    goto LABEL_34;
  }
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = *(CFTypeRef *)(a1 + 56);
  if (v7)
    v7 = CFRetain(v7);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 448) = v7;
}

uint64_t __carEndpoint_SetProperty_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t result;

  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 432), a2, a3);
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = carEndpoint_updateDisplayCornerMasks();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __audioHoseManagerBuffered_SetProperty_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (((*(unsigned __int16 *)(a3 + 10) - *(unsigned __int16 *)(result + 40)) & 0x8000) != 0)
  {
    v4 = result;
    if (gLogCategory_APAudioHoseManagerBuffered <= 50)
    {
      if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      {
        if (*(_QWORD *)(v4 + 32))
          CMBaseObjectGetDerivedStorage();
        result = LogPrintF();
      }
    }
    *(_WORD *)(a3 + 10) = *(_WORD *)(v4 + 40);
  }
  return result;
}

void __audioHoseManagerBuffered_SetProperty_block_invoke_2()
{
  _QWORD v0[3];
  int v1;

  v0[0] = 0;
  v0[1] = v0;
  v0[2] = 0x2000000000;
  v1 = 0;
  if (*(_BYTE *)(CMBaseObjectGetDerivedStorage() + 186))
    CFDictionaryApplyBlock();
  _Block_object_dispose(v0, 8);
}

const void *__audioHoseManagerBuffered_SetProperty_block_invoke_3(uint64_t a1)
{
  const void *result;
  const void *v3;

  result = (const void *)FigCFEqual();
  if (!(_DWORD)result)
  {
    v3 = *(const void **)(*(_QWORD *)(a1 + 32) + 200);
    if (v3)
      CFRelease(v3);
    result = *(const void **)(a1 + 40);
    if (result)
      result = CFRetain(result);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = result;
  }
  return result;
}

const void *__audioHoseManagerBuffered_SetProperty_block_invoke_4(uint64_t a1)
{
  const void *result;
  const void *v3;

  result = (const void *)FigCFEqual();
  if (!(_DWORD)result)
  {
    v3 = *(const void **)(*(_QWORD *)(a1 + 32) + 160);
    if (v3)
      CFRelease(v3);
    result = *(const void **)(a1 + 40);
    if (result)
      result = CFRetain(result);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = result;
  }
  return result;
}

void __screenstream_SetProperty_block_invoke(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  v3 = *(const void **)(v2 + 488);
  *(_QWORD *)(v2 + 488) = v1;
  if (v1)
    CFRetain(v1);
  if (v3)
    CFRelease(v3);
}

@end
