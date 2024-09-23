@implementation CNMailToGroup

+ (id)os_log
{
  if (os_log_cn_once_token_1_3 != -1)
    dispatch_once(&os_log_cn_once_token_1_3, &__block_literal_global_116);
  return (id)os_log_cn_once_object_1_3;
}

void __23__CNMailToGroup_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNMailToGroup");
  v1 = (void *)os_log_cn_once_object_1_3;
  os_log_cn_once_object_1_3 = (uint64_t)v0;

}

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  +[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = CFSTR("emailAddresses");
  v8[2] = CFSTR("phoneNumbers");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNMailToGroup)init
{
  CNMailToGroup *v2;
  CNContactFormatter *v3;
  CNContactFormatter *contactFormatter;
  CNMailToGroup *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNMailToGroup;
  v2 = -[CNMailToGroup init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CNContactFormatter);
    contactFormatter = v2->_contactFormatter;
    v2->_contactFormatter = v3;

    -[CNContactFormatter setStyle:](v2->_contactFormatter, "setStyle:", 0);
    v5 = v2;
  }

  return v2;
}

- (id)mailUrlForContacts:(id)a3
{
  return -[CNMailToGroup mailUrlForContacts:needsEmailAddresses:](self, "mailUrlForContacts:needsEmailAddresses:", a3, 0);
}

- (id)mailUrlWithEmailAddressesForContacts:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__CNMailToGroup_mailUrlWithEmailAddressesForContacts___block_invoke;
  v7[3] = &unk_1E29F88F0;
  v7[4] = self;
  objc_msgSend(a3, "_cn_compactMap:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMailToGroup mailUrlForMailingAddresses:](self, "mailUrlForMailingAddresses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __54__CNMailToGroup_mailUrlWithEmailAddressesForContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mailingAddressWithEmailForContact:", a2);
}

- (id)mailUrlForContacts:(id)a3 needsEmailAddresses:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = a4;
  v6 = a3;
  if (v4 && !-[CNMailToGroup allContactsHaveEmailAddress:](self, "allContactsHaveEmailAddress:", v6))
  {
    v8 = 0;
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__CNMailToGroup_mailUrlForContacts_needsEmailAddresses___block_invoke;
    v10[3] = &unk_1E29F88F0;
    v10[4] = self;
    objc_msgSend(v6, "_cn_compactMap:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMailToGroup mailUrlForMailingAddresses:](self, "mailUrlForMailingAddresses:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __56__CNMailToGroup_mailUrlForContacts_needsEmailAddresses___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mailingAddressForContact:", a2);
}

- (id)mailUrlForMailingAddresses:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("mailto:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__CNMailToGroup_mailUrlForMailingAddresses___block_invoke;
    v11[3] = &unk_1E29F9590;
    v12 = v4;
    v5 = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);
    objc_msgSend(v5, "_cn_stringByAddingPercentEscapesToEntireURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CNMailToGroup mailUrlForMailingAddresses:].cold.1(v9);

    v8 = 0;
  }

  return v8;
}

void __44__CNMailToGroup_mailUrlForMailingAddresses___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

}

- (BOOL)allContactsHaveEmailAddress:(id)a3
{
  return objc_msgSend(a3, "_cn_any:", &__block_literal_global_13_1) ^ 1;
}

uint64_t __45__CNMailToGroup_allContactsHaveEmailAddress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *MEMORY[0x1E0D137F8];
  objc_msgSend(a2, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNLabeledValue Value](CNLabeledValue, "Value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_filter:", *MEMORY[0x1E0D13850]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v6);

  return v7;
}

