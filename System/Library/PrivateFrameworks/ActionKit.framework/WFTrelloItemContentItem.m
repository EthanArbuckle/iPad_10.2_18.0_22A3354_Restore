@implementation WFTrelloItemContentItem

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
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_1311, CFSTR("Description"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo:", CFSTR("WFTrelloDescriptionProperty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_115, CFSTR("URL"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo:", CFSTR("WFTrelloURLProperty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_119, CFSTR("Card Due Date"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo:", CFSTR("WFTrelloDueDateProperty"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_123, CFSTR("Card Attachments"), objc_opt_class());
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

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE19468];
  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessingProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Trello item"), CFSTR("Trello item"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Trello items"), CFSTR("Trello items"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Trello items"));
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

uint64_t __43__WFTrelloItemContentItem_propertyBuilders__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

uint64_t __43__WFTrelloItemContentItem_propertyBuilders__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

uint64_t __43__WFTrelloItemContentItem_propertyBuilders__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

uint64_t __43__WFTrelloItemContentItem_propertyBuilders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

- (id)preferredFileType
{
  return (id)objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
}

@end
