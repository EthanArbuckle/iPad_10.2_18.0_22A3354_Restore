@implementation ASDPurchaseHistoryQuery

- (void)setSortOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void)setIsPreorder:(int64_t)a3
{
  self->_isPreorder = a3;
}

- (void)setIsHidden:(int64_t)a3
{
  self->_isHidden = a3;
}

- (void)setIsFirstParty:(int64_t)a3
{
  self->_isFirstParty = a3;
}

- (void)setAccountID:(int64_t)a3
{
  self->_accountID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIDs, 0);
  objc_storeStrong((id *)&self->_sortOptions, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t accountID;
  id v5;

  accountID = self->_accountID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", accountID, CFSTR("A"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_isFirstParty, CFSTR("B"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_isHidden, CFSTR("C"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_optedInForMacOSEligibility, CFSTR("H"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_optedInForXROSEligibility, CFSTR("I"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_isPreorder, CFSTR("D"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_searchTerm, CFSTR("E"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sortOptions, CFSTR("F"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportsRealityDevice, CFSTR("L"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeIDs, CFSTR("G"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_currentlyOptedInForMacOSEligibility, CFSTR("J"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_currentlyOptedInForXROSEligibility, CFSTR("K"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIDs, CFSTR("M"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_includeArcade, CFSTR("N"));

}

- (ASDPurchaseHistoryQuery)initWithCoder:(id)a3
{
  id v4;
  ASDPurchaseHistoryQuery *v5;
  uint64_t v6;
  NSString *searchTerm;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *sortOptions;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *storeIDs;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *bundleIDs;
  objc_super v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDPurchaseHistoryQuery;
  v5 = -[ASDPurchaseHistoryQuery init](&v24, sel_init);
  if (v5)
  {
    v5->_accountID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("A"));
    v5->_isFirstParty = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("B"));
    v5->_isHidden = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("C"));
    v5->_optedInForMacOSEligibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("H"));
    v5->_optedInForXROSEligibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("I"));
    v5->_isPreorder = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("D"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("E"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchTerm = v5->_searchTerm;
    v5->_searchTerm = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("F"));
    v11 = objc_claimAutoreleasedReturnValue();
    sortOptions = v5->_sortOptions;
    v5->_sortOptions = (NSArray *)v11;

    v5->_supportsRealityDevice = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("L"));
    v13 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("G"));
    v16 = objc_claimAutoreleasedReturnValue();
    storeIDs = v5->_storeIDs;
    v5->_storeIDs = (NSArray *)v16;

    v5->_currentlyOptedInForMacOSEligibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("J"));
    v5->_currentlyOptedInForXROSEligibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("K"));
    v18 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("M"));
    v21 = objc_claimAutoreleasedReturnValue();
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v21;

    v5->_includeArcade = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("N"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  objc_super v23;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("accountID = %lld"), -[ASDPurchaseHistoryQuery accountID](self, "accountID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isFirstParty = %ld"), -[ASDPurchaseHistoryQuery isFirstParty](self, "isFirstParty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isHidden = %ld"), -[ASDPurchaseHistoryQuery isHidden](self, "isHidden"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isPreorder = %ld"), -[ASDPurchaseHistoryQuery isPreorder](self, "isPreorder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[ASDPurchaseHistoryQuery searchTerm](self, "searchTerm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("searchTerm = %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[ASDPurchaseHistoryQuery storeIDs](self, "storeIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("storeIDs = %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[ASDPurchaseHistoryQuery bundleIDs](self, "bundleIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("bundleIDs = %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("includeArcade = %ld"), -[ASDPurchaseHistoryQuery includeArcade](self, "includeArcade"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  v18 = (void *)MEMORY[0x1E0CB3940];
  v23.receiver = self;
  v23.super_class = (Class)ASDPurchaseHistoryQuery;
  -[ASDPurchaseHistoryQuery description](&v23, sel_description);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: {%@}"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (int64_t)accountID
{
  return self->_accountID;
}

- (NSArray)bundleIDs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (int64_t)includeArcade
{
  return self->_includeArcade;
}

- (void)setIncludeArcade:(int64_t)a3
{
  self->_includeArcade = a3;
}

- (int64_t)isFirstParty
{
  return self->_isFirstParty;
}

- (int64_t)isHidden
{
  return self->_isHidden;
}

- (int64_t)currentlyOptedInForMacOSEligibility
{
  return self->_currentlyOptedInForMacOSEligibility;
}

- (void)setCurrentlyOptedInForMacOSEligibility:(int64_t)a3
{
  self->_currentlyOptedInForMacOSEligibility = a3;
}

- (int64_t)currentlyOptedInForXROSEligibility
{
  return self->_currentlyOptedInForXROSEligibility;
}

- (void)setCurrentlyOptedInForXROSEligibility:(int64_t)a3
{
  self->_currentlyOptedInForXROSEligibility = a3;
}

- (int64_t)optedInForMacOSEligibility
{
  return self->_optedInForMacOSEligibility;
}

- (void)setOptedInForMacOSEligibility:(int64_t)a3
{
  self->_optedInForMacOSEligibility = a3;
}

- (int64_t)optedInForXROSEligibility
{
  return self->_optedInForXROSEligibility;
}

- (void)setOptedInForXROSEligibility:(int64_t)a3
{
  self->_optedInForXROSEligibility = a3;
}

- (int64_t)isPreorder
{
  return self->_isPreorder;
}

- (NSString)searchTerm
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSearchTerm:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSArray)sortOptions
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (int64_t)supportsRealityDevice
{
  return self->_supportsRealityDevice;
}

- (void)setSupportsRealityDevice:(int64_t)a3
{
  self->_supportsRealityDevice = a3;
}

- (NSArray)storeIDs
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setStoreIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

@end
