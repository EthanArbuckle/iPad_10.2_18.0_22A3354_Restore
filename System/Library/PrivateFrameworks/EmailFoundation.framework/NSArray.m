@implementation NSArray

uint64_t __47__NSArray_EmailFoundationAdditions__ef_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __52__NSArray_EmailFoundationAdditions__ef_mapSelector___block_invoke(uint64_t a1, id a2)
{
  objc_msgSend(a2, *(SEL *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __44__NSArray_EmailFoundationAdditions__ef_all___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

id __59__NSArray_EmailFoundationAdditions__ef_compactMapSelector___block_invoke(uint64_t a1, id a2)
{
  objc_msgSend(a2, *(SEL *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __67__NSArray_EmailFoundationAdditions__ef_indicesOfStringsWithPrefix___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __80__NSArray_EmailFoundationAdditions__ef_indexOfObject_usingSortFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 32))(a2, a3, *(_QWORD *)(a1 + 40));
}

void __62__NSArray_EmailFoundationAdditions__ef_lastObjectPassingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

id __59__NSArray_EmailFoundationAdditions__ef_longestCommonPrefix__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v6, "description");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    if (v8)
    {
      if (v5)
      {
        objc_msgSend(v5, "commonPrefixWithString:options:", v8, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "length"))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        goto LABEL_13;
      }
      v10 = v8;
    }
    else
    {
      v10 = v5;
    }
    v7 = v10;
LABEL_13:

    goto LABEL_14;
  }
  v7 = 0;
LABEL_14:

  return v7;
}

@end
