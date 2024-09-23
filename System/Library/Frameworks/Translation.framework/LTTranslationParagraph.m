@implementation LTTranslationParagraph

void __45___LTTranslationParagraph_splitIntoSentences__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%zd"), a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "range");
  objc_msgSend(v4, "addAttribute:value:range:", v9, v6, v7, v8);

}

void __45___LTTranslationParagraph_splitIntoSentences__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45___LTTranslationParagraph_splitIntoSentences__block_invoke_3;
  v7[3] = &unk_250694368;
  v8 = *(id *)(a1 + 32);
  v9 = a3;
  v10 = a4;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __45___LTTranslationParagraph_splitIntoSentences__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _LTTranslationSpan *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _LTTranslationSpan *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _LTTranslationSpan *v22;
  uint64_t v23;
  _LTTranslationSpan *v24;
  id v25;

  v25 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "range");
    objc_msgSend(v7, "range");
    if (v9 + v8 != *(_QWORD *)(a1 + 40))
      __45___LTTranslationParagraph_splitIntoSentences__block_invoke_3_cold_1();
    v10 = objc_msgSend(v7, "range");
    objc_msgSend(v7, "range");
    v12 = v11 + *(_QWORD *)(a1 + 48);
    v13 = [_LTTranslationSpan alloc];
    objc_msgSend(v5, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "shouldTranslate");
    objc_msgSend(v5, "metaInfoData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    v18 = v14;
    v19 = v10;
    v20 = v12;
    v21 = v15;
  }
  else
  {
    v22 = [_LTTranslationSpan alloc];
    objc_msgSend(v5, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v5, "shouldTranslate");
    objc_msgSend(v5, "metaInfoData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 48);
    v17 = v22;
    v18 = v14;
    v21 = v23;
  }
  v24 = -[_LTTranslationSpan initWithIdentifier:range:shouldTranslate:metaInfoData:](v17, "initWithIdentifier:range:shouldTranslate:metaInfoData:", v18, v19, v20, v21, v16);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v24, v25);

}

uint64_t __45___LTTranslationParagraph_splitIntoSentences__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __45___LTTranslationParagraph_splitIntoSentences__block_invoke_3_cold_1()
{
  __assert_rtn("-[_LTTranslationParagraph splitIntoSentences]_block_invoke_3", "LTTranslationParagraph.m", 99, "previousSpan.range.location + previousSpan.range.length == textRange.location");
}

@end
