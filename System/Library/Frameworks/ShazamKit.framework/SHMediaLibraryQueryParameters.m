@implementation SHMediaLibraryQueryParameters

+ (id)defaultParameters
{
  return -[SHMediaLibraryQueryParameters initWithResultsLimit:]([SHMediaLibraryQueryParameters alloc], "initWithResultsLimit:", 0x7FFFFFFFFFFFFFFFLL);
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3
{
  SHMediaLibraryQueryParameters *v4;
  SHMediaLibraryQueryParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SHMediaLibraryQueryParameters;
  v4 = -[SHMediaLibraryQueryParameters init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SHMediaLibraryQueryParameters commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:](v4, "commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:", a3, 3, 0, 0, 0);
  return v5;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4
{
  SHMediaLibraryQueryParameters *v6;
  SHMediaLibraryQueryParameters *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SHMediaLibraryQueryParameters;
  v6 = -[SHMediaLibraryQueryParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    -[SHMediaLibraryQueryParameters commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:](v6, "commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:", a3, a4, 0, 0, 0);
  return v7;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5
{
  _BOOL8 v5;
  SHMediaLibraryQueryParameters *v8;
  SHMediaLibraryQueryParameters *v9;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)SHMediaLibraryQueryParameters;
  v8 = -[SHMediaLibraryQueryParameters init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[SHMediaLibraryQueryParameters commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:](v8, "commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:", a3, a4, v5, 0, 0);
  return v9;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 shouldUpdate:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  SHMediaLibraryQueryParameters *v10;
  SHMediaLibraryQueryParameters *v11;
  objc_super v13;

  v6 = a6;
  v7 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SHMediaLibraryQueryParameters;
  v10 = -[SHMediaLibraryQueryParameters init](&v13, sel_init);
  v11 = v10;
  if (v10)
    -[SHMediaLibraryQueryParameters commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:](v10, "commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:", a3, a4, v7, v6, 0);
  return v11;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 shouldUpdate:(BOOL)a6 providerIdentifier:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  SHMediaLibraryQueryParameters *v13;
  SHMediaLibraryQueryParameters *v14;
  objc_super v16;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)SHMediaLibraryQueryParameters;
  v13 = -[SHMediaLibraryQueryParameters init](&v16, sel_init);
  v14 = v13;
  if (v13)
    -[SHMediaLibraryQueryParameters commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:](v13, "commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:", a3, a4, v8, v7, v12);

  return v14;
}

- (void)commonInitWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 shouldUpdate:(BOOL)a6 providerIdentifier:(id)a7
{
  NSString *v12;
  NSString *providerIdentifier;
  id v14;

  v12 = (NSString *)a7;
  if (!-[SHMediaLibraryQueryParameters validateLimit:](self, "validateLimit:", a3))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Limit must be a non-negative number"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  self->_resultsLimit = a3;
  self->_filterOptions = a4;
  self->_ascending = a5;
  self->_shouldUpdate = a6;
  providerIdentifier = self->_providerIdentifier;
  self->_providerIdentifier = v12;

}

- (BOOL)validateLimit:(int64_t)a3
{
  return a3 >= 0;
}

- (SHMediaLibraryQueryParameters)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SHMediaLibraryQueryParameters *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SHMediaLibraryQueryDescriptorLimit"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryQueryDescriptorFilterOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SHMediaLibraryQueryDescriptorAscending"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SHMediaLibraryQueryDescriptorShouldUpdate"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryQueryDescriptorProviderIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SHMediaLibraryQueryParameters initWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:](self, "initWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:", v5, objc_msgSend(v6, "unsignedIntegerValue"), v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t resultsLimit;
  void *v5;
  id v6;

  resultsLimit = self->_resultsLimit;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", resultsLimit, CFSTR("SHMediaLibraryQueryDescriptorLimit"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_filterOptions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("SHMediaLibraryQueryDescriptorFilterOptions"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_ascending, CFSTR("SHMediaLibraryQueryDescriptorAscending"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldUpdate, CFSTR("SHMediaLibraryQueryDescriptorShouldUpdate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_providerIdentifier, CFSTR("SHMediaLibraryQueryDescriptorProviderIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHMediaLibraryQueryParameters *v5;
  int64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  SHMediaLibraryQueryParameters *v12;

  v5 = +[SHMediaLibraryQueryParameters allocWithZone:](SHMediaLibraryQueryParameters, "allocWithZone:");
  v6 = -[SHMediaLibraryQueryParameters resultsLimit](self, "resultsLimit");
  v7 = -[SHMediaLibraryQueryParameters filterOptions](self, "filterOptions");
  v8 = -[SHMediaLibraryQueryParameters ascending](self, "ascending");
  v9 = -[SHMediaLibraryQueryParameters shouldUpdate](self, "shouldUpdate");
  -[SHMediaLibraryQueryParameters providerIdentifier](self, "providerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  v12 = -[SHMediaLibraryQueryParameters initWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:](v5, "initWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:", v6, v7, v8, v9, v11);

  return v12;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 providerIdentifier:(id)a6
{
  _BOOL8 v6;
  id v10;
  SHMediaLibraryQueryParameters *v11;
  SHMediaLibraryQueryParameters *v12;
  objc_super v14;

  v6 = a5;
  v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)SHMediaLibraryQueryParameters;
  v11 = -[SHMediaLibraryQueryParameters init](&v14, sel_init);
  v12 = v11;
  if (v11)
    -[SHMediaLibraryQueryParameters commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:](v11, "commonInitWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:", a3, a4, v6, 0, v10);

  return v12;
}

- (int64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (BOOL)shouldUpdate
{
  return self->_shouldUpdate;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
}

@end
