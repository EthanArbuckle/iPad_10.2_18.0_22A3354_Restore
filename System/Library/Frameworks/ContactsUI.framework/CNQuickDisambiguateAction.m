@implementation CNQuickDisambiguateAction

- (CNQuickDisambiguateAction)initWithActions:(id)a3
{
  id v3;
  CNQuickDisambiguateAction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNQuickDisambiguateAction;
  v3 = a3;
  v4 = -[CNQuickPropertyAction initWithPropertyAction:](&v6, sel_initWithPropertyAction_, 0);
  -[CNQuickDisambiguateAction setActions:](v4, "setActions:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)CNQuickDisambiguateAction;
    if (!-[CNQuickAction isEqual:](&v12, sel_isEqual_, v6))
    {
      v10 = 0;
LABEL_12:

      goto LABEL_13;
    }
    -[CNQuickDisambiguateAction actions](self, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "actions"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CNQuickDisambiguateAction actions](self, "actions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "actions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_11;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)titleForContext:(int64_t)a3
{
  __CFString *v3;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v3 = 0;
  switch(a3)
  {
    case 0:
    case 1:
      -[CNQuickPropertyAction titleForContext:](&v9, sel_titleForContext_, a3, v8.receiver, v8.super_class, self, CNQuickDisambiguateAction);
      return (id)objc_claimAutoreleasedReturnValue();
    case 2:
    case 3:
      -[CNQuickDisambiguateAction mainAction](self, "mainAction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "titleForContext:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    case 5:
      -[CNQuickAction defaultTitleForContext:](&v8, sel_defaultTitleForContext_, 5, self, CNQuickDisambiguateAction, v9.receiver, v9.super_class);
      return (id)objc_claimAutoreleasedReturnValue();
    case 6:
      v3 = CFSTR("•••");
      return v3;
    default:
      return v3;
  }
}

- (id)subtitleForContext:(int64_t)a3
{
  void *v3;
  void *v4;

  if ((unint64_t)a3 > 1)
  {
    v4 = 0;
  }
  else
  {
    -[CNQuickDisambiguateAction mainAction](self, "mainAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subtitleForContext:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)performWithCompletionBlock:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  -[CNQuickDisambiguateAction mainAction](self, "mainAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "score") < 0x3E9)
  {

  }
  else
  {
    v5 = -[CNQuickAction isLongPress](self, "isLongPress");

    if (!v5)
    {
      -[CNQuickDisambiguateAction mainAction](self, "mainAction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "performWithCompletionBlock:", v28);

      goto LABEL_18;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[CNQuickDisambiguateAction actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
        if (!-[CNQuickDisambiguateAction ignoreMainAction](self, "ignoreMainAction")
          || (-[CNQuickDisambiguateAction mainAction](self, "mainAction"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v12, "isEqual:", v13),
              v13,
              (v14 & 1) == 0))
        {
          objc_msgSend(v12, "titleForContext:", 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "subtitleForContext:", 4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0DC3448];
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __56__CNQuickDisambiguateAction_performWithCompletionBlock___block_invoke;
          v31[3] = &unk_1E204D898;
          v31[4] = v12;
          v32 = v28;
          objc_msgSend(v17, "_actionWithTitle:descriptiveText:image:style:handler:shouldDismissHandler:", v16, v15, 0, 0, v31, &__block_literal_global_323);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addAction:", v18);
          -[CNQuickDisambiguateAction mainAction](self, "mainAction");

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v9);
  }

  v19 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __56__CNQuickDisambiguateAction_performWithCompletionBlock___block_invoke_4;
  v29[3] = &unk_1E2048B40;
  v30 = v28;
  objc_msgSend(v19, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v21, 0, 1, &__block_literal_global_326, v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAction:", v22);

  objc_msgSend(v27, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[CNQuickAction sourceView](self, "sourceView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSourceView:", v24);

    -[CNQuickAction sourceView](self, "sourceView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    objc_msgSend(v23, "setSourceRect:");

  }
  -[CNQuickContactAction delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contactAction:presentViewController:", self, v27);

LABEL_18:
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CNQuickDisambiguateAction;
  -[CNQuickAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickDisambiguateAction actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSOrderedSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (CNQuickAction)mainAction
{
  return (CNQuickAction *)objc_loadWeakRetained((id *)&self->_mainAction);
}

- (void)setMainAction:(id)a3
{
  objc_storeWeak((id *)&self->_mainAction, a3);
}

- (BOOL)ignoreMainAction
{
  return self->_ignoreMainAction;
}

- (void)setIgnoreMainAction:(BOOL)a3
{
  self->_ignoreMainAction = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainAction);
  objc_storeStrong((id *)&self->_actions, 0);
}

uint64_t __56__CNQuickDisambiguateAction_performWithCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithCompletionBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__CNQuickDisambiguateAction_performWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  return 1;
}

uint64_t __56__CNQuickDisambiguateAction_performWithCompletionBlock___block_invoke_2()
{
  return 1;
}

@end
