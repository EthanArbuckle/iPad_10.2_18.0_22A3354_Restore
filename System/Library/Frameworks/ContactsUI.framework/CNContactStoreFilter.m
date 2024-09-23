@implementation CNContactStoreFilter

- (BOOL)showsEverything
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CNContactStoreFilter predicate](self, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[CNContactStoreFilter limitedAccessIdentifiers](self, "limitedAccessIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (id)predicate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactFilter fullTextString](self, "fullTextString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStoreFilter containerIdentifiers](self, "containerIdentifiers");
  v5 = objc_claimAutoreleasedReturnValue();
  -[CNContactStoreFilter groupIdentifiers](self, "groupIdentifiers");
  v6 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v7 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend((id)v5, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForContactsMatchingFullTextSearch:containerIdentifiers:groupIdentifiers:", v4, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v11 = (void *)v10;

    objc_msgSend(v3, "addObject:", v11);
    goto LABEL_4;
  }
  if (v5 | v6 && !-[CNContactStoreFilter isServerFilter](self, "isServerFilter"))
  {
    v12 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend((id)v5, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateForPreferredNameInContainersWithIdentifiers:groupsWithIdentifiers:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
LABEL_4:
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
      objc_msgSend(v3, "firstObject");
    else
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (NSSet)containerIdentifiers
{
  return self->_containerIdentifiers;
}

- (BOOL)supportsSections
{
  void *v2;
  BOOL v3;

  -[CNContactFilter fullTextString](self, "fullTextString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

+ (id)contactStoreFilterFromPreferencesWithContactStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredGroupAndContainerIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CNContactFilterDictionaryKeyFullTextString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "_cn_filter:", &__block_literal_global_60_27161);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionaryRepresentation:contactStore:", v6, v4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNContactStoreFilter;
  v4 = -[CNContactFilter copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[CNContactStoreFilter containerIdentifiers](self, "containerIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainerIdentifiers:", v5);

  -[CNContactStoreFilter groupIdentifiers](self, "groupIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupIdentifiers:", v6);

  objc_msgSend(v4, "setIsServerFilter:", self->_isServerFilter);
  -[CNContactStoreFilter limitedAccessIdentifiers](self, "limitedAccessIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLimitedAccessIdentifiers:", v7);

  -[CNContactStoreFilter customDisplayName](self, "customDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomDisplayName:", v8);

  objc_msgSend(v4, "setLimitedAccessFilterMode:", -[CNContactStoreFilter limitedAccessFilterMode](self, "limitedAccessFilterMode"));
  return v4;
}

- (void)setIsServerFilter:(BOOL)a3
{
  self->_isServerFilter = a3;
}

- (void)setGroupIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifiers, a3);
}

- (void)setContainerIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifiers, a3);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  NSSet *containerIdentifiers;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  NSSet *groupIdentifiers;
  NSSet *v15;
  int v16;
  _BOOL4 v17;
  void *v19;
  objc_super v20;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v20.receiver = self,
        v20.super_class = (Class)CNContactStoreFilter,
        !-[CNContactFilter isEqual:](&v20, sel_isEqual_, v5)))
  {
    LOBYTE(v12) = 0;
    goto LABEL_26;
  }
  v6 = v5;
  v7 = v6;
  containerIdentifiers = self->_containerIdentifiers;
  v9 = containerIdentifiers;
  if (!containerIdentifiers)
  {
    objc_msgSend(v6, "containerIdentifiers");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v19 = 0;
      v11 = 0;
      goto LABEL_11;
    }
    v19 = (void *)v10;
    v9 = self->_containerIdentifiers;
  }
  objc_msgSend(v7, "containerIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqual:", v3))
  {
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
  v11 = 1;
LABEL_11:
  v13 = 32;
  groupIdentifiers = self->_groupIdentifiers;
  v15 = groupIdentifiers;
  if (!groupIdentifiers)
  {
    objc_msgSend(v7, "groupIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v16 = 0;
LABEL_18:
      v17 = -[CNContactStoreFilter isServerFilter](self, "isServerFilter");
      v12 = v17 ^ objc_msgSend(v7, "isServerFilter") ^ 1;
      if (!v16)
        goto LABEL_20;
      goto LABEL_19;
    }
    v15 = self->_groupIdentifiers;
  }
  objc_msgSend(v7, "groupIdentifiers");
  v13 = objc_claimAutoreleasedReturnValue();
  if (-[NSSet isEqual:](v15, "isEqual:", v13))
  {
    v16 = 1;
    goto LABEL_18;
  }
  LOBYTE(v12) = 0;
LABEL_19:

LABEL_20:
  if (!groupIdentifiers)
  {

    if ((v11 & 1) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  if (v11)
LABEL_22:

LABEL_23:
  if (!containerIdentifiers)

LABEL_26:
  return v12;
}

- (BOOL)isServerFilter
{
  return self->_isServerFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDisplayName, 0);
  objc_storeStrong((id *)&self->_limitedAccessIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
}

- (CNContactStoreFilter)initWithDictionaryRepresentation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  CNContactStoreFilter *v7;

  v4 = (objc_class *)MEMORY[0x1E0C97298];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[CNContactStoreFilter initWithDictionaryRepresentation:contactStore:](self, "initWithDictionaryRepresentation:contactStore:", v5, v6);

  return v7;
}

- (CNContactStoreFilter)initWithDictionaryRepresentation:(id)a3 contactStore:(id)a4
{
  id v6;
  id v7;
  CNContactStoreFilter *v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSSet *containerIdentifiers;
  uint64_t v23;
  NSSet *groupIdentifiers;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  char v36;
  objc_super v37;

  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CNContactStoreFilter;
  v8 = -[CNContactFilter initWithDictionaryRepresentation:](&v37, sel_initWithDictionaryRepresentation_, v6);
  if (v8)
  {
    v36 = 0;
    v34 = 0;
    v35 = 0;
    v9 = objc_msgSend((id)objc_opt_class(), "getContainerIdentifiers:groupIdentifiers:serverFilter:fromLegacyDictionary:contactStore:", &v35, &v34, &v36, v6, v7);
    v10 = v35;
    v11 = v34;
    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CNContactStoreFilterDictionaryKeyIsServerFilter"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v12, "BOOLValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CNContactStoreFilterDictionaryKeyExcludedContainerIdentifiers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CNContactStoreFilterDictionaryKeyExcludedGroupIdentifiers"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count") || objc_msgSend(v14, "count"))
      {
        if (v36)
          objc_msgSend(v7, "serverSearchContainersMatchingPredicate:error:", 0, 0);
        else
          objc_msgSend(v7, "containersMatchingPredicate:error:", 0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = MEMORY[0x1E0C809B0];
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke;
        v32[3] = &unk_1E2050200;
        v33 = v13;
        objc_msgSend(v15, "_cn_filter:", v32);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_cn_map:", &__block_literal_global_36_27150);
        v26 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "groupsMatchingPredicate:error:", 0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v16;
        v28 = 3221225472;
        v29 = __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke_3;
        v30 = &unk_1E204CA68;
        v31 = v14;
        objc_msgSend(v18, "_cn_filter:", &v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_cn_map:", &__block_literal_global_37);
        v20 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v20;
        v10 = (id)v26;
      }

    }
    if (!objc_msgSend(v10, "count", v26, v27, v28, v29, v30))
    {

      v10 = 0;
    }
    if (!objc_msgSend(v11, "count"))
    {

      v11 = 0;
    }
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
      v21 = objc_claimAutoreleasedReturnValue();
      containerIdentifiers = v8->_containerIdentifiers;
      v8->_containerIdentifiers = (NSSet *)v21;

    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
      v23 = objc_claimAutoreleasedReturnValue();
      groupIdentifiers = v8->_groupIdentifiers;
      v8->_groupIdentifiers = (NSSet *)v23;

    }
    v8->_isServerFilter = v36;

  }
  return v8;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
  -[CNContactStoreFilter dictionaryRepresentationWithContactStore:](self, "dictionaryRepresentationWithContactStore:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithContactStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNContactStoreFilter;
  -[CNContactFilter dictionaryRepresentation](&v22, sel_dictionaryRepresentation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (!-[CNContactStoreFilter showsEverything](self, "showsEverything"))
  {
    if (-[CNContactStoreFilter isServerFilter](self, "isServerFilter"))
      objc_msgSend(v4, "serverSearchContainersMatchingPredicate:error:", 0, 0);
    else
      objc_msgSend(v4, "containersMatchingPredicate:error:", 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke;
    v21[3] = &unk_1E2050200;
    v21[4] = self;
    objc_msgSend(v10, "_cn_filter:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupsMatchingPredicate:error:", 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke_2;
    v20[3] = &unk_1E204CA68;
    v20[4] = self;
    objc_msgSend(v13, "_cn_filter:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactStoreFilter isServerFilter](self, "isServerFilter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("CNContactStoreFilterDictionaryKeyIsServerFilter"));

    objc_msgSend(v12, "_cn_map:", &__block_literal_global_41);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("CNContactStoreFilterDictionaryKeyExcludedContainerIdentifiers"));
    objc_msgSend(v14, "_cn_map:", &__block_literal_global_42_27144);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("CNContactStoreFilterDictionaryKeyExcludedGroupIdentifiers"));
    -[CNContactStoreFilter addAddressBookUIKeysToDictionaryRepresentation:withAllContainers:excludedContainers:excludedGroups:](self, "addAddressBookUIKeysToDictionaryRepresentation:withAllContainers:excludedContainers:excludedGroups:", v9, v10, v12, v14);

  }
  v18 = (void *)objc_msgSend(v9, "copy");

  return v18;
}

- (void)addAddressBookUIKeysToDictionaryRepresentation:(id)a3 withAllContainers:(id)a4 excludedContainers:(id)a5 excludedGroups:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!-[CNContactStoreFilter isServerFilter](self, "isServerFilter"))
  {
    objc_msgSend(v11, "_cn_map:", &__block_literal_global_44);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("kABContactsFilter_ExcludedSourceIDs"));
    objc_msgSend(v12, "_cn_map:", &__block_literal_global_46_27135);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("kABContactsFilter_ExcludedGroupIDs");
    goto LABEL_5;
  }
  objc_msgSend(v10, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "iOSLegacyIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("kABContactsFilter_DirectorySourceID");
LABEL_5:
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v16);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CNContactStoreFilter;
  -[CNContactFilter description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ containerIdentifiers: %@, groupIdentifiers: %@"), v4, self->_containerIdentifiers, self->_groupIdentifiers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)saveToPreferencesWithContactStore:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[CNContactStoreFilter dictionaryRepresentationWithContactStore:](self, "dictionaryRepresentationWithContactStore:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CNContactFilterDictionaryKeyFullTextString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v6, "_cn_filter:", &__block_literal_global_61_27119);
    v4 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v4;
  }
  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilteredGroupAndContainerIDs:", v6);

}

