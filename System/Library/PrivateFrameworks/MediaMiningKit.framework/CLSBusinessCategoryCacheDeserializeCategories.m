@implementation CLSBusinessCategoryCacheDeserializeCategories

uint64_t ___CLSBusinessCategoryCacheDeserializeCategories_block_invoke(uint64_t result, uint64_t a2, char a3)
{
  if (((*(_DWORD *)(result + 40) >> a3) & 1) != 0)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

@end
