@implementation MUISearchSuggestionCategory

+ (id)contactCategory
{
  if (contactCategory_onceToken != -1)
    dispatch_once(&contactCategory_onceToken, &__block_literal_global_13);
  return (id)contactCategory_category;
}

void __68__MUISearchSuggestionCategory_MUIContactSuggestion__contactCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = [MUISearchSuggestionCategory alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("SEARCH_SUGGESTION_CATEGORY_PEOPLE"), &stru_1E99EB1C8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MUISearchSuggestionCategory initWithDisplayName:](v0, "initWithDisplayName:", v2);
  v4 = (void *)contactCategory_category;
  contactCategory_category = v3;

  objc_msgSend((id)contactCategory_category, "setParsecCategory:", *MEMORY[0x1E0D46D68]);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:", &__block_literal_global_34);

}

void __68__MUISearchSuggestionCategory_MUIContactSuggestion__contactCategory__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0DC3870], "mui_imageWithSystemSymbolName:", CFSTR("person.crop.circle"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)contactCategory_category, "setAtomImage:", v0);

}

+ (id)documentCategory
{
  if (documentCategory_onceToken != -1)
    dispatch_once(&documentCategory_onceToken, &__block_literal_global_14);
  return (id)documentCategory_category;
}

uint64_t __70__MUISearchSuggestionCategory_MUIDocumentSuggestion__documentCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = [MUISearchSuggestionCategory alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("SEARCH_SUGGESTION_CATEGORY_DOCUMENTS"), &stru_1E99EB1C8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MUISearchSuggestionCategory initWithDisplayName:](v0, "initWithDisplayName:", v2);
  v4 = (void *)documentCategory_category;
  documentCategory_category = v3;

  return objc_msgSend((id)documentCategory_category, "setParsecCategory:", *MEMORY[0x1E0D46D40]);
}

+ (id)suggestedSearchCategory
{
  if (suggestedSearchCategory_onceToken != -1)
    dispatch_once(&suggestedSearchCategory_onceToken, &__block_literal_global_68);
  return (id)suggestedSearchCategory_category;
}

void __75__MUISearchSuggestionCategory_MUISearchSuggestion__suggestedSearchCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [MUISearchSuggestionCategory alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEARCH_SUGGESTION_CATEGORY_SUGGESTED_SEARCHES"), &stru_1E99EB1C8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[MUISearchSuggestionCategory initWithDisplayName:](v0, "initWithDisplayName:", v1);
  v3 = (void *)suggestedSearchCategory_category;
  suggestedSearchCategory_category = v2;

}

+ (id)genericCategory
{
  if (genericCategory_onceToken[0] != -1)
    dispatch_once(genericCategory_onceToken, &__block_literal_global_73);
  return (id)genericCategory_category;
}

uint64_t __68__MUISearchSuggestionCategory_MUIGenericSuggestion__genericCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = [MUISearchSuggestionCategory alloc];
  +[MUISearchSuggestionCategory suggestedSearchCategory](MUISearchSuggestionCategory, "suggestedSearchCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[MUISearchSuggestionCategory initWithDisplayName:groupingCategory:](v0, "initWithDisplayName:groupingCategory:", 0, v1);
  v3 = (void *)genericCategory_category;
  genericCategory_category = v2;

  return objc_msgSend((id)genericCategory_category, "setParsecCategory:", *MEMORY[0x1E0D46D48]);
}

+ (id)recentGenericCategory
{
  if (recentGenericCategory_onceToken != -1)
    dispatch_once(&recentGenericCategory_onceToken, &__block_literal_global_75);
  return (id)recentGenericCategory_category;
}

uint64_t __80__MUISearchSuggestionCategory_MUIRecentGenericSuggestion__recentGenericCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = [MUISearchSuggestionCategory alloc];
  +[MUISearchSuggestionCategory recentSearchCategory](MUISearchSuggestionCategory, "recentSearchCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[MUISearchSuggestionCategory initWithDisplayName:groupingCategory:](v0, "initWithDisplayName:groupingCategory:", 0, v1);
  v3 = (void *)recentGenericCategory_category;
  recentGenericCategory_category = v2;

  return objc_msgSend((id)recentGenericCategory_category, "setParsecCategory:", *MEMORY[0x1E0D46D48]);
}

