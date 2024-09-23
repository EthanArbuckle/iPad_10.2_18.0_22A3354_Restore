@implementation CFHTTPServerCopyProperty

uint64_t ___CFHTTPServerCopyProperty_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 80))(a2, *(_QWORD *)(a1 + 32));
}

uint64_t ___CFHTTPServerCopyProperty_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 64))(a2, *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
