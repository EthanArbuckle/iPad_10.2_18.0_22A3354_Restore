@implementation WFTrelloBoardContentItem

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_3145, CFSTR("Description"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo:", CFSTR("WFTrelloDescriptionProperty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_107, CFSTR("URL"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo:", CFSTR("WFTrelloURLProperty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Trello board"), CFSTR("Trello board"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Trello boards"), CFSTR("Trello boards"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Trello boards"));
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

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __44__WFTrelloBoardContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "board");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v7);

}

void __44__WFTrelloBoardContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v5)(id, _QWORD);
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  objc_msgSend(a2, "board");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemDescription");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    v7 = v8;
  else
    v7 = 0;
  ((void (**)(id, id))v5)[2](v5, v7);

}

- (id)board
{
  return (id)-[WFTrelloBoardContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if ((Class)objc_opt_class() == a3)
  {
    v7 = (void *)MEMORY[0x24BE19590];
    -[WFTrelloBoardContentItem board](self, "board");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTrelloBoardContentItem name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "object:named:", v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
