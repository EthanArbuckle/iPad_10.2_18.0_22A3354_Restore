@implementation NSSTerminateNewsProcessesWithItems

uint64_t __NSSTerminateNewsProcessesWithItems_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "processType"));
}

uint64_t __NSSTerminateNewsProcessesWithItems_block_invoke_48(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleID");
}

void __NSSTerminateNewsProcessesWithItems_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  FCBlockConjunction();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    objc_msgSend(v8, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "containsObject:", MEMORY[0x1E0C9AAA0]) ^ 1;

  }
  else
  {
    *(_BYTE *)(v6 + 24) = 0;
  }

}

void __NSSTerminateNewsProcessesWithItems_block_invoke_54(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;

  FCBlockConjunction();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = a2;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
}

@end
