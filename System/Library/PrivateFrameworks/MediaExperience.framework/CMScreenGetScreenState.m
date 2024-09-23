@implementation CMScreenGetScreenState

uint64_t __CMScreenGetScreenState_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = gCMScreen_2;
  return result;
}

@end
