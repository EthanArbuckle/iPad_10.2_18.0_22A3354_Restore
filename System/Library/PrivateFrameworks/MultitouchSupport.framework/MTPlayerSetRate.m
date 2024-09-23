@implementation MTPlayerSetRate

uint64_t __MTPlayerSetRate_block_invoke(uint64_t a1)
{
  return MTPlayerStop(*(_QWORD **)(a1 + 32));
}

@end
