@implementation MXSessionCreate

MXSessionSidekick *__MXSessionCreate_block_invoke(uint64_t a1)
{
  MXSessionSidekick *result;

  result = -[MXSessionSidekick initWithSession:]([MXSessionSidekick alloc], "initWithSession:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

MXSessionSidekick *___MXSessionCreate_block_invoke(uint64_t a1)
{
  MXSessionSidekick *result;

  result = -[MXSessionSidekick initWithSession:]([MXSessionSidekick alloc], "initWithSession:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

@end
