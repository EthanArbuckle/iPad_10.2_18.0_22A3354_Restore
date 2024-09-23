@implementation ML3SortMapFaultingNameOrderDictionaryEnumerator

void __62___ML3SortMapFaultingNameOrderDictionaryEnumerator_nextObject__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 1);
  v5 = objc_msgSend(v3, "intForColumnIndex:", 2);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithML3NameOrder:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ML3SortMap.m"), 1226, CFSTR("got nil name from the sort map!"));

    v9 = 0;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ML3SortMap.m"), 1227, CFSTR("valueWithML3NameOrder returned nil!"));

    v9 = v12;
  }

}

@end
