@implementation CSSymbolicatorCreateWithExclaveUUIDAndFlags

_QWORD *__CSSymbolicatorCreateWithExclaveUUIDAndFlags_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char SymbolOwner;
  uint64_t v7;
  _QWORD *result;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  SymbolOwner = CSSymbolicatorGetSymbolOwner(a2, a3);
  result = CSSymbolOwnerGetCFUUIDBytes(SymbolOwner, v7);
  v9 = *(uint64_t **)(a1 + 40);
  v11 = *v9;
  v10 = v9[1];
  if (v11 == *result && v10 == result[1])
  {
    result = (_QWORD *)CSRetain(a2, a3);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v13 + 40) = result;
    *(_QWORD *)(v13 + 48) = v14;
  }
  return result;
}

@end
