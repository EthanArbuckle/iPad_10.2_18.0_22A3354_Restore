@implementation NSAttributedString(LTParagraphs)

- (id)_ltAttributedStringByTrimmingCharactersInSet:()LTParagraphs
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", a1);
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v4);
  v9 = v8;

  if (!v7)
  {
    do
    {
      objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, v9, &stru_250695360);
      objc_msgSend(v5, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v4);
      v9 = v12;

    }
    while (!v11);
  }
  objc_msgSend(v5, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "rangeOfCharacterFromSet:options:", v4, 4);
  v16 = v15;

  while (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length") - 1;

    if (v14 != v18)
      break;
    objc_msgSend(v5, "replaceCharactersInRange:withString:", v14, v16, &stru_250695360);
    objc_msgSend(v5, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v19, "rangeOfCharacterFromSet:options:", v4, 4);
    v16 = v20;

  }
  return v5;
}

- (id)paragraphs
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDFD70]), "initWithUnit:", 2);
  objc_msgSend(a1, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", v3);

  v21 = v2;
  objc_msgSend(v2, "tokensForRange:", 0, objc_msgSend(a1, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v10), "rangeValue");
        objc_msgSend(a1, "attributedSubstringFromRange:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_ltAttributedStringByTrimmingCharactersInSet:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "length"))
          objc_msgSend(v5, "addObject:", v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sentences");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v18, "count") < 2)
      {
        v16 = (id)MEMORY[0x24BDBD1A8];
      }
      else
      {
        objc_msgSend(v5, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v19;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
        v16 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v16 = (id)MEMORY[0x24BDBD1A8];
    }
  }
  else
  {
    v16 = v5;
  }

  return v16;
}

- (id)sentences
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDFD70]), "initWithUnit:", 1);
  objc_msgSend(a1, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", v3);

  v17 = v2;
  objc_msgSend(v2, "tokensForRange:", 0, objc_msgSend(a1, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "rangeValue");
        objc_msgSend(a1, "attributedSubstringFromRange:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_ltAttributedStringByTrimmingCharactersInSet:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "length"))
          objc_msgSend(v5, "addObject:", v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)lt_attributedStringByJoiningComponents:()LTParagraphs withString:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDD1458];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithString:", v7);

  objc_msgSend(a1, "lt_attributedStringByJoiningComponents:withAttributedString:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)lt_attributedStringByJoiningComponents:()LTParagraphs withAttributedString:
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t);
  void *v16;
  id v17;
  id v18;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDD1688];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __96__NSAttributedString_LTParagraphs__lt_attributedStringByJoiningComponents_withAttributedString___block_invoke;
  v16 = &unk_250694CB0;
  v17 = v8;
  v18 = v5;
  v9 = v5;
  v10 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v13);

  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);
  return v11;
}

@end
