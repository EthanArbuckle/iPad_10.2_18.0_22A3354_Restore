@implementation MSPMutableHistoryEntrySearch

+ (Class)immutableObjectClass
{
  return 0;
}

+ (id)immutableObjectProtocol
{
  return &unk_1EF0835E8;
}

+ (Class)mutableObjectClass
{
  return (Class)objc_opt_class();
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (MSPMutableHistoryEntrySearch)initWithStorage:(id)a3
{
  MSPHistoryEntryStorage *v4;
  MSPQuerySearch *v5;
  MSPMutableHistoryEntrySearch *v6;
  MSPMutableHistoryEntrySearch *v7;
  objc_super v9;

  v4 = (MSPHistoryEntryStorage *)a3;
  if (!v4)
  {
    v4 = objc_alloc_init(MSPHistoryEntryStorage);
    -[MSPHistoryEntryStorage setSearchType:](v4, "setSearchType:", 1);
    v5 = objc_alloc_init(MSPQuerySearch);
    -[MSPHistoryEntryStorage setQuerySearch:](v4, "setQuerySearch:", v5);

  }
  v9.receiver = self;
  v9.super_class = (Class)MSPMutableHistoryEntrySearch;
  v6 = -[MSPMutableHistoryEntry initWithStorage:](&v9, sel_initWithStorage_, v4);
  if (!v6)
    goto LABEL_6;
  if (-[MSPHistoryEntryStorage searchType](v4, "searchType") != 1)
  {
    v7 = 0;
    goto LABEL_8;
  }
  -[MSPHistoryEntryStorage querySearch](v4, "querySearch");
  v7 = (MSPMutableHistoryEntrySearch *)objc_claimAutoreleasedReturnValue();

  if (v7)
LABEL_6:
    v7 = v6;
LABEL_8:

  return v7;
}

- (NSString)query
{
  void *v2;
  void *v3;
  void *v4;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "querySearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MSPMutableHistoryEntry _noteWillMutate](self, "_noteWillMutate");
  v7 = (id)objc_msgSend(v4, "copy");

  -[MSPMutableHistoryEntry storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "querySearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQuery:", v7);

}

- (NSString)locationDisplayString
{
  void *v2;
  void *v3;
  void *v4;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "querySearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationDisplayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setLocationDisplayString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MSPMutableHistoryEntry _noteWillMutate](self, "_noteWillMutate");
  v7 = (id)objc_msgSend(v4, "copy");

  -[MSPMutableHistoryEntry storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "querySearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocationDisplayString:", v7);

}

- (NSString)languageCode
{
  void *v2;
  void *v3;
  void *v4;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "querySearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setLanguageCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MSPMutableHistoryEntry _noteWillMutate](self, "_noteWillMutate");
  v7 = (id)objc_msgSend(v4, "copy");

  -[MSPMutableHistoryEntry storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "querySearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLanguage:", v7);

}

- (GEOMapRegion)mapRegion
{
  void *v2;
  void *v3;
  void *v4;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "querySearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapRegion *)v4;
}

- (void)setMapRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MSPMutableHistoryEntry _noteWillMutate](self, "_noteWillMutate");
  v7 = (id)objc_msgSend(v4, "copy");

  -[MSPMutableHistoryEntry storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "querySearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMapRegion:", v7);

}

- (id)transferToImmutableIfValidWithError:(id *)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MSPMutableHistoryEntrySearch query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
    objc_msgSend(v5, "addObject:", CFSTR("query"));
  if (objc_msgSend(v5, "count"))
  {
    if (a3)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v11[0] = CFSTR("MSPContainerUntransferableObject");
      v11[1] = CFSTR("MSPContainerUnavailableKeys");
      v12[0] = self;
      v12[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MapsSupport.MSPContainer"), 1, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      a3 = 0;
    }
  }
  else
  {
    -[MSPMutableHistoryEntry _markImmutable](self, "_markImmutable");
    a3 = self;
  }

  return a3;
}

- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;

  v4 = a3;
  -[MSPMutableHistoryEntrySearch query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_1E6655688;
  v10 = v9;

  objc_msgSend(v4, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (__CFString *)v13;
  else
    v15 = &stru_1E6655688;
  v16 = v15;

  v17 = -[__CFString localizedCaseInsensitiveCompare:](v10, "localizedCaseInsensitiveCompare:", v16);
  return v17 == 0;
}

@end
