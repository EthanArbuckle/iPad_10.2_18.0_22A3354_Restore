@implementation CTTelephonyCenterGetRunLoop

uint64_t __CTTelephonyCenterGetRunLoop_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40)
                                                                                          + 24)
                                                                              + 16);
  return result;
}

@end
