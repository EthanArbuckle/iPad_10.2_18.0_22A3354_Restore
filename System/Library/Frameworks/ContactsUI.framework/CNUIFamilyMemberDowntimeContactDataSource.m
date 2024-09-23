@implementation CNUIFamilyMemberDowntimeContactDataSource

- (CNUIFamilyMemberDowntimeContactDataSource)initWithStore:(id)a3 familyMembers:(id)a4 requiredKeys:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNUIFamilyMemberDowntimeContactDataSource *v12;
  CNUIFamilyMemberDowntimeContactDataSource *v13;
  uint64_t v14;
  NSMutableArray *selectedContactItems;
  CNUIFamilyMemberDowntimeContactDataSource *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNUIFamilyMemberDowntimeContactDataSource;
  v12 = -[CNUIFamilyMemberDowntimeContactDataSource init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_familyMembers, a4);
    objc_storeStrong((id *)&v13->_requiredKeys, a5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    selectedContactItems = v13->_selectedContactItems;
    v13->_selectedContactItems = (NSMutableArray *)v14;

    v16 = v13;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CNUIFamilyMemberDowntimeContactDataSource initWithStore:familyMembers:requiredKeys:]([CNUIFamilyMemberDowntimeContactDataSource alloc], "initWithStore:familyMembers:requiredKeys:", self->_store, self->_familyMembers, self->_requiredKeys);
}

- (int64_t)sortOrder
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sortOrder");

  return v3;
}

- (id)titleForSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_filteredSections, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)numberOfSections
{
  -[CNUIFamilyMemberDowntimeContactDataSource _loadAllContactsIfNeeded](self, "_loadAllContactsIfNeeded");
  return -[NSArray count](self->_filteredSections, "count");
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;

  -[CNUIFamilyMemberDowntimeContactDataSource _loadAllContactsIfNeeded](self, "_loadAllContactsIfNeeded");
  -[NSArray objectAtIndexedSubscript:](self->_filteredSections, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)contactItemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[CNUIFamilyMemberDowntimeContactDataSource _loadAllContactsIfNeeded](self, "_loadAllContactsIfNeeded");
  -[NSArray objectAtIndexedSubscript:](self->_filteredSections, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)selectedContacts
{
  void *v2;
  void *v3;

  -[CNUIFamilyMemberDowntimeContactDataSource selectedContactItems](self, "selectedContactItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_map:", &__block_literal_global_3994);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContactItemSelected:(BOOL)a3 forIndexPath:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CNUIFamilyMemberDowntimeContactDataSource contactItemForIndexPath:](self, "contactItemForIndexPath:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelected:", v4);
  -[CNUIFamilyMemberDowntimeContactDataSource selectedContactItems](self, "selectedContactItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "_cn_addNonNilObjectIfNotPresent:", v8);
  else
    objc_msgSend(v6, "removeObject:", v8);

}

- (void)setFilterString:(id)a3
{
  NSString *v4;
  NSString *filterString;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_filterString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    filterString = self->_filterString;
    self->_filterString = v4;

    -[CNUIFamilyMemberDowntimeContactDataSource filterSectionsForString:](self, "filterSectionsForString:", v6);
  }

}

- (void)filterSectionsForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  CNUIFamilyMemberDowntimeContactSection *v16;
  void *v17;
  CNUIFamilyMemberDowntimeContactSection *v18;
  uint64_t v19;
  NSArray *filteredSections;
  CNUIFamilyMemberDowntimeContactDataSource *v21;
  id v22;
  NSArray *obj;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "localizedLowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_filter:", &__block_literal_global_42);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0 || !objc_msgSend(v7, "count"))
  {
    objc_storeStrong((id *)&self->_filteredSections, self->_sections);
  }
  else
  {
    v22 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = self;
    obj = self->_sections;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v13, "contactItems", v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __69__CNUIFamilyMemberDowntimeContactDataSource_filterSectionsForString___block_invoke_2;
          v24[3] = &unk_1E2048620;
          v25 = v7;
          objc_msgSend(v14, "_cn_filter:", v24);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = [CNUIFamilyMemberDowntimeContactSection alloc];
          objc_msgSend(v13, "title");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[CNUIFamilyMemberDowntimeContactSection initWithContactItems:title:](v16, "initWithContactItems:title:", v15, v17);

          objc_msgSend(v8, "addObject:", v18);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }

    v19 = objc_msgSend(v8, "copy");
    filteredSections = v21->_filteredSections;
    v21->_filteredSections = (NSArray *)v19;

    v4 = v22;
  }

}

