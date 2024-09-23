@implementation RecvMessageUDP

void __RecvMessageUDP_block_invoke(uint64_t a1)
{
  PassMessage(*(_QWORD *)(a1 + 56));
  free(*(void **)(a1 + 64));
}

void __RecvMessageUDP_block_invoke_11(uint64_t a1)
{
  PassMessage(*(_QWORD *)(a1 + 40));
  free(*(void **)(a1 + 48));
}

@end