- (NSSet)limitedAccessIdentifiers
{
  return self->_limitedAccessIdentifiers;
}

- (void)setLimitedAccessIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessIdentifiers, a3);
}

- (NSString)customDisplayName
{
  return self->_customDisplayName;
}

- (void)setCustomDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_customDisplayName, a3);
}

- (int)limitedAccessFilterMode
{
  return self->_limitedAccessFilterMode;
}

- (void)setLimitedAccessFilterMode:(int)a3
{
  self->_limitedAccessFilterMode = a3;
}

uint64_t __58__CNContactStoreFilter_saveToPreferencesWithContactStore___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", CFSTR("CNContactFilterDictionaryKeyFullTextString")) ^ 1;
}

uint64_t __123__CNContactStoreFilter_addAddressBookUIKeysToDictionaryRepresentation_withAllContainers_excludedContainers_excludedGroups___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "iOSLegacyIdentifier"));
}

uint64_t __123__CNContactStoreFilter_addAddressBookUIKeysToDictionaryRepresentation_withAllContainers_excludedContainers_excludedGroups___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "iOSLegacyIdentifier"));
}

uint64_t __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "containerIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  return v6;
}

uint64_t __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "groupIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  return v6;
}

uint64_t __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __65__CNContactStoreFilter_dictionaryRepresentationWithContactStore___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __70__CNContactStoreFilter_initWithDictionaryRepresentation_contactStore___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

