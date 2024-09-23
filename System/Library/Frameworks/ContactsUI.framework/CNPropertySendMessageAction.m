@implementation CNPropertySendMessageAction

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CNPropertySendMessageAction actionMenuHelper](self, "actionMenuHelper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertySendMessageAction contextMenuInteraction](self, "contextMenuInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithMenuItems:contextMenuInteraction:", v5, v6);

}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (CNPropertySendMessageAction)initWithContact:(id)a3 propertyItems:(id)a4 actionDataSource:(id)a5
{
  id v9;
  CNPropertySendMessageAction *v10;
  CNPropertySendMessageAction *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CNPropertySendMessageAction;
  v10 = -[CNPropertyAction initWithContact:propertyItems:](&v13, sel_initWithContact_propertyItems_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_actionsDataSource, a5);

  return v11;
}

- (id)menuProviderForContextMenuInteraction:(id)a3
{
  id v4;
  CNActionMenuHelper *v5;
  CNContactActionsController *v6;
  void *v7;
  void *v8;
  void *v9;
  CNContactActionsController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNPropertySendMessageAction shouldPresentDisambiguationMenu](self, "shouldPresentDisambiguationMenu"))
  {
    -[CNPropertySendMessageAction setContextMenuInteraction:](self, "setContextMenuInteraction:", v4);
    v5 = objc_alloc_init(CNActionMenuHelper);
    -[CNPropertySendMessageAction setActionMenuHelper:](self, "setActionMenuHelper:", v5);

    v6 = [CNContactActionsController alloc];
    -[CNContactAction contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySendMessageAction actionsDataSource](self, "actionsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = *MEMORY[0x1E0C96620];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNContactActionsController initWithContact:dataSource:actionTypes:](v6, "initWithContact:dataSource:actionTypes:", v7, v8, v9);
    -[CNPropertySendMessageAction setActionsController:](self, "setActionsController:", v10);

    -[CNPropertySendMessageAction actionsController](self, "actionsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShouldUseOutlinedActionGlyphStyle:", 1);

    -[CNPropertySendMessageAction actionsController](self, "actionsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    -[CNPropertySendMessageAction actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "retrieveModels");

    -[CNPropertySendMessageAction actionMenuHelper](self, "actionMenuHelper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "menuProviderWithActionBlock:", &__block_literal_global_41265);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (BOOL)shouldPresentDisambiguationMenu
{
  void *v2;
  BOOL v3;

  -[CNPropertyAction propertyItems](self, "propertyItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 1;

  return v3;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (void)setActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsController, a3);
}

- (void)setActionMenuHelper:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuHelper, a3);
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (void)performActionWithSender:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[CNPropertySendMessageAction shouldPresentDisambiguationMenu](self, "shouldPresentDisambiguationMenu"))
  {
    -[CNPropertyAction propertyItem](self, "propertyItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySendMessageAction performActionForItem:sender:](self, "performActionForItem:sender:", v4, v6);

    -[CNContactAction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionDidFinish:", self);

  }
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C967C0]);

  if (v6)
  {
    objc_msgSend(v4, "labeledValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v9;

    goto LABEL_7;
  }
  objc_msgSend(v4, "property");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  if (v11)
  {
    objc_msgSend(v4, "labeledValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v12 = 0;
LABEL_7:
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("sms:%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CNUIContactActionTypeSendMessage;
  v24[0] = CNUIContactActionDestinationType;
  v20 = &CNUIContactActionDestinationTypePhoneNumber;
  if (!v6)
    v20 = (uint64_t *)&CNUIContactActionDestinationTypeEmail;
  v25[0] = *v20;
  v24[1] = CNUIDataCollectorActionTypeAttributeContact;
  objc_msgSend(v4, "contact");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v21;
  v24[2] = CNUIDataCollectorActionTypeAttributeLabeledValue;
  objc_msgSend(v4, "labeledValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logContactActionType:attributes:", v19, v23);

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "openURL:withCompletionHandler:", v17, 0);
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0D13D70]);
  v6 = (id)objc_msgSend(v8, "performActionWithContext:", v5);

  -[CNContactAction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionDidFinish:", self);

  -[CNPropertySendMessageAction setActionsController:](self, "setActionsController:", 0);
  -[CNPropertySendMessageAction setActionMenuHelper:](self, "setActionMenuHelper:", 0);

}

- (void)setActionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_actionsDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
}

@end
