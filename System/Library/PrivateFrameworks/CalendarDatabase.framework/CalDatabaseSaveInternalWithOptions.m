@implementation CalDatabaseSaveInternalWithOptions

uint64_t __CalDatabaseSaveInternalWithOptions_block_invoke(uint64_t result, const void *a2)
{
  uint64_t v2;
  _BYTE *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(unsigned __int8 *)(v2 + 24);
  v3 = (_BYTE *)(v2 + 24);
  if (!v4)
  {
    v5 = result;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    {
      result = _CalDatabaseIsIntegrationRecord(a2);
      if ((_DWORD)result)
        v6 = *(_QWORD *)(v5 + 48);
      else
        v6 = *(_QWORD *)(v5 + 32);
      v3 = (_BYTE *)(*(_QWORD *)(v6 + 8) + 24);
    }
    *v3 = 1;
  }
  return result;
}

@end
