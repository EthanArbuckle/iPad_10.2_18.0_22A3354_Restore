@implementation SOSViewCreateSetFromBitmask

void __SOSViewCreateSetFromBitmask_block_invoke(uint64_t a1, const void *a2, uint64_t a3)
{
  if ((*(_QWORD *)(a1 + 32) & a3) != 0)
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), a2);
}

@end
