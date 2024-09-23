@implementation StartSuppressingLikelyDestinations

uint64_t __routingSessionManagerResilientRemote_StartSuppressingLikelyDestinations_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(uint64_t);

  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
  if (v3)
    return v3(a2);
  else
    return 4294954514;
}

@end
