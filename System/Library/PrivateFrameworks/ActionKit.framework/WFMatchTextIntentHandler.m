@implementation WFMatchTextIntentHandler

- (void)resolveCaseSensitiveForMatchText:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD9C10];
  v7 = a4;
  objc_msgSend(a3, "caseSensitive");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)resolvePatternForMatchText:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v10, "pattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDDA218];
  if (v6)
  {
    objc_msgSend(v10, "pattern");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "successWithResolvedString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v5[2](v5, v9);

    v5 = (void (**)(id, uint64_t))v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDA218], "needsValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, (uint64_t)v8);
  }

}

- (void)resolveTextForMatchText:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v10, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDDA218];
  if (v6)
  {
    objc_msgSend(v10, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "successWithResolvedString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v5[2](v5, v9);

    v5 = (void (**)(id, uint64_t))v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDA218], "needsValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, (uint64_t)v8);
  }

}

- (void)handleMatchText:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, WFMatchTextIntentResponse *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  WFMatchTextIntentResponse *v13;
  WFMatchTextIntentResponse *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  WFTextMatch *v21;
  void *v22;
  void *v23;
  WFTextMatch *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  WFMatchTextIntentResponse *v29;
  void *v30;
  void *v31;
  WFMatchTextIntentResponse *v32;
  void *v33;
  void (**v34)(id, WFMatchTextIntentResponse *);
  id v35;

  v5 = a3;
  v6 = (void (**)(id, WFMatchTextIntentResponse *))a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "caseSensitive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (objc_msgSend(v8, "length"))
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v9, v11 ^ 1u, &v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (WFMatchTextIntentResponse *)v35;
    v14 = v13;
    if (!v12)
    {
      v29 = -[WFMatchTextIntentResponse initWithCode:userActivity:]([WFMatchTextIntentResponse alloc], "initWithCode:userActivity:", 100, 0);
      -[WFMatchTextIntentResponse localizedDescription](v14, "localizedDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFMatchTextIntentResponse setErrorDescription:](v29, "setErrorDescription:", v30);

      v6[2](v6, v29);
      goto LABEL_9;
    }
    v32 = v13;
    v33 = v9;
    v34 = v6;
    v31 = v12;
    objc_msgSend(v12, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      v16 = 0;
      do
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "range");
        objc_msgSend(v8, "substringWithRange:", v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = [WFTextMatch alloc];
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[WFTextMatch initWithIdentifier:displayString:](v21, "initWithIdentifier:displayString:", v23, v20);

        objc_msgSend(v5, "text");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTextMatch setText:](v24, "setText:", v25);

        objc_msgSend(v5, "pattern");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTextMatch setPattern:](v24, "setPattern:", v26);

        objc_msgSend(v5, "caseSensitive");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTextMatch setCaseSensitive:](v24, "setCaseSensitive:", v27);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTextMatch setIndex:](v24, "setIndex:", v28);

        objc_msgSend(v7, "addObject:", v24);
        ++v16;
      }
      while (objc_msgSend(v15, "count") > v16);
    }

    v9 = v33;
    v6 = v34;
  }
  v14 = -[WFMatchTextIntentResponse initWithCode:userActivity:]([WFMatchTextIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  -[WFMatchTextIntentResponse setMatches:](v14, "setMatches:", v7);
  v6[2](v6, v14);
LABEL_9:

}

@end
