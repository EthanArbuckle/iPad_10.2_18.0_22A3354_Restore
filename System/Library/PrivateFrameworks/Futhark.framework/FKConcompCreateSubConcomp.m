@implementation FKConcompCreateSubConcomp

BOOL __FKConcompCreateSubConcomp_block_invoke(uint64_t a1, unsigned int a2, int a3, int *a4, int *a5)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v5 = HIWORD(a2);
  v6 = a3 - *(unsigned __int16 *)(a1 + 52);
  v7 = *(unsigned __int16 *)(a1 + 48);
  v8 = v7 + *(unsigned __int8 *)(a1 + 56) + *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 2 * v6);
  v9 = v7 + *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 2 * v6) - 1;
  if (v8 <= (unsigned __int16)a2)
    v8 = (unsigned __int16)a2;
  if (v9 < (int)HIWORD(a2))
    v5 = v9;
  *a4 = v8;
  *a5 = v5;
  return v8 <= v5;
}

@end
