@implementation RequestModeChange

uint64_t __fsmcontroller_RequestModeChange_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = fsm_requestModeChange(*(__n128 **)(a1 + 40), *(__int128 **)(a1 + 48), *(const char **)(a1 + 56), 0, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
