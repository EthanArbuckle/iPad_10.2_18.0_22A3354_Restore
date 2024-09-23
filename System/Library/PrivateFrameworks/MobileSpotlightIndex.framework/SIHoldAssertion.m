@implementation SIHoldAssertion

BOOL __SIHoldAssertion_block_invoke(double *a1, uint64_t *a2)
{
  double v4;
  uint64_t v5;
  _BOOL8 result;

  if (!a2
    || (v4 = a1[5], v5 = *((_QWORD *)a1 + 6), (fd_hold_assertion(a2[582], v5, v4) & 0x80000000) != 0)
    || (fd_hold_assertion(a2[58], v5, v4) & 0x80000000) != 0
    || (fd_hold_assertion(a2[25], v5, v4) & 0x80000000) != 0)
  {
    result = 0;
  }
  else
  {
    result = _CICreateFdAndHoldAssertion((uint64_t)a2, v5, "shadowIndexDirectory", v4);
    if (result)
    {
      result = _CICreateFdAndHoldAssertion((uint64_t)a2, v5, "shadowIndexCompactDirectory", v4);
      if (result)
        result = _CICreateFdAndHoldAssertion((uint64_t)a2, v5, "shadowIndexArrays", v4);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 24) &= result;
  return result;
}

@end
