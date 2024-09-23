@implementation WFSerializable

uint64_t __WFSerializable_block_invoke(uint64_t a1, uint64_t a2)
{
  return WFSerializable(a2, *(_QWORD *)(a1 + 32));
}

id __WFSerializable_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  id result;

  WFSerializable(a3, *(_QWORD *)(a1 + 32));
  result = (id)objc_claimAutoreleasedReturnValue();
  *a5 = result;
  return result;
}

@end
