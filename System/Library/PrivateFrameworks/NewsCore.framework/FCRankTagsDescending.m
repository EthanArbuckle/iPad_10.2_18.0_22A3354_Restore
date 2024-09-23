@implementation FCRankTagsDescending

uint64_t __FCRankTagsDescending_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

@end
