@implementation APAccTransportClientEndpointActivate

uint64_t __APAccTransportClientEndpointActivate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  _QWORD v12[5];

  v2 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(v2 + 16) || *(_QWORD *)(v2 + 48))
  {
    result = APSLogErrorAt();
    v11 = -6709;
  }
  else
  {
    v3 = _Block_copy(*(const void **)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(v4 + 64) = v3;
    if (v3)
    {
      v5 = *(_QWORD *)(v4 + 40);
      v6 = *(unsigned int *)(a1 + 64);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __APAccTransportClientEndpointActivate_block_invoke_2;
      v12[3] = &unk_1E826DB28;
      v12[4] = v4;
      result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkacc_transportClient_createEndpoint[0])(v5, 4, v6, 0, (uint64_t)v12, 1);
      *(_QWORD *)(*(_QWORD *)(a1 + 56) + 48) = result;
      v8 = *(_QWORD *)(a1 + 56);
      if (*(_QWORD *)(v8 + 48))
      {
        if (!*(_BYTE *)(a1 + 68))
          goto LABEL_12;
        if (gLogCategory_APAccTransportClientEndpoint <= 30)
        {
          if (gLogCategory_APAccTransportClientEndpoint != -1
            || (v9 = _LogCategory_Initialize(), v8 = *(_QWORD *)(a1 + 56), v9))
          {
            LogPrintF();
            v8 = *(_QWORD *)(a1 + 56);
          }
        }
        if (*(_QWORD *)(v8 + 56))
        {
          v10 = getkCFACCProperties_Connection_MFi4Auth_AccessoryCertInfoToMatch[0]();
          result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkacc_transportClient_setPropertyForEndpointWithUUID[0])(v10, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 48));
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            goto LABEL_12;
          result = APSLogErrorAt();
          v11 = -6762;
        }
        else
        {
          result = APSLogErrorAt();
          v11 = -6736;
        }
      }
      else
      {
        result = APSLogErrorAt();
        v11 = -6700;
      }
    }
    else
    {
      result = APSLogErrorAt();
      v11 = -6728;
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
LABEL_12:
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return accTransportClientEndpointDestroyEndpoint(*(_QWORD *)(a1 + 56));
  return result;
}

void __APAccTransportClientEndpointActivate_block_invoke_2(uint64_t a1, const void *a2, const void *a3, CFDataRef theData)
{
  _QWORD *v7;
  NSObject *v8;
  _QWORD block[8];

  v7 = *(_QWORD **)(a1 + 32);
  if (gLogCategory_APAccTransportClientEndpoint <= 30
    && (gLogCategory_APAccTransportClientEndpoint != -1 || _LogCategory_Initialize()))
  {
    CFDataGetLength(theData);
    LogPrintF();
  }
  CFRetain(v7);
  CFRetain(a2);
  CFRetain(a3);
  CFRetain(theData);
  v8 = v7[3];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __APAccTransportClientEndpointActivate_block_invoke_3;
  block[3] = &__block_descriptor_64_e5_v8__0l;
  block[4] = v7;
  block[5] = a2;
  block[6] = a3;
  block[7] = theData;
  dispatch_async(v8, block);
}

void __APAccTransportClientEndpointActivate_block_invoke_3(CFTypeRef *a1)
{
  if (!*((_BYTE *)a1[4] + 16) && FigCFEqual() && FigCFEqual())
    (*(void (**)(void))(*((_QWORD *)a1[4] + 8) + 16))();
  CFRelease(a1[7]);
  CFRelease(a1[6]);
  CFRelease(a1[5]);
  CFRelease(a1[4]);
}

@end
