@implementation AFErrorSetUnderlyingErrorRecursively

void ___AFErrorSetUnderlyingErrorRecursively_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = 0;
  v5 = _AFErrorSetUnderlyingErrorRecursively(a2, &v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = v11;
  if (v5)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v7)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", a3, v6);
  }

}

@end
