@implementation IKCSSParser

+ (id)parse:(id)a3
{
  id v3;
  IKCSSStylesheet *v4;
  void *v5;
  IKCSSTokenizer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(IKCSSStylesheet);
  v5 = (void *)MEMORY[0x1DF092260]();
  v6 = -[IKCSSTokenizer initWithText:]([IKCSSTokenizer alloc], "initWithText:", v3);
  +[IKCSSParser parseStylesheet:](IKCSSParser, "parseStylesheet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cssValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toNSArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSParser parseRulesList:](IKCSSParser, "parseRulesList:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKCSSStylesheet setRuleList:](v4, "setRuleList:", v10);
  objc_autoreleasePoolPop(v5);

  return v4;
}

+ (id)parseRulesList:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IKCSSDeclarationList *v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  NSUInteger v21;
  NSRange v22;
  IKCSSRule *v23;
  unint64_t v24;
  void *v25;
  IKCSSAtMediaRule *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v45;
  IKCSSRuleList *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;
  NSRange v57;
  NSRange v58;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v46 = objc_alloc_init(IKCSSRuleList);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v3;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v52;
    v4 = 0x1E9F4A000uLL;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v52 != v48)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (objc_msgSend(v6, "type") == 5)
        {
          objc_msgSend(v6, "name");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("media"));

          if (!v8)
            continue;
          v50 = i;
          objc_msgSend(v6, "cssValue");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "toNSArray");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "prelude");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "toNSArray");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[IKCSSMediaQuery mediaQueryFromTokenList:](IKCSSMediaQuery, "mediaQueryFromTokenList:", v12);
          v13 = (IKCSSDeclarationList *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "prelude");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "range");
          v18 = v17;
          objc_msgSend(v6, "prelude");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v58.location = objc_msgSend(v20, "range");
          v58.length = v21;
          v57.location = v16;
          v57.length = v18;
          v22 = NSUnionRange(v57, v58);

          +[IKCSSParser parseRulesList:](IKCSSParser, "parseRulesList:", v10);
          v23 = (IKCSSRule *)objc_claimAutoreleasedReturnValue();
          if (-[IKCSSRule count](v23, "count"))
          {
            v45 = v10;
            v24 = 0;
            do
            {
              -[IKCSSRule ruleAtIndex:](v23, "ruleAtIndex:", v24, v45);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = -[IKCSSAtMediaRule initWithMediaQuery:]([IKCSSAtMediaRule alloc], "initWithMediaQuery:", v13);
              -[IKCSSAtMediaRule setQueryRange:](v26, "setQueryRange:", v22.location, v22.length);
              objc_msgSend(v25, "selectorList");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[IKCSSRule setSelectorList:](v26, "setSelectorList:", v27);

              objc_msgSend(v25, "declarationList");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[IKCSSRule setDeclarationList:](v26, "setDeclarationList:", v28);

              -[IKCSSRuleList addRule:](v46, "addRule:", v26);
              ++v24;
            }
            while (v24 < -[IKCSSRule count](v23, "count"));
            v4 = 0x1E9F4A000;
            v10 = v45;
          }
          goto LABEL_21;
        }
        v29 = *(void **)(v4 + 2136);
        objc_msgSend(v6, "prelude");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "toNSArray");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "createSelectorList:", v31);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v50 = i;
          v13 = objc_alloc_init(IKCSSDeclarationList);
          v23 = objc_alloc_init(IKCSSRule);
          objc_msgSend(v6, "block");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = objc_msgSend(v32, "range");
            -[IKCSSDeclarationList setRange:](v13, "setRange:", v33, v34);
          }
          objc_msgSend(v32, "cssValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "count");

          if (v36)
          {
            v37 = 0;
            do
            {
              v38 = (void *)MEMORY[0x1DF092260]();
              objc_msgSend(v32, "cssValue");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectAtIndex:", v37);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(*(id *)(v4 + 2136), "createDeclaration:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41)
                -[IKCSSDeclarationList addDeclaration:](v13, "addDeclaration:", v41);

              objc_autoreleasePoolPop(v38);
              ++v37;
              objc_msgSend(v32, "cssValue");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "count");

            }
            while (v37 < v43);
          }
          -[IKCSSRule setSelectorList:](v23, "setSelectorList:", v10);
          -[IKCSSRule setDeclarationList:](v23, "setDeclarationList:", v13);
          -[IKCSSRuleList addRule:](v46, "addRule:", v23);

