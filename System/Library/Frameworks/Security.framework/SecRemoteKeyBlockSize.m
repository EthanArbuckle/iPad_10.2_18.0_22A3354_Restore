@implementation SecRemoteKeyBlockSize

uint64_t __SecRemoteKeyBlockSize_block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
