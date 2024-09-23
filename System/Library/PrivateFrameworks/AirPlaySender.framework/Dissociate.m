@implementation Dissociate

void __screenstreamudp_Dissociate_block_invoke(uint64_t a1)
{
  screenstreamudp_dissociateInternal(*(const void **)(a1 + 32));
}

_QWORD *__carEndpoint_Dissociate_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void (*v4)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *v5;
  uint64_t (*v6)(_QWORD *);

  *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = *(_BYTE *)(result[5] + 152);
  v1 = result[5];
  *(_BYTE *)(v1 + 152) = 1;
  *(_DWORD *)(v1 + 208) = *(_DWORD *)(v1 + 204);
  if (!*(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24))
  {
    v2 = *(_QWORD *)(v1 + 216);
    if (v2)
    {
      v3 = result;
      v4 = *(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 96);
      if (v4)
        v4(v2, 0, 0, 0, 0);
      result = (_QWORD *)APSenderSessionGetCMBaseObject(*(_QWORD *)(v3[5] + 216));
      if (result)
      {
        v5 = result;
        result = (_QWORD *)CMBaseObjectGetVTable();
        v6 = *(uint64_t (**)(_QWORD *))(result[1] + 24);
        if (v6)
          return (_QWORD *)v6(v5);
      }
    }
  }
  return result;
}

void __carEndpoint_Dissociate_block_invoke_2(uint64_t a1)
{
  int v2;

  v2 = 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    if (gLogCategory_APEndpointCarPlay <= 30
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    carEndpoint_deactivateInternal(*(const void **)(a1 + 40), 1, (uint64_t)CFSTR("Dissociating"), &v2);
    carEndpoint_postActivationNotification(*(const void **)(a1 + 40), (const void *)*MEMORY[0x1E0CA3B30], v2);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __screenstream_Dissociate_block_invoke(uint64_t a1)
{
  screenstream_dissociateInternal(*(const void **)(a1 + 32));
}

@end
