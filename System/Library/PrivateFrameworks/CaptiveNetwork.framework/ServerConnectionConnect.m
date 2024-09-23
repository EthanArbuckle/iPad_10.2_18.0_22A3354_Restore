@implementation ServerConnectionConnect

uint64_t __ServerConnectionConnect_block_invoke(uint64_t a1)
{
  ServerConnectionCleanup(*(_QWORD *)(a1 + 32));
  return ServerConnectionConnect(*(_QWORD *)(a1 + 32), 1);
}

@end
