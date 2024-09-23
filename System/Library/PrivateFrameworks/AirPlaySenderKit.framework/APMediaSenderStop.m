@implementation APMediaSenderStop

void __APMediaSenderStop_block_invoke(uint64_t a1)
{
  sender_stopInternal(*(_QWORD *)(a1 + 32), 1);
}

@end
