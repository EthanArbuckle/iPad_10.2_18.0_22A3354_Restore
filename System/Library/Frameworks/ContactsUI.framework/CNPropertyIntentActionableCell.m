@implementation CNPropertyIntentActionableCell

- (id)defaultContext
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  -[CNPropertyCell delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactViewCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0D13D70]);
  v6 = objc_alloc_init(MEMORY[0x1E0D13C70]);
  v7 = (void *)objc_msgSend(v5, "initWithContactStore:applicationWorkspace:", v4, v6);

  return v7;
}

- (BOOL)shouldPerformDefaultAction
{
  void *v3;
  BOOL v4;

  -[CNPropertyIntentActionableCell actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 1 || -[CNPropertyCell isSuggested](self, "isSuggested");

  return v4;
}

- (void)performDefaultAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v11;

  if (-[CNPropertyCell isSuggested](self, "isSuggested"))
  {
    v11.receiver = self;
    v11.super_class = (Class)CNPropertyIntentActionableCell;
    -[CNPropertyCell performDefaultAction](&v11, sel_performDefaultAction);
    return;
  }
  -[CNPropertyIntentActionableCell actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[CNPropertyIntentActionableCell actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v4 == 1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyIntentActionableCell defaultContext](self, "defaultContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "performActionWithContext:", v7);

  }
  else
  {
    v9 = objc_msgSend(v5, "count");

    if (v9)
      return;
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[CNPropertyAction performDefaultActionForItem:sender:](CNPropertyAction, "performDefaultActionForItem:sender:", v10, self);
  }

}

- (void)updateTransportButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  objc_super v15;
  _QWORD v16[5];
  id v17;

  -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransportType:", 0);

  -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransportType:", 0);

  -[CNPropertySimpleTransportCell transportIcon3](self, "transportIcon3");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransportType:", 0);

  if (-[CNPropertySimpleTransportCell allowsActions](self, "allowsActions")
    && !-[CNPropertyCell isSuggested](self, "isSuggested"))
  {
    -[CNPropertyCell delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharedActionsDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactProperty");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "thirdPartyActionsForContactProperty:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v10, "result:", &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    -[CNPropertyIntentActionableCell setActions:](self, "setActions:", v11);

    -[CNPropertyIntentActionableCell actions](self, "actions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v14 = -[CNPropertySimpleTransportCell shouldShowTransportButtons](self, "shouldShowTransportButtons");

      if (!v14)
      {
LABEL_7:

        goto LABEL_8;
      }
      -[CNPropertyIntentActionableCell actions](self, "actions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __56__CNPropertyIntentActionableCell_updateTransportButtons__block_invoke;
      v16[3] = &unk_1E204B6E0;
      v16[4] = self;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);
    }

    goto LABEL_7;
  }
LABEL_8:
  v15.receiver = self;
  v15.super_class = (Class)CNPropertyIntentActionableCell;
  -[CNPropertySimpleTransportCell updateTransportButtons](&v15, sel_updateTransportButtons);
}

- (id)transportsMapping
{
  if (transportsMapping_cn_once_token_1 != -1)
    dispatch_once(&transportsMapping_cn_once_token_1, &__block_literal_global_29227);
  return (id)transportsMapping_cn_once_object_1;
}

- (void)transportButton1Clicked:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CNPropertyIntentActionableCell actions](self, "actions", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyIntentActionableCell defaultContext](self, "defaultContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "performActionWithContext:", v5);

}

- (void)transportButton2Clicked:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CNPropertyIntentActionableCell actions](self, "actions", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyIntentActionableCell defaultContext](self, "defaultContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "performActionWithContext:", v5);

}

- (void)transportButton3Clicked:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CNPropertyIntentActionableCell actions](self, "actions", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyIntentActionableCell defaultContext](self, "defaultContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "performActionWithContext:", v5);

}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

void __51__CNPropertyIntentActionableCell_transportsMapping__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96658];
  v4[0] = *MEMORY[0x1E0C965F8];
  v4[1] = v0;
  v5[0] = &unk_1E20D2EF8;
  v5[1] = &unk_1E20D2F10;
  v4[2] = *MEMORY[0x1E0C96620];
  v5[2] = &unk_1E20D2F28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)transportsMapping_cn_once_object_1;
  transportsMapping_cn_once_object_1 = v2;

}

void __56__CNPropertyIntentActionableCell_updateTransportButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "transportsMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (a3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "transportIcon3");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTransportType:", v10);

    objc_msgSend(*(id *)(a1 + 32), "transportIcon3");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

    objc_msgSend(*(id *)(a1 + 32), "transportIcon3");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &selRef_transportButton3Clicked_;
  }
  else if (a3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "transportIcon2");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTransportType:", v10);

    objc_msgSend(*(id *)(a1 + 32), "transportIcon2");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

    objc_msgSend(*(id *)(a1 + 32), "transportIcon2");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &selRef_transportButton2Clicked_;
  }
  else
  {
    if (a3)
      return;
    objc_msgSend(*(id *)(a1 + 32), "transportIcon1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTransportType:", v10);

    objc_msgSend(*(id *)(a1 + 32), "transportIcon1");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

    objc_msgSend(*(id *)(a1 + 32), "transportIcon1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &selRef_transportButton1Clicked_;
  }
  v19 = v13;
  objc_msgSend(v13, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), *v14, 64);

}

@end
