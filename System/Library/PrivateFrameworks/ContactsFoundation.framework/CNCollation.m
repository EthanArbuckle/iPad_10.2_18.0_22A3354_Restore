@implementation CNCollation

- (CNCollation)initWithCollator:(UCollator *)a3
{
  void *v5;
  CNCollation *v6;

  objc_msgSend((id)objc_opt_class(), "sectionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNCollation initWithCollator:URL:](self, "initWithCollator:URL:", a3, v5);

  return v6;
}

+ (id)defaultSortCollatorIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "sectionURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v5 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ABCollationKey"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

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

+ (id)sectionURL
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__CNCollation_sectionURL__block_invoke;
  v7[3] = &unk_1E29B9E60;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (CNCollation)initWithCollator:(UCollator *)a3 URL:(id)a4
{
  void *v6;
  void *v7;
  NSString *v8;
  NSString *searchTransform;
  NSString *v10;
  NSString *nameTransform;
  void *v12;
  NSString *v13;
  NSString *sortCollatorIdentifier;
  NSString *v15;
  NSString *searchCollatorIdentifier;
  NSArray *v17;
  NSArray *indexSections;
  NSArray *v19;
  NSArray *headerLanguages;
  CNCollation *v21;
  objc_super v23;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (v23.receiver = self,
            v23.super_class = (Class)CNCollation,
            (self = -[CNCollation init](&v23, sel_init)) != 0))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SearchTransform"));
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        searchTransform = self->_searchTransform;
        self->_searchTransform = v8;

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NameTransform"));
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        nameTransform = self->_nameTransform;
        self->_nameTransform = v10;

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ABUseExtraTokenizations"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        self->_indexExtraTokenizations = objc_msgSend(v12, "BOOLValue");

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ABCollationKey"));
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        sortCollatorIdentifier = self->_sortCollatorIdentifier;
        self->_sortCollatorIdentifier = v13;

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ABSearchCollationKey"));
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        searchCollatorIdentifier = self->_searchCollatorIdentifier;
        self->_searchCollatorIdentifier = v15;

        objc_msgSend((id)objc_opt_class(), "indexSectionsFromPropertyList:", v7);
        v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
        indexSections = self->_indexSections;
        self->_indexSections = v17;

        objc_msgSend((id)objc_opt_class(), "languageHeaderSectionsFromPropertyList:collator:", v7, a3);
        v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
        headerLanguages = self->_headerLanguages;
        self->_headerLanguages = v19;

        self = self;
        v21 = self;
      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)languageHeaderSectionsFromPropertyList:(id)a3 collator:(UCollator *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  UCollator *v13;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SectionHeaders"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LocalizedSectionHeaders"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__CNCollation_languageHeaderSectionsFromPropertyList_collator___block_invoke;
  v11[3] = &unk_1E29B9ED8;
  v12 = v7;
  v13 = a4;
  v8 = v7;
  objc_msgSend(v6, "_cn_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)indexSectionsFromPropertyList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SectionIndices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LocalizedSectionIndices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__CNCollation_indexSectionsFromPropertyList___block_invoke;
  v14[3] = &unk_1E29B9E88;
  v15 = v9;
  v10 = v9;
  objc_msgSend(v4, "_cn_map:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

CNCollationHeaderSection *__63__CNCollation_languageHeaderSectionsFromPropertyList_collator___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  CNCollationHeaderSection *v6;
  void *v7;
  CNCollationHeaderSection *v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  CNSortKeyStringForString(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [CNCollationHeaderSection alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNCollationHeaderSection initWithKey:localizedName:ICUSortKey:](v6, "initWithKey:localizedName:ICUSortKey:", v4, v7, v5);

  return v8;
}

CNCollationSection *__45__CNCollation_indexSectionsFromPropertyList___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  CNCollationSection *v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  v7 = v6;

  v8 = -[CNCollationSection initWithKey:localizedName:]([CNCollationSection alloc], "initWithKey:localizedName:", v7, v3);
  return v8;
}

CNCollationLanguage *__63__CNCollation_languageHeaderSectionsFromPropertyList_collator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  CNCollationLanguage *v9;
  __int128 v11;
  _QWORD v12[4];
  __int128 v13;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LastCharacter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FirstCharacterAfterLanguage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Headers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__CNCollation_languageHeaderSectionsFromPropertyList_collator___block_invoke_2;
  v12[3] = &unk_1E29B9EB0;
  v11 = *(_OWORD *)(a1 + 32);
  v7 = (id)v11;
  v13 = v11;
  objc_msgSend(v6, "_cn_map:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNCollationLanguage initWithSections:lastCharacter:firstCharacterAfterLanguage:]([CNCollationLanguage alloc], "initWithSections:lastCharacter:firstCharacterAfterLanguage:", v8, v4, v5);

  return v9;
}

- (NSArray)headerLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)indexSections
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

void __25__CNCollation_sectionURL__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "URLForResource:withExtension:subdirectory:localization:", CFSTR("ABContactSections"), CFSTR("plist"), 0, a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

- (CNCollation)init
{
  return -[CNCollation initWithCollator:](self, "initWithCollator:", 0);
}

- (NSString)searchTransform
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)nameTransform
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)searchCollatorIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)sortCollatorIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)indexExtraTokenizations
{
  return self->_indexExtraTokenizations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortCollatorIdentifier, 0);
  objc_storeStrong((id *)&self->_searchCollatorIdentifier, 0);
  objc_storeStrong((id *)&self->_nameTransform, 0);
  objc_storeStrong((id *)&self->_searchTransform, 0);
  objc_storeStrong((id *)&self->_indexSections, 0);
  objc_storeStrong((id *)&self->_headerLanguages, 0);
}

@end
