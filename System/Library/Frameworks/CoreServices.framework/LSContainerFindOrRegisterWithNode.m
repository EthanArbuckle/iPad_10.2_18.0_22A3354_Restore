@implementation LSContainerFindOrRegisterWithNode

void ___LSContainerFindOrRegisterWithNode_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  char v7;
  id v8;

  v6 = a3;
  if (a2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    v7 = 1;
  }
  else
  {
    v7 = *(_BYTE *)(a1 + 56);
    if (v7)
    {
      v8 = v6;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
      v6 = v8;
      v7 = 0;
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;

}

@end
