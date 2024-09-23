@implementation CreateEmptyWrapper

uint64_t __frr_CreateEmptyWrapper_block_invoke()
{
  uint64_t result;

  result = FigSimpleMutexCreate();
  qword_1ECDC8648 = result;
  return result;
}

@end