- (void)_loadAllContactsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;

  if (!self->_sections)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", self->_requiredKeys);
    objc_msgSend(v3, "setUnifyResults:", 0);
    objc_msgSend(v3, "setSortOrder:", -[CNUIFamilyMemberDowntimeContactDataSource sortOrder](self, "sortOrder"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberDowntimeContactDataSource store](self, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__CNUIFamilyMemberDowntimeContactDataSource__loadAllContactsIfNeeded__block_invoke;
    v13[3] = &unk_1E204E690;
    v6 = v4;
    v14 = v6;
    v7 = objc_msgSend(v5, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v3, &v15, v13);
    v8 = v15;

    if (v7)
    {
      if (v8)
        _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 203, 4, CFSTR("Non fatal error during contacts fetching: %@"), v9, v10, v11, v12, (uint64_t)v8);
      -[CNUIFamilyMemberDowntimeContactDataSource postProcessForFamilyMembersWithContacts:](self, "postProcessForFamilyMembersWithContacts:", v6);
    }
    else
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 207, 3, CFSTR("Error fetching contacts: %@"), v9, v10, v11, v12, (uint64_t)v8);
    }

  }
}

- (void)postProcessForFamilyMembersWithContacts:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  CNUIFamilyMemberDowntimeContactItem *v13;
  void *v14;
  CNUIFamilyMemberDowntimeContactItem *v15;
  CNUIFamilyMemberDowntimeContactSection *v16;
  void *v17;
  void *v18;
  CNUIFamilyMemberDowntimeContactSection *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  CNUIFamilyMemberDowntimeContactSection *v26;
  NSArray *v27;
  NSArray *sections;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v31 = (void *)objc_msgSend(v30, "mutableCopy");
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3963;
  v45 = __Block_byref_object_dispose__3964;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __85__CNUIFamilyMemberDowntimeContactDataSource_postProcessForFamilyMembersWithContacts___block_invoke;
  v38[3] = &unk_1E2048670;
  v38[4] = self;
  v40 = &v41;
  v4 = v3;
  v39 = v4;
  objc_msgSend(v30, "enumerateObjectsUsingBlock:", v38);
  objc_msgSend(v31, "removeObjectsAtIndexes:", v4);
  v29 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v42[5], "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v42[5], "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = (id)v42[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v10, "second");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNUIFamilyMemberDowntimeContactDataSource labelForFamilyMember:](self, "labelForFamilyMember:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = [CNUIFamilyMemberDowntimeContactItem alloc];
          objc_msgSend(v10, "first");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[CNUIFamilyMemberDowntimeContactItem initWithContact:label:](v13, "initWithContact:label:", v14, v12);

          objc_msgSend(v5, "addObject:", v15);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
      }
      while (v7);
    }

    v16 = [CNUIFamilyMemberDowntimeContactSection alloc];
    CNContactsUIBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_PICKER_FAMILY_SECTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CNUIFamilyMemberDowntimeContactSection initWithContactItems:title:](v16, "initWithContactItems:title:", v5, v18);
    objc_msgSend(v32, "addObject:", v19);

  }
  objc_msgSend(v31, "_cn_map:", &__block_literal_global_64_3980);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CNUIFamilyMemberDowntimeContactDataSource isShowingFamilyMemberContacts](self, "isShowingFamilyMemberContacts");
  CNContactsUIBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21)
    v24 = CFSTR("DOWNTIME_PICKER_CONTACTS_SECTION_TITLE_MEMBER");
  else
    v24 = CFSTR("DOWNTIME_PICKER_CONTACTS_SECTION_TITLE_THIS_DEVICE");
  objc_msgSend(v22, "localizedStringForKey:value:table:", v24, &stru_1E20507A8, CFSTR("Localized"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[CNUIFamilyMemberDowntimeContactSection initWithContactItems:title:]([CNUIFamilyMemberDowntimeContactSection alloc], "initWithContactItems:title:", v20, v25);
  objc_msgSend(v32, "addObject:", v26);

  v27 = (NSArray *)objc_msgSend(v32, "copy");
  sections = self->_sections;
  self->_sections = v27;

  -[CNUIFamilyMemberDowntimeContactDataSource filterSectionsForString:](self, "filterSectionsForString:", self->_filterString);
  _Block_object_dispose(&v41, 8);

}

- (id)labelForFamilyMember:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isMe"))
  {
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("DOWNTIME_PICKER_CONTACT_LABEL_ME");
  }
  else
  {
    if (!objc_msgSend(v3, "isParent"))
    {
      v7 = 0;
      goto LABEL_7;
    }
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("DOWNTIME_PICKER_CONTACT_LABEL_PARENT");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void (**v14)(void *, _BOOL8);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  CNUIFamilyMemberDowntimeContactDataSource *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "isUnknown") && (objc_msgSend(v8, "isSuggestedMe") & 1) == 0)
  {
    v23 = v8;
  }
  else
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberDowntimeContactDataSource preferredForNameMeContactIdentifier](self, "preferredForNameMeContactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__3963;
    v48 = __Block_byref_object_dispose__3964;
    v49 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__3963;
    v42 = __Block_byref_object_dispose__3964;
    v43 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__CNUIFamilyMemberDowntimeContactDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke;
    aBlock[3] = &unk_1E204E790;
    v27 = v9;
    v33 = v12;
    v13 = v10;
    v28 = v13;
    v29 = self;
    v30 = &v34;
    v31 = &v38;
    v32 = &v44;
    v14 = (void (**)(void *, _BOOL8))_Block_copy(aBlock);
    v14[2](v14, v6);
    if (!*((_BYTE *)v35 + 24))
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 295, 3, CFSTR("Error completing contact: %@"), v15, v16, v17, v18, v39[5]);
      if (objc_msgSend((id)objc_opt_class(), "isErrorPossiblyRelatedToExtraStores:", v39[5]))
      {
        _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 297, 3, CFSTR("Will re-fetch from main store"), v19, v20, v21, v22, v25);
        v14[2](v14, 1);
      }
    }
    v23 = (id)v45[5];

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v44, 8);
  }

  return v23;
}

