@implementation HKClinicalProviderSearchResultsPage

- (HKClinicalProviderSearchResultsPage)initWithSearchResults:(id)a3 from:(int64_t)a4 nextFrom:(int64_t)a5 size:(int64_t)a6
{
  id v10;
  HKClinicalProviderSearchResultsPage *v11;
  uint64_t v12;
  NSArray *searchResults;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKClinicalProviderSearchResultsPage;
  v11 = -[HKClinicalProviderSearchResultsPage init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    searchResults = v11->_searchResults;
    v11->_searchResults = (NSArray *)v12;

    v11->_from = a4;
    v11->_nextFrom = a5;
    v11->_size = a6;
  }

  return v11;
}

- (id)copyWithSearchResults:(id)a3
{
  id v4;
  HKClinicalProviderSearchResultsPage *v5;

  v4 = a3;
  v5 = -[HKClinicalProviderSearchResultsPage initWithSearchResults:from:nextFrom:size:]([HKClinicalProviderSearchResultsPage alloc], "initWithSearchResults:from:nextFrom:size:", v4, self->_from, self->_nextFrom, self->_size);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HKClinicalProviderSearchResultsPage searchResults](self, "searchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("SearchResultsKey"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[HKClinicalProviderSearchResultsPage from](self, "from"), CFSTR("FromKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[HKClinicalProviderSearchResultsPage nextFrom](self, "nextFrom"), CFSTR("NextFromKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[HKClinicalProviderSearchResultsPage size](self, "size"), CFSTR("SizeKey"));

}

- (HKClinicalProviderSearchResultsPage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKClinicalProviderSearchResultsPage *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("SearchResultsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("FromKey"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("NextFromKey"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("SizeKey")) & 1) != 0)
  {
    self = -[HKClinicalProviderSearchResultsPage initWithSearchResults:from:nextFrom:size:](self, "initWithSearchResults:from:nextFrom:size:", v6, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FromKey")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NextFromKey")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SizeKey")));
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (int64_t)from
{
  return self->_from;
}

- (int64_t)nextFrom
{
  return self->_nextFrom;
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
}

@end
