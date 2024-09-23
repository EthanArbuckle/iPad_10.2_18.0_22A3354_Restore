@implementation SCNetworkConnectionCallBack

void ____SCNetworkConnectionCallBack_block_invoke(uint64_t a1)
{
  const __SCNetworkConnection *v2;
  __CFRunLoop *v3;
  const void *v4;
  uint64_t v5;
  SCNetworkConnectionStatus Status;
  __int128 v7;
  _QWORD block[5];
  __int128 v9;
  uint64_t v10;
  SCNetworkConnectionStatus v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(const __SCNetworkConnection **)(a1 + 32);
  v3 = *(__CFRunLoop **)(a1 + 40);
  v4 = *(const void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 56);
  Status = SCNetworkConnectionGetStatus(v2);
  CFRetain(v2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ____SCNetworkConnectionCallBackPerformRunLoop_block_invoke;
  block[3] = &__block_descriptor_tmp_104;
  block[4] = v2;
  v11 = Status;
  v9 = v7;
  v10 = v5;
  CFRunLoopPerformBlock(v3, v4, block);
  CFRunLoopWakeUp(v3);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