+ (id)excludedContainerIdentifiersDictionaryKey
{
  return CFSTR("CNContactStoreFilterDictionaryKeyExcludedContainerIdentifiers");
}

+ (id)excludedGroupIdentifiersDictionaryKey
{
  return CFSTR("CNContactStoreFilterDictionaryKeyExcludedGroupIdentifiers");
}

+ (id)isServerFilterDictionaryKey
{
  return CFSTR("CNContactStoreFilterDictionaryKeyIsServerFilter");
}

+ (BOOL)getContainerIdentifiers:(id *)a3 groupIdentifiers:(id *)a4 serverFilter:(BOOL *)a5 fromLegacyDictionary:(id)a6 contactStore:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  char v19;

  v12 = a6;
  v13 = a7;
  if (getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore__cn_once_token_0 != -1)
    dispatch_once(&getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore__cn_once_token_0, &__block_literal_global_27176);
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = (id)getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore__cn_once_object_0;
  objc_msgSend(v12, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "intersectsSet:", v15);

  if ((v18 & 1) != 0)
  {
    v19 = 0;
  }
  else if ((objc_msgSend(a1, "getContainerIdentifiers:groupIdentifiers:serverFilter:fromSundanceToOkemoAndAddressBookUIDictionary:contactStore:", a3, a4, a5, v12, v13) & 1) != 0)
  {
    v19 = 1;
  }
  else
  {
    v19 = objc_msgSend(a1, "getContainerIdentifiers:groupIdentifiers:serverFilter:fromPreSundanceDictionary:contactStore:", a3, a4, a5, v12, v13);
  }

  return v19;
}

