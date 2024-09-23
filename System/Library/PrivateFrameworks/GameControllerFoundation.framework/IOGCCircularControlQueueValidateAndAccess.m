@implementation IOGCCircularControlQueueValidateAndAccess

uint64_t ___IOGCCircularControlQueueValidateAndAccess_block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unsigned int v11;

  result = 3758097112;
  v5 = *(unsigned int *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 40);
  if (a2 + (v5 >> 1) <= v6)
    return 3758097127;
  if (v6 + (v5 >> 1) <= a2)
    return 3758097128;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(unsigned int *)(a1 + 68);
  v9 = (_QWORD *)(v7 + v8 * (a2 % v5) + 72);
  if ((unint64_t)v9 + v8 > v7 + (unint64_t)*(unsigned int *)(a1 + 72))
    return 3758097097;
  if (*v9 != *(_QWORD *)(a1 + 48))
    return 3758097105;
  v10 = atomic_load(v9 + 1);
  v11 = v10 & 1;
  if (v9[3 * v11 + 3] == *(_QWORD *)(a1 + 56) && v9[3 * v11 + 4] == a2)
    return (*(uint64_t (**)(uint64_t, unint64_t, _QWORD))(a3 + 16))(a3, (unint64_t)v9 + v11 * (unint64_t)*(unsigned int *)(a1 + 76) + 64, *(unsigned int *)(a1 + 80));
  return result;
}

@end
