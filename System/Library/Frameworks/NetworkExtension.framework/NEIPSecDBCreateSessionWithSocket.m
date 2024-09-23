@implementation NEIPSecDBCreateSessionWithSocket

void __NEIPSecDBCreateSessionWithSocket_block_invoke(uint64_t a1)
{
  CFArrayAppendValue((CFMutableArrayRef)g_IPSecDBSessions, *(const void **)(a1 + 32));
}

@end
