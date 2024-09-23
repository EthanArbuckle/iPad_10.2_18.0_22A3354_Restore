@implementation CNCardLinkedCardsGroup

- (id)title
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("LINKED_CARDS_TABLE_SECTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayItems
{
  void *v2;
  void *v3;
  void *v4;

  -[CNCardLinkedCardsGroup linkedContacts](self, "linkedContacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_filter:", &__block_literal_global_2017);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v3, "_cn_map:", &__block_literal_global_7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)editingItems
{
  void *v2;
  void *v3;
  CNCardLinkedCardsPlaceholderGroupItem *v4;

  -[CNCardLinkedCardsGroup displayItems](self, "displayItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = objc_alloc_init(CNCardLinkedCardsPlaceholderGroupItem);
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (NSArray)linkedContacts
{
  return self->_linkedContacts;
}

- (void)setLinkedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_linkedContacts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedContacts, 0);
}

CNCardLinkedCardsGroupItem *__38__CNCardLinkedCardsGroup_displayItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  CNCardLinkedCardsGroupItem *v3;

  v2 = a2;
  v3 = -[CNCardLinkedCardsGroupItem initWithContact:]([CNCardLinkedCardsGroupItem alloc], "initWithContact:", v2);

  return v3;
}

uint64_t __38__CNCardLinkedCardsGroup_displayItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isImplicitAugmentation") ^ 1;
}

@end
