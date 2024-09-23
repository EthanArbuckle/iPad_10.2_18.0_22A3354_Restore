@implementation SecOTRSGetIsIdle

uint64_t __SecOTRSGetIsIdle_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 40) + 16) == 0;
  return result;
}

@end
