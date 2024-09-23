@implementation CGPathApply

uint64_t __CGPathApply_block_invoke(uint64_t a1, int a2, void *a3)
{
  BOOL v3;
  void *v4;
  int v6;
  void *v7;

  v6 = a2;
  if (a3)
    v3 = 0;
  else
    v3 = a2 == 4;
  v4 = &CGPathApply::for_dummies;
  if (!v3)
    v4 = a3;
  v7 = v4;
  return (*(uint64_t (**)(_QWORD, int *))(a1 + 32))(*(_QWORD *)(a1 + 40), &v6);
}

@end
