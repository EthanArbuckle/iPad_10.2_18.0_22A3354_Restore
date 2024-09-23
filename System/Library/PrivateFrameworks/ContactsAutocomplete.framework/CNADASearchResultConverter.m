@implementation CNADASearchResultConverter

+ (id)autocompleteResultsForDASearchResultElement:(id)a3 request:(id)a4 factory:(id)a5
{
  id v8;
  id v9;
  id v10;
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFactory:", v10);

  objc_msgSend(a1, "displayNameForElement:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplayName:", v12);

  objc_msgSend(a1, "nameComponentsForElement:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNameComponents:", v13);

  if (objc_msgSend(a1, "shouldIncludeEmailAddressesForRequest:", v9))
  {
    objc_msgSend(v8, "emailAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEmailAddress:", v14);

  }
  if (objc_msgSend(a1, "shouldIncludePhoneNumbersForRequest:", v9))
  {
    objc_msgSend(v8, "homePhone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addPhoneNumber:", v15);

    objc_msgSend(v8, "workPhone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addPhoneNumber:", v16);

    objc_msgSend(v8, "mobilePhone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addPhoneNumber:", v17);

    objc_msgSend(v8, "iPhone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addPhoneNumber:", v18);

    objc_msgSend(v8, "mainPhone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addPhoneNumber:", v19);

  }
  objc_msgSend(v11, "build");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)resultTransformForRequest:(id)a3 factory:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__CNADASearchResultConverter_resultTransformForRequest_factory___block_invoke;
  aBlock[3] = &unk_1E70DF558;
  v14 = v7;
  v15 = a1;
  v13 = v6;
  v8 = v7;
  v9 = v6;
  v10 = _Block_copy(aBlock);

  return v10;
}

uint64_t __64__CNADASearchResultConverter_resultTransformForRequest_factory___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "autocompleteResultsForDASearchResultElement:request:factory:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)displayNameForElement:(id)a3
{
  return (id)objc_msgSend(a3, "displayName");
}

+ (id)nameComponentsForElement:(id)a3
{
  return 0;
}

+ (BOOL)shouldIncludeEmailAddressesForRequest:(id)a3
{
  return 1;
}

+ (BOOL)shouldIncludePhoneNumbersForRequest:(id)a3
{
  return objc_msgSend(a3, "searchType") != 0;
}

- (CNADASearchResultConverter)initWithFactory:(id)a3
{
  id v5;
  CNADASearchResultConverter *v6;
  CNADASearchResultConverter *v7;
  uint64_t v8;
  NSMutableArray *results;
  CNADASearchResultConverter *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNADASearchResultConverter;
  v6 = -[CNADASearchResultConverter init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_factory, a3);
    v8 = objc_opt_new();
    results = v7->_results;
    v7->_results = (NSMutableArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)build
{
  return self->_results;
}

- (void)addEmailAddress:(id)a3
{
  CNAutocompleteResultValue *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    v4 = objc_alloc_init(CNAutocompleteResultValue);
    -[CNAutocompleteResultValue setAddress:](v4, "setAddress:", v6);
    -[CNAutocompleteResultValue setAddressType:](v4, "setAddressType:", 1);
    -[CNAutocompleteResultFactory directoryServerResultWithDisplayName:value:nameComponents:](self->_factory, "directoryServerResultWithDisplayName:value:nameComponents:", self->_displayName, v4, self->_nameComponents);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_results, "addObject:", v5);

  }
}

- (void)addPhoneNumber:(id)a3
{
  CNAutocompleteResultValue *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    v4 = objc_alloc_init(CNAutocompleteResultValue);
    -[CNAutocompleteResultValue setAddress:](v4, "setAddress:", v6);
    -[CNAutocompleteResultValue setAddressType:](v4, "setAddressType:", 2);
    -[CNAutocompleteResultFactory directoryServerResultWithDisplayName:value:nameComponents:](self->_factory, "directoryServerResultWithDisplayName:value:nameComponents:", self->_displayName, v4, self->_nameComponents);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_results, "addObject:", v5);

  }
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (CNAutocompleteNameComponents)nameComponents
{
  return (CNAutocompleteNameComponents *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNameComponents:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_factory, 0);
}

@end
