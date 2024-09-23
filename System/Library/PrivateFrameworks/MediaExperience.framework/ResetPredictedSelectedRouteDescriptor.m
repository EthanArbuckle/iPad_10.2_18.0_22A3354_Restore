@implementation ResetPredictedSelectedRouteDescriptor

uint64_t __routingContextResilientRemote_ResetPredictedSelectedRouteDescriptor_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(uint64_t);

  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 184);
  if (v3)
    return v3(a2);
  else
    return 4294954514;
}

void __routingContext_ResetPredictedSelectedRouteDescriptor_block_invoke(uint64_t a1)
{
  FigPredictedRouting_ResetSelectedRouteDescriptor(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 1);
}

@end
