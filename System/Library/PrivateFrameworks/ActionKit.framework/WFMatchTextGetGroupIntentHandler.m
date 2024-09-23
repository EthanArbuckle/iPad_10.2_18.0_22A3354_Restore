@implementation WFMatchTextGetGroupIntentHandler

- (void)resolveGroupIndexForMatchTextGetGroup:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v9, "groupIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v9, "groupIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[INIntegerResolutionResult successWithResolvedValue:](WFMatchTextGetGroupGroupIndexResolutionResult, "successWithResolvedValue:", objc_msgSend(v7, "integerValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    v5[2](v5, v8);

    v5 = (void (**)(id, uint64_t))v8;
  }
  else
  {
    +[WFMatchTextGetGroupGroupIndexResolutionResult needsValue](WFMatchTextGetGroupGroupIndexResolutionResult, "needsValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, (uint64_t)v7);
  }

}

- (void)resolveMatchesForMatchTextGetGroup:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "matches");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_map:", &__block_literal_global_45669);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v6, v7);

}

- (void)resolveTypeForMatchTextGetGroup:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, void *))a4;
  if (objc_msgSend(v7, "type"))
    +[WFMatchTextGetGroupTypeResolutionResult successWithResolvedMatchTextGetGroupType:](WFMatchTextGetGroupTypeResolutionResult, "successWithResolvedMatchTextGetGroupType:", objc_msgSend(v7, "type"));
  else
    +[WFMatchTextGetGroupTypeResolutionResult needsValue](WFMatchTextGetGroupTypeResolutionResult, "needsValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

}

- (void)handleMatchTextGetGroup:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, WFMatchTextGetGroupIntentResponse *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  WFMatchTextGetGroupIntentResponse *v32;
  WFMatchTextGetGroupIntentResponse *v33;
  WFMatchTextGetGroupIntentResponse *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void (**v38)(id, WFMatchTextGetGroupIntentResponse *);
  id v39;
  unint64_t v40;
  uint64_t v41;
  WFMatchTextGetGroupIntentResponse *obj;
  uint64_t v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, WFMatchTextGetGroupIntentResponse *))a4;
  objc_msgSend(v6, "matches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v6, "type");
  objc_msgSend(v6, "groupIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v9, "integerValue");

  v10 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v8;
  v11 = -[WFMatchTextGetGroupIntentResponse countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v11)
  {
    v12 = v11;
    v43 = *(_QWORD *)v47;
    v44 = v10;
    v38 = v7;
    v39 = v6;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v47 != v43)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v14, "text", v38);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "caseSensitive");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        v18 = (void *)MEMORY[0x24BDD1798];
        objc_msgSend(v14, "pattern");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        objc_msgSend(v18, "regularExpressionWithPattern:options:error:", v19, v17, &v45);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v45;

        if (v20)
        {
          objc_msgSend(v20, "matchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "index");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "integerValue");

          if (v24 < objc_msgSend(v22, "count"))
          {
            objc_msgSend(v22, "objectAtIndexedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v41 == 2)
            {
              if ((unint64_t)objc_msgSend(v25, "numberOfRanges") >= 2)
              {
                v27 = 1;
                while (1)
                {
                  -[WFMatchTextGetGroupIntentHandler matchedTextInString:withResult:atIndex:](self, "matchedTextInString:withResult:atIndex:", v15, v26, v27);
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (!v28)
                    break;
                  v29 = (void *)v28;
                  objc_msgSend(v44, "addObject:", v28);

                  if (++v27 >= (unint64_t)objc_msgSend(v26, "numberOfRanges"))
                    goto LABEL_18;
                }
                v34 = -[WFMatchTextGetGroupIntentResponse initWithCode:userActivity:]([WFMatchTextGetGroupIntentResponse alloc], "initWithCode:userActivity:", 100, 0);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27);
                v35 = objc_claimAutoreleasedReturnValue();
                goto LABEL_24;
              }
            }
            else
            {
              if ((v40 & 0x8000000000000000) != 0 || v40 >= objc_msgSend(v25, "numberOfRanges"))
              {
                v34 = -[WFMatchTextGetGroupIntentResponse initWithCode:userActivity:]([WFMatchTextGetGroupIntentResponse alloc], "initWithCode:userActivity:", 101, 0);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v40);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFMatchTextGetGroupIntentResponse setRangeErrorGroupNumber:](v34, "setRangeErrorGroupNumber:", v37);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v26, "numberOfRanges"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFMatchTextGetGroupIntentResponse setRangeErrorGroupCount:](v34, "setRangeErrorGroupCount:", v36);
                goto LABEL_25;
              }
              -[WFMatchTextGetGroupIntentHandler matchedTextInString:withResult:atIndex:](self, "matchedTextInString:withResult:atIndex:", v15, v26, v40);
              v30 = objc_claimAutoreleasedReturnValue();
              if (!v30)
              {
                v34 = -[WFMatchTextGetGroupIntentResponse initWithCode:userActivity:]([WFMatchTextGetGroupIntentResponse alloc], "initWithCode:userActivity:", 100, 0);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v40);
                v35 = objc_claimAutoreleasedReturnValue();
LABEL_24:
                v36 = (void *)v35;
                -[WFMatchTextGetGroupIntentResponse setNoMatchIndex:](v34, "setNoMatchIndex:", v35);
LABEL_25:

                v7 = v38;
                v38[2](v38, v34);

                v32 = obj;
                v33 = obj;
                v6 = v39;
                v10 = v44;
                goto LABEL_26;
              }
              v31 = (void *)v30;
              objc_msgSend(v44, "addObject:", v30);

            }
LABEL_18:

          }
        }

      }
      v12 = -[WFMatchTextGetGroupIntentResponse countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      v7 = v38;
      v6 = v39;
      v10 = v44;
      if (v12)
        continue;
      break;
    }
  }
  v32 = obj;

  v33 = -[WFMatchTextGetGroupIntentResponse initWithCode:userActivity:]([WFMatchTextGetGroupIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  -[WFMatchTextGetGroupIntentResponse setText:](v33, "setText:", v10);
  v7[2](v7, v33);
LABEL_26:

}

- (id)matchedTextInString:(id)a3 withResult:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v7 = a3;
  v8 = objc_msgSend(a4, "rangeAtIndex:", a5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "substringWithRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id __86__WFMatchTextGetGroupIntentHandler_resolveMatchesForMatchTextGetGroup_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFTextMatchResolutionResult successWithResolvedTextMatch:](WFTextMatchResolutionResult, "successWithResolvedTextMatch:", a2);
}

@end
