@implementation Activate

uint64_t __endpointAggregate_Activate_block_invoke(_QWORD *a1, uint64_t a2)
{
  MXAggregateEndpointCallback *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, _QWORD, MXAggregateEndpointCallback *);

  v4 = -[MXAggregateEndpointCallback initWithAggregate:features:options:callback:callbackRefCon:operationType:]([MXAggregateEndpointCallback alloc], "initWithAggregate:features:options:callback:callbackRefCon:operationType:", a1[4], a1[5], a1[6], a1[7], a1[8], 1);
  v5 = a1[5];
  v6 = a1[6];
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, MXAggregateEndpointCallback *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 8);
  if (v7)
    return v7(a2, v5, v6, MXAggregateEndpointCompletionCallback, v4);
  else
    return 4294954514;
}

@end
