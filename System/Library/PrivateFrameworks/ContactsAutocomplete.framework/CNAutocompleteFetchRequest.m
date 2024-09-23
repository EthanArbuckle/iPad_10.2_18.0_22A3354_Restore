@implementation CNAutocompleteFetchRequest

+ (id)request
{
  return objc_alloc_init((Class)a1);
}

- (CNAutocompleteFetchRequest)init
{
  CNAutocompleteFetchRequest *v2;
  CNAutocompleteFetchRequest *v3;
  uint64_t v4;
  NSString *triageIdentifier;
  CNAutocompleteFetchRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNAutocompleteFetchRequest;
  v2 = -[CNAutocompleteFetchRequest init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CNAutocompleteFetchRequest setIncludeContacts:](v2, "setIncludeContacts:", 1);
    -[CNAutocompleteFetchRequest setIncludeRecents:](v3, "setIncludeRecents:", 1);
    -[CNAutocompleteFetchRequest setIncludeStewie:](v3, "setIncludeStewie:", 0);
    -[CNAutocompleteFetchRequest setIncludeSuggestions:](v3, "setIncludeSuggestions:", 1);
    -[CNAutocompleteFetchRequest setIncludeLocalExtensions:](v3, "setIncludeLocalExtensions:", 1);
    -[CNAutocompleteFetchRequest setIncludeDirectoryServers:](v3, "setIncludeDirectoryServers:", 1);
    -[CNAutocompleteFetchRequest setIncludeCalendarServers:](v3, "setIncludeCalendarServers:", 1);
    -[CNAutocompleteFetchRequest setIncludePredictions:](v3, "setIncludePredictions:", 1);
    -[CNAutocompleteFetchRequest setAddressableGroupResultStyle:](v3, "setAddressableGroupResultStyle:", 0);
    -[CNAutocompleteFetchRequest setSearchNames:](v3, "setSearchNames:", MEMORY[0x1E0C9AA60]);
    objc_msgSend((id)objc_opt_class(), "makeTriageIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    triageIdentifier = v3->_triageIdentifier;
    v3->_triageIdentifier = (NSString *)v4;

    v6 = v3;
  }

  return v3;
}

+ (id)makeTriageIdentifier
{
  uint64_t v2;

  if (makeTriageIdentifier_cn_once_token_0 != -1)
    dispatch_once(&makeTriageIdentifier_cn_once_token_0, &__block_literal_global_5);
  v2 = objc_msgSend((id)makeTriageIdentifier_cn_once_object_0, "nextUnsignedInteger");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CNA-%04llu"), v2);
}

void __50__CNAutocompleteFetchRequest_makeTriageIdentifier__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D13988]);
  v1 = (void *)makeTriageIdentifier_cn_once_object_0;
  makeTriageIdentifier_cn_once_object_0 = (uint64_t)v0;

}

- (NSString)searchString
{
  return (NSString *)-[NSArray firstObject](self->_searchNames, "firstObject");
}

- (void)setSearchString:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteFetchRequest setSearchNames:](self, "setSearchNames:", v5);

  }
  else
  {
    -[CNAutocompleteFetchRequest setSearchNames:](self, "setSearchNames:", MEMORY[0x1E0C9AA60]);
  }
}

