@implementation CSSymbolicatorGetSymbolWithMangledNameAtTime

uint64_t __CSSymbolicatorGetSymbolWithMangledNameAtTime_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v3 + 40) = a2;
  *(_QWORD *)(v3 + 48) = a3;
  return result;
}

@end