LABEL_21:
          i = v50;
        }

      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v49);
  }

  return v46;
}

+ (id)parseStylesheet:(id)a3
{
  id v3;
  IKCSSParseStylesheet *v4;
  void *v5;
  IKArray *v6;

  v3 = a3;
  v4 = objc_alloc_init(IKCSSParseStylesheet);
  +[IKCSSParser consumeRules:topLevel:](IKCSSParser, "consumeRules:topLevel:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[IKArray initWithNSArray:]([IKArray alloc], "initWithNSArray:", v5);
  -[IKCSSParseStylesheet setCssValue:](v4, "setCssValue:", v6);

  return v4;
}

+ (id)consumeRules:(id)a3 topLevel:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v5, "getNextToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "type") == 1)
      goto LABEL_15;
    if (objc_msgSend(v7, "type") == 2)
      goto LABEL_16;
    if (objc_msgSend(v7, "type") == 16 || objc_msgSend(v7, "type") == 15)
    {
      if (a4)
        goto LABEL_15;
      goto LABEL_11;
    }
    if (objc_msgSend(v7, "type") != 29)
      break;
    objc_msgSend(v5, "reconsumeToken:", v7);
    +[IKCSSParser consumeAtRule:](IKCSSParser, "consumeAtRule:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v9 = (void *)v8;
    if (v8)
      objc_msgSend(v6, "addObject:", v8);

LABEL_15:
  }
  if (objc_msgSend(v7, "type") != 26)
  {
LABEL_11:
    objc_msgSend(v5, "reconsumeToken:", v7);
    +[IKCSSParser consumeQualifiedRule:](IKCSSParser, "consumeQualifiedRule:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_16:

  return v6;
}

+ (id)consumeQualifiedRule:(id)a3
{
  id v3;
  IKCSSQualifiedParseRule *v4;
  void *v5;
  void *v6;
  void *v7;
  IKCSSQualifiedParseRule *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  IKArray *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  v4 = objc_alloc_init(IKCSSQualifiedParseRule);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNextToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type") == 2)
  {
LABEL_6:
    v8 = 0;
  }
  else
  {
    while (objc_msgSend(v6, "type") != 25)
    {
      objc_msgSend(v3, "reconsumeToken:", v6);
      +[IKCSSParser consumeComponentValue:](IKCSSParser, "consumeComponentValue:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v5, "addObject:", v7);

      objc_msgSend(v3, "getNextToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "type") == 2)
        goto LABEL_6;
    }
    +[IKCSSParser consumeSimpleBlock:startTokenType:](IKCSSParser, "consumeSimpleBlock:startTokenType:", v3, objc_msgSend(v6, "type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKCSSParseRule setBlock:](v4, "setBlock:", v9);

    while (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "type") != 1)
      {

        break;
      }
      objc_msgSend(v5, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "token");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "type") == 1)
      {

      }
      else
      {
        objc_msgSend(v5, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "token");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "type");

        if (v15 != 26)
          break;
      }
      objc_msgSend(v5, "removeLastObject");
    }
    v16 = -[IKArray initWithNSArray:]([IKArray alloc], "initWithNSArray:", v5);
    -[IKCSSParseRule setPrelude:](v4, "setPrelude:", v16);

    -[IKCSSParseRule block](v4, "block");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cssValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "toNSArray");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKCSSParser consumeDeclarationList:](IKCSSParser, "consumeDeclarationList:", v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKCSSParseRule setBlock:](v4, "setBlock:", v6);
    objc_msgSend(v3, "currentToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "type");

    if (v21 == 26)
    {
      objc_msgSend(v3, "currentToken");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "range");
      -[IKCSSParseRule _setEndRange:](v4, "_setEndRange:", v23, v24);

    }
    v8 = v4;
  }

  return v8;
}

