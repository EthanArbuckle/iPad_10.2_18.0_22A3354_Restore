@implementation LNDeferredLocalizedString

void __57__LNDeferredLocalizedString_CATSupport__parametersForCAT__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "valueType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cat_value:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "cat_parameterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);
}

void __61__LNDeferredLocalizedString_CATSupport__parameterDefinitions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cat_definitionXML");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __67__LNDeferredLocalizedString_CATSupport__localizedKeyWithParameters__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "arguments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "cat_variableXML");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "range");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + v7, v9, v6);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v6, "length") - v9;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

void __67__LNDeferredLocalizedString_CATSupport__localizedKeyWithParameters__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(\\%[\\@ldfu0-9.]+)"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)localizedKeyWithParameters_regularExpression;
  localizedKeyWithParameters_regularExpression = v0;

}

@end