+ (BOOL)getContainerIdentifiers:(id *)a3 groupIdentifiers:(id *)a4 serverFilter:(BOOL *)a5 fromSundanceToOkemoAndAddressBookUIDictionary:(id)a6 contactStore:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v34;
  void *v35;
  void *v36;
  id *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  if (getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore__cn_once_token_1 != -1)
    dispatch_once(&getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore__cn_once_token_1, &__block_literal_global_6_27174);
  v13 = (id)getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore__cn_once_object_1;
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v11, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intersectsSet:", v13);

  if (v17)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("kABContactsFilter_DirectorySourceID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C972C0], "predicateForiOSLegacyIdentifier:", objc_msgSend(v18, "intValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serverSearchContainersMatchingPredicate:error:", v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "count") == 1)
      {
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        *a5 = 1;
LABEL_15:

        goto LABEL_16;
      }

    }
    v37 = a4;
    objc_msgSend(v11, "objectForKey:", CFSTR("kABContactsFilter_ExcludedSourceIDs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("kABContactsFilter_ExcludedGroupIDs"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count") || objc_msgSend(v21, "count"))
    {
      v34 = a3;
      objc_msgSend(v12, "containersMatchingPredicate:error:", 0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_2;
      v42[3] = &unk_1E2050200;
      v36 = v21;
      v27 = v21;
      v43 = v27;
      v35 = v25;
      objc_msgSend(v25, "_cn_filter:", v42);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_cn_map:", &__block_literal_global_18_27175);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "groupsMatchingPredicate:error:", 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v26;
      v38[1] = 3221225472;
      v38[2] = __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_4;
      v38[3] = &unk_1E204B1C8;
      v39 = v24;
      v40 = v12;
      v41 = v27;
      objc_msgSend(v30, "_cn_filter:", v38);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_cn_map:", &__block_literal_global_21);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v29, "count") || objc_msgSend(v32, "count"))
      {
        *v34 = objc_retainAutorelease(v29);
        *v37 = objc_retainAutorelease(v32);
      }

      v21 = v36;
    }

    goto LABEL_15;
  }
LABEL_16:

  return v17;
}

