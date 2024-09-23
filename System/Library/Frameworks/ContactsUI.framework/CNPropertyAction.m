@implementation CNPropertyAction

- (NSArray)propertyItems
{
  return self->_propertyItems;
}

- (CNPropertyAction)initWithContact:(id)a3 propertyItems:(id)a4
{
  id v6;
  CNPropertyAction *v7;
  uint64_t v8;
  NSArray *propertyItems;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CNPropertyAction;
  v7 = -[CNContactAction initWithContact:](&v11, sel_initWithContact_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    propertyItems = v7->_propertyItems;
    v7->_propertyItems = (NSArray *)v8;

  }
  return v7;
}

- (CNPropertyAction)initWithContact:(id)a3
{
  return -[CNPropertyAction initWithContact:propertyItems:](self, "initWithContact:propertyItems:", a3, MEMORY[0x1E0C9AA60]);
}

- (CNPropertyAction)initWithContact:(id)a3 propertyItem:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CNPropertyAction *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CNPropertyAction initWithContact:propertyItems:](self, "initWithContact:propertyItems:", v8, v9, v12, v13);
  return v10;
}

- (CNPropertyGroupItem)propertyItem
{
  void *v2;
  void *v3;

  -[CNPropertyAction propertyItems](self, "propertyItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNPropertyGroupItem *)v3;
}

- (BOOL)canPerformAction
{
  return 1;
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "performDefaultActionForItem:sender:", v6, v5);

}

- (void)performActionWithSender:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CNPropertyAction propertyItems](self, "propertyItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    -[CNPropertyAction propertyItem](self, "propertyItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyAction performActionForItem:sender:](self, "performActionForItem:sender:", v6, v8);

    -[CNContactAction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionDidFinish:", self);

  }
  else
  {
    -[CNPropertyAction presentDisambiguationAlertWithSender:](self, "presentDisambiguationAlertWithSender:", v8);
  }

}

- (void)presentDisambiguationAlertWithSender:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  _QWORD v20[5];
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[CNPropertyAction propertyItems](self, "propertyItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "displayValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __57__CNPropertyAction_presentDisambiguationAlertWithSender___block_invoke;
        v21[3] = &unk_1E204FFA8;
        v21[4] = self;
        v21[5] = v9;
        objc_msgSend(MEMORY[0x1E0DC3448], "_actionWithTitle:descriptiveText:image:style:handler:shouldDismissHandler:", v10, v11, 0, 0, v21, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addAction:", v12);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  v13 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__CNPropertyAction_presentDisambiguationAlertWithSender___block_invoke_2;
  v20[3] = &unk_1E204F7F0;
  v20[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v16);

  -[CNContactAction delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "action:presentViewController:sender:", self, v4, v18);

}

- (void)setPropertyItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyItems, 0);
}

void __57__CNPropertyAction_presentDisambiguationAlertWithSender___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "performActionForItem:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionDidFinish:", *(_QWORD *)(a1 + 32));

}

void __57__CNPropertyAction_presentDisambiguationAlertWithSender___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWasCanceled:", *(_QWORD *)(a1 + 32));

}

+ (void)performDefaultActionForItem:(id)a3 sender:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Class v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "defaultActionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (objc_msgSend(v4, "isSuggested"))
    {
      v10 = (Class)getSGSuggestedActionMetricsClass[0]();
      objc_msgSend(v4, "property");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class recordContactDetailUsage:withApp:](v10, "recordContactDetailUsage:withApp:", v11, v13);

    }
    +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CNUIContactActionTypeTapProperty;
    v25[0] = CNUIContactActionTapPropertyIdentifier;
    objc_msgSend(v4, "property");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    v25[1] = CNUIDataCollectorActionTypeAttributeContact;
    objc_msgSend(v4, "contact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v17;
    v25[2] = CNUIDataCollectorActionTypeAttributeLabeledValue;
    objc_msgSend(v4, "labeledValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logContactActionType:attributes:", v15, v19);

    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "applicationWorkspace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0CA57C0];
    v24 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "openSensitiveURLInBackground:withOptions:", v9, v22);

  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyAction.m", 89, 6, CFSTR("%@ doesn’t define a default action URL"), v5, v6, v7, v8, (uint64_t)v4);
  }

}

@end