- (id)preferredForNameMeContactIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIFamilyMemberDowntimeContactDataSource preferredForNameMeContactWithKeysToFetch:](self, "preferredForNameMeContactWithKeysToFetch:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)preferredForNameMeContactWithKeysToFetch:(id)a3
{
  id v4;
  CNUIFamilyMemberDowntimeContactDataSource *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[CNUIFamilyMemberDowntimeContactDataSource meContactNeedsUpdate](v5, "meContactNeedsUpdate")
    || (-[CNUIFamilyMemberDowntimeContactDataSource meContact](v5, "meContact"),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (-[CNUIFamilyMemberDowntimeContactDataSource meContact](v5, "meContact"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "areKeysAvailable:", v4),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v4)
      objc_msgSend(v9, "addObjectsFromArray:", v4);
    -[CNUIFamilyMemberDowntimeContactDataSource meContact](v5, "meContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CNUIFamilyMemberDowntimeContactDataSource meContact](v5, "meContact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "availableKeyDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v13);

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v10);
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForMeContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v15);

    objc_msgSend(v14, "setUnifyResults:", 0);
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__3963;
    v31 = __Block_byref_object_dispose__3964;
    v32 = 0;
    -[CNUIFamilyMemberDowntimeContactDataSource store](v5, "store");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = &v27;
    v26 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __86__CNUIFamilyMemberDowntimeContactDataSource_preferredForNameMeContactWithKeysToFetch___block_invoke;
    v25[3] = &unk_1E204FB18;
    v17 = objc_msgSend(v16, "enumerateNonUnifiedContactsWithFetchRequest:error:usingBlock:", v14, &v26, v25);
    v18 = v26;

    if ((v17 & 1) != 0)
    {
      -[CNUIFamilyMemberDowntimeContactDataSource setMeContactNeedsUpdate:](v5, "setMeContactNeedsUpdate:", 0);
      -[CNUIFamilyMemberDowntimeContactDataSource setMeContact:](v5, "setMeContact:", v28[5]);
    }
    else
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 335, 3, CFSTR("Error fetching the me card: %@"), v19, v20, v21, v22, (uint64_t)v18);
    }

    _Block_object_dispose(&v27, 8);
  }
  -[CNUIFamilyMemberDowntimeContactDataSource meContact](v5, "meContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v23;
}

- (NSString)filterString
{
  return self->_filterString;
}

- (BOOL)isShowingFamilyMemberContacts
{
  return self->_isShowingFamilyMemberContacts;
}

- (void)setIsShowingFamilyMemberContacts:(BOOL)a3
{
  self->_isShowingFamilyMemberContacts = a3;
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (BOOL)meContactNeedsUpdate
{
  return self->_meContactNeedsUpdate;
}

- (void)setMeContactNeedsUpdate:(BOOL)a3
{
  self->_meContactNeedsUpdate = a3;
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
  objc_storeStrong((id *)&self->_meContact, a3);
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
  objc_storeStrong((id *)&self->_familyMembers, a3);
}

- (NSArray)filteredSections
{
  return self->_filteredSections;
}

- (void)setFilteredSections:(id)a3
{
  objc_storeStrong((id *)&self->_filteredSections, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSMutableArray)selectedContactItems
{
  return self->_selectedContactItems;
}

- (void)setSelectedContactItems:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContactItems, a3);
}

