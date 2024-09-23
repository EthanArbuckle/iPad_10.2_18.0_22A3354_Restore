@implementation Deactivate

void __carEndpoint_Deactivate_block_invoke(uint64_t a1)
{
  int isDissociated;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  const __CFDictionary *v6;
  const void *Value;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const void *v11;
  _QWORD v12[6];
  int8x16_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2000000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  isDissociated = carEndpoint_isDissociated(*(_QWORD *)(a1 + 32));
  v3 = MEMORY[0x1E0C809B0];
  if (isDissociated)
  {
    *((_BYTE *)v18 + 24) = 1;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 144);
    block[0] = v3;
    block[1] = 0x40000000;
    block[2] = __carEndpoint_Deactivate_block_invoke_2;
    block[3] = &unk_1E826D750;
    block[4] = &v21;
    block[5] = v4;
    dispatch_sync(v5, block);
  }
  else
  {
    v6 = *(const __CFDictionary **)(a1 + 40);
    if (v6)
      Value = CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E0CA3958]);
    else
      Value = 0;
    carEndpoint_deactivateInternal(*(const void **)(a1 + 48), 0, (uint64_t)Value, (_DWORD *)v22 + 6);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    CFRetain(*(CFTypeRef *)(a1 + 48));
    v8 = **(NSObject ***)(a1 + 32);
    v12[0] = v3;
    v12[1] = 0x40000000;
    v12[2] = __carEndpoint_Deactivate_block_invoke_3;
    v12[3] = &unk_1E826D778;
    v13 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    v12[4] = &v21;
    v12[5] = &v17;
    v9 = *(_QWORD *)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 64);
    v15 = v9;
    dispatch_async(v8, v12);
  }
  v10 = *((_DWORD *)v22 + 6);
  if (v10)
    carEndpoint_postActivationNotification(*(const void **)(a1 + 48), (const void *)*MEMORY[0x1E0CA3B40], v10);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  v11 = *(const void **)(a1 + 40);
  if (v11)
    CFRelease(v11);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

uint64_t __carEndpoint_Deactivate_block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 40) + 208);
  return result;
}

void __carEndpoint_Deactivate_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD);
  uint64_t v4;

  v3 = *(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))(a1 + 48);
  v2 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v4 = 4294950573;
  else
    v4 = 0;
  v3(v2, *(_QWORD *)(a1 + 64), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v4, *(_QWORD *)(a1 + 72));
  CFRelease(*(CFTypeRef *)(a1 + 56));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (gLogCategory_APEndpointCarPlay <= 30
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
LABEL_10:
      LogPrintF();
    }
  }
  else if (gLogCategory_APEndpointCarPlay <= 30
         && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_10;
  }
}

@end
