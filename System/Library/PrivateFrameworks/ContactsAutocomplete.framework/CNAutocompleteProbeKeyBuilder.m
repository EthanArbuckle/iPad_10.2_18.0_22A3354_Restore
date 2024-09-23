@implementation CNAutocompleteProbeKeyBuilder

+ (id)builderWithKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:", v4);

  return v5;
}

- (CNAutocompleteProbeKeyBuilder)init
{
  return -[CNAutocompleteProbeKeyBuilder initWithKey:](self, "initWithKey:", &stru_1E70E0E70);
}

- (CNAutocompleteProbeKeyBuilder)initWithKey:(id)a3
{
  id v5;
  CNAutocompleteProbeKeyBuilder *v6;
  CNAutocompleteProbeKeyBuilder *v7;
  NSArray *prefixes;
  NSArray *suffixes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNAutocompleteProbeKeyBuilder;
  v6 = -[CNAutocompleteProbeKeyBuilder init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_key, a3);
    prefixes = v7->_prefixes;
    v7->_prefixes = (NSArray *)MEMORY[0x1E0C9AA60];

    suffixes = v7->_suffixes;
    v7->_suffixes = (NSArray *)&unk_1E70F0000;

  }
  return v7;
}

- (void)useString:(id)a3 forSuffixAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[CNAutocompleteProbeKeyBuilder suffixes](self, "suffixes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v9, "replaceObjectAtIndex:withObject:", a4, v6);
  v8 = (void *)objc_msgSend(v9, "copy");
  -[CNAutocompleteProbeKeyBuilder setSuffixes:](self, "setSuffixes:", v8);

}

- (id)addDuetReturnedResults:(BOOL)a3
{
  __CFString **v4;

  v4 = CNAutocompleteProbeKeyUsageMonitorDuetReturnedResults;
  if (!a3)
    v4 = CNAutocompleteProbeKeyUsageMonitorNoResultsFromDuet;
  -[CNAutocompleteProbeKeyBuilder useString:forSuffixAtIndex:](self, "useString:forSuffixAtIndex:", *v4, 1);
  return self;
}

- (id)addBatchIndex:(unint64_t)a3
{
  void *v4;

  CNAutocompleteProbeBatchKey(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteProbeKeyBuilder useString:forSuffixAtIndex:](self, "useString:forSuffixAtIndex:", v4, 0);

  return self;
}

- (id)prediction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("prediction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteProbeKeyBuilder prefixes](self, "prefixes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteProbeKeyBuilder setPrefixes:](self, "setPrefixes:", v5);

  return self;
}

- (id)prefixedSearch
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("prefixed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteProbeKeyBuilder prefixes](self, "prefixes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteProbeKeyBuilder setPrefixes:](self, "setPrefixes:", v5);

  return self;
}

- (id)addDuetModelID
{
  void *v3;

  CNAutocompleteProbeDuetModelID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteProbeKeyBuilder useString:forSuffixAtIndex:](self, "useString:forSuffixAtIndex:", v3, 2);

  return self;
}

- (id)build
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CNAutocompleteProbeKeyBuilder prefixes](self, "prefixes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteProbeKeyBuilder key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  -[CNAutocompleteProbeKeyBuilder suffixes](self, "suffixes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_filter:", &__block_literal_global_17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v8);

  CNAutocompleteProbeBuildKey(v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __38__CNAutocompleteProbeKeyBuilder_build__block_invoke()
{
  return (*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))() ^ 1;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (void)setPrefixes:(id)a3
{
  objc_storeStrong((id *)&self->_prefixes, a3);
}

- (NSArray)suffixes
{
  return self->_suffixes;
}

- (void)setSuffixes:(id)a3
{
  objc_storeStrong((id *)&self->_suffixes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
