@implementation MTPlayerPlayPreviousFrame

uint64_t __MTPlayerPlayPreviousFrame_block_invoke(uint64_t a1)
{
  return MTPlayerStop(*(_QWORD **)(a1 + 32));
}

@end
