@implementation _CNAPeopleSuggesterFacadeTestDouble

- (_CNAPeopleSuggesterFacadeTestDouble)init
{
  return -[_CNAPeopleSuggesterFacadeTestDouble initWithDelegate:](self, "initWithDelegate:", 0);
}

- (_CNAPeopleSuggesterFacadeTestDouble)initWithDelegate:(id)a3
{
  id v4;
  _CNAPeopleSuggesterFacadeTestDouble *v5;
  _CNAPeopleSuggesterFacadeTestDouble *v6;
  uint64_t v7;
  NSMutableArray *suggestions;
  _CNAPeopleSuggesterFacadeTestDouble *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNAPeopleSuggesterFacadeTestDouble;
  v5 = -[_CNAPeopleSuggesterFacadeTestDouble init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_opt_new();
    suggestions = v6->_suggestions;
    v6->_suggestions = (NSMutableArray *)v7;

    v9 = v6;
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  id WeakRetained;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("delegate"), WeakRetained);

  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("suggestions"), self->_suggestions);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)addPerson:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  id v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (Class (__cdecl *)())get_PSSuggestionClass;
  v5 = a3;
  v6 = objc_alloc_init(v4());
  objc_msgSend(v6, "setSuggestionType:", 1);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRecipients:", v7);
  -[_CNAPeopleSuggesterFacadeTestDouble addSuggestion:](self, "addSuggestion:", v6);
  return v6;
}

- (id)addGroupWithDisplayName:(id)a3 conversationIdentifier:(id)a4 recipients:(id)a5
{
  Class (__cdecl *v8)();
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = (Class (__cdecl *)())get_PSSuggestionClass;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc(v8()), "initWithBundleID:conversationIdentifier:groupName:recipients:", 0, v10, v11, v9);

  objc_msgSend(v12, "setSuggestionType:", 2);
  -[_CNAPeopleSuggesterFacadeTestDouble addSuggestion:](self, "addSuggestion:", v12);
  return v12;
}

- (void)addSuggestion:(id)a3
{
  -[NSMutableArray addObject:](self->_suggestions, "addObject:", a3);
}

+ (id)personWithDisplayName:(id)a3 handle:(id)a4 hasContact:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "makeRecipientWithDisplayName:handle:hasContact:", v8, v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)makeRecipientWithDisplayName:(id)a3 handle:(id)a4
{
  return (id)objc_msgSend(a1, "makeRecipientWithDisplayName:handle:hasContact:", a3, a4, 0);
}

+ (id)makeRecipientWithDisplayName:(id)a3 handle:(id)a4 hasContact:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    objc_msgSend(a1, "makeContactWithDisplayName:handle:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_alloc(get_PSRecipientClass());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithIdentifier:handle:displayName:contact:", v13, v9, v8, v10);

  return v14;
}

+ (id)makeContactWithDisplayName:(id)a3 handle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "makeContactWithDisplayName:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v6, "length"))
  {
    v8 = (void *)MEMORY[0x1E0D13A70];
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "classificationOfHandleStrings:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "emailAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_cn_map:", &__block_literal_global_22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEmailAddresses:", v12);

    objc_msgSend(v10, "phoneNumbers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_cn_map:", &__block_literal_global_13_1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhoneNumbers:", v14);

  }
  return v7;
}

+ (id)makeContactWithDisplayName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C97360]);
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "givenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGivenName:", v6);

    objc_msgSend(v5, "familyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFamilyName:", v7);

    objc_msgSend(v5, "middleName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMiddleName:", v8);

    objc_msgSend(v5, "namePrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNamePrefix:", v9);

    objc_msgSend(v5, "nameSuffix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNameSuffix:", v10);

    objc_msgSend(v5, "nickname");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNickname:", v11);

  }
  return v4;
}

- (id)autocompleteSearchResultsWithPredictionContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_CNAPeopleSuggesterFacadeTestDouble delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didQueryPeopleSuggesterWithContext:", v4);

  return (id)-[NSMutableArray copy](self->_suggestions, "copy");
}

- (_CNAPeopleSuggesterFacadeTestDoubleDelegate)delegate
{
  return (_CNAPeopleSuggesterFacadeTestDoubleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
