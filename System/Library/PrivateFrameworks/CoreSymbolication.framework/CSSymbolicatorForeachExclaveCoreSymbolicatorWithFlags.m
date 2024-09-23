@implementation CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags

uint64_t __CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

@end
