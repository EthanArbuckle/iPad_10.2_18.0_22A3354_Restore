@implementation SIDropAssertion

uint64_t __SIDropAssertion_block_invoke(uint64_t a1, uint64_t *a2)
{
  int v4;
  int v5;
  int v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v10;

  if (a2)
  {
    v4 = fd_drop_assertion(a2[582]);
    v5 = fd_drop_assertion(a2[58]) | v4;
    v6 = v5 | fd_drop_assertion(a2[25]);
    v7 = _CICreateFdAndDropAssertion((uint64_t)a2, "shadowIndexDirectory");
    v8 = v6 >= 0 && v7;
    v9 = _CICreateFdAndDropAssertion((uint64_t)a2, "shadowIndexCompactDirectory");
    v10 = v8 & v9 & _CICreateFdAndDropAssertion((uint64_t)a2, "shadowIndexArrays");
  }
  else
  {
    v10 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) &= v10;
  return 1;
}

@end
