@implementation MTLLogState

BOOL __25___MTLLogState_decodeLog__block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  size_t v4;
  size_t v5;

  *a2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  v5 = strnlen(*(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v4);
  *(_QWORD *)(v3 + 24) = v4 - (v5 + 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v5 + 1;
  return (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) & 0x8000000000000000) == 0
      && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) - 1) == 0;
}

@end