+ (id)consumeAtRule:(id)a3
{
  id v3;
  void *v4;
  IKCSSAtParseRule *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  IKArray *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  IKArray *v26;
  void *v27;

  v3 = a3;
  objc_msgSend(v3, "getNextToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") != 29)
  {
    v5 = 0;
    goto LABEL_22;
  }
  v5 = objc_alloc_init(IKCSSAtParseRule);
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSAtParseRule setName:](v5, "setName:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reconsumeToken:", v4);
  +[IKCSSParser consumeComponentValue:](IKCSSParser, "consumeComponentValue:", v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:");
  objc_msgSend(v3, "getNextToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "type") == 22)
  {
LABEL_3:
    v4 = v8;
    goto LABEL_4;
  }
  do
  {
    if (objc_msgSend(v8, "type") == 2)
      goto LABEL_3;
    if (objc_msgSend(v8, "type") == 25)
    {
      -[IKCSSAtParseRule name](v5, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("media"));

      if (v16)
      {
        +[IKCSSParser consumeRules:topLevel:](IKCSSParser, "consumeRules:topLevel:", v3, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[IKArray initWithNSArray:]([IKArray alloc], "initWithNSArray:", v25);
        -[IKCSSParseObject setCssValue:](v5, "setCssValue:", v26);

        goto LABEL_3;
      }
      +[IKCSSParser consumeSimpleBlock:startTokenType:](IKCSSParser, "consumeSimpleBlock:startTokenType:", v3, objc_msgSend(v8, "type"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKCSSParseRule setBlock:](v5, "setBlock:", v17);
    }
    else
    {
      objc_msgSend(v3, "reconsumeToken:", v8);
      +[IKCSSParser consumeComponentValue:](IKCSSParser, "consumeComponentValue:", v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v17);
    }

    objc_msgSend(v3, "getNextToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v4;
  }
  while (objc_msgSend(v4, "type") != 22);
LABEL_4:
  while (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "type") != 1)
    {

      break;
    }
    objc_msgSend(v7, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "token");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "type") == 1)
    {

    }
    else
    {
      objc_msgSend(v7, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "token");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "type");

      if (v14 != 26)
        break;
    }
    objc_msgSend(v7, "removeLastObject");
  }
  v18 = -[IKArray initWithNSArray:]([IKArray alloc], "initWithNSArray:", v7);
  -[IKCSSParseRule setPrelude:](v5, "setPrelude:", v18);

  objc_msgSend(v3, "currentToken");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "type");

  if (v20 == 26)
  {
    objc_msgSend(v3, "currentToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "range");
    -[IKCSSParseRule _setEndRange:](v5, "_setEndRange:", v22, v23);

  }
LABEL_22:

  return v5;
}

