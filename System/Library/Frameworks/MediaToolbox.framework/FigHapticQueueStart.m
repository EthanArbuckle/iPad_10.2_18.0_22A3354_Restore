@implementation FigHapticQueueStart

uint64_t __FigHapticQueueStart_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigHapticEngineStart(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    result = fhq_scheduleWaitingHapticPlayers(*(_QWORD *)(a1 + 40));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
