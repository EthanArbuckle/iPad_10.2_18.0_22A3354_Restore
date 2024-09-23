@implementation CNContactRelationsDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 53), CFSTR("_contactRelations"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setContactRelations:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "contactRelations");
}

- (id)_builtInExtendedLabels
{
  if (_builtInExtendedLabels_cn_once_token_8 != -1)
    dispatch_once(&_builtInExtendedLabels_cn_once_token_8, &__block_literal_global_537);
  return (id)_builtInExtendedLabels_cn_once_object_8;
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF61E8];
  return a3 != 0;
}

- (CNContactRelationsDescription)init
{
  return -[CNContactRelationsDescription initWithLocalizationProvider:](self, "initWithLocalizationProvider:", 0);
}

- (CNContactRelationsDescription)initWithLocalizationProvider:(Class)a3
{
  CNContactRelationsDescription *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *generationQueue;
  objc_class *v7;
  Class provider;
  CNContactRelationsDescription *v9;

  v4 = -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("contactRelations"), sel_contactRelations, sel_setContactRelations_);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.contacts.CNContactRelationsDescription", 0);
    generationQueue = v4->_generationQueue;
    v4->_generationQueue = (OS_dispatch_queue *)v5;

    if (a3)
    {
      v7 = a3;
    }
    else
    {
      objc_opt_class();
      v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    provider = v4->_provider;
    v4->_provider = v7;

    v9 = v4;
  }

  return v4;
}

void __55__CNContactRelationsDescription__builtInExtendedLabels__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("_$!<Assistant>!$_"), CFSTR("_$!<Manager>!$_"), CFSTR("_$!<Colleague>!$_"), CFSTR("_$!<Teacher>!$_"), CFSTR("_$!<Sibling>!$_"), CFSTR("_$!<YoungerSibling>!$_"), CFSTR("_$!<ElderSibling>!$_"), CFSTR("_$!<Sister>!$_"), CFSTR("_$!<YoungerSister>!$_"), CFSTR("_$!<YoungestSister>!$_"), CFSTR("_$!<ElderSister>!$_"), CFSTR("_$!<EldestSister>!$_"), CFSTR("_$!<Brother>!$_"), CFSTR("_$!<YoungerBrother>!$_"), CFSTR("_$!<YoungestBrother>!$_"), CFSTR("_$!<ElderBrother>!$_"), CFSTR("_$!<EldestBrother>!$_"),
         CFSTR("_$!<Friend>!$_"),
         CFSTR("_$!<MaleFriend>!$_"),
         CFSTR("_$!<FemaleFriend>!$_"),
         CFSTR("_$!<Spouse>!$_"),
         CFSTR("_$!<Wife>!$_"),
         CFSTR("_$!<Husband>!$_"),
         CFSTR("_$!<Partner>!$_"),
         CFSTR("_$!<MalePartner>!$_"),
         CFSTR("_$!<FemalePartner>!$_"),
         CFSTR("_$!<GirlfriendOrBoyfriend>!$_"),
         CFSTR("_$!<Girlfriend>!$_"),
         CFSTR("_$!<Boyfriend>!$_"),
         CFSTR("_$!<Parent>!$_"),
         CFSTR("_$!<Mother>!$_"),
         CFSTR("_$!<Father>!$_"),
         CFSTR("_$!<Child>!$_"),
         CFSTR("_$!<Daughter>!$_"),
         CFSTR("_$!<Son>!$_"),
         CFSTR("_$!<Grandparent>!$_"),
         CFSTR("_$!<Grandmother>!$_"),
         CFSTR("_$!<GrandmotherMothersMother>!$_"),
         CFSTR("_$!<GrandmotherFathersMother>!$_"),
         CFSTR("_$!<Grandfather>!$_"),
         CFSTR("_$!<GrandfatherMothersFather>!$_"),
         CFSTR("_$!<GrandfatherFathersFather>!$_"),
         CFSTR("_$!<GreatGrandparent>!$_"),
         CFSTR("_$!<GreatGrandfather>!$_"),
         CFSTR("_$!<GreatGrandmother>!$_"),
         CFSTR("_$!<Grandchild>!$_"),
         CFSTR("_$!<Granddaughter>!$_"),
         CFSTR("_$!<GranddaughterDaughtersDaughter>!$_"),
         CFSTR("_$!<GranddaughterSonsDaughter>!$_"),
         CFSTR("_$!<Grandson>!$_"),
         CFSTR("_$!<GrandsonDaughtersSon>!$_"),
         CFSTR("_$!<GrandsonSonsSon>!$_"),
         CFSTR("_$!<GreatGrandchild>!$_"),
         CFSTR("_$!<GreatGrandson>!$_"),
         CFSTR("_$!<GreatGranddaughter>!$_"),
         CFSTR("_$!<ParentInLaw>!$_"),
         CFSTR("_$!<MotherInLaw>!$_"),
         CFSTR("_$!<MotherInLawWifesMother>!$_"),
         CFSTR("_$!<MotherInLawHusbandsMother>!$_"),
         CFSTR("_$!<FatherInLaw>!$_"),
         CFSTR("_$!<FatherInLawWifesFather>!$_"));
  v1 = (void *)_builtInExtendedLabels_cn_once_object_8;
  _builtInExtendedLabels_cn_once_object_8 = v0;

}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v12 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 16; i != -8; i -= 8)

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_contactRelations"), v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v6[53];
  v6[53] = v10;

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contactRelations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "contactRelations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "contactRelations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactRelations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v11;
}