+ (id)consumeComponentValue:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  IKCSSParseToken *v6;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "getNextToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 25 || objc_msgSend(v4, "type") == 23 || objc_msgSend(v4, "type") == 8)
  {
    +[IKCSSParser consumeSimpleBlock:startTokenType:](IKCSSParser, "consumeSimpleBlock:startTokenType:", v3, objc_msgSend(v4, "type"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "type") != 17)
    {
      v6 = objc_alloc_init(IKCSSParseToken);
      v8 = objc_msgSend(v4, "range");
      -[IKCSSParseObject setRange:](v6, "setRange:", v8, v9);
      -[IKCSSParseToken setToken:](v6, "setToken:", v4);
      goto LABEL_6;
    }
    +[IKCSSParser consumeFunction:fromToken:](IKCSSParser, "consumeFunction:fromToken:", v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (IKCSSParseToken *)v5;
LABEL_6:

  return v6;
}

+ (id)consumeSimpleBlock:(id)a3 startTokenType:(int64_t)a4
{
  id v5;
  uint64_t v6;
  IKCSSSimpleParseBlock *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  IKArray *v13;

  v5 = a3;
  switch(a4)
  {
    case 8:
      v6 = 9;
      break;
    case 25:
      v6 = 26;
      break;
    case 23:
      v6 = 24;
      break;
    default:
      v7 = 0;
      goto LABEL_15;
  }
  v7 = objc_alloc_init(IKCSSSimpleParseBlock);
  -[IKCSSSimpleParseBlock setAssociatedToken:](v7, "setAssociatedToken:", a4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNextToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = objc_msgSend(v9, "type"); i != 2 && objc_msgSend(v9, "type") != v6; i = objc_msgSend(v9, "type"))
  {
    objc_msgSend(v5, "reconsumeToken:", v9);
    +[IKCSSParser consumeComponentValue:](IKCSSParser, "consumeComponentValue:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    objc_msgSend(v5, "getNextToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "type") == v6)
  {
    objc_msgSend(v5, "reconsumeToken:", v9);
    +[IKCSSParser consumeComponentValue:](IKCSSParser, "consumeComponentValue:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  v13 = -[IKArray initWithNSArray:]([IKArray alloc], "initWithNSArray:", v8);
  -[IKCSSParseObject setCssValue:](v7, "setCssValue:", v13);

LABEL_15:
  return v7;
}

+ (id)consumeFunction:(id)a3 fromToken:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  IKCSSParseFunction *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  IKArray *v19;
  void *v20;
  NSUInteger v21;
  NSRange v22;
  NSRange v24;
  NSRange v25;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "type") == 17)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "range");
    v10 = v9;
    v11 = objc_alloc_init(IKCSSParseFunction);
    objc_msgSend(v6, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKCSSParseFunction setName:](v11, "setName:", v12);

    objc_msgSend(v5, "getNextToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");
    v15 = objc_msgSend(v13, "type");
    if (v14 != 2 && v15 != 9)
    {
      do
      {
        objc_msgSend(v5, "reconsumeToken:", v13);
        +[IKCSSParser consumeComponentValue:](IKCSSParser, "consumeComponentValue:", v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);

        objc_msgSend(v5, "getNextToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v13, "type");
        v18 = objc_msgSend(v13, "type");
      }
      while (v17 != 2 && v18 != 9);
    }

    v19 = -[IKArray initWithNSArray:]([IKArray alloc], "initWithNSArray:", v7);
    -[IKCSSParseObject setCssValue:](v11, "setCssValue:", v19);

    objc_msgSend(v5, "currentToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25.location = objc_msgSend(v20, "range");
    v25.length = v21;
    v24.location = v8;
    v24.length = v10;
    v22 = NSUnionRange(v24, v25);
    -[IKCSSParseObject setRange:](v11, "setRange:", v22.location, v22.length);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)consumeDeclarationList:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSUInteger location;
  void *v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  void *v23;
  NSUInteger v24;
  NSRange v25;
  NSUInteger length;
  unint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  IKCSSParseDeclarationList *v34;
  IKArray *v35;
  void *v37;
  NSRange v38;
  NSRange v39;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    if (!objc_msgSend(v4, "count"))
      goto LABEL_12;
    objc_msgSend(v4, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "type") != 1)
      break;
    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "token");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "type");

    if (v10 != 1)
      goto LABEL_12;
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
  }

LABEL_12:
  while (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "type") != 1)
    {

      break;
    }
    objc_msgSend(v4, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "type") == 1)
    {

    }
    else
    {
      objc_msgSend(v4, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "token");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "type");

      if (v16 != 26)
        break;
    }
    objc_msgSend(v4, "removeLastObject");
  }
  objc_msgSend(v3, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  location = objc_msgSend(v17, "range");

  if (!objc_msgSend(v4, "count"))
  {
    length = 0;
    goto LABEL_44;
  }
  objc_msgSend(v4, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "range");
  v22 = v21;
  objc_msgSend(v4, "lastObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39.location = objc_msgSend(v23, "range");
  v39.length = v24;
  v38.location = v20;
  v38.length = v22;
  v25 = NSUnionRange(v38, v39);
  location = v25.location;
  length = v25.length;

  if (objc_msgSend(v4, "count"))
  {
    for (i = 0; i < objc_msgSend(v4, "count"); ++i)
    {
      objc_msgSend(v4, "objectAtIndex:", i);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "type") != 1)
        goto LABEL_41;
      objc_msgSend(v28, "token");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "type") == 1 || objc_msgSend(v29, "type") == 22)
        goto LABEL_40;
      if (objc_msgSend(v29, "type") == 2)
        goto LABEL_45;
      if (objc_msgSend(v29, "type") == 29 || objc_msgSend(v29, "type") == 32)
        goto LABEL_40;
      if (objc_msgSend(v29, "type") != 18)
      {
LABEL_45:

        break;
      }
      v37 = v6;
      objc_msgSend(*(id *)(v5 + 3560), "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      while (i < objc_msgSend(v4, "count"))
      {
        objc_msgSend(v4, "objectAtIndex:", i);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "type") != 7)
        {
          if (objc_msgSend(v31, "type") != 1)
            goto LABEL_33;
          objc_msgSend(v31, "token");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v32, "type") == 22 || objc_msgSend(v32, "type") == 2)
          {
            if (objc_msgSend(v32, "type") == 22)
              objc_msgSend(v30, "addObject:", v31);

            v29 = v32;
            break;
          }
          v29 = v32;
        }
        objc_msgSend(v30, "addObject:", v31);
