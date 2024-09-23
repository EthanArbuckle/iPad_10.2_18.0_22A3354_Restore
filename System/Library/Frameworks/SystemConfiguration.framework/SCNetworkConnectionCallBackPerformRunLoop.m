@implementation SCNetworkConnectionCallBackPerformRunLoop

void ____SCNetworkConnectionCallBackPerformRunLoop_block_invoke(uint64_t a1)
{
  __SCNetworkConnectionNotify(*(_QWORD *)(a1 + 32), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 40), *(unsigned int *)(a1 + 64), *(uint64_t (**)(uint64_t))(a1 + 48), *(_QWORD *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
