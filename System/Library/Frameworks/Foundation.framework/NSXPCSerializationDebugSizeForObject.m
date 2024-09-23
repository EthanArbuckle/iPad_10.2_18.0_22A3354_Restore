@implementation NSXPCSerializationDebugSizeForObject

uint64_t ___NSXPCSerializationDebugSizeForObject_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += _NSXPCSerializationDebugSizeForObject(*(_QWORD *)(a1 + 40));
  return 1;
}

uint64_t ___NSXPCSerializationDebugSizeForObject_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = _NSXPCSerializationDebugSizeForObject(*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += _NSXPCSerializationDebugSizeForObject(v3);
  return 1;
}

@end
