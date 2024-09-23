@implementation ZN3AGX14FenceGroupPoolD2Ev

_QWORD *___ZN3AGX14FenceGroupPoolD2Ev_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *result;

  v1 = *(_QWORD *)(a1 + 32);
  for (result = *(_QWORD **)(v1 + 8); result; result = *(_QWORD **)(v1 + 8))
  {
    *(_QWORD *)(v1 + 8) = *result;
    free(result);
  }
  return result;
}

@end
