@implementation WFTrelloCardContentItem

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_31314, CFSTR("Description"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo:", CFSTR("WFTrelloDescriptionProperty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_107_31316, CFSTR("URL"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo:", CFSTR("WFTrelloURLProperty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_111, CFSTR("Card Due Date"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo:", CFSTR("WFTrelloDueDateProperty"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_115_31320, CFSTR("Card Attachments"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "multipleValues:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo:", CFSTR("WFTrelloAttachmentsProperty"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Trello card"), CFSTR("Trello card"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Trello cards"), CFSTR("Trello cards"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Trello cards"));
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __43__WFTrelloCardContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  WFTrelloSessionManager *v9;
  void *v10;
  WFTrelloSessionManager *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = a2;
  +[WFAccount accounts](WFTrelloAccount, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [WFTrelloSessionManager alloc];
  objc_msgSend(v8, "token");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFTrelloSessionManager initWithConfiguration:token:](v9, "initWithConfiguration:token:", 0, v10);

  objc_msgSend(v6, "card");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __43__WFTrelloCardContentItem_propertyBuilders__block_invoke_5;
  v14[3] = &unk_24F8B9110;
  v15 = v5;
  v13 = v5;
  -[WFTrelloSessionManager getAttachmentsOnCard:completionHandler:](v11, "getAttachmentsOnCard:completionHandler:", v12, v14);

}

uint64_t __43__WFTrelloCardContentItem_propertyBuilders__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__WFTrelloCardContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "card");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dueDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v7);

}

void __43__WFTrelloCardContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "card");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v7);

}

void __43__WFTrelloCardContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v5)(id, _QWORD);
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  objc_msgSend(a2, "card");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemDescription");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    v7 = v8;
  else
    v7 = 0;
  ((void (**)(id, id))v5)[2](v5, v7);

}

- (id)card
{
  return (id)-[WFTrelloCardContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if ((Class)objc_opt_class() == a3)
  {
    v8 = (void *)MEMORY[0x24BE19590];
    -[WFTrelloCardContentItem card](self, "card");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTrelloCardContentItem name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "object:named:", v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v12 = (void *)MEMORY[0x24BE19590];
    -[WFTrelloCardContentItem card](self, "card");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dueDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "object:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
  return v7;
}

@end
