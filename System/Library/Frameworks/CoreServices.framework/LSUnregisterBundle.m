@implementation LSUnregisterBundle

uint64_t ___LSUnregisterBundle_block_invoke(uint64_t a1, uint64_t a2, int a3, _BYTE *a4)
{
  uint64_t result;
  BOOL v8;

  result = _LSBundleGet(**(void ***)(a1 + 40), a3);
  v8 = *(_DWORD *)(a1 + 56) == a3 || result == 0;
  if (!v8 && *(_DWORD *)(result + 168) == 2 && *(_DWORD *)(result + 12) == *(_DWORD *)(*(_QWORD *)(a1 + 48) + 12))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void ___LSUnregisterBundle_block_invoke_129(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _LSGetOSStatusFromNSError(v3);

}

void ___LSUnregisterBundle_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = v5;
    v7 = _LSGetOSStatusFromNSError(v5);
    v6 = v8;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;

}

@end
