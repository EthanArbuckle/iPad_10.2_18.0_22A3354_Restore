@implementation CopyCurrentEvent

CFTypeRef __fpic_CopyCurrentEvent_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = fpic_GetCurrentlyPlayingEvent();
  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
    return CFRetain(result);
  return result;
}

const void *__fpirc_CopyCurrentEvent_block_invoke(_QWORD *a1)
{
  const void *result;

  result = fpirc_GetCurrentEventWrapperOnQueue(a1[5], a1[6]);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
