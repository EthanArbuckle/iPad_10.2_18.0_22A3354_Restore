@implementation WFCombineTextIntentHandler

- (void)resolveCustomSeparatorForCombineText:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  v6 = objc_msgSend(v12, "separator");
  v7 = (void *)MEMORY[0x24BDDA218];
  if (v6 == 3)
  {
    objc_msgSend(v12, "customSeparator");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = &stru_24F8BBA48;
    objc_msgSend(v7, "successWithResolvedString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v5[2](v5, v11);

    v5 = (void (**)(id, uint64_t))v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDA218], "notRequired");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, (uint64_t)v9);
  }

}

- (void)resolveSeparatorForCombineText:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, void *))a4;
  if (objc_msgSend(v7, "separator"))
    +[WFCombineTextSeparatorResolutionResult successWithResolvedCombineTextSeparator:](WFCombineTextSeparatorResolutionResult, "successWithResolvedCombineTextSeparator:", objc_msgSend(v7, "separator"));
  else
    +[WFCombineTextSeparatorResolutionResult needsValue](WFCombineTextSeparatorResolutionResult, "needsValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

}

- (void)resolveTextForCombineText:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_map:", &__block_literal_global_21528);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v6, v7);

}

- (void)handleCombineText:(id)a3 completion:(id)a4
{
  void (**v5)(id, WFCombineTextIntentResponse *);
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  WFCombineTextIntentResponse *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void (**)(id, WFCombineTextIntentResponse *))a4;
  v6 = objc_msgSend(v12, "separator");
  switch(v6)
  {
    case 3:
      objc_msgSend(v12, "customSeparator");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR(" ");
      goto LABEL_9;
    case 1:
      objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("\n");
      goto LABEL_9;
    default:
      v8 = 0;
      break;
  }
  v7 = 0;
LABEL_9:
  objc_msgSend(v12, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFCombineTextIntentResponse initWithCode:userActivity:]([WFCombineTextIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "componentsJoinedByString:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCombineTextIntentResponse setText:](v10, "setText:", v11);

  }
  v5[2](v5, v10);

}

uint64_t __71__WFCombineTextIntentHandler_resolveTextForCombineText_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDDA218], "successWithResolvedString:", a2);
}

@end
