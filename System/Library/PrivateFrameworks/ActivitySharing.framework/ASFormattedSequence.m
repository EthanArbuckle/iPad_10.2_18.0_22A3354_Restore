@implementation ASFormattedSequence

uint64_t __ASFormattedSequence_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]"), a2);
}

@end