- (BOOL)isNonnull
{
  return 1;
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  BOOL v10;

  v5 = a4;
  objc_msgSend(a3, "name");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v8 = v6;
  else
    v8 = &stru_1E29FF900;
  if (v7)
    v9 = v7;
  else
    v9 = &stru_1E29FF900;
  v10 = -[__CFString localizedCaseInsensitiveCompare:](v8, "localizedCaseInsensitiveCompare:", v9) == 0;

  return v10;
}

- (id)_builtInStandardLabels
{
  if (_builtInStandardLabels_cn_once_token_7 != -1)
    dispatch_once(&_builtInStandardLabels_cn_once_token_7, &__block_literal_global_523);
  return (id)_builtInStandardLabels_cn_once_object_7;
}

void __55__CNContactRelationsDescription__builtInStandardLabels__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("_$!<Mother>!$_"), CFSTR("_$!<Father>!$_"), CFSTR("_$!<Parent>!$_"), CFSTR("_$!<Brother>!$_"), CFSTR("_$!<Sister>!$_"), CFSTR("_$!<Son>!$_"), CFSTR("_$!<Daughter>!$_"), CFSTR("_$!<Child>!$_"), CFSTR("_$!<Friend>!$_"), CFSTR("_$!<Spouse>!$_"), CFSTR("_$!<Partner>!$_"), CFSTR("_$!<Assistant>!$_"), CFSTR("_$!<Manager>!$_"), 0);
  v1 = (void *)_builtInStandardLabels_cn_once_object_7;
  _builtInStandardLabels_cn_once_object_7 = v0;

}

- (void)_addLocalizedLabels:(id)a3 fromLanguagePlist:(id)a4 languageIdentifier:(id)a5 toDictionary:(id)a6 conflictInfo:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __116__CNContactRelationsDescription__addLocalizedLabels_fromLanguagePlist_languageIdentifier_toDictionary_conflictInfo___block_invoke;
  v19[3] = &unk_1E29F8C40;
  v20 = v13;
  v21 = v12;
  v22 = v11;
  v23 = v14;
  v15 = v14;
  v16 = v11;
  v17 = v12;
  v18 = v13;
  objc_msgSend(a3, "_cn_each:", v19);

}

void __116__CNContactRelationsDescription__addLocalizedLabels_fromLanguagePlist_languageIdentifier_toDictionary_conflictInfo___block_invoke(uint64_t a1, void *a2)
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0D13AF8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForLanguageCode:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pairWithFirst:second:", v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
    {
      objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        if (objc_msgSend(v10, "count") == 1)
        {
          objc_msgSend(v10, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "first");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (%@)"), v9, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = *(void **)(a1 + 32);
          objc_msgSend(v11, "second");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v14, v16);

        }
        v17 = *(void **)(a1 + 56);
        objc_msgSend(v10, "arrayByAddingObject:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v18, v9);

        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForLanguageCode:", *(_QWORD *)(a1 + 40));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ (%@)"), v9, v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v22;
      }
      else
      {
        v23 = *(void **)(a1 + 56);
        v25[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v24, v9);

      }
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v3);

    }
  }

}

