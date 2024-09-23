@implementation IFConcurrentArrayTransform

id ___IFConcurrentArrayTransform_block_invoke(uint64_t a1, uint64_t a2)
{
  id result;

  result = (id)(*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2), a2);
  if (result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 8 * a2) = result;
  return result;
}

@end
