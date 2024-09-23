@implementation APAdvertiserRapportManagerDebugShow

uint64_t __APAdvertiserRapportManagerDebugShow_block_invoke(uint64_t a1)
{
  uint64_t result;

  DataBuffer_AppendF();
  DataBuffer_AppendF();
  result = DataBuffer_AppendF();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

@end
