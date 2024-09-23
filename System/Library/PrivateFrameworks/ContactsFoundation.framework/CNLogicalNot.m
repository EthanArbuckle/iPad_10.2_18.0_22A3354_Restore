@implementation CNLogicalNot

uint64_t __CNLogicalNot_block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

@end
