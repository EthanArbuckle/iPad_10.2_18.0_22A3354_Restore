@implementation HMDProcessMonitorProcessInfoForPID

BOOL ____HMDProcessMonitorProcessInfoForPID_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") == *(_DWORD *)(a1 + 32);
}

@end
