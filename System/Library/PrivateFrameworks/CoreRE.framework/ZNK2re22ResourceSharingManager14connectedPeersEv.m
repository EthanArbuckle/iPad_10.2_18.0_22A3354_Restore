@implementation ZNK2re22ResourceSharingManager14connectedPeersEv

_QWORD *___ZNK2re22ResourceSharingManager14connectedPeersEv_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = result[5];
  v2 = *(_QWORD *)(v1 + 80);
  if (v2)
  {
    v3 = result;
    v4 = 168 * v2;
    v5 = (_QWORD *)(*(_QWORD *)(v1 + 96) + 16);
    do
    {
      result = re::DynamicArray<re::TransitionCondition *>::add((_QWORD *)(*(_QWORD *)(v3[4] + 8) + 48), v5);
      v5 += 21;
      v4 -= 168;
    }
    while (v4);
  }
  return result;
}

@end
