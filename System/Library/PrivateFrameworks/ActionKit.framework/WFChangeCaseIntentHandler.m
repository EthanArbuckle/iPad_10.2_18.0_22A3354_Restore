@implementation WFChangeCaseIntentHandler

- (void)resolveTextForChangeCase:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_map:", &__block_literal_global_7591);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v6, v7);

}

- (void)resolveTypeForChangeCase:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, void *))a4;
  if (objc_msgSend(v7, "type"))
    +[WFChangeCaseTypeResolutionResult successWithResolvedChangeCaseType:](WFChangeCaseTypeResolutionResult, "successWithResolvedChangeCaseType:", objc_msgSend(v7, "type"));
  else
    +[WFChangeCaseTypeResolutionResult needsValue](WFChangeCaseTypeResolutionResult, "needsValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

}

- (void)handleChangeCase:(id)a3 completion:(id)a4
{
  void (**v6)(id, WFChangeCaseIntentResponse *);
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  WFChangeCaseIntentResponse *v11;
  _QWORD v12[6];

  v6 = (void (**)(id, WFChangeCaseIntentResponse *))a4;
  v7 = a3;
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "type");

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__WFChangeCaseIntentHandler_handleChangeCase_completion___block_invoke;
  v12[3] = &unk_24F8B17C0;
  v12[4] = self;
  v12[5] = v9;
  objc_msgSend(v8, "if_compactMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFChangeCaseIntentResponse initWithCode:userActivity:]([WFChangeCaseIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  -[WFChangeCaseIntentResponse setText:](v11, "setText:", v10);
  v6[2](v6, v11);

}

- (id)stringByApplyingSentenceCaseToString:(id)a3 withLocale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v23 = v6;
    v24 = v5;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v5, 0);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v26 = objc_msgSend(&unk_24F93C2B8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v38;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(&unk_24F93C2B8);
          v27 = v9;
          v10 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v9);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v11 = (void *)objc_msgSend(v8, "copy");
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v34 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                objc_msgSend(v16, "componentsSeparatedByString:", v10);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v30[0] = MEMORY[0x24BDAC760];
                v30[1] = 3221225472;
                v30[2] = __77__WFChangeCaseIntentHandler_stringByApplyingSentenceCaseToString_withLocale___block_invoke;
                v30[3] = &unk_24F8B17E8;
                v31 = v17;
                v32 = v10;
                v18 = v17;
                objc_msgSend(v18, "if_map:", v30);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "replaceObjectsInRange:withObjectsFromArray:", objc_msgSend(v8, "indexOfObject:", v16), 1, v19);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v13);
          }

          v9 = v27 + 1;
        }
        while (v27 + 1 != v26);
        v26 = objc_msgSend(&unk_24F93C2B8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v26);
    }
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __77__WFChangeCaseIntentHandler_stringByApplyingSentenceCaseToString_withLocale___block_invoke_2;
    v28[3] = &unk_24F8B9220;
    v7 = v23;
    v29 = v23;
    objc_msgSend(v8, "if_map:", v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", &stru_24F8BBA48);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v24;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)stringByApplyingTitleCaseToString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "newlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "if_map:", &__block_literal_global_117);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)stringByApplyingAlternatingCaseToString:(id)a3
{
  id v3;
  void *v4;
  int v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      objc_msgSend(v3, "substringWithRange:", v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uppercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lowercaseString");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if ((v5 & 1) != 0)
        v11 = v8;
      else
        v11 = (void *)v9;
      v12 = v11;
      v13 = objc_msgSend(v12, "length");
      if (v13 == objc_msgSend(v7, "length"))
      {
        objc_msgSend(v4, "appendString:", v12);
        v5 ^= objc_msgSend(v8, "isEqualToString:", v10) ^ 1;
      }
      else
      {
        objc_msgSend(v4, "appendString:", v7);
      }

      ++v6;
    }
    while (v6 < objc_msgSend(v3, "length"));
  }

  return v4;
}

id __63__WFChangeCaseIntentHandler_stringByApplyingTitleCaseToString___block_invoke(uint64_t a1, void *a2)
{
  return VCTitleCaseString(a2);
}

id __77__WFChangeCaseIntentHandler_stringByApplyingSentenceCaseToString_withLocale___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 == a3)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v5, "stringByAppendingString:", *(_QWORD *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

id __77__WFChangeCaseIntentHandler_stringByApplyingSentenceCaseToString_withLocale___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "substringWithRange:", 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "capitalizedStringWithLocale:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 1, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

id __57__WFChangeCaseIntentHandler_handleChangeCase_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  switch(*(_QWORD *)(a1 + 40))
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uppercaseStringWithLocale:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lowercaseStringWithLocale:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "capitalizedStringWithLocale:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "stringByApplyingTitleCaseToString:", v3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5:
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByApplyingSentenceCaseToString:withLocale:", v3, v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = (void *)v5;

      break;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "stringByApplyingAlternatingCaseToString:", v3);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v6 = (void *)v7;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

uint64_t __69__WFChangeCaseIntentHandler_resolveTextForChangeCase_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDDA218], "successWithResolvedString:", a2);
}

@end
