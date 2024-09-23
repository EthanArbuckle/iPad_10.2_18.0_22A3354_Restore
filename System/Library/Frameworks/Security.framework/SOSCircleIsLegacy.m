@implementation SOSCircleIsLegacy

BOOL __SOSCircleIsLegacy_block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = SOSPeerInfoIsLegacy(a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

@end
