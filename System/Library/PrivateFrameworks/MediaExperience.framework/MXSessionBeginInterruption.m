@implementation MXSessionBeginInterruption

uint64_t __MXSessionBeginInterruption_block_invoke(_QWORD *a1)
{
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_beginInterruptionWithSecTask:andFlags:", 0, 0);
  return -[MXSessionManager getAndResetAsyncDuckingParameters:mostRecentDuckFadeDuration:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getAndResetAsyncDuckingParameters:mostRecentDuckFadeDuration:", *(_QWORD *)(a1[6] + 8) + 24, *(_QWORD *)(a1[7] + 8) + 24);
}

uint64_t __MXSessionBeginInterruption_WithFlags_block_invoke(_QWORD *a1)
{
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_beginInterruptionWithSecTask:andFlags:", 0, a1[8]);
  return -[MXSessionManager getAndResetAsyncDuckingParameters:mostRecentDuckFadeDuration:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getAndResetAsyncDuckingParameters:mostRecentDuckFadeDuration:", *(_QWORD *)(a1[6] + 8) + 24, *(_QWORD *)(a1[7] + 8) + 24);
}

uint64_t __MXSessionBeginInterruption_WithSecTaskAndFlags_block_invoke(_QWORD *a1)
{
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_beginInterruptionWithSecTask:andFlags:", a1[8], a1[9]);
  return -[MXSessionManager getAndResetAsyncDuckingParameters:mostRecentDuckFadeDuration:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getAndResetAsyncDuckingParameters:mostRecentDuckFadeDuration:", *(_QWORD *)(a1[6] + 8) + 24, *(_QWORD *)(a1[7] + 8) + 24);
}

@end
