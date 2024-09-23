@implementation SetActionAtEnd

uint64_t __fpic_SetActionAtEnd_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 992) = *(_QWORD *)(result + 40);
  return result;
}

@end