+ (id)linkCategory
{
  if (linkCategory_onceToken != -1)
    dispatch_once(&linkCategory_onceToken, &__block_literal_global_18);
  return (id)linkCategory_category;
}

uint64_t __62__MUISearchSuggestionCategory_MUILinkSuggestion__linkCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = [MUISearchSuggestionCategory alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Links"), &stru_1E99EB1C8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MUISearchSuggestionCategory initWithDisplayName:](v0, "initWithDisplayName:", v2);
  v4 = (void *)linkCategory_category;
  linkCategory_category = v3;

  return objc_msgSend((id)linkCategory_category, "setParsecCategory:", *MEMORY[0x1E0D46D58]);
}

+ (id)locationCategory
{
  if (locationCategory_onceToken != -1)
    dispatch_once(&locationCategory_onceToken, &__block_literal_global_20);
  return (id)locationCategory_category;
}

uint64_t __70__MUISearchSuggestionCategory_MUILocationSuggestion__locationCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = [MUISearchSuggestionCategory alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Locations"), &stru_1E99EB1C8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MUISearchSuggestionCategory initWithDisplayName:](v0, "initWithDisplayName:", v2);
  v4 = (void *)locationCategory_category;
  locationCategory_category = v3;

  return objc_msgSend((id)locationCategory_category, "setParsecCategory:", *MEMORY[0x1E0D46D60]);
}

+ (id)instantAnswersCategory
{
  if (instantAnswersCategory_onceToken != -1)
    dispatch_once(&instantAnswersCategory_onceToken, &__block_literal_global_220);
  objc_msgSend((id)instantAnswersCategory_category, "setParsecCategory:", *MEMORY[0x1E0D46D50]);
  return (id)instantAnswersCategory_category;
}

void __88__MUISearchSuggestionCategory_MUISearchInstantAnswersSuggestion__instantAnswersCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [MUISearchSuggestionCategory alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEARCH_SUGGESTION_CATEGORY_INSTANT_ANSWERS"), &stru_1E99EB1C8, CFSTR("Main"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[MUISearchSuggestionCategory initWithDisplayName:](v0, "initWithDisplayName:", v1);
  v3 = (void *)instantAnswersCategory_category;
  instantAnswersCategory_category = v2;

}

+ (id)topHitsCategory
{
  if (topHitsCategory_onceToken[0] != -1)
    dispatch_once(topHitsCategory_onceToken, &__block_literal_global_33);
  objc_msgSend((id)topHitsCategory_category, "setParsecCategory:", *MEMORY[0x1E0D46D70]);
  return (id)topHitsCategory_category;
}

void __46__MUISearchSuggestionCategory_topHitsCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [MUISearchSuggestionCategory alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEARCH_SUGGESTION_CATEGORY_TOP_HITS"), &stru_1E99EB1C8, CFSTR("Main"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[MUISearchSuggestionCategory initWithDisplayName:](v0, "initWithDisplayName:", v1);
  v3 = (void *)topHitsCategory_category;
  topHitsCategory_category = v2;

}

- (MUISearchSuggestionCategory)init
{
  -[MUISearchSuggestionCategory doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUISearchSuggestionCategory init]", "MUISearchSuggestionCategory.m", 44, "0");
}

- (MUISearchSuggestionCategory)initWithDisplayName:(id)a3
{
  return -[MUISearchSuggestionCategory initWithDisplayName:groupingCategory:](self, "initWithDisplayName:groupingCategory:", a3, 0);
}

- (MUISearchSuggestionCategory)initWithDisplayName:(id)a3 groupingCategory:(id)a4
{
  id v6;
  id v7;
  MUISearchSuggestionCategory *v8;
  uint64_t v9;
  NSString *displayName;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUISearchSuggestionCategory;
  v8 = -[MUISearchSuggestionCategory init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v9;

    objc_storeWeak((id *)&v8->_groupingCategory, v7);
  }

  return v8;
}

