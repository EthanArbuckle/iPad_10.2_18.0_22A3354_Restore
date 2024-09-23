@implementation DuckAudio

uint64_t __carEndpoint_DuckAudio_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(*(_QWORD *)(result + 40) + 304))
  {
    if (gLogCategory_APEndpointCarPlay <= 50)
    {
      if (gLogCategory_APEndpointCarPlay != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 40) + 304) = 0;
  }
  else
  {
    result = carEndpoint_sendCommandInternal(*(const void **)(result + 48), CFSTR("duckAudio"), *(const void **)(result + 56), 0, 0);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t __carEndpoint_DuckAudio_block_invoke_2(uint64_t result)
{
  uint64_t v1;
  CFAllocatorRef v2;
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, const __CFString *, CFAllocatorRef, uint64_t *);
  unint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  if (*(_QWORD *)(*(_QWORD *)(result + 40) + 240))
  {
    v1 = result;
    result = carEndpoint_getStreamInfoForSubtype();
    if (result)
    {
      v8 = 0;
      v2 = CFGetAllocator(*(CFTypeRef *)(v1 + 48));
      CMBaseObject = FigEndpointStreamGetCMBaseObject();
      result = CMBaseObjectGetVTable();
      v4 = *(void (**)(uint64_t, const __CFString *, CFAllocatorRef, uint64_t *))(*(_QWORD *)(result + 8) + 48);
      if (v4)
      {
        v4(CMBaseObject, CFSTR("AudioFormatInfo"), v2, &v8);
        result = v8;
        if (v8)
        {
          LODWORD(v5) = *(_DWORD *)(APCarPlayAudioFormatInfoGetLatencyInfo(v8) + 8);
          v6 = (double)v5;
          result = APCarPlayAudioFormatInfoGetDescription(v8);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = (unint64_t)(v6
                                                                                         / *(double *)result
                                                                                         * 1000000000.0);
          v7 = *(_QWORD *)(v1 + 32);
          if (*(_QWORD *)(*(_QWORD *)(v7 + 8) + 24) > 0x1DCD6500uLL)
          {
            if (gLogCategory_APEndpointCarPlay <= 50)
            {
              if (gLogCategory_APEndpointCarPlay != -1
                || (result = _LogCategory_Initialize(), v7 = *(_QWORD *)(v1 + 32), (_DWORD)result))
              {
                result = LogPrintF();
                v7 = *(_QWORD *)(v1 + 32);
              }
            }
            *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24) = 500000000;
          }
        }
      }
    }
  }
  return result;
}

void __carEndpoint_DuckAudio_block_invoke_3(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  int v4;
  const void *v5;
  dispatch_time_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  int8x16_t v11;
  uint64_t v12;
  int v13;

  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(const void **)(a1 + 48);
  v4 = *(_DWORD *)(v3 + 204);
  *(_BYTE *)(v3 + 304) = 1;
  CFRetain(v2);
  v5 = *(const void **)(a1 + 56);
  if (v5)
    CFRetain(v5);
  v6 = dispatch_time(0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __carEndpoint_DuckAudio_block_invoke_4;
  block[3] = &__block_descriptor_tmp_791;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(NSObject **)(v7 + 144);
  block[1] = 0x40000000;
  block[4] = v7;
  v13 = v4;
  v11 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
  v12 = v8;
  dispatch_after(v6, v9, block);
}

void __carEndpoint_DuckAudio_block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  const void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 204) == *(_DWORD *)(a1 + 64))
  {
    if (*(_BYTE *)(v1 + 304))
    {
      carEndpoint_sendCommandInternal(*(const void **)(a1 + 40), CFSTR("unduckAudio"), *(const void **)(a1 + 48), 0, 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 304) = 0;
    }
    else if (gLogCategory_APEndpointCarPlay <= 50
           && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(const void **)(a1 + 48);
    if (v3)
      CFRelease(v3);
    CFRelease(*(CFTypeRef *)(a1 + 56));
  }
}

@end
