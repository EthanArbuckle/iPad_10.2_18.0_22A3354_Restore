@implementation WFSplitTextIntentHandler

- (void)resolveCustomSeparatorForSplitText:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  if (objc_msgSend(v12, "separator") != 4)
  {
    objc_msgSend(MEMORY[0x24BDDA218], "notRequired");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v11;
    v5[2](v5, v11);
    goto LABEL_7;
  }
  objc_msgSend(v12, "customSeparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = (void *)MEMORY[0x24BDDA218];
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDDA218], "needsValue");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v12, "customSeparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "successWithResolvedString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, (uint64_t)v10);

LABEL_7:
}

- (void)resolveSeparatorForSplitText:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, void *))a4;
  if (objc_msgSend(v7, "separator"))
    +[WFSplitTextSeparatorResolutionResult successWithResolvedSplitTextSeparator:](WFSplitTextSeparatorResolutionResult, "successWithResolvedSplitTextSeparator:", objc_msgSend(v7, "separator"));
  else
    +[WFSplitTextSeparatorResolutionResult needsValue](WFSplitTextSeparatorResolutionResult, "needsValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

}

- (void)resolveTextForSplitText:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_map:", &__block_literal_global_39485);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v6, v7);

}

- (void)handleSplitText:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, WFSplitTextIntentResponse *);
  void *v7;
  __CFString *v8;
  void *v9;
  WFSplitTextIntentResponse *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  WFSplitTextIntentResponse *v26;
  void *v27;
  void (**v28)(id, WFSplitTextIntentResponse *);
  id v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, WFSplitTextIntentResponse *))a4;
  v31 = objc_msgSend(v5, "separator");
  switch(v31)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("\n");
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR(" ");
      break;
    case 3:
      v7 = 0;
      v8 = &stru_24F8BBA48;
      break;
    case 4:
      objc_msgSend(v5, "customSeparator");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    default:
      v8 = 0;
LABEL_7:
      v7 = 0;
      break;
  }
  objc_msgSend(v5, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFSplitTextIntentResponse initWithCode:userActivity:]([WFSplitTextIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  if (objc_msgSend(v9, "count"))
  {
    v26 = v10;
    v28 = v6;
    v11 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v27 = v9;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      v29 = v12;
      v30 = v7;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((-[__CFString isEqualToString:](v8, "isEqualToString:", &stru_24F8BBA48) & 1) != 0
            || (v20 = -[__CFString length](v8, "length"), v31 == 1)
            || !v20)
          {
            v18 = objc_msgSend(v17, "length");
            v36[0] = MEMORY[0x24BDAC760];
            v36[1] = 3221225472;
            v36[2] = __55__WFSplitTextIntentHandler_handleSplitText_completion___block_invoke;
            v36[3] = &unk_24F8B8140;
            v37 = v11;
            objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v18, 2 * (v31 != 1), v36);
            v19 = v37;
          }
          else
          {
            if (v7)
              objc_msgSend(v17, "componentsSeparatedByCharactersInSet:", v7);
            else
              objc_msgSend(v17, "componentsSeparatedByString:", v8);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v19 = v21;
            v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v33;
              do
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v33 != v24)
                    objc_enumerationMutation(v19);
                  objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
                }
                v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
              }
              while (v23);
            }

            v12 = v29;
            v7 = v30;
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v14);
    }

    v10 = v26;
    -[WFSplitTextIntentResponse setText:](v26, "setText:", v11);
    v6 = v28;
    v28[2](v28, v26);

    v9 = v27;
  }
  else
  {
    v6[2](v6, v10);
  }

}

uint64_t __55__WFSplitTextIntentHandler_handleSplitText_completion___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __67__WFSplitTextIntentHandler_resolveTextForSplitText_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDDA218], "successWithResolvedString:", a2);
}

@end
