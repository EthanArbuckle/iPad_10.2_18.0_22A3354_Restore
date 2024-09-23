@implementation EnqueueEventFunction

_QWORD *____EnqueueEventFunction_block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  if (v2)
  {
    v3 = result;
    result = IOHIDSessionFilterFilterEventToConnection(a2, result[5], result[6], v2);
    *(_QWORD *)(*(_QWORD *)(v3[4] + 8) + 24) = result;
  }
  return result;
}

@end
