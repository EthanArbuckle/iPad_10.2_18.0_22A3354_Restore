@implementation LSBundleFindWithNode

BOOL ___LSBundleFindWithNode_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _LSBundleMatchesNode(**(void ***)(a1 + 40), *(_DWORD *)a3, *(_QWORD *)(a3 + 8), *(void **)(a1 + 32), *(_QWORD *)(a1 + 48)) != 0;
}

uint64_t ___LSBundleFindWithNode_block_invoke_91(uint64_t a1, int a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  result = _LSBundleMatchesNode(**(void ***)(a1 + 64), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(void **)(a1 + 32), *(_QWORD *)(a1 + 72));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void ___LSBundleFindWithNode_block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;

  v9 = (void *)MEMORY[0x186DAE7A0]();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = _LSAliasMatchesPath_NoIO(**(void ***)(a1 + 64), **(_DWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24), *(void **)(a1 + 32), 0);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a5 = 1;
  objc_autoreleasePoolPop(v9);
}

@end
