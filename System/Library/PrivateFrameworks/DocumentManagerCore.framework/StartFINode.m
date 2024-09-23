@implementation StartFINode

uint64_t __StartFINode_block_invoke()
{
  return objc_msgSend(MEMORY[0x24BE2BEB0], "start");
}

@end