- (BOOL)isZeroKeywordSearch
{
  void *v3;
  void *v4;

  -[CNAutocompleteFetchRequest searchNames](self, "searchNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("ZKW: %@"), v3);

  -[CNAutocompleteFetchRequest searchNames](self, "searchNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "_cn_none:", *MEMORY[0x1E0D13850]);

  return (char)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CNAutocompleteFetchRequest *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(CNAutocompleteFetchRequest);
  -[CNAutocompleteFetchRequest searchNames](self, "searchNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchRequest setSearchNames:](v4, "setSearchNames:", v5);

  -[CNAutocompleteFetchRequest priorityDomainForSorting](self, "priorityDomainForSorting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchRequest setPriorityDomainForSorting:](v4, "setPriorityDomainForSorting:", v6);

  -[CNAutocompleteFetchRequest setSearchType:](v4, "setSearchType:", -[CNAutocompleteFetchRequest searchType](self, "searchType"));
  -[CNAutocompleteFetchRequest fetchContext](self, "fetchContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchRequest setFetchContext:](v4, "setFetchContext:", v7);

  -[CNAutocompleteFetchRequest setIncludeContacts:](v4, "setIncludeContacts:", -[CNAutocompleteFetchRequest includeContacts](self, "includeContacts"));
  -[CNAutocompleteFetchRequest setIncludeRecents:](v4, "setIncludeRecents:", -[CNAutocompleteFetchRequest includeRecents](self, "includeRecents"));
  -[CNAutocompleteFetchRequest setIncludeStewie:](v4, "setIncludeStewie:", -[CNAutocompleteFetchRequest includeStewie](self, "includeStewie"));
  -[CNAutocompleteFetchRequest setIncludeSuggestions:](v4, "setIncludeSuggestions:", -[CNAutocompleteFetchRequest includeSuggestions](self, "includeSuggestions"));
  -[CNAutocompleteFetchRequest setIncludeLocalExtensions:](v4, "setIncludeLocalExtensions:", -[CNAutocompleteFetchRequest includeLocalExtensions](self, "includeLocalExtensions"));
  -[CNAutocompleteFetchRequest setIncludeDirectoryServers:](v4, "setIncludeDirectoryServers:", -[CNAutocompleteFetchRequest includeDirectoryServers](self, "includeDirectoryServers"));
  -[CNAutocompleteFetchRequest setIncludeCalendarServers:](v4, "setIncludeCalendarServers:", -[CNAutocompleteFetchRequest includeCalendarServers](self, "includeCalendarServers"));
  -[CNAutocompleteFetchRequest setIncludePredictions:](v4, "setIncludePredictions:", -[CNAutocompleteFetchRequest includePredictions](self, "includePredictions"));
  -[CNAutocompleteFetchRequest setAddressableGroupResultStyle:](v4, "setAddressableGroupResultStyle:", -[CNAutocompleteFetchRequest addressableGroupResultStyle](self, "addressableGroupResultStyle"));
  objc_storeStrong((id *)&v4->_shouldIncludeGroupResultsImpl, self->_shouldIncludeGroupResultsImpl);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *searchNames;
  int v12;
  NSString *priorityDomainForSorting;
  CNAutocompleteFetchContext *fetchContext;
  int v15;
  int64_t v16;
  uint64_t v18;
  uint64_t v19;

  if (self == a3)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v18 = v4;
    v19 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !self->_includeContacts == (*((_BYTE *)a3 + 48) != 0)
      || !self->_includeRecents == (*((_BYTE *)a3 + 49) != 0)
      || !self->_includeStewie == (*((_BYTE *)a3 + 50) != 0)
      || !self->_includeLocalExtensions == (*((_BYTE *)a3 + 52) != 0)
      || !self->_includeSuggestions == (*((_BYTE *)a3 + 51) != 0)
      || !self->_includeDirectoryServers == (*((_BYTE *)a3 + 53) != 0)
      || !self->_includeCalendarServers == (*((_BYTE *)a3 + 54) != 0)
      || !self->_includePredictions == (*((_BYTE *)a3 + 55) != 0))
    {
      goto LABEL_19;
    }
    searchNames = self->_searchNames;
    if (!((unint64_t)searchNames | *((_QWORD *)a3 + 1))
      || (v12 = -[NSArray isEqual:](searchNames, "isEqual:")) != 0)
    {
      if (self->_searchType != *((_QWORD *)a3 + 3))
      {
LABEL_19:
        LOBYTE(v12) = 0;
        return v12;
      }
      priorityDomainForSorting = self->_priorityDomainForSorting;
      if (!((unint64_t)priorityDomainForSorting | *((_QWORD *)a3 + 2))
        || (v12 = -[NSString isEqual:](priorityDomainForSorting, "isEqual:")) != 0)
      {
        fetchContext = self->_fetchContext;
        if (!((unint64_t)fetchContext | *((_QWORD *)a3 + 4))
          || (v12 = -[CNAutocompleteFetchContext isEqual:](fetchContext, "isEqual:")) != 0)
        {
          v15 = -[CNAutocompleteFetchRequest shouldIncludeGroupResults](self, "shouldIncludeGroupResults", v6, v5, v18, v19, v7, v8);
          if (v15 != objc_msgSend(a3, "shouldIncludeGroupResults"))
            goto LABEL_19;
          v16 = -[CNAutocompleteFetchRequest addressableGroupResultStyle](self, "addressableGroupResultStyle");
          LOBYTE(v12) = v16 == objc_msgSend(a3, "addressableGroupResultStyle");
        }
      }
    }
  }
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "arrayHash:", self->_searchNames);
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_priorityDomainForSorting);
  v5 = self->_searchType - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  v6 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_fetchContext);
  v7 = self->_includeContacts - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  v8 = self->_includeRecents - v7 + 32 * v7;
  v9 = self->_includeStewie - v8 + 32 * v8;
  v10 = self->_includeLocalExtensions - v9 + 32 * v9;
  v11 = self->_includeSuggestions - v10 + 32 * v10;
  v12 = self->_includeDirectoryServers - v11 + 32 * v11;
  v13 = self->_includeCalendarServers - v12 + 32 * v12;
  v14 = 31 * (self->_includePredictions - v13 + 32 * v13);
  v15 = v14 + -[CNAutocompleteFetchRequest shouldIncludeGroupResults](self, "shouldIncludeGroupResults");
  v16 = -[CNAutocompleteFetchRequest addressableGroupResultStyle](self, "addressableGroupResultStyle");
  if (v16 >= 0)
    v17 = v16;
  else
    v17 = -v16;
  return v17 - v15 + 32 * v15 - 0x6BF9C36B086DF1AFLL;
}

