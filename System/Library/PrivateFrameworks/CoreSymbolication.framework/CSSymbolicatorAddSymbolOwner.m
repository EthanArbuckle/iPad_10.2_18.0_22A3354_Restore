@implementation CSSymbolicatorAddSymbolOwner

uint64_t __CSSymbolicatorAddSymbolOwner_block_invoke(_QWORD *a1, char **this)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = CSSymbolOwnerAddInContext(a1[5], a1[6], this);
  v4 = *(_QWORD *)(a1[4] + 8);
  *(_QWORD *)(v4 + 40) = result;
  *(_QWORD *)(v4 + 48) = v5;
  return result;
}

@end
