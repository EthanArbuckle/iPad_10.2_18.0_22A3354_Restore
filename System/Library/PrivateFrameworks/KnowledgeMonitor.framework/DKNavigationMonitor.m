@implementation DKNavigationMonitor

uint64_t __29___DKNavigationMonitor_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNavigationStatus:", 1);
}

uint64_t __29___DKNavigationMonitor_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNavigationStatus:", 0);
}

uint64_t __29___DKNavigationMonitor_start__block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 148), &state64);
  if (!(_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = state64 != 0;
    return objc_msgSend((id)objc_opt_class(), "setIsNavigating:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 145));
  }
  return result;
}

@end
