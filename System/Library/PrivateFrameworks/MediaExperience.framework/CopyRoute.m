@implementation CopyRoute

uint64_t __routingContextResilientRemote_CopyRoute_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v4)
    return v4(a2, v3);
  else
    return 4294954514;
}

void __routingContext_CopyRoute_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  CFTypeRef cf;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  cf = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigRoutingManagerCopyPickedEndpointForRoutingContext(*(_QWORD *)(DerivedStorage + 8), &cf);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    if (cf)
      CFRelease(cf);
  }
  else
  {
    **(_QWORD **)(a1 + 48) = cf;
  }
}

@end
