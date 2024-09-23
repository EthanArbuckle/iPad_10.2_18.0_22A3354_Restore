@implementation SecRemoteKeyCopyOperationResult

void __SecRemoteKeyCopyOperationResult_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else if (*(_QWORD *)(a1 + 40))
  {
    **(_QWORD **)(a1 + 40) = v5;
  }

}

@end
