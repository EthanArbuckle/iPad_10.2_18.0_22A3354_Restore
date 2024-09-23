@implementation CNReputationCoreRecentsAdapter

- (CNReputationCoreRecentsAdapter)init
{
  void *v3;
  id v4;
  void *v5;
  CNReputationCoreRecentsAdapter *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getCRRecentContactsLibraryClass_softClass;
  v12 = getCRRecentContactsLibraryClass_softClass;
  if (!getCRRecentContactsLibraryClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getCRRecentContactsLibraryClass_block_invoke;
    v8[3] = &unk_1E29F98A8;
    v8[4] = &v9;
    __getCRRecentContactsLibraryClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v4, "defaultInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNReputationCoreRecentsAdapter initWithRecentContactsLibrary:](self, "initWithRecentContactsLibrary:", v5);

  return v6;
}

- (CNReputationCoreRecentsAdapter)initWithRecentContactsLibrary:(id)a3
{
  id v5;
  CNReputationCoreRecentsAdapter *v6;
  CNReputationCoreRecentsAdapter *v7;
  CNReputationCoreRecentsAdapter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNReputationCoreRecentsAdapter;
  v6 = -[CNReputationCoreRecentsAdapter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    v8 = v7;
  }

  return v7;
}

- (id)recentContactsForHandle:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void **v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (*v14)(uint64_t, id);
  id v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  id v23;
  id *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2050000000;
  v5 = (void *)getCRSearchQueryClass_softClass;
  v42 = getCRSearchQueryClass_softClass;
  if (!getCRSearchQueryClass_softClass)
  {
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = (uint64_t)__getCRSearchQueryClass_block_invoke;
    v37 = &unk_1E29F98A8;
    v38 = &v39;
    __getCRSearchQueryClass_block_invoke((uint64_t)&v34);
    v5 = (void *)v40[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v39, 8);
  v7 = objc_alloc_init(v6);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2050000000;
  v8 = (void *)getCRSearchPredicateClass_softClass;
  v42 = getCRSearchPredicateClass_softClass;
  if (!getCRSearchPredicateClass_softClass)
  {
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = (uint64_t)__getCRSearchPredicateClass_block_invoke;
    v37 = &unk_1E29F98A8;
    v38 = &v39;
    __getCRSearchPredicateClass_block_invoke((uint64_t)&v34);
    v8 = (void *)v40[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v39, 8);
  v34 = 0;
  v35 = (uint64_t)&v34;
  v36 = 0x2020000000;
  v10 = (void **)getCRRecentContactKeyAddressSymbolLoc_ptr;
  v37 = (void *)getCRRecentContactKeyAddressSymbolLoc_ptr;
  if (!getCRRecentContactKeyAddressSymbolLoc_ptr)
  {
    v11 = (void *)CoreRecentsLibrary();
    v10 = (void **)dlsym(v11, "CRRecentContactKeyAddress");
    *(_QWORD *)(v35 + 24) = v10;
    getCRRecentContactKeyAddressSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v34, 8);
  if (!v10)
    goto LABEL_18;
  v12 = *v10;
  v13 = *MEMORY[0x1E0D13760];
  v14 = *(void (**)(uint64_t, id))(*MEMORY[0x1E0D13760] + 16);
  v15 = v12;
  v14(v13, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateForKey:inCollection:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSearchPredicate:", v17);
  v34 = 0;
  v35 = (uint64_t)&v34;
  v36 = 0x2020000000;
  v18 = (id *)getCRRecentsDomainCalendarSymbolLoc_ptr;
  v37 = (void *)getCRRecentsDomainCalendarSymbolLoc_ptr;
  if (!getCRRecentsDomainCalendarSymbolLoc_ptr)
  {
    v19 = (void *)CoreRecentsLibrary();
    v18 = (id *)dlsym(v19, "CRRecentsDomainCalendar");
    *(_QWORD *)(v35 + 24) = v18;
    getCRRecentsDomainCalendarSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v34, 8);
  if (!v18)
    goto LABEL_18;
  v20 = *v18;
  v43[0] = v20;
  v34 = 0;
  v35 = (uint64_t)&v34;
  v36 = 0x2020000000;
  v21 = (id *)getCRRecentsDomainMailSymbolLoc_ptr;
  v37 = (void *)getCRRecentsDomainMailSymbolLoc_ptr;
  if (!getCRRecentsDomainMailSymbolLoc_ptr)
  {
    v22 = (void *)CoreRecentsLibrary();
    v21 = (id *)dlsym(v22, "CRRecentsDomainMail");
    *(_QWORD *)(v35 + 24) = v21;
    getCRRecentsDomainMailSymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&v34, 8);
  if (!v21)
    goto LABEL_18;
  v23 = *v21;
  v43[1] = v23;
  v34 = 0;
  v35 = (uint64_t)&v34;
  v36 = 0x2020000000;
  v24 = (id *)getCRRecentsDomainMessagesSymbolLoc_ptr;
  v37 = (void *)getCRRecentsDomainMessagesSymbolLoc_ptr;
  if (!getCRRecentsDomainMessagesSymbolLoc_ptr)
  {
    v25 = (void *)CoreRecentsLibrary();
    v24 = (id *)dlsym(v25, "CRRecentsDomainMessages");
    *(_QWORD *)(v35 + 24) = v24;
    getCRRecentsDomainMessagesSymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(&v34, 8);
  if (!v24)
  {
LABEL_18:
    -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:].cold.1();
    __break(1u);
  }
  v44 = *v24;
  v26 = (void *)MEMORY[0x1E0C99D20];
  v27 = v44;
  objc_msgSend(v26, "arrayWithObjects:count:", v43, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDomains:", v28);
  v29 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  -[CNReputationCoreRecentsAdapter library](self, "library");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "completionHandlerAdapterWithDefaultValue:", MEMORY[0x1E0C9AA60]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "performRecentsSearch:queue:completion:", v7, 0, v31);

  objc_msgSend(v29, "future");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (CRRecentContactsLibrary)library
{
  return self->_library;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
}

@end