- (id)labelsForPreferredLanguages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CNContactRelationsDescriptionLabels *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id obj;
  void *v52;
  void *v53;
  void *v54;
  CNContactRelationsDescription *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  CNContactRelationsDescriptionLabels *v61;
  uint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E10];
  -[CNContactRelationsDescription _builtInStandardLabels](self, "_builtInStandardLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedSetWithArray:", v6);
  v44 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = self;
  v46 = v4;
  -[objc_class supplementalLabelURLPairsForLanguages:](-[CNContactRelationsDescription provider](self, "provider"), "supplementalLabelURLPairsForLanguages:", v4);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
  v7 = 0;
  if (v65)
  {
    v52 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v67;
    v47 = *MEMORY[0x1E0D13850];
    v48 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v67 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v11, "first", v44);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataWithContentsOfURL:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v8)
        {
          v17 = v15;
          objc_msgSend(v11, "second");
          v62 = objc_claimAutoreleasedReturnValue();

          -[CNContactRelationsDescription _builtInStandardLabels](v55, "_builtInStandardLabels");
          v18 = v7;
          v19 = v14;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "second");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v17;
          -[CNContactRelationsDescription _addLocalizedLabels:fromLanguagePlist:languageIdentifier:toDictionary:conflictInfo:](v55, "_addLocalizedLabels:fromLanguagePlist:languageIdentifier:toDictionary:conflictInfo:", v20, v17, v21, v54, v53);

          v14 = v19;
          v7 = v18;
          v52 = (void *)v62;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v60 = v14;
          v63 = v8;
          objc_msgSend(v16, "objectForKey:", CFSTR("SupplementalRelationships"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "componentsSeparatedByString:", CFSTR(" "));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_cn_filter:", v47);
          v23 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "objectForKey:", CFSTR("ExtendedRelevantRelationships"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "componentsSeparatedByString:", CFSTR(" "));
          v24 = v7;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_cn_filter:", v47);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "objectForKey:", CFSTR("ExemptedStandardRelationships"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "componentsSeparatedByString:", CFSTR(" "));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "_cn_filter:", v47);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v50, "addObjectsFromArray:", v23);
          objc_msgSend(v49, "addObjectsFromArray:", v26);
          objc_msgSend(v11, "second");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)v23;
          -[CNContactRelationsDescription _addLocalizedLabels:fromLanguagePlist:languageIdentifier:toDictionary:conflictInfo:](v55, "_addLocalizedLabels:fromLanguagePlist:languageIdentifier:toDictionary:conflictInfo:", v23, v16, v29, v54, v53);

          objc_msgSend(v11, "second");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v24;
          -[CNContactRelationsDescription _addLocalizedLabels:fromLanguagePlist:languageIdentifier:toDictionary:conflictInfo:](v55, "_addLocalizedLabels:fromLanguagePlist:languageIdentifier:toDictionary:conflictInfo:", v26, v16, v30, v54, v53);

          v31 = objc_msgSend(v28, "count");
          if (v24)
          {
            if (v31)
            {
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v28);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "intersectSet:", v32);

            }
            else
            {
              objc_msgSend(v24, "removeAllObjects");
            }
          }
          else
          {
            if (v31)
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v28);
            else
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v14 = v60;
          v8 = v63;

          v9 = v48;
        }

      }
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    }
    while (v65);
  }
  else
  {
    v52 = 0;
    v8 = 0;
  }
  -[CNContactRelationsDescription _builtInExtendedLabels](v55, "_builtInExtendedLabels", v44);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactRelationsDescription _addLocalizedLabels:fromLanguagePlist:languageIdentifier:toDictionary:conflictInfo:](v55, "_addLocalizedLabels:fromLanguagePlist:languageIdentifier:toDictionary:conflictInfo:", v33, v8, v52, v54, v53);

  if (v7)
    objc_msgSend(v45, "minusSet:", v7);
  v64 = v8;
  objc_msgSend(v45, "minusOrderedSet:", v50);
  objc_msgSend(v45, "unionOrderedSet:", v50);
  v34 = (void *)objc_msgSend(v49, "mutableCopy");
  -[CNContactRelationsDescription _builtInExtendedLabels](v55, "_builtInExtendedLabels");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObjectsFromArray:", v35);

  if ((objc_msgSend(v7, "containsObject:", CFSTR("_$!<Other>!$_")) & 1) == 0)
    objc_msgSend(v45, "addObject:", CFSTR("_$!<Other>!$_"));
  objc_msgSend(v34, "addObject:", CFSTR("_$!<Other>!$_"));
  -[CNContactRelationsDescription _builtInStandardLabels](v55, "_builtInStandardLabels");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "removeObjectsInArray:", v36);

  objc_msgSend(v50, "removeObject:", CFSTR("_$!<Other>!$_"));
  v37 = [CNContactRelationsDescriptionLabels alloc];
  v38 = (void *)objc_msgSend(v46, "copy");
  objc_msgSend(v45, "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = -[CNContactRelationsDescriptionLabels initWithPreferredLanguages:standardLabels:standardLocaleSpecificLabels:extendedLabels:extendedLocaleSpecificLabels:localizedStringsByLabelKey:](v37, "initWithPreferredLanguages:standardLabels:standardLocaleSpecificLabels:extendedLabels:extendedLocaleSpecificLabels:localizedStringsByLabelKey:", v38, v39, v40, v41, v42, v54);

  return v61;
}

