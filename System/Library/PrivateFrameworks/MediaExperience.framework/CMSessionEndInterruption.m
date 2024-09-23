@implementation CMSessionEndInterruption

uint64_t __CMSessionEndInterruption_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = *(void **)(v2 + 16);
  else
    v3 = 0;
  result = MXCoreSessionEndInterruption_WithSecTaskAndStatus(v3, 0, *(const __CFString **)(a1 + 48), 1);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __CMSessionEndInterruption_WithInterruptionNotification_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = *(void **)(v2 + 16);
  else
    v3 = 0;
  result = MXCoreSessionEndInterruption_WithSecTaskAndStatus(v3, 0, *(const __CFString **)(a1 + 48), 1);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