- (NSArray)requiredKeys
{
  return self->_requiredKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredKeys, 0);
  objc_storeStrong((id *)&self->_selectedContactItems, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_filteredSections, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_filterString, 0);
}

void __86__CNUIFamilyMemberDowntimeContactDataSource_preferredForNameMeContactWithKeysToFetch___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __102__CNUIFamilyMemberDowntimeContactDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id obj;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", *(_QWORD *)(a1 + 32));
  v5 = (void *)MEMORY[0x1E0C97200];
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForMeContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v6);

  }
  else
  {
    v19[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForContactsWithIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v8);

  }
  objc_msgSend(v4, "setUnifyResults:", 0);
  objc_msgSend(v4, "setOnlyMainStore:", a2);
  objc_msgSend(*(id *)(a1 + 48), "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  v17[4] = *(_QWORD *)(a1 + 72);
  obj = v11;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[2] = __102__CNUIFamilyMemberDowntimeContactDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke_2;
  v17[3] = &unk_1E204FB18;
  v17[1] = 3221225472;
  v12 = objc_msgSend(v9, "enumerateContactsWithFetchRequest:error:usingBlock:", v4, &obj, v17);
  objc_storeStrong((id *)(v10 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v12;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 289, 3, CFSTR("Error completing contact: %@"), v13, v14, v15, v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

void __102__CNUIFamilyMemberDowntimeContactDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(_QWORD *)(v10 + 40);
  v11 = (id *)(v10 + 40);
  if (v12)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 282, 3, CFSTR("Error: got more than one contact instead of a unified one"), v6, v7, v8, v9, v15);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

    *a3 = 1;
  }
  else
  {
    objc_storeStrong(v11, a2);
  }

}

void __85__CNUIFamilyMemberDowntimeContactDataSource_postProcessForFamilyMembersWithContacts___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8[2];
  _QWORD v9[4];
  id v10;
  __int128 v11;
  uint64_t v12;

  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__CNUIFamilyMemberDowntimeContactDataSource_postProcessForFamilyMembersWithContacts___block_invoke_2;
  v9[3] = &unk_1E2048648;
  v10 = v5;
  *(_OWORD *)v8 = *(_OWORD *)(a1 + 40);
  v7 = v8[0];
  v11 = *(_OWORD *)v8;
  v12 = a3;
  v8[0] = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

CNUIFamilyMemberDowntimeContactItem *__85__CNUIFamilyMemberDowntimeContactDataSource_postProcessForFamilyMembersWithContacts___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  CNUIFamilyMemberDowntimeContactItem *v3;

  v2 = a2;
  v3 = -[CNUIFamilyMemberDowntimeContactItem initWithContact:label:]([CNUIFamilyMemberDowntimeContactItem alloc], "initWithContact:label:", v2, 0);

  return v3;
}

void __85__CNUIFamilyMemberDowntimeContactDataSource_postProcessForFamilyMembersWithContacts___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  v8 = v11;
  if (v7)
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", *(_QWORD *)(a1 + 32), v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    objc_msgSend(*(id *)(a1 + 40), "addIndex:", *(_QWORD *)(a1 + 56));
LABEL_5:
    v8 = v11;
  }

}

uint64_t __69__CNUIFamilyMemberDowntimeContactDataSource__loadAllContactsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __69__CNUIFamilyMemberDowntimeContactDataSource_filterSectionsForString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__CNUIFamilyMemberDowntimeContactDataSource_filterSectionsForString___block_invoke_3;
  v8[3] = &unk_1E204E1D8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "_cn_any:", v8);

  return v6;
}

uint64_t __69__CNUIFamilyMemberDowntimeContactDataSource_filterSectionsForString___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedLowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasPrefix:", v3) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedLowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "hasPrefix:", v3);

  }
  return v7;
}

uint64_t __69__CNUIFamilyMemberDowntimeContactDataSource_filterSectionsForString___block_invoke()
{
  return (*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))() ^ 1;
}

uint64_t __61__CNUIFamilyMemberDowntimeContactDataSource_selectedContacts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contact");
}

+ (BOOL)isErrorPossiblyRelatedToExtraStores:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = a3;
  v4 = *MEMORY[0x1E0CB28A8];
  if ((objc_msgSend(MEMORY[0x1E0D13A50], "isError:errorWithDomain:code:", v3, *MEMORY[0x1E0CB28A8], 4099) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D13A50], "isError:errorWithDomain:code:", v3, v4, 4097) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E0D13A50], "isError:errorWithDomain:code:", v3, v4, 4101);
  }

  return v5;
}

@end
