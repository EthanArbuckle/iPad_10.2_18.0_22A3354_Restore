@implementation RWIProtocolCSSRule(IKJSInspector)

+ (id)ik_cssRuleForRule:()IKJSInspector withOrdinal:forStyleSheetHeader:forStyleMarkup:withNewLineIndexSet:
{
  void *v7;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = (void *)MEMORY[0x1E0DD95C8];
  v15 = a7;
  v16 = a6;
  objc_msgSend(v12, "selectorList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ik_cssSelectorListFromSelectorList:forStyleMarkup:withNewLineIndexSet:", v17, v16, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0DD95E0];
  objc_msgSend(v12, "declarationList");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ik_cssStyleFromDeclarationList:forStyleMarkup:withNewLineIndexSet:existingStyle:", v20, v16, v15, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0DD95F0];
  objc_msgSend(v13, "styleSheetId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safe_initWithStyleSheetId:ordinal:", v23, a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setStyleId:", v24);
  v25 = (void *)MEMORY[0x1E0DD95A8];
  if (v16)
  {
    objc_msgSend(v18, "range");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v7, "startLine");
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(v25, "safe_initWithSelectorList:sourceLine:origin:style:", v18, v26, objc_msgSend(v13, "origin"), v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)

  v28 = (void *)MEMORY[0x1E0DD95B0];
  objc_msgSend(v13, "styleSheetId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "safe_initWithStyleSheetId:ordinal:", v29, a4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setRuleId:", v30);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = (void *)MEMORY[0x1E0DD9580];
    v32 = v12;
    objc_msgSend(v31, "safe_initWithType:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "mediaQuery");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "queryExpression");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setText:", v35);

    v38[0] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setGroupings:", v36);

  }
  return v27;
}

- (id)ik_ruleMatchForClassSelectors:()IKJSInspector andIdSelector:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = a1;
  objc_msgSend(a1, "selectorList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    while (1)
    {
      objc_msgSend(v9, "selectors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "length"))
      {
        objc_msgSend(v14, "text");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "hasPrefix:", CFSTR("#")) & 1) != 0)
        {
          objc_msgSend(v14, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%@"), v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v18 & 1) != 0)
            break;
        }
        else
        {

        }
      }
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v14, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v19, "hasPrefix:", CFSTR(".")))
          goto LABEL_12;
        objc_msgSend(v14, "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "substringFromIndex:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v6, "containsObject:", v21);

        if (v22)
          break;
      }
LABEL_13:

      ++v12;
      objc_msgSend(v9, "selectors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (v12 >= v24)
        goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v19);
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0DD95B8], "safe_initWithRule:matchingSelectors:", v27, v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

@end
