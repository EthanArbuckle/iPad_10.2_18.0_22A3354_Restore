@implementation IOHIDServiceCopyEventForClient

uint64_t __IOHIDServiceCopyEventForClient_block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = IOHIDServiceFilterFilterCopyEvent(a2, *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
