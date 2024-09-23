@implementation SetDelegateRemoteControl

uint64_t __central_SetDelegateRemoteControl_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t result;

  v2 = a1[5];
  if (*(_BYTE *)v2)
  {
    result = 4294954511;
  }
  else
  {
    v3 = *(_QWORD *)(v2 + 8);
    v4 = a1[6];
    v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
    if (v5)
      result = v5(v3, v4);
    else
      result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __endpointAggregate_SetDelegateRemoteControl_block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeRef v3;
  uint64_t (*v4)(uint64_t, _QWORD *);
  _QWORD v6[4];

  v3 = *(CFTypeRef *)(a1 + 32);
  v6[1] = 0;
  v6[2] = MXAggregateEndpointDidReceiveDataFromCommChannel;
  v6[3] = MXAggregateEndpointDidCloseCommChannel;
  if (v3)
    v3 = CFRetain(v3);
  v6[0] = v3;
  v4 = *(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
  if (v4)
    return v4(a2, v6);
  else
    return 4294954514;
}

@end
