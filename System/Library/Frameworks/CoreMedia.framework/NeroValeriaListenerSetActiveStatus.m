@implementation NeroValeriaListenerSetActiveStatus

uint64_t __NeroValeriaListenerSetActiveStatus_block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = **(_QWORD **)(a1 + 32);
  if (v1)
    return NeroTransportStartAcceptingConnections(v2);
  else
    return NeroTransportStopAcceptingConnections(v2);
}

@end