- (id)executeWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  CNAutocompleteStore *v8;
  void *v9;
  CNAutocompleteStore *v10;
  void *v11;
  int v13;
  CNAutocompleteFetchRequest *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CNALoggingContextDebug();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = self;
    _os_log_impl(&dword_1B9950000, v5, OS_LOG_TYPE_DEFAULT, "Autocompleting “%@”", (uint8_t *)&v13, 0xCu);
  }

  +[CNAutocompleteSearchProviderFactory nonCachingProvider](CNAutocompleteSearchProviderFactory, "nonCachingProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteProbeProviderFactory defaultProbeProvider](CNAutocompleteProbeProviderFactory, "defaultProbeProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [CNAutocompleteStore alloc];
  objc_msgSend(MEMORY[0x1E0D13B68], "globalAsyncScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNAutocompleteStore initWithDelegate:searchProvider:probeProvider:scheduler:](v8, "initWithDelegate:searchProvider:probeProvider:scheduler:", v4, v6, v7, v9);

  -[CNAutocompleteStore executeFetchRequest:](v10, "executeFetchRequest:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isValid:(id *)a3
{
  void *v5;
  void *v6;
  char v7;

  -[CNAutocompleteFetchRequest fetchContext](self, "fetchContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CNAutocompleteFetchRequest fetchContext](self, "fetchContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isValid:", a3);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (id)searchablePropertiesForSearchType:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3 > 5)
    return MEMORY[0x1E0C9AA60];
  if (((1 << a3) & 0x32) != 0)
  {
    v3 = *MEMORY[0x1E0C967C0];
    v10[0] = *MEMORY[0x1E0C966A8];
    v10[1] = v3;
    v10[2] = *MEMORY[0x1E0C96740];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v10;
    v6 = 3;
  }
  else if (((1 << a3) & 9) != 0)
  {
    v11[0] = *MEMORY[0x1E0C966A8];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v11;
    v6 = 1;
  }
  else
  {
    v8 = *MEMORY[0x1E0C967C0];
    v9[0] = *MEMORY[0x1E0C966A8];
    v9[1] = v8;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v9;
    v6 = 2;
  }
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)searchableProperties
{
  return (NSArray *)objc_msgSend((id)objc_opt_class(), "searchablePropertiesForSearchType:", -[CNAutocompleteFetchRequest searchType](self, "searchType"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNAutocompleteFetchRequest)initWithCoder:(id)a3
{
  id v4;
  CNAutocompleteFetchRequest *v5;
  uint64_t v6;
  NSArray *searchNames;
  uint64_t v8;
  NSString *priorityDomainForSorting;
  uint64_t v10;
  CNAutocompleteFetchContext *fetchContext;
  uint64_t v12;
  NSNumber *shouldIncludeGroupResultsImpl;
  CNAutocompleteFetchRequest *v14;

  v4 = a3;
  v5 = -[CNAutocompleteFetchRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("searchNames"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchNames = v5->_searchNames;
    v5->_searchNames = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priorityDomainForSorting"));
    v8 = objc_claimAutoreleasedReturnValue();
    priorityDomainForSorting = v5->_priorityDomainForSorting;
    v5->_priorityDomainForSorting = (NSString *)v8;

    v5->_searchType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("searchType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fetchContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    fetchContext = v5->_fetchContext;
    v5->_fetchContext = (CNAutocompleteFetchContext *)v10;

    v5->_includeContacts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeContacts"));
    v5->_includeRecents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeRecents"));
    v5->_includeStewie = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeStewie"));
    v5->_includeSuggestions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeSuggestions"));
    v5->_includeLocalExtensions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeLocalExtensions"));
    v5->_includeDirectoryServers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeDirectoryServers"));
    v5->_includeCalendarServers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeCalendarServers"));
    v5->_includePredictions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includePredictions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shouldIncludeGroupResultsImpl"));
    v12 = objc_claimAutoreleasedReturnValue();
    shouldIncludeGroupResultsImpl = v5->_shouldIncludeGroupResultsImpl;
    v5->_shouldIncludeGroupResultsImpl = (NSNumber *)v12;

    -[CNAutocompleteFetchRequest setAddressableGroupResultStyle:](v5, "setAddressableGroupResultStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("addressableGroupResultStyle")));
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *searchNames;
  id v5;

  searchNames = self->_searchNames;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", searchNames, CFSTR("searchNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_priorityDomainForSorting, CFSTR("priorityDomainForSorting"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_searchType, CFSTR("searchType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fetchContext, CFSTR("fetchContext"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeContacts, CFSTR("includeContacts"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeRecents, CFSTR("includeRecents"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeStewie, CFSTR("includeStewie"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeSuggestions, CFSTR("includeSuggestions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeLocalExtensions, CFSTR("includeLocalExtensions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeDirectoryServers, CFSTR("includeDirectoryServers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeCalendarServers, CFSTR("includeCalendarServers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includePredictions, CFSTR("includePredictions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shouldIncludeGroupResultsImpl, CFSTR("shouldIncludeGroupResultsImpl"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[CNAutocompleteFetchRequest addressableGroupResultStyle](self, "addressableGroupResultStyle"), CFSTR("addressableGroupResultStyle"));

}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchRequest searchNames](self, "searchNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("search names"), v4);

  -[CNAutocompleteFetchRequest includeDebugString](self, "includeDebugString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("include"), v6);

  -[CNAutocompleteFetchRequest searchTypeDebugString](self, "searchTypeDebugString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("search type"), v8);

  -[CNAutocompleteFetchRequest priorityDomainForSorting](self, "priorityDomainForSorting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("priority domain"), v10);

  -[CNAutocompleteFetchRequest fetchContext](self, "fetchContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("fetch context"), v12);

  -[CNAutocompleteFetchRequest shouldIncludeGroupResultsDebugString](self, "shouldIncludeGroupResultsDebugString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("shouldIncludeGroupResults"), v14);

  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)includeDebugString
{
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNAutocompleteFetchRequest includeRecents](self, "includeRecents"))
    objc_msgSend(v3, "addObject:", CFSTR("Recents"));
  if (-[CNAutocompleteFetchRequest includeStewie](self, "includeStewie"))
    objc_msgSend(v3, "addObject:", CFSTR("Stewie"));
  if (-[CNAutocompleteFetchRequest includeContacts](self, "includeContacts"))
    objc_msgSend(v3, "addObject:", CFSTR("Contacts"));
  if (-[CNAutocompleteFetchRequest includeSuggestions](self, "includeSuggestions"))
    objc_msgSend(v3, "addObject:", CFSTR("Suggestions"));
  if (-[CNAutocompleteFetchRequest includeLocalExtensions](self, "includeLocalExtensions"))
    objc_msgSend(v3, "addObject:", CFSTR("Local Extensions"));
  if (-[CNAutocompleteFetchRequest includeDirectoryServers](self, "includeDirectoryServers"))
    objc_msgSend(v3, "addObject:", CFSTR("Directory Servers"));
  if (-[CNAutocompleteFetchRequest includeCalendarServers](self, "includeCalendarServers"))
    objc_msgSend(v3, "addObject:", CFSTR("Calendar Servers"));
  if (-[CNAutocompleteFetchRequest includePredictions](self, "includePredictions"))
    objc_msgSend(v3, "addObject:", CFSTR("Duet"));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("+"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("none");
  }

  return v4;
}

- (id)searchTypeDebugString
{
  unint64_t v2;

  v2 = -[CNAutocompleteFetchRequest searchType](self, "searchType");
  if (v2 > 5)
    return CFSTR("unknown");
  else
    return off_1E70DEFD0[v2];
}

- (id)shouldIncludeGroupResultsDebugString
{
  _BOOL4 v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = -[CNAutocompleteFetchRequest shouldIncludeGroupResults](self, "shouldIncludeGroupResults");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  if (self->_shouldIncludeGroupResultsImpl)
    v5 = CFSTR("explicit");
  else
    v5 = CFSTR("implicit");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5);
}

- (BOOL)shouldIncludeGroupResults
{
  NSNumber *shouldIncludeGroupResultsImpl;

  shouldIncludeGroupResultsImpl = self->_shouldIncludeGroupResultsImpl;
  return !shouldIncludeGroupResultsImpl || -[NSNumber BOOLValue](shouldIncludeGroupResultsImpl, "BOOLValue");
}

- (void)setShouldIncludeGroupResults:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *shouldIncludeGroupResultsImpl;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  shouldIncludeGroupResultsImpl = self->_shouldIncludeGroupResultsImpl;
  self->_shouldIncludeGroupResultsImpl = v4;

}

- (void)setSendingAddress:(id)a3
{
  CNAutocompleteFetchContext *v4;
  id v5;

  v5 = a3;
  -[CNAutocompleteFetchRequest fetchContext](self, "fetchContext");
  v4 = (CNAutocompleteFetchContext *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(CNAutocompleteFetchContext);
    -[CNAutocompleteFetchRequest setFetchContext:](self, "setFetchContext:", v4);
  }
  -[CNAutocompleteFetchContext setSendingAddress:](v4, "setSendingAddress:", v5);

}

- (NSString)sendingAddress
{
  void *v2;
  void *v3;

  -[CNAutocompleteFetchRequest fetchContext](self, "fetchContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendingAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)searchNames
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSearchNames:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)priorityDomainForSorting
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPriorityDomainForSorting:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (unint64_t)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(unint64_t)a3
{
  self->_searchType = a3;
}

- (CNAutocompleteFetchContext)fetchContext
{
  return (CNAutocompleteFetchContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFetchContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)includeContacts
{
  return self->_includeContacts;
}

- (void)setIncludeContacts:(BOOL)a3
{
  self->_includeContacts = a3;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (void)setIncludeRecents:(BOOL)a3
{
  self->_includeRecents = a3;
}

- (BOOL)includeStewie
{
  return self->_includeStewie;
}

- (void)setIncludeStewie:(BOOL)a3
{
  self->_includeStewie = a3;
}

- (BOOL)includeSuggestions
{
  return self->_includeSuggestions;
}

- (void)setIncludeSuggestions:(BOOL)a3
{
  self->_includeSuggestions = a3;
}

- (BOOL)includeLocalExtensions
{
  return self->_includeLocalExtensions;
}

- (void)setIncludeLocalExtensions:(BOOL)a3
{
  self->_includeLocalExtensions = a3;
}

- (BOOL)includeDirectoryServers
{
  return self->_includeDirectoryServers;
}

- (void)setIncludeDirectoryServers:(BOOL)a3
{
  self->_includeDirectoryServers = a3;
}

- (BOOL)includeCalendarServers
{
  return self->_includeCalendarServers;
}

- (void)setIncludeCalendarServers:(BOOL)a3
{
  self->_includeCalendarServers = a3;
}

- (BOOL)includePredictions
{
  return self->_includePredictions;
}

- (void)setIncludePredictions:(BOOL)a3
{
  self->_includePredictions = a3;
}

- (int64_t)addressableGroupResultStyle
{
  return self->_addressableGroupResultStyle;
}

- (void)setAddressableGroupResultStyle:(int64_t)a3
{
  self->_addressableGroupResultStyle = a3;
}

- (NSString)triageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triageIdentifier, 0);
  objc_storeStrong((id *)&self->_shouldIncludeGroupResultsImpl, 0);
  objc_storeStrong((id *)&self->_fetchContext, 0);
  objc_storeStrong((id *)&self->_priorityDomainForSorting, 0);
  objc_storeStrong((id *)&self->_searchNames, 0);
}

@end