- (id)description
{
  __CFString *v3;
  void *v4;

  if (-[NSArray count](self->_scopes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%ld scopes)"), -[NSArray count](self->_scopes, "count"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E99EB1C8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@%@"), objc_opt_class(), self, self->_displayName, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIImage)image
{
  UIImage *image;
  UIImage *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  image = self->_image;
  if (!image)
  {
    -[MUISearchSuggestionCategory imageInstantiationBlock](self, "imageInstantiationBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p>.image"), self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUISearchSuggestionCategory imageInstantiationBlock](self, "imageInstantiationBlock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cachedImage:forKey:", v8, v6);
      v3 = (UIImage *)objc_claimAutoreleasedReturnValue();

      return v3;
    }
    image = self->_image;
  }
  v3 = image;
  return v3;
}

- (unint64_t)indexOfScopeWithIdentifier:(id)a3
{
  id v4;
  NSArray *scopes;
  unint64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[NSArray count](self->_scopes, "count"))
  {
    scopes = self->_scopes;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__MUISearchSuggestionCategory_indexOfScopeWithIdentifier___block_invoke;
    v8[3] = &unk_1E99E3510;
    v9 = v4;
    v6 = -[NSArray indexOfObjectPassingTest:](scopes, "indexOfObjectPassingTest:", v8);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __58__MUISearchSuggestionCategory_indexOfScopeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (MUISearchSuggestionCategory)groupingCategory
{
  MUISearchSuggestionCategory *WeakRetained;

  WeakRetained = (MUISearchSuggestionCategory *)objc_loadWeakRetained((id *)&self->_groupingCategory);
  if (!WeakRetained)
    WeakRetained = self;
  return WeakRetained;
}

- (BOOL)isGroupedInCategory:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((-[MUISearchSuggestionCategory isEqual:](self, "isEqual:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[MUISearchSuggestionCategory groupingCategory](self, "groupingCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqual:", v4);

  }
  return v5;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIImage)atomImage
{
  return self->_atomImage;
}

- (void)setAtomImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)parsecCategory
{
  return self->_parsecCategory;
}

- (void)setParsecCategory:(id)a3
{
  objc_storeStrong((id *)&self->_parsecCategory, a3);
}

- (BOOL)isLegacy
{
  return self->_isLegacy;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setGroupingCategory:(id)a3
{
  objc_storeWeak((id *)&self->_groupingCategory, a3);
}

- (id)imageInstantiationBlock
{
  return self->_imageInstantiationBlock;
}

- (void)setImageInstantiationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageInstantiationBlock, 0);
  objc_destroyWeak((id *)&self->_groupingCategory);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_parsecCategory, 0);
  objc_storeStrong((id *)&self->_atomImage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

+ (id)recentSearchCategory
{
  if (recentSearchCategory_onceToken != -1)
    dispatch_once(&recentSearchCategory_onceToken, &__block_literal_global_119);
  return (id)recentSearchCategory_category;
}

void __83__MUISearchSuggestionCategory_MFSearchRecentSearchCategories__recentSearchCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [MUISearchSuggestionCategory alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEARCH_SUGGESTION_CATEGORY_RECENT_SEARCHES"), &stru_1E99EB1C8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[MUISearchSuggestionCategory initWithDisplayName:](v0, "initWithDisplayName:", v1);
  v3 = (void *)recentSearchCategory_category;
  recentSearchCategory_category = v2;

}

+ (id)allMailboxesCategory
{
  if (allMailboxesCategory_onceToken != -1)
    dispatch_once(&allMailboxesCategory_onceToken, &__block_literal_global_124);
  return (id)allMailboxesCategory_category;
}

uint64_t __78__MUISearchSuggestionCategory_MUIAllMailboxesSuggestion__allMailboxesCategory__block_invoke()
{
  MUISearchSuggestionCategory *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = [MUISearchSuggestionCategory alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("All Mailboxes"), &stru_1E99EB1C8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MUISearchSuggestionCategory initWithDisplayName:](v0, "initWithDisplayName:", v2);
  v4 = (void *)allMailboxesCategory_category;
  allMailboxesCategory_category = v3;

  return objc_msgSend((id)allMailboxesCategory_category, "setParsecCategory:", CFSTR("content"));
}

@end
