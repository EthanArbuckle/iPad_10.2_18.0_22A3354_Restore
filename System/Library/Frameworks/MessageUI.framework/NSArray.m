@implementation NSArray

id __79__NSArray_RecipientUtilities__mf_commaSeparatedRecipientListWithWidth_forFont___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __90__NSArray_RecipientUtilities__mf_commaSeparatedRecipientListWithWidth_forFont_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __90__NSArray_RecipientUtilities__mf_commaSeparatedRecipientListWithWidth_forFont_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "_legacy_sizeWithFont:", *(_QWORD *)(a1 + 32));
  return v3 <= *(double *)(a1 + 40);
}

void __67__NSArray_RecipientUtilities__mf_indexOfRecipientWithEmailAddress___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  id v10;

  v10 = a2;
  v7 = objc_msgSend(v10, "rangeOfString:options:", *(_QWORD *)(a1 + 32), 1);
  if (!v7
    || v7 != 0x7FFFFFFFFFFFFFFFLL
    && ((v8 = objc_msgSend(v10, "characterAtIndex:", v7 - 1), v8 <= 0x3C)
      ? (v9 = ((1 << v8) & 0x1000100500000200) == 0)
      : (v9 = 1),
        !v9))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    *a4 = 1;

}

@end
