@implementation Deactivate

uint64_t __endpointAggregate_Deactivate_block_invoke(_QWORD *a1, uint64_t a2)
{
  MXAggregateEndpointCallback *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, unsigned int, void *), MXAggregateEndpointCallback *);

  v4 = -[MXAggregateEndpointCallback initWithAggregate:features:options:callback:callbackRefCon:operationType:]([MXAggregateEndpointCallback alloc], "initWithAggregate:features:options:callback:callbackRefCon:operationType:", a1[4], 0, a1[5], a1[6], a1[7], 2);
  v5 = a1[5];
  v6 = *(uint64_t (**)(uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, unsigned int, void *), MXAggregateEndpointCallback *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v6)
    return v6(a2, v5, MXAggregateEndpointCompletionCallback, v4);
  else
    return 4294954514;
}

@end
