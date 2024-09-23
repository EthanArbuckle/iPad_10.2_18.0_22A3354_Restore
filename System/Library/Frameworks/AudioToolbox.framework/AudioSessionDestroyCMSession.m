@implementation AudioSessionDestroyCMSession

uint64_t __AudioSessionDestroyCMSession_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "destroyCMSessionForPID:sessionID:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
