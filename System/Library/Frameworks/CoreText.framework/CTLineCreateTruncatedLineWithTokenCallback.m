@implementation CTLineCreateTruncatedLineWithTokenCallback

uint64_t __CTLineCreateTruncatedLineWithTokenCallback_block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))(a1 + 32))(a2, *a3, a3[1], a4, *(_QWORD *)(a1 + 40));
}

@end