- (id)bestGuessEmailAddressForContact:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "bestGuessEmailAddressForContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mailingAddressWithEmailForContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNMailToGroup bestGuessEmailAddressForContact:](self, "bestGuessEmailAddressForContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D13850];
  if (((*(uint64_t (**)(_QWORD, void *))(*MEMORY[0x1E0D13850] + 16))(*MEMORY[0x1E0D13850], v5) & 1) != 0)
  {
    v7 = v5;
    -[CNMailToGroup contactFormatter](self, "contactFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromContact:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v9))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@>"), v9, v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v10;
    }
    -[CNMailToGroup santizeMailingAddress:](self, "santizeMailingAddress:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_INFO, "Contact has no e-mail so will not be included: %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (id)mailingAddressForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  int v26;
  void *v27;
  id v28;

  v4 = a3;
  -[CNMailToGroup contactFormatter](self, "contactFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNMailToGroup bestGuessEmailAddressForContact:](self, "bestGuessEmailAddressForContact:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0D13850];
  v12 = (*(uint64_t (**)(_QWORD, void *))(*MEMORY[0x1E0D13850] + 16))(*MEMORY[0x1E0D13850], v6);
  v13 = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v7);
  if ((v12 & 1) == 0 && (v13 & 1) == 0 && !v10)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CNMailToGroup mailingAddressForContact:].cold.1((uint64_t)v4, v14, v15, v16, v17, v18, v19, v20);

    goto LABEL_7;
  }
  if ((v12 & v13) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@>"), v6, v7);
    v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v23 = v22;
    -[CNMailToGroup santizeMailingAddress:](self, "santizeMailingAddress:", v22);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v21 = (void *)v24;

    goto LABEL_14;
  }
  if (v13)
  {
    v22 = v7;
    goto LABEL_12;
  }
  if (v10)
    v26 = v12;
  else
    v26 = 0;
  if (v26 == 1)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "digits");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@ <%@>"), v6, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v12)
  {
    v28 = v6;
LABEL_24:
    v21 = v28;
    goto LABEL_14;
  }
  if (v10)
  {
    objc_msgSend(v10, "digits");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_7:
  v21 = 0;
LABEL_14:

  return v21;
}

- (id)santizeMailingAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend((Class)getECEmailAddressClass_0[0](), "emailAddressWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  objc_msgSend(v5, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CNMailToGroup santizeMailingAddress:].cold.1((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);

  }
  return v7;
}

+ (id)bestGuessEmailAddressForContact:(id)a3
{
  return (id)objc_msgSend(a1, "bestGuessEmailAddressForContact:sendingAddressDomain:", a3, 0);
}

+ (id)bestGuessEmailAddressForContact:(id)a3 sendingAddressDomain:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(a3, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNLabeledValue Value](CNLabeledValue, "Value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_map:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_filter:", *MEMORY[0x1E0D13850]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "bestGuessEmailAddressForAddresses:sendingAddressDomain:alreadyDuetRanked:", v9, v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)bestGuessEmailAddressForAddresses:(id)a3 sendingAddressDomain:(id)a4 alreadyDuetRanked:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "queryForEmailAddresses:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v10 = (void *)getCRRecentContactsLibraryClass_softClass_0;
    v27 = getCRRecentContactsLibraryClass_softClass_0;
    if (!getCRRecentContactsLibraryClass_softClass_0)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __getCRRecentContactsLibraryClass_block_invoke_0;
      v23[3] = &unk_1E29F98A8;
      v23[4] = &v24;
      __getCRRecentContactsLibraryClass_block_invoke_0((uint64_t)v23);
      v10 = (void *)v25[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v11, "defaultInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_recentContactsWithQuery:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v13, "result:", &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
      goto LABEL_5;
    if (v5)
    {
      objc_msgSend(v7, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
    }
    else
    {
      objc_msgSend(v14, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "address");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v17 = v16;
      if (!v16)
      {
LABEL_5:

        goto LABEL_6;
      }
    }

    goto LABEL_13;
  }
LABEL_6:
  if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
    goto LABEL_8;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__CNMailToGroup_bestGuessEmailAddressForAddresses_sendingAddressDomain_alreadyDuetRanked___block_invoke;
  v20[3] = &unk_1E29F9198;
  v21 = v8;
  objc_msgSend(v7, "_cn_firstObjectPassingTest:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  v17 = v16;
  if (!v16)
  {
LABEL_8:
    objc_msgSend(v7, "firstObject");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v16;
  }
LABEL_13:

  return v17;
}

uint64_t __90__CNMailToGroup_bestGuessEmailAddressForAddresses_sendingAddressDomain_alreadyDuetRanked___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasSuffix:", *(_QWORD *)(a1 + 32));
}

