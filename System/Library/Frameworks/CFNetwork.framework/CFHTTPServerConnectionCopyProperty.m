@implementation CFHTTPServerConnectionCopyProperty

uint64_t ___CFHTTPServerConnectionCopyProperty_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 56))(a2, *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
