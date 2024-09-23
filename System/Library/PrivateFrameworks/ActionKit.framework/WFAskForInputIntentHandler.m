@implementation WFAskForInputIntentHandler

- (void)resolveQuestionForAskForInput:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  unint64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = (void (**)(id, void *))a4;
  objc_msgSend(v11, "question");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    v7 = objc_msgSend(v11, "type") - 2;
    if (v7 > 4)
      v8 = CFSTR("What’s the text?");
    else
      v8 = off_24F8B30C0[v7];
    WFLocalizedString(v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x24BDDA218], "successWithResolvedString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v10);

}

- (void)resolveTypeForAskForInput:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, void *))a4;
  if (objc_msgSend(v7, "type"))
    +[WFAskForInputTypeResolutionResult successWithResolvedAskForInputType:](WFAskForInputTypeResolutionResult, "successWithResolvedAskForInputType:", objc_msgSend(v7, "type"));
  else
    +[WFAskForInputTypeResolutionResult needsValue](WFAskForInputTypeResolutionResult, "needsValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

}

- (void)resolveStringAnswerForAskForInput:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v12, "stringAnswer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    goto LABEL_5;
  }
  v8 = -[WFAskForInputIntentHandler resolvedValue](self, "resolvedValue");

  if (!v8)
  {
LABEL_5:
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 1);
    objc_msgSend(MEMORY[0x24BDDA218], "needsValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);
    goto LABEL_6;
  }
  -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 0);
  v9 = (void *)MEMORY[0x24BDDA218];
  objc_msgSend(v12, "stringAnswer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "successWithResolvedString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v11);

LABEL_6:
}

- (void)resolveNumberAnswerForAskForInput:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v12, "numberAnswer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7, v9 = -[WFAskForInputIntentHandler resolvedValue](self, "resolvedValue"), v8, v9))
  {
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 0);
    objc_msgSend(v12, "numberAnswer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    +[WFAskForInputNumberAnswerResolutionResult successWithResolvedValue:](WFAskForInputNumberAnswerResolutionResult, "successWithResolvedValue:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);

  }
  else
  {
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 1);
    +[WFAskForInputNumberAnswerResolutionResult needsValue](WFAskForInputNumberAnswerResolutionResult, "needsValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);
  }

}

- (void)resolveDefaultURLAnswerForAskForInput:(id)a3 withCompletion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDDA218];
  v6 = a4;
  objc_msgSend(v5, "notRequired");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)resolveUrlAnswerForAskForInput:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v13, "urlAnswer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7, v9 = -[WFAskForInputIntentHandler resolvedValue](self, "resolvedValue"), v8, v9))
  {
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 0);
    v10 = (void *)MEMORY[0x24BDDA278];
    objc_msgSend(v13, "urlAnswer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "successWithResolvedURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

  }
  else
  {
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 1);
    objc_msgSend(MEMORY[0x24BDDA278], "needsValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);
  }

}

- (void)resolveDateAnswerForAskForInput:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v13, "dateAnswer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7, v9 = -[WFAskForInputIntentHandler resolvedValue](self, "resolvedValue"), v8, v9))
  {
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 0);
    v10 = (void *)MEMORY[0x24BDD9CA8];
    objc_msgSend(v13, "dateAnswer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "successWithResolvedDateComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

  }
  else
  {
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 1);
    objc_msgSend(MEMORY[0x24BDD9CA8], "needsValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);
  }

}

- (void)resolveTimeAnswerForAskForInput:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v13, "timeAnswer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7, v9 = -[WFAskForInputIntentHandler resolvedValue](self, "resolvedValue"), v8, v9))
  {
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 0);
    v10 = (void *)MEMORY[0x24BDD9CA8];
    objc_msgSend(v13, "timeAnswer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "successWithResolvedDateComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

  }
  else
  {
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 1);
    objc_msgSend(MEMORY[0x24BDD9CA8], "needsValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);
  }

}

- (void)resolveDateAndTimeAnswerForAskForInput:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v13, "dateAndTimeAnswer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7, v9 = -[WFAskForInputIntentHandler resolvedValue](self, "resolvedValue"), v8, v9))
  {
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 0);
    v10 = (void *)MEMORY[0x24BDD9CA8];
    objc_msgSend(v13, "dateAndTimeAnswer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "successWithResolvedDateComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

  }
  else
  {
    -[WFAskForInputIntentHandler setResolvedValue:](self, "setResolvedValue:", 1);
    objc_msgSend(MEMORY[0x24BDD9CA8], "needsValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);
  }

}

- (void)handleAskForInput:(id)a3 completion:(id)a4
{
  void (**v5)(id, WFAskForInputIntentResponse *);
  uint64_t v6;
  __CFString *v7;
  WFAskForInputIntentResponse *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WFAskForInputResult *v15;
  void *v16;
  void *v17;
  WFAskForInputResult *v18;
  id v19;

  v19 = a3;
  v5 = (void (**)(id, WFAskForInputIntentResponse *))a4;
  v6 = objc_msgSend(v19, "type");
  if ((unint64_t)(v6 - 1) >= 6)
  {
    v8 = -[WFAskForInputIntentResponse initWithCode:userActivity:]([WFAskForInputIntentResponse alloc], "initWithCode:userActivity:", 5, 0);
    v5[2](v5, v8);
  }
  else
  {
    v7 = off_24F8B30E8[v6 - 1];
    v8 = -[WFAskForInputIntentResponse initWithCode:userActivity:]([WFAskForInputIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
    objc_msgSend(v19, "valueForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_codableDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributeByName:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDDA210], "localizerForLanguage:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_intents_readableTitleWithLocalizer:metadata:", v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = [WFAskForInputResult alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WFAskForInputResult initWithIdentifier:displayString:](v15, "initWithIdentifier:displayString:", v17, v14);

    -[WFAskForInputResult setType:](v18, "setType:", objc_msgSend(v19, "type"));
    switch(objc_msgSend(v19, "type"))
    {
      case 1:
        -[WFAskForInputResult setStringValue:](v18, "setStringValue:", v9);
        break;
      case 2:
        -[WFAskForInputResult setNumberValue:](v18, "setNumberValue:", v9);
        break;
      case 3:
        -[WFAskForInputResult setUrlValue:](v18, "setUrlValue:", v9);
        break;
      case 4:
        -[WFAskForInputResult setDateValue:](v18, "setDateValue:", v9);
        break;
      case 5:
        -[WFAskForInputResult setTimeValue:](v18, "setTimeValue:", v9);
        break;
      case 6:
        -[WFAskForInputResult setDateAndTimeValue:](v18, "setDateAndTimeValue:", v9);
        break;
      default:
        break;
    }
    -[WFAskForInputIntentResponse setResult:](v8, "setResult:", v18);
    v5[2](v5, v8);

  }
}

- (BOOL)resolvedValue
{
  return self->_resolvedValue;
}

- (void)setResolvedValue:(BOOL)a3
{
  self->_resolvedValue = a3;
}

@end
