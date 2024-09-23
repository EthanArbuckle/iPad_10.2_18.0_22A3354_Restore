@implementation LSRemoveSchemeHandler

uint64_t ___LSRemoveSchemeHandler_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = _LSGetOSStatusFromNSError(a2);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ___LSRemoveSchemeHandler_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t result;

  if ((a2 & 1) != 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    return _LSContextUpdate(0, 1, 0);
  }
  else
  {
    result = _LSGetOSStatusFromNSError(a3);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
