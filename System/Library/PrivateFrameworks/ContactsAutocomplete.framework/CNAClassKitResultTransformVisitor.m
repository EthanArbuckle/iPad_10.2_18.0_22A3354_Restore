@implementation CNAClassKitResultTransformVisitor

- (CNAClassKitResultTransformVisitor)initWithFactory:(id)a3 dataStore:(id)a4 searchType:(unint64_t)a5 addressableGroupResultStyle:(int64_t)a6
{
  id v11;
  id v12;
  CNAClassKitResultTransformVisitor *v13;
  CNAClassKitResultTransformVisitor *v14;
  NSMutableArray *v15;
  NSMutableArray *results;
  CNAClassKitResultTransformVisitor *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CNAClassKitResultTransformVisitor;
  v13 = -[CNAClassKitResultTransformVisitor init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_factory, a3);
    objc_storeStrong((id *)&v14->_dataStore, a4);
    v14->_searchType = a5;
    v14->_groupResultStyle = a6;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v14->_results;
    v14->_results = v15;

    v17 = v14;
  }

  return v14;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13A08]), "initWithObject:", self);
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("factory"), self->_factory);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("dataStore"), self->_dataStore);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reduceCollection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "acceptVisitor:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  v9 = (void *)-[NSMutableArray copy](self->_results, "copy");

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactory:dataStore:searchType:addressableGroupResultStyle:", self->_factory, self->_dataStore, self->_searchType, self->_groupResultStyle);
}

- (void)visitPerson:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNAutocompleteResultFactory *factory;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteNameComponents nameComponentsWithFirstName:lastName:nickname:nameSuffix:](CNAutocompleteNameComponents, "nameComponentsWithFirstName:lastName:nickname:nameSuffix:", v5, v6, &stru_1E70E0E70, &stru_1E70E0E70);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "addressForPerson:searchType:", v13, self->_searchType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    +[CNAutocompleteResultValue resultValueWithAddress:addressType:](CNAutocompleteResultValue, "resultValueWithAddress:addressType:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    factory = self->_factory;
    objc_msgSend(v13, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultFactory MAIDResultWithDisplayName:value:nameComponents:](factory, "MAIDResultWithDisplayName:value:nameComponents:", v11, v9, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray _cn_addNonNilObject:](self->_results, "_cn_addNonNilObject:", v12);
  }

}

+ (id)addressForPerson:(id)a3 searchType:(unint64_t)a4
{
  if (a4)
    objc_msgSend(a3, "appleID");
  else
    objc_msgSend(a3, "emailAddress");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)visitClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  CNAutocompleteResultFactory *factory;
  void *v11;
  void *v12;
  _QWORD aBlock[5];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[CNAClassKitResultTransformVisitor copy](self, "copy");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__CNAClassKitResultTransformVisitor_visitClass___block_invoke;
  aBlock[3] = &unk_1E70DF5C8;
  aBlock[4] = self;
  v14 = v5;
  v15 = v6;
  v7 = v6;
  v8 = v5;
  v9 = _Block_copy(aBlock);
  factory = self->_factory;
  objc_msgSend(v4, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteResultFactory MAIDGroupResultWithDisplayName:groupIdentifier:membersProvider:](factory, "MAIDGroupResultWithDisplayName:groupIdentifier:membersProvider:", v11, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray _cn_addNonNilObject:](self->_results, "_cn_addNonNilObject:", v12);
}

id __48__CNAClassKitResultTransformVisitor_visitClass___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cna_membersOfGroupWithIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isSuccess") & 1) != 0)
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(v5, "value");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reduceCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (a2)
    {
      v7 = objc_retainAutorelease(v9);
      v8 = 0;
      *a2 = v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)visitGroup:(id)a3
{
  if (self->_groupResultStyle)
    -[CNAClassKitResultTransformVisitor visitAddressableGroup:](self, "visitAddressableGroup:", a3);
  else
    -[CNAClassKitResultTransformVisitor visitExpandableGroup:](self, "visitExpandableGroup:", a3);
}

- (void)visitExpandableGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  CNAutocompleteResultFactory *factory;
  void *v11;
  void *v12;
  _QWORD aBlock[5];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[CNAClassKitResultTransformVisitor copy](self, "copy");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CNAClassKitResultTransformVisitor_visitExpandableGroup___block_invoke;
  aBlock[3] = &unk_1E70DF5C8;
  aBlock[4] = self;
  v14 = v5;
  v15 = v6;
  v7 = v6;
  v8 = v5;
  v9 = _Block_copy(aBlock);
  factory = self->_factory;
  objc_msgSend(v4, "groupName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteResultFactory MAIDGroupResultWithDisplayName:groupIdentifier:membersProvider:](factory, "MAIDGroupResultWithDisplayName:groupIdentifier:membersProvider:", v11, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray _cn_addNonNilObject:](self->_results, "_cn_addNonNilObject:", v12);
}

id __58__CNAClassKitResultTransformVisitor_visitExpandableGroup___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cna_membersOfGroupWithIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isSuccess") & 1) != 0)
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(v5, "value");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reduceCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (a2)
    {
      v7 = objc_retainAutorelease(v9);
      v8 = 0;
      *a2 = v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)visitAddressableGroup:(id)a3
{
  void *v4;
  void *v5;
  CNAutocompleteResultFactory *factory;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "emailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    +[CNAutocompleteResultValue resultValueWithAddress:addressType:](CNAutocompleteResultValue, "resultValueWithAddress:addressType:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    factory = self->_factory;
    objc_msgSend(v9, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultFactory MAIDResultWithDisplayName:value:nameComponents:](factory, "MAIDResultWithDisplayName:value:nameComponents:", v7, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray _cn_addNonNilObject:](self->_results, "_cn_addNonNilObject:", v8);
  }

}

- (CNAutocompleteResultFactory)factory
{
  return self->_factory;
}

- (CLSDataStore)dataStore
{
  return self->_dataStore;
}

- (unint64_t)searchType
{
  return self->_searchType;
}

- (int64_t)groupResultStyle
{
  return self->_groupResultStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
