@implementation CNUICoreFamilyMemberContactsModelBuilder

- (CNUICoreFamilyMemberContactsModelBuilder)init
{
  CNUICoreFamilyMemberContactsModelBuilder *v2;
  CNUICoreFamilyMemberContactsModelBuilder *v3;
  CNUICoreFamilyMemberContactsModelBuilder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNUICoreFamilyMemberContactsModelBuilder;
  v2 = -[CNUICoreFamilyMemberContactsModelBuilder init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_markItemsAsPersisted = 1;
    v4 = v2;
  }

  return v3;
}

- (id)build
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNUICoreFamilyMemberContactsModel *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  -[CNUICoreFamilyMemberContactsModelBuilder contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__CNUICoreFamilyMemberContactsModelBuilder_build__block_invoke;
  v12[3] = &unk_1EA603568;
  v12[4] = self;
  objc_msgSend(v3, "_cn_filter:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __49__CNUICoreFamilyMemberContactsModelBuilder_build__block_invoke_2;
  v11[3] = &unk_1EA603718;
  v11[4] = self;
  objc_msgSend(v5, "_cn_map:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "uniqueFamilyMemberContactItems:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsModelBuilder sortedFamilyMemberContactItems:](self, "sortedFamilyMemberContactItems:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNUICoreFamilyMemberContactsModel initWithItems:]([CNUICoreFamilyMemberContactsModel alloc], "initWithItems:", v8);

  return v9;
}

uint64_t __49__CNUICoreFamilyMemberContactsModelBuilder_build__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "shouldIncludeContact:givenIncludeWhitelistedContactsOnlySetting:", v3, objc_msgSend(*(id *)(a1 + 32), "includeWhitelistedContactsOnly"));

  return v4;
}

id __49__CNUICoreFamilyMemberContactsModelBuilder_build__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(*(id *)(a1 + 32), "contactFormatterStyle");
  objc_msgSend(*(id *)(a1 + 32), "contactTypeAssessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyMemberContactItemFromContact:contactFormatterStyle:contactTypeAssessor:itemHasBeenPersisted:itemIsProposed:", v3, v5, v6, objc_msgSend(*(id *)(a1 + 32), "markItemsAsPersisted"), objc_msgSend(*(id *)(a1 + 32), "markItemsAsProposed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)shouldIncludeContact:(id)a3 givenIncludeWhitelistedContactsOnlySetting:(BOOL)a4
{
  if (a4)
    return objc_msgSend(MEMORY[0x1E0C972D8], "isWhitelistedContact:", a3);
  else
    return 1;
}

+ (id)familyMemberContactItemFromContact:(id)a3 contactFormatterStyle:(int64_t)a4 contactTypeAssessor:(id)a5 itemHasBeenPersisted:(BOOL)a6 itemIsProposed:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  CNUICoreFamilyMemberContactItem *v21;
  uint64_t v23;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "formattedNameOfContact:contactFormatterStyle:", v12, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isKeyAvailable:", *MEMORY[0x1E0C96708]))
  {
    objc_msgSend(v12, "imageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v12, "phoneNumbers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (*(uint64_t (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  if (v13)
    v20 = objc_msgSend(v13, "estiamtedTypeOfContact:", v12);
  else
    v20 = 0;
  LOBYTE(v23) = a6;
  v21 = -[CNUICoreFamilyMemberContactItem initWithContactIdentifier:formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:]([CNUICoreFamilyMemberContactItem alloc], "initWithContactIdentifier:formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:", v14, v15, v16, v19, v7, v20, objc_msgSend(MEMORY[0x1E0C972D8], "isWhitelistedContact:", v12), v23);

  return v21;
}

+ (id)formattedNameOfContact:(id)a3 contactFormatterStyle:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {

    objc_msgSend(a1, "placeholderNameForNamelessContact:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)placeholderNameForNamelessContact:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "keyVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsKey:", *MEMORY[0x1E0C966A8]);

  if (v6)
  {
    objc_msgSend(a1, "firstDisplayableEmailAddressForContact:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      goto LABEL_8;

  }
  objc_msgSend(v4, "keyVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsKey:", *MEMORY[0x1E0C967C0]);

  if (!v9)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1EA606688, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  objc_msgSend(a1, "firstDisplayablePhoneNumberForContact:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

+ (id)firstDisplayableEmailAddressForContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_firstObjectPassingTest:", &__block_literal_global_9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_trimmedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __83__CNUICoreFamilyMemberContactsModelBuilder_firstDisplayableEmailAddressForContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *MEMORY[0x1E0D13850];
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_trimmedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  return v5;
}

+ (id)firstDisplayablePhoneNumberForContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "phoneNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_compactMap:", &__block_literal_global_17_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_firstObjectPassingTest:", &__block_literal_global_19_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __82__CNUICoreFamilyMemberContactsModelBuilder_firstDisplayablePhoneNumberForContact___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedInternationalStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_trimmedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

_QWORD *__82__CNUICoreFamilyMemberContactsModelBuilder_firstDisplayablePhoneNumberForContact___block_invoke_2()
{
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*MEMORY[0x1E0D13850] + 16))(MEMORY[0x1E0D13850]);
}

+ (id)uniqueFamilyMemberContactItems:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "_cn_indexBy:", &__block_literal_global_24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sortedFamilyMemberContactItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (-[CNUICoreFamilyMemberContactsModelBuilder sortItemsByName](self, "sortItemsByName"))
  {
    objc_msgSend((id)objc_opt_class(), "itemsBySortingItems:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUICoreFamilyMemberContactsModelBuilder contacts](self, "contacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_indexBy:", &__block_literal_global_26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUICoreFamilyMemberContactsModelBuilder contacts](self, "contacts");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__CNUICoreFamilyMemberContactsModelBuilder_sortedFamilyMemberContactItems___block_invoke;
    v11[3] = &unk_1EA603668;
    v12 = v7;
    v9 = v7;
    objc_msgSend(v4, "_cn_sortedArrayUsingAuxiliarySortOrder:transform:", v8, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }

  return v5;
}

id __75__CNUICoreFamilyMemberContactsModelBuilder_sortedFamilyMemberContactItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)itemsBySortingItems:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_22);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (CNUICoreContactTypeAssessor)contactTypeAssessor
{
  return self->_contactTypeAssessor;
}

- (void)setContactTypeAssessor:(id)a3
{
  objc_storeStrong((id *)&self->_contactTypeAssessor, a3);
}

- (int64_t)contactFormatterStyle
{
  return self->_contactFormatterStyle;
}

- (void)setContactFormatterStyle:(int64_t)a3
{
  self->_contactFormatterStyle = a3;
}

- (BOOL)includeWhitelistedContactsOnly
{
  return self->_includeWhitelistedContactsOnly;
}

- (void)setIncludeWhitelistedContactsOnly:(BOOL)a3
{
  self->_includeWhitelistedContactsOnly = a3;
}

- (BOOL)sortItemsByName
{
  return self->_sortItemsByName;
}

- (void)setSortItemsByName:(BOOL)a3
{
  self->_sortItemsByName = a3;
}

- (BOOL)markItemsAsPersisted
{
  return self->_markItemsAsPersisted;
}

- (void)setMarkItemsAsPersisted:(BOOL)a3
{
  self->_markItemsAsPersisted = a3;
}

- (BOOL)markItemsAsProposed
{
  return self->_markItemsAsProposed;
}

- (void)setMarkItemsAsProposed:(BOOL)a3
{
  self->_markItemsAsProposed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactTypeAssessor, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
