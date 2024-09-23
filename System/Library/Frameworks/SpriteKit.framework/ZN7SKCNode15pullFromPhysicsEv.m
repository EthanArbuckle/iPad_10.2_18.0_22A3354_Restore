@implementation ZN7SKCNode15pullFromPhysicsEv

_QWORD *___ZN7SKCNode15pullFromPhysicsEv_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *result;
  _QWORD *v5;
  uint64_t v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = operator new(0x18uLL);
  result[2] = a2;
  v5 = *(_QWORD **)(v3 + 56);
  v6 = *(_QWORD *)(v3 + 64);
  *result = v3 + 48;
  result[1] = v5;
  *v5 = result;
  *(_QWORD *)(v3 + 56) = result;
  *(_QWORD *)(v3 + 64) = v6 + 1;
  return result;
}

@end
