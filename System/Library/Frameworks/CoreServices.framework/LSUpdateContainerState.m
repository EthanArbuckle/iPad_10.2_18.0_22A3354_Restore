@implementation LSUpdateContainerState

void ___LSUpdateContainerState_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 52);
  if (v1)
    _LSContainerSetMounted(*(void **)(a1 + 32), *(_DWORD *)(a1 + 48), v1);
  else
    _CSStoreWriteToUnit();
}

uint64_t ___LSUpdateContainerState_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___LSUpdateContainerState_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _LSGetOSStatusFromNSError(v3);

}

void ___LSUpdateContainerState_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (!v7)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _LSGetOSStatusFromNSError(v5);
    v6 = a1 + 32;
    goto LABEL_5;
  }
  v6 = a1 + 32;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  if (objc_msgSend(v7, "length") != 20)
  {
LABEL_5:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 24) = -10817;
    goto LABEL_6;
  }
  objc_msgSend(v7, "getBytes:range:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48, 0, 20);
LABEL_6:

}

@end
