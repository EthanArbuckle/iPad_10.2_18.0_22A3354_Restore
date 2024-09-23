@implementation NSRegularExpression

void __95__NSRegularExpression_EmailFoundationAdditions__ef_enumerateTokensInString_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = objc_msgSend(v13, "range");
  v4 = v3;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(_QWORD *)(v7 + 32);
  if (v3 > v8)
  {
    *(_QWORD *)(v7 + 40) = v3 - v8;
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD, _QWORD))(v9 + 16))(v9, v10, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, unint64_t, uint64_t))(v11 + 16))(v11, v12, 1, v4, v6);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v4 + v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(_QWORD *)(a1 + 56)
                                                              - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 32);

}

void __141__NSRegularExpression_EmailFoundationAdditions__ef_stringByRemovingTokensFromString_matchingOptions_tokenizationOptions_tokenizationHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v9 = v5;
      objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v5, "length") - 1));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v7, "rangeOfComposedCharacterSequenceAtIndex:", 0) + 1);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v8;
    }
    v10 = v6;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10 = v5;
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
  }

}

id __95__NSRegularExpression_EmailFoundationAdditions__ef_regularExpressionForQuotedStringsInLocales___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@[^%@]+?%@)+)"), v3, v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
