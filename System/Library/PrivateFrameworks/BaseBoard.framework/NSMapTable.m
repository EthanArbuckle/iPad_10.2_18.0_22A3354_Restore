@implementation NSMapTable

uint64_t __35__NSMapTable_BaseBoard__bs_filter___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
  return result;
}

@end
