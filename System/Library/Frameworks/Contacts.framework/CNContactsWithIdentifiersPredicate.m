@implementation CNContactsWithIdentifiersPredicate

- (BOOL)cn_hasHighSpecificity
{
  return 1;
}

- (CNContactsWithIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  CNContactsWithIdentifiersPredicate *v6;
  uint64_t v7;
  NSArray *identifiers;
  CNContactsWithIdentifiersPredicate *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier IN %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CNContactsWithIdentifiersPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v11, sel_initWithPredicate_, v5);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    identifiers = v6->_identifiers;
    v6->_identifiers = (NSArray *)v7;

    v9 = v6;
  }

  return v6;
}

- (CNContactsWithIdentifiersPredicate)initWithCoder:(id)a3
{
  id v4;
  CNContactsWithIdentifiersPredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *identifiers;
  CNContactsWithIdentifiersPredicate *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNContactsWithIdentifiersPredicate;
  v5 = -[CNPredicate init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_identifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v9;

    v11 = v5;
  }

  return v5;
}

- (id)suggestionsWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  +[CNSuggestedContactStore storeIdentifier](CNSuggestedContactStore, "storeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactsWithIdentifiersPredicate internalIdentifiersForStoreWithIdentifier:](self, "internalIdentifiersForStoreWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15);
        SGRecordIDFromIdentifier();
        v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v17[2](v17, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v8, "contactFromRecordID:error:", v18, a6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = objc_alloc(MEMORY[0x1E0D197B8]);
            v21 = (void *)objc_msgSend(v20, "initWithContact:matchTokens:matchInfo:", v19, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
            +[CNContactSuggestionMatch suggestionFromContactMatch:](CNContactSuggestionMatch, "suggestionFromContactMatch:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v22);

          }
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  +[CNContactSuggestionMatch fetchLinkedIdentifiersForContactSuggestionMatches:fromSuggestionService:](CNContactSuggestionMatch, "fetchLinkedIdentifiersForContactSuggestionMatches:fromSuggestionService:", v24, v8);
  return v24;
}

- (id)contactsFromDonationStore:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContactsWithIdentifiersPredicate identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("2D0447ED-BB88-45F9-909B-EB36C6920675"));

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "donatedMeCardEither");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isLeft");
    v9 = (void *)MEMORY[0x1E0D13A18];
    if (v8)
    {
      objc_msgSend(v7, "left");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "eitherWithLeft:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "right");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "eitherWithRight:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithLeft:", MEMORY[0x1E0C9AA60]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)internalIdentifiersForStoreWithIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSMutableDictionary *internalIdentifiers;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (unint64_t)v4;
  if (self->_identifiers)
  {
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_internalIdentifiers, "objectForKeyedSubscript:", v6);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v23 = v7;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[CNContactsWithIdentifiersPredicate identifiers](self, "identifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            +[CNContactStore storeIdentifierFromContactIdentifier:](CNContactStore, "storeIdentifierFromContactIdentifier:", v13);
            v14 = objc_claimAutoreleasedReturnValue();
            if (v5 | v14)
            {
              v15 = (void *)v14;
              +[CNContactStore storeIdentifierFromContactIdentifier:](CNContactStore, "storeIdentifierFromContactIdentifier:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqual:", v5);

              if (!v17)
                continue;
            }
            +[CNContactStore internalIdentifierFromContactIdentifier:](CNContactStore, "internalIdentifierFromContactIdentifier:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v18);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v10);
      }

      internalIdentifiers = self->_internalIdentifiers;
      if (!internalIdentifiers)
      {
        v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v21 = self->_internalIdentifiers;
        self->_internalIdentifiers = v20;

        internalIdentifiers = self->_internalIdentifiers;
      }
      v7 = v23;
      -[NSMutableDictionary setObject:forKeyedSubscript:](internalIdentifiers, "setObject:forKeyedSubscript:", v24, v23);
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_internalIdentifiers, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__CNContactsWithIdentifiersPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E29F7D70;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactsWithIdentifiersPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifiers, CFSTR("_identifiers"), v5.receiver, v5.super_class);

}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsWithIdentifiers:]"));
  -[CNContactsWithIdentifiersPredicate identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("identifiers (count)"), objc_msgSend(v5, "count"));

  -[CNContactsWithIdentifiersPredicate identifiers](self, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifiers"), v7);

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

uint64_t __46__CNContactsWithIdentifiersPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __42__CNContactsWithIdentifiersPredicate_hash__block_invoke;
  v3[3] = &unk_1E29F7D98;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

uint64_t __42__CNContactsWithIdentifiersPredicate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

@end
