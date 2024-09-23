@implementation CGPathApplyWithBlock

uint64_t __CGPathApplyWithBlock_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  int v4;
  uint64_t v5;

  v4 = a2;
  v5 = a3;
  return (*(uint64_t (**)(_QWORD, int *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), &v4);
}

@end
