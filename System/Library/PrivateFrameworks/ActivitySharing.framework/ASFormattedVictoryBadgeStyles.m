@implementation ASFormattedVictoryBadgeStyles

uint64_t __ASFormattedVictoryBadgeStyles_block_invoke(uint64_t a1, void *a2)
{
  unsigned int v2;

  v2 = objc_msgSend(a2, "unsignedIntValue");
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%d.%d]"), HIWORD(v2), (unsigned __int16)v2);
}

@end
