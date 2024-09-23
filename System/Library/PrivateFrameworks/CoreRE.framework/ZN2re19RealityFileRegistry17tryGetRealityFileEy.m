@implementation ZN2re19RealityFileRegistry17tryGetRealityFileEy

_QWORD *___ZN2re19RealityFileRegistry17tryGetRealityFileEy_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = result[5];
  v2 = *(_QWORD *)(v1 + 88);
  if (v2)
  {
    v3 = result[6];
    v4 = 0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) >> 27));
    v5 = *(unsigned int *)(*(_QWORD *)(v1 + 96) + 4 * ((v4 ^ (v4 >> 31)) % *(unsigned int *)(v1 + 112)));
    if ((_DWORD)v5 != 0x7FFFFFFF)
    {
      v6 = *(_QWORD *)(v1 + 104);
      if (*(_QWORD *)(v6 + 32 * v5 + 16) == v3)
      {
LABEL_7:
        v2 = v6 + 32 * v5 + 24;
        goto LABEL_8;
      }
      while (1)
      {
        v5 = *(_DWORD *)(v6 + 32 * v5 + 8) & 0x7FFFFFFF;
        if ((_DWORD)v5 == 0x7FFFFFFF)
          break;
        if (*(_QWORD *)(v6 + 32 * v5 + 16) == v3)
          goto LABEL_7;
      }
    }
    v2 = 0;
  }
LABEL_8:
  *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = v2;
  return result;
}

@end
