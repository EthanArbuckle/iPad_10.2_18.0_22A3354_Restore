@implementation CNMonitorSyncState

_QWORD *__CNMonitorSyncState_block_invoke(_QWORD *result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = *(_QWORD *)(result[6] + 16) != 0;
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_BYTE *)(result[6] + 32);
  v1 = result[6];
  if (*(_BYTE *)(v1 + 32))
    *(_BYTE *)(v1 + 32) = 0;
  return result;
}

@end
