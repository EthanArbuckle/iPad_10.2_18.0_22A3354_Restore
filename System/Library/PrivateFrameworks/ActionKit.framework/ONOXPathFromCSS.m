@implementation ONOXPathFromCSS

void __ONOXPathFromCSS_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__20627;
    v18 = __Block_byref_object_dispose__20628;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", CFSTR("./"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__20627;
    v12[4] = __Block_byref_object_dispose__20628;
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __ONOXPathFromCSS_block_invoke_6;
    v11[3] = &unk_24F8B44F8;
    v11[4] = &v14;
    v11[5] = v12;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

    v9 = *(void **)(a1 + 32);
    objc_msgSend((id)v15[5], "componentsJoinedByString:", CFSTR("/"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v14, 8);

  }
}

void __ONOXPathFromCSS_block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("*"));
  if (a3 && v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", CFSTR("/*"));
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR(">")))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    v9 = &stru_24F8BBA48;
LABEL_10:
    *(_QWORD *)(v7 + 40) = v9;

    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("+")))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    v9 = CFSTR("following-sibling::*[1]/self::");
    goto LABEL_10;
  }
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("~"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  if (v10)
  {
    v9 = CFSTR("following-sibling::");
    goto LABEL_10;
  }
  if (a3 && !v8)
    *(_QWORD *)(v7 + 40) = CFSTR("descendant::");
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("#.[]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v11);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v5;
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD16A8];
    objc_msgSend(v5, "substringToIndex:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithString:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v5, "length");
    if (ONOIdRegularExpression_onceToken != -1)
      dispatch_once(&ONOIdRegularExpression_onceToken, &__block_literal_global_20644);
    objc_msgSend((id)ONOIdRegularExpression__ONOIdRegularExpression, "firstMatchInString:options:range:", v5, 0, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = &stru_24F8BBA48;
    if ((unint64_t)objc_msgSend(v17, "numberOfRanges") >= 2)
    {
      if (v12)
        v19 = &stru_24F8BBA48;
      else
        v19 = CFSTR("*");
      v20 = objc_msgSend(v17, "rangeAtIndex:", 1);
      objc_msgSend(v5, "substringWithRange:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendFormat:", CFSTR("%@[@id = '%@']"), v19, v22);

    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    if (ONOClassRegularExpression_onceToken != -1)
      dispatch_once(&ONOClassRegularExpression_onceToken, &__block_literal_global_299);
    v45 = v16;
    objc_msgSend((id)ONOClassRegularExpression__ONOClassRegularExpression, "matchesInString:options:range:", v5, 0, 0, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v51;
      if (!v12)
        v18 = CFSTR("*");
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v51 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v28, "numberOfRanges") >= 2)
          {
            v29 = objc_msgSend(v28, "rangeAtIndex:", 1);
            objc_msgSend(v5, "substringWithRange:", v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "appendFormat:", CFSTR("%@[contains(concat(' ',normalize-space(@class),' '),' %@ ')]"), v18, v31);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v25);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    if (ONOAttributeRegularExpression_onceToken != -1)
      dispatch_once(&ONOAttributeRegularExpression_onceToken, &__block_literal_global_302);
    objc_msgSend((id)ONOAttributeRegularExpression__ONOAttributeRegularExpression, "matchesInString:options:range:", v5, 0, 0, v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v47 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          if ((unint64_t)objc_msgSend(v37, "numberOfRanges") >= 2)
          {
            v38 = objc_msgSend(v37, "rangeAtIndex:", 1);
            objc_msgSend(v5, "substringWithRange:", v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "appendFormat:", CFSTR("[@%@]"), v40);

          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v34);
    }

  }
  v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v41)
  {
    objc_msgSend(v41, "stringByAppendingString:", v13);
    v42 = objc_claimAutoreleasedReturnValue();

    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v44 = *(void **)(v43 + 40);
    *(_QWORD *)(v43 + 40) = 0;

    v13 = (void *)v42;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v13);
  v5 = v13;
LABEL_11:

}

@end
