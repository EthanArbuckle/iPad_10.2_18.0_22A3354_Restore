@implementation IOHIDServiceScheduleAsync

BOOL ___IOHIDServiceScheduleAsync_block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = IOHIDServiceFilterSetCancelHandler(a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
  if (result)
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 444);
  return result;
}

@end
