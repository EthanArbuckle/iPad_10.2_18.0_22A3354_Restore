@implementation MTPlayerPlayNextFrame

uint64_t __MTPlayerPlayNextFrame_block_invoke(uint64_t a1)
{
  return MTPlayerStop(*(_QWORD **)(a1 + 32));
}

@end
