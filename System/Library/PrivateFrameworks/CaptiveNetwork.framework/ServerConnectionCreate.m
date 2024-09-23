@implementation ServerConnectionCreate

uint64_t __ServerConnectionCreate_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ServerConnectionConnect(G_conn, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