LABEL_33:

        ++i;
      }
      +[IKCSSParser consumeDeclaration:](IKCSSParser, "consumeDeclaration:", v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v37;
      if (v33)
        objc_msgSend(v37, "addObject:", v33);

      v5 = 0x1E0C99000;
LABEL_40:

LABEL_41:
    }
  }
LABEL_44:
  v34 = objc_alloc_init(IKCSSParseDeclarationList);
  -[IKCSSParseDeclarationList setRange:](v34, "setRange:", location, length);
  v35 = -[IKArray initWithNSArray:]([IKArray alloc], "initWithNSArray:", v6);
  -[IKCSSParseObject setCssValue:](v34, "setCssValue:", v35);

  return v34;
}

+ (id)consumeDeclaration:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  IKCSSParseDeclaration *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  IKCSSParseDeclaration *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSUInteger v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSUInteger v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  unint64_t v52;
  uint64_t v53;
  void *v54;
  NSUInteger v55;
  void *v56;
  NSUInteger v57;
  NSRange v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  IKArray *v65;
  NSRange v66;
  uint64_t range1;
  NSUInteger range1a;
  void *v70;
  IKCSSParseDeclaration *v71;
  NSUInteger v72;
  NSUInteger range2;
  NSUInteger range2_8;
  NSUInteger v75;
  NSRange v76;
  NSRange v77;
  NSRange v78;
  NSRange v79;

  v3 = a3;
  v4 = 0;
  if (objc_msgSend(v3, "count"))
  {
    while (1)
    {
      objc_msgSend(v3, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "type") != 1)
        break;
      objc_msgSend(v5, "token");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "type");

      if (v7 != 1)
        break;

      if (++v4 >= (unint64_t)objc_msgSend(v3, "count"))
        goto LABEL_7;
    }

  }
