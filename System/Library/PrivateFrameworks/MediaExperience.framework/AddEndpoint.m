@implementation AddEndpoint

uint64_t __endpointAggregate_AddEndpoint_block_invoke(_QWORD *a1, uint64_t a2)
{
  MXAggregateEndpointCallback *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *), MXAggregateEndpointCallback *);
  uint64_t v8;

  v4 = -[MXAggregateEndpointCallback initWithAggregate:features:options:callback:callbackRefCon:operationType:]([MXAggregateEndpointCallback alloc], "initWithAggregate:features:options:callback:callbackRefCon:operationType:", FigEndpointAggregateGetFigEndpoint(), 0, a1[5], a1[6], a1[7], 3);
  if (!a2 || (FigEndpointAggregateGetClassID(), !CMBaseObjectIsMemberOfClass()))
    a2 = 0;
  v5 = a1[8];
  v6 = a1[5];
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *), MXAggregateEndpointCallback *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 8);
  if (v7)
    v8 = v7(a2, v5, v6, MXAggregateSubEndpointCompletionCallback, v4);
  else
    v8 = 4294954514;
  MEMORY[0x1940352F8](*(_QWORD *)(a1[9] + 40));
  FigEndpointAggregateGetFigEndpoint();
  MXAggregateEndpointUpdateSubEndpoints();
  MEMORY[0x194035304](*(_QWORD *)(a1[9] + 40));
  return v8;
}

@end
