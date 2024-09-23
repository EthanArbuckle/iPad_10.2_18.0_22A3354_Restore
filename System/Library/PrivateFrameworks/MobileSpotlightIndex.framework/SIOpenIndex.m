@implementation SIOpenIndex

void ___SIOpenIndex_block_invoke(uint64_t a1, const void *a2)
{
  si_collect_block(*(_QWORD *)(a1 + 32), a2);
}

uint64_t ___SIOpenIndex_block_invoke_693(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 6584) |= 0x1000u;
  return result;
}

uint64_t ___SIOpenIndex_block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 6584) |= 0x800u;
  return result;
}

uint64_t ___SIOpenIndex_block_invoke_3(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 6584) |= 0x40u;
  return result;
}

uint64_t ___SIOpenIndex_block_invoke_4(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 6584) |= 0x100u;
  return result;
}

uint64_t ___SIOpenIndex_block_invoke_708(uint64_t a1, uint64_t a2)
{
  return _si_next_index_id(*(os_unfair_lock_s **)(a1 + 32), a2, 0, 1);
}

@end
