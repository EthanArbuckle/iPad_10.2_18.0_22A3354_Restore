@implementation CopyPredictedSelectedRouteDescriptor

uint64_t __routingContextResilientRemote_CopyPredictedSelectedRouteDescriptor_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 176);
  if (v4)
    return v4(a2, v3);
  else
    return 4294954514;
}

CFTypeRef __routingContext_CopyPredictedSelectedRouteDescriptor_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = FigPredictedRouting_CopySelectedRouteDescriptor(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
