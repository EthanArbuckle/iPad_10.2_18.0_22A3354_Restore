@implementation SetDelegateRouting

uint64_t __endpointAggregate_SetDelegateRouting_block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeRef v3;
  uint64_t (*v4)(uint64_t, _QWORD *);
  _QWORD v6[5];

  v3 = *(CFTypeRef *)(a1 + 32);
  v6[3] = 0;
  v6[4] = 0;
  v6[1] = MXAggregateEndpointHandleAuthRequired;
  v6[2] = MXAggregateEndpointHandleEndpointFailed;
  if (v3)
    v3 = CFRetain(v3);
  v6[0] = v3;
  v4 = *(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v4)
    return v4(a2, v6);
  else
    return 4294954514;
}

@end
