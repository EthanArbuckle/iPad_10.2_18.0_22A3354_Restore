@implementation INPopulateFormatStringWithArguments

void __INPopulateFormatStringWithArguments_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v15 = v3;
  v5 = objc_msgSend(v3, "rangeAtIndex:", 1);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, v6 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "integerValue") - 1;

  }
  if (v4 < objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "descriptionWithLocale:", *(_QWORD *)(a1 + 48));
    else
      objc_msgSend(v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v15, "range");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 56), "replaceCharactersInRange:withString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + v10, v11, v9);
    v13 = *(void **)(a1 + 64);
    v14 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v13, "addObject:", v14);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += objc_msgSend(v9, "length") - v12;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

  }
}

@end