+ (BOOL)getContainerIdentifiers:(id *)a3 groupIdentifiers:(id *)a4 serverFilter:(BOOL *)a5 fromPreSundanceDictionary:(id)a6 contactStore:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  BOOL *v30;
  unint64_t v31;
  BOOL v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id *v42;
  void *v43;
  void *v44;
  void *v45;
  char v47;
  BOOL *v48;
  id *v49;
  id *v50;
  void *v51;
  void *v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  if (getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore__cn_once_token_2 != -1)
    dispatch_once(&getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore__cn_once_token_2, &__block_literal_global_22);
  v13 = (id)getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore__cn_once_object_2;
  v16 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v11, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v15, "intersectsSet:", v13);

  if ((_DWORD)v16)
  {
    v49 = a3;
    objc_msgSend(v11, "objectForKey:", CFSTR("GroupID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v50 = a4;
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C97318], "predicateForiOSLegacyIdentifier:", objc_msgSend(v17, "intValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "groupsMatchingPredicate:error:", v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      if (objc_msgSend(v20, "count") == 1)
      {
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v11, "objectForKey:", CFSTR("StoreID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("Global"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    if (!v22)
      goto LABEL_15;
    if (!objc_msgSend(v22, "intValue"))
    {
      objc_msgSend(v12, "containersMatchingPredicate:error:", 0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (char)v16;
      v16 = v13;
      v26 = v22;
      v27 = v12;
      v28 = v21;
      v29 = v18;
      v30 = a5;
      v31 = objc_msgSend(v25, "count");

      v32 = v31 > 1;
      a5 = v30;
      v18 = v29;
      v21 = v28;
      v12 = v27;
      v22 = v26;
      v13 = v16;
      LOBYTE(v16) = v47;
      v33 = v32 ? v24 : 0;
      if ((v33 & 1) != 0)
        goto LABEL_15;
    }
    v48 = a5;
    objc_msgSend(MEMORY[0x1E0C972C0], "predicateForiOSLegacyIdentifier:", objc_msgSend(v22, "intValue"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "containersMatchingPredicate:error:", v35, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v36, "count") == 1)
    {
      objc_msgSend(v36, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v36, "count"))
    {
      v34 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C972C0], "predicateForiOSLegacyIdentifier:", objc_msgSend(v22, "intValue"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serverSearchContainersMatchingPredicate:error:", v37, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v38, "count") == 1)
      {
        objc_msgSend(v38, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v34, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
          *v49 = (id)objc_claimAutoreleasedReturnValue();

          *v48 = 1;
LABEL_35:

          goto LABEL_36;
        }
LABEL_15:
        if (v21)
        {
          v34 = 0;
LABEL_26:
          objc_msgSend(v21, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v40;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
          v41 = (id)objc_claimAutoreleasedReturnValue();
          v42 = v50;
LABEL_27:
          *v42 = v41;

          goto LABEL_35;
        }
LABEL_30:
        objc_msgSend(v11, "objectForKey:", CFSTR("AccountIdentifier"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          objc_msgSend(MEMORY[0x1E0C972C0], "predicateForContainersInAccountWithExternalIdentifier:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "containersMatchingPredicate:error:", v44, 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v45, "count"))
          {
            objc_msgSend(v45, "_cn_map:", &__block_literal_global_32_27169);
            *v49 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        v34 = 0;
        goto LABEL_35;
      }
      v34 = 0;
      v36 = v38;
    }

    if (v21)
      goto LABEL_26;
    if (v34)
    {
      objc_msgSend(v34, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      v42 = v49;
      goto LABEL_27;
    }
    goto LABEL_30;
  }
LABEL_36:

  return (char)v16;
}

uint64_t __74__CNContactStoreFilter_contactStoreFilterFromPreferencesWithContactStore___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", CFSTR("CNContactFilterDictionaryKeyFullTextString")) ^ 1;
}

uint64_t __117__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __117__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Global"), CFSTR("GroupID"), CFSTR("StoreID"), CFSTR("AccountIdentifier"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore__cn_once_object_2;
  getContainerIdentifiers_groupIdentifiers_serverFilter_fromPreSundanceDictionary_contactStore__cn_once_object_2 = v0;

}

uint64_t __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "iOSLegacyIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "iOSLegacyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v6 = (void *)a1[5];
    v7 = (void *)MEMORY[0x1E0C972C0];
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForContainerOfGroupWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containersMatchingPredicate:error:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)a1[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "iOSLegacyIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13) ^ 1;

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

uint64_t __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __137__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("kABContactsFilter_ExcludedSourceIDs"), CFSTR("kABContactsFilter_ExcludedGroupIDs"), CFSTR("kABContactsFilter_DirectorySourceID"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore__cn_once_object_1;
  getContainerIdentifiers_groupIdentifiers_serverFilter_fromSundanceToOkemoAndAddressBookUIDictionary_contactStore__cn_once_object_1 = v0;

}

void __112__CNContactStoreFilter_getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("CNContactStoreFilterDictionaryKeyExcludedContainerIdentifiers"), CFSTR("CNContactStoreFilterDictionaryKeyExcludedGroupIdentifiers"), CFSTR("CNContactStoreFilterDictionaryKeyIsServerFilter"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore__cn_once_object_0;
  getContainerIdentifiers_groupIdentifiers_serverFilter_fromLegacyDictionary_contactStore__cn_once_object_0 = v0;

}

@end