LABEL_7:
  v8 = v4 + 1;
  if (v4 + 1 < (unint64_t)objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", v4 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "type") != 1
      || (objc_msgSend(v9, "token"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "type"),
          v10,
          v11 != 21))
    {
      v22 = 0;
      goto LABEL_74;
    }
    v8 = v4 + 2;

  }
  v12 = objc_alloc_init(IKCSSParseDeclaration);
  objc_msgSend(v3, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "token");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "range");
  v17 = v16;
  objc_msgSend(v14, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseDeclaration setName:](v12, "setName:", v18);

  v71 = v12;
  range2_8 = v17;
  v75 = v15;
  -[IKCSSParseDeclaration setNameRange:](v12, "setNameRange:", v15, v17);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    if (v8 >= objc_msgSend(v3, "count"))
      goto LABEL_25;
    objc_msgSend(v3, "objectAtIndex:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "type") == 1)
      break;
    objc_msgSend(v19, "addObject:", v20);
LABEL_17:

    ++v8;
  }
  objc_msgSend(v3, "objectAtIndex:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "type") != 2)
  {
    objc_msgSend(v19, "addObject:", v20);

    goto LABEL_17;
  }

LABEL_25:
  while (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "type") != 1)
    {

      break;
    }
    objc_msgSend(v19, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "token");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "type") == 1)
    {

    }
    else
    {
      objc_msgSend(v19, "lastObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "token");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "type");

      if (v28 != 26)
        break;
    }
    objc_msgSend(v19, "removeLastObject");
  }
  v29 = range2_8 + v75 + 1;
  objc_msgSend(v19, "lastObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v19, "lastObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "range");
    v34 = v33;

  }
  else
  {
    v34 = 0;
    v32 = range2_8 + v75 + 1;
  }
  v35 = v32;

  objc_msgSend(v19, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    objc_msgSend(v19, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v37, "range");
    range1 = v38;

  }
  else
  {
    range1 = 0;
  }

  range2 = v32;
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v34;
    if (objc_msgSend(v39, "type") == 1)
    {
      objc_msgSend(v19, "lastObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "token");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "type") == 22;

    }
    else
    {
      v43 = 0;
    }

  }
  else
  {
    v40 = v34;
    v43 = 0;
  }
  v70 = v14;
  if (!objc_msgSend(v19, "count", range1))
  {
    v47 = 0;
    if (v43)
      goto LABEL_48;
LABEL_44:
    v48 = v40;
    v49 = v40;
    v50 = v35;
    v51 = range1a;
    if (v47)
      goto LABEL_58;
    goto LABEL_62;
  }
  objc_msgSend(v19, "firstObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "type") == 1)
  {
    objc_msgSend(v19, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "token");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "type") == 1;

  }
  else
  {
    v47 = 0;
  }

  if (!v43)
    goto LABEL_44;
LABEL_48:
  v52 = objc_msgSend(v19, "count");
  v53 = objc_msgSend(v19, "count");
  if (v52 < 2)
  {
    v50 = v35;
    if (v53 == 1)
      v29 = v35;
    v51 = range1a;
    if (v53 == 1)
      v51 = 0;
    v48 = v40;
    if (v53 == 1)
      v49 = 0;
    else
      v49 = v40;
  }
  else
  {
    objc_msgSend(v19, "objectAtIndex:", v53 - 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v54, "range");
    v49 = v55;

    v48 = v40;
    v51 = range1a;
  }
  objc_msgSend(v19, "removeLastObject");
  if (v47)
  {
LABEL_58:
    if ((unint64_t)objc_msgSend(v19, "count") < 2)
    {
      if (objc_msgSend(v19, "count") == 1)
      {
        v51 = 0;
        v50 = v29;
        v49 = 0;
      }
    }
    else
    {
      objc_msgSend(v19, "objectAtIndex:", 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v56, "range");
      v51 = v57;

    }
  }
LABEL_62:
  v9 = v70;
  v22 = v71;
  v76.location = v29;
  v76.length = v51;
  v78.location = v50;
  v78.length = v49;
  v58 = NSUnionRange(v76, v78);
  -[IKCSSParseDeclaration setValueRange:](v71, "setValueRange:", v58.location, v58.length);
  if ((unint64_t)objc_msgSend(v19, "count") >= 2)
  {
    objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v19, "count") - 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v19, "count") - 2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v60, "type") == 1)
    {
      objc_msgSend(v60, "token");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v61, "type") == 5
        && objc_msgSend(v61, "charValue") == 33
        && objc_msgSend(v59, "type") == 1)
      {
        v72 = v48;
        objc_msgSend(v59, "token");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v62, "type") == 18)
        {
          objc_msgSend(v62, "stringValue");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "caseInsensitiveCompare:", CFSTR("important"));

          if (!v64)
          {
            -[IKCSSParseDeclaration setImportant:](v22, "setImportant:", 1);
            objc_msgSend(v19, "removeLastObject");
            objc_msgSend(v19, "removeLastObject");
          }
        }

        v48 = v72;
      }

    }
  }
  v65 = -[IKArray initWithNSArray:]([IKArray alloc], "initWithNSArray:", v19);
  -[IKCSSParseObject setCssValue:](v22, "setCssValue:", v65);

  v77.length = range2_8;
  v77.location = v75;
  v79.location = range2;
  v79.length = v48;
  v66 = NSUnionRange(v77, v79);
  -[IKCSSParseObject setRange:](v22, "setRange:", v66.location, v66.length);

LABEL_74:
  return v22;
}

@end
