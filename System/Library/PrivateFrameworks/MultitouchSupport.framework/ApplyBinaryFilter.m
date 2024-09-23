@implementation ApplyBinaryFilter

uint64_t __mt_ApplyBinaryFilter_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  kdebug_trace();
  mt_ApplyBinaryFilter(*(_QWORD *)(a1 + 32), (*(_BYTE *)(a1 + 40) + 1), a2, a3, a4, 0);
  return kdebug_trace();
}

@end
