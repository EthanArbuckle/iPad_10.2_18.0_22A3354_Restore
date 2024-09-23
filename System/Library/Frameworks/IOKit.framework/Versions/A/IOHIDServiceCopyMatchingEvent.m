@implementation IOHIDServiceCopyMatchingEvent

uint64_t __IOHIDServiceCopyMatchingEvent_block_invoke(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  uint64_t result;

  v4 = *(_QWORD **)(a1 + 40);
  if (*(_BYTE *)(a1 + 64))
    result = IOHIDServiceFilterFilterCopyEvent(a2, v4);
  else
    result = (uint64_t)IOHIDServiceFilterFilterCopyMatchingEvent((uint64_t)a2, v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