+ (id)queryForEmailAddresses:(id)a3
{
  id v3;
  id CRSearchPredicateClass;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v3 = objc_alloc_init((Class)getCRSearchQueryClass());
  CRSearchPredicateClass = getCRSearchPredicateClass();
  v5 = getCRSearchPredicateClass();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v6 = (id *)getCRRecentContactKeyKindSymbolLoc_ptr;
  v32 = getCRRecentContactKeyKindSymbolLoc_ptr;
  if (!getCRRecentContactKeyKindSymbolLoc_ptr)
  {
    v7 = (void *)CoreRecentsLibrary_0();
    v6 = (id *)dlsym(v7, "CRRecentContactKeyKind");
    v30[3] = (uint64_t)v6;
    getCRRecentContactKeyKindSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v29, 8);
  if (!v6)
    goto LABEL_14;
  v8 = *v6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v9 = (id *)getCRAddressKindEmailSymbolLoc_ptr;
  v32 = getCRAddressKindEmailSymbolLoc_ptr;
  if (!getCRAddressKindEmailSymbolLoc_ptr)
  {
    v10 = (void *)CoreRecentsLibrary_0();
    v9 = (id *)dlsym(v10, "CRAddressKindEmail");
    v30[3] = (uint64_t)v9;
    getCRAddressKindEmailSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v29, 8);
  if (!v9)
    goto LABEL_14;
  v11 = *v9;
  v34 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForKey:inCollection:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v13;
  v14 = getCRSearchPredicateClass();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v15 = (id *)getCRRecentContactKeyAddressSymbolLoc_ptr_0;
  v32 = getCRRecentContactKeyAddressSymbolLoc_ptr_0;
  if (!getCRRecentContactKeyAddressSymbolLoc_ptr_0)
  {
    v16 = (void *)CoreRecentsLibrary_0();
    v15 = (id *)dlsym(v16, "CRRecentContactKeyAddress");
    v30[3] = (uint64_t)v15;
    getCRRecentContactKeyAddressSymbolLoc_ptr_0 = (uint64_t)v15;
  }
  _Block_object_dispose(&v29, 8);
  if (!v15)
    goto LABEL_14;
  v17 = *v15;
  objc_msgSend(v14, "predicateForKey:inCollection:", v17, v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CRSearchPredicateClass, "predicateSatisfyingAllSubpredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSearchPredicate:", v20);

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v21 = (id *)getCRRecentsDomainMailSymbolLoc_ptr_0;
  v32 = getCRRecentsDomainMailSymbolLoc_ptr_0;
  if (!getCRRecentsDomainMailSymbolLoc_ptr_0)
  {
    v22 = (void *)CoreRecentsLibrary_0();
    v21 = (id *)dlsym(v22, "CRRecentsDomainMail");
    v30[3] = (uint64_t)v21;
    getCRRecentsDomainMailSymbolLoc_ptr_0 = (uint64_t)v21;
  }
  _Block_object_dispose(&v29, 8);
  if (!v21)
  {
LABEL_14:
    -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:].cold.1();
    __break(1u);
  }
  v33 = *v21;
  v23 = (void *)MEMORY[0x1E0C99D20];
  v24 = v33;
  objc_msgSend(v23, "arrayWithObjects:count:", &v33, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setDomains:", v25);
  objc_msgSend(getCRSearchQueryClass(), "frecencyComparator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setComparator:", v26);

  return v3;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
}

- (void)mailUrlForMailingAddresses:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Failed to create mail URL", v1, 2u);
}

- (void)mailingAddressForContact:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Failed to create mailing address for contact: %@", a5, a6, a7, a8, 2u);
}

- (void)santizeMailingAddress:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Failed to sanitize mailing address: %@", a5, a6, a7, a8, 2u);
}

@end
