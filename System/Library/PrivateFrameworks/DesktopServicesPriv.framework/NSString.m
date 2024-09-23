@implementation NSString

void __56__NSString_DSAdditions__ds_commonParentPathForItemURLs___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count") <= a3)
    goto LABEL_4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v12, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

LABEL_4:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

@end