- (id)cachedLabelsForPreferredLanguages:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  CNContactRelationsDescription *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[objc_class preferredLanguages](-[CNContactRelationsDescription provider](self, "provider"), "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  -[CNContactRelationsDescription generationQueue](self, "generationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CNContactRelationsDescription_cachedLabelsForPreferredLanguages___block_invoke;
  block[3] = &unk_1E29F8C68;
  v11 = v5;
  v12 = self;
  v13 = &v14;
  v7 = v5;
  dispatch_sync(v6, block);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __67__CNContactRelationsDescription_cachedLabelsForPreferredLanguages___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = *(void **)(a1 + 32);
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "cachedLabels");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "preferredLanguages");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {

      goto LABEL_10;
    }
    v2 = (void *)v6;
    v5 = *(void **)(a1 + 32);
  }
  objc_msgSend(*(id *)(a1 + 40), "cachedLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if (v4)
  {
    if (v9)
      goto LABEL_10;
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "labelsForPreferredLanguages:", *(_QWORD *)(a1 + 32));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(*(id *)(a1 + 40), "setCachedLabels:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    return;
  }

  if ((v9 & 1) == 0)
    goto LABEL_8;
LABEL_10:
  objc_msgSend(*(id *)(a1 + 40), "cachedLabels");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

- (id)localizedStringForLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[objc_class preferredLanguages](-[CNContactRelationsDescription provider](self, "provider"), "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactRelationsDescription cachedLabelsForPreferredLanguages:](self, "cachedLabelsForPreferredLanguages:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringsByLabelKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {

    v8 = 0;
  }

  return v8;
}

- (id)standardLabels
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactRelationsDescription cachedLabelsForPreferredLanguages:](self, "cachedLabelsForPreferredLanguages:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "standardLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)standardLabelsWithOptions:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactRelationsDescription cachedLabelsForPreferredLanguages:](self, "cachedLabelsForPreferredLanguages:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "standardLocaleSpecificLabels");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v4 = (void *)v7;

    return v4;
  }
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactRelationsDescription cachedLabelsForPreferredLanguages:](self, "cachedLabelsForPreferredLanguages:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extendedLabels");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a3)
  {
    if (a3 > 3)
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
      return v4;
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactRelationsDescription cachedLabelsForPreferredLanguages:](self, "cachedLabelsForPreferredLanguages:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extendedLocaleSpecificLabels");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[CNContactRelationsDescription standardLabels](self, "standardLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (id)plistTransform
{
  return +[CN relatedContactToStringTransform](CN, "relatedContactToStringTransform");
}

- (id)fromPlistTransform
{
  return +[CN relatedContactFromStringTransform](CN, "relatedContactFromStringTransform");
}

- (OS_dispatch_queue)generationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (CNContactRelationsDescriptionLabels)cachedLabels
{
  return self->_cachedLabels;
}

- (void)setCachedLabels:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLabels, a3);
}

- (Class)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_cachedLabels, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
}

- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4
{
  void *v4;
  void *v5;

  +[CNiOSABConversions stringFromABBytes:length:](CNiOSABConversions, "stringFromABBytes:length:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CNContactRelation contactRelationWithName:](CNContactRelation, "contactRelationWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  CFTypeID v4;
  void *v5;

  if (a3)
  {
    v4 = CFGetTypeID(a3);
    if (v4 == CFStringGetTypeID())
    {
      +[CNContactRelation contactRelationWithName:](CNContactRelation, "contactRelationWithName:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
