@implementation CRSearchQuery

- (_NSRange)pageRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_pageRange.length;
  location = self->_pageRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)implicitGroupThreshold
{
  return self->_implicitGroupThreshold;
}

- (NSArray)domains
{
  return self->_domains;
}

- (void)encodeWithCoder:(id)a3
{
  CRSearchPredicate *searchPredicate;
  id v5;

  searchPredicate = self->_searchPredicate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", searchPredicate, CFSTR("searchPredicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domains, CFSTR("domains"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_implicitGroupThreshold, CFSTR("implicitGroupThreshold"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_pageRange.location, CFSTR("page.location"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_pageRange.length, CFSTR("page.length"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));

}

- (NSPredicate)predicate
{
  NSPredicate *v3;
  NSPredicate *v4;
  NSPredicate *predicate;

  v3 = self->_predicate;
  if (!v3)
  {
    if (!self->_searchPredicateExpansionAttempted)
    {
      self->_searchPredicateExpansionAttempted = 1;
      -[CRSearchPredicate asNSPredicate](self->_searchPredicate, "asNSPredicate");
      v4 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
      predicate = self->_predicate;
      self->_predicate = v4;

    }
    v3 = self->_predicate;
  }
  return v3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)weightDecayer
{
  return self->_weightDecayer;
}

- (id)comparator
{
  return self->_comparator;
}

+ (id)searchQueryForSearchTerm:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5 recentsDomain:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CRSearchQuery *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "length") && objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRSearchPredicate predicateForKey:inCollection:](CRSearchPredicate, "predicateForKey:inCollection:", CFSTR("kind"), v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    objc_msgSend(v10, "_cn_trimmedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRSearchPredicate predicateForKey:matchingText:comparison:](CRSearchPredicate, "predicateForKey:matchingText:comparison:", CFSTR("displayName"), v16, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

    +[CRSearchPredicate predicateForKey:matchingText:comparison:](CRSearchPredicate, "predicateForKey:matchingText:comparison:", CFSTR("address"), v16, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v19);

    if (objc_msgSend(v11, "containsObject:", CFSTR("group")))
    {
      +[CRSearchPredicate predicateForKey:matchingText:comparison:](CRSearchPredicate, "predicateForKey:matchingText:comparison:", CFSTR("groupName"), v16, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v20);

    }
    +[CRSearchPredicate predicateSatisfyingAnySubpredicate:](CRSearchPredicate, "predicateSatisfyingAnySubpredicate:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v21);

    v22 = objc_alloc_init(CRSearchQuery);
    +[CRSearchPredicate predicateSatisfyingAllSubpredicates:](CRSearchPredicate, "predicateSatisfyingAllSubpredicates:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSearchQuery setSearchPredicate:](v22, "setSearchPredicate:", v23);

    v27[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSearchQuery setDomains:](v22, "setDomains:", v24);

    objc_msgSend(a1, "frecencyComparatorForSearch:preferredKinds:sendingAddress:queryOptions:", v16, v11, v12, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSearchQuery setComparator:](v22, "setComparator:", v25);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)setComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CRSearchQuery)init
{
  CRSearchQuery *v2;
  CRSearchQuery *v3;
  void *v4;
  uint64_t v5;
  NSString *uuid;
  CRSearchQuery *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRSearchQuery;
  v2 = -[CRSearchQuery init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_pageRange = (_NSRange)xmmword_1A494BF40;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    uuid = v3->_uuid;
    v3->_uuid = (NSString *)v5;

    v7 = v3;
  }

  return v3;
}

- (void)setSearchPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_searchPredicate, a3);
}

- (void)setDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CRSearchQuery)initWithCoder:(id)a3
{
  id v4;
  CRSearchQuery *v5;
  uint64_t v6;
  CRSearchPredicate *searchPredicate;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *domains;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *uuid;
  CRSearchQuery *v18;

  v4 = a3;
  v5 = -[CRSearchQuery init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchPredicate"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchPredicate = v5->_searchPredicate;
    v5->_searchPredicate = (CRSearchPredicate *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("domains"));
    v11 = objc_claimAutoreleasedReturnValue();
    domains = v5->_domains;
    v5->_domains = (NSArray *)v11;

    v5->_implicitGroupThreshold = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("implicitGroupThreshold"));
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    v13 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("page.location"));
    v14 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("page.length"));
    v5->_pageRange.location = v13;
    v5->_pageRange.length = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

+ (id)frecencyComparatorForSearch:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5 queryOptions:(unint64_t)a6
{
  char v6;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  char v25;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __88__CRSearchQuery_frecencyComparatorForSearch_preferredKinds_sendingAddress_queryOptions___block_invoke;
  v21 = &unk_1E4D32380;
  v22 = v10;
  v23 = v9;
  v24 = v11;
  v25 = v6 & 1;
  v12 = v11;
  v13 = v9;
  v14 = v10;
  v15 = (void *)MEMORY[0x1A85A3228](&v18);
  v16 = (void *)objc_msgSend(v15, "copy", v18, v19, v20, v21);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong(&self->_weightDecayer, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_searchPredicate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  CRSearchQuery *v4;
  CRSearchPredicate *searchPredicate;
  NSPredicate *predicate;
  NSArray *domains;
  BOOL v8;

  v4 = (CRSearchQuery *)a3;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  searchPredicate = self->_searchPredicate;
  if ((unint64_t)searchPredicate | (unint64_t)v4->_searchPredicate)
  {
    if (!-[CRSearchPredicate isEqual:](searchPredicate, "isEqual:"))
      goto LABEL_14;
  }
  predicate = self->_predicate;
  if ((unint64_t)predicate | (unint64_t)v4->_predicate)
  {
    if (!-[NSPredicate isEqual:](predicate, "isEqual:"))
      goto LABEL_14;
  }
  domains = self->_domains;
  if ((unint64_t)domains | (unint64_t)v4->_domains)
  {
    if (!-[NSArray isEqual:](domains, "isEqual:"))
      goto LABEL_14;
  }
  if (self->_implicitGroupThreshold != v4->_implicitGroupThreshold || self->_options != v4->_options)
    goto LABEL_14;
  v8 = 0;
  if (self->_pageRange.location == v4->_pageRange.location && self->_pageRange.length == v4->_pageRange.length)
  {
    if (self->_weightDecayer == v4->_weightDecayer)
    {
      v8 = self->_comparator == v4->_comparator;
      goto LABEL_16;
    }
LABEL_14:
    v8 = 0;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  char *v10;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_searchPredicate);
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_predicate) - v3 + 32 * v3;
  v5 = objc_msgSend(MEMORY[0x1E0D13A78], "arrayHash:", self->_domains);
  v6 = self->_implicitGroupThreshold - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  v7 = self->_options - v6 + 32 * v6;
  v8 = self->_pageRange.location - v7 + 32 * v7;
  v9 = self->_pageRange.length - v8 + 32 * v8;
  v10 = (char *)self->_weightDecayer + 32 * v9 - v9;
  return (char *)self->_comparator - (char *)v10 + 32 * (_QWORD)v10 + 0x198CB38E0830FLL;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRSearchQuery *v4;
  CRSearchQuery *v5;
  void *v6;

  v4 = objc_alloc_init(CRSearchQuery);
  v5 = v4;
  if (self->_searchPredicate)
    -[CRSearchQuery setSearchPredicate:](v4, "setSearchPredicate:");
  else
    -[CRSearchQuery setPredicate:](v4, "setPredicate:", self->_predicate);
  v6 = (void *)-[NSArray copy](self->_domains, "copy");
  -[CRSearchQuery setDomains:](v5, "setDomains:", v6);

  -[CRSearchQuery setImplicitGroupThreshold:](v5, "setImplicitGroupThreshold:", self->_implicitGroupThreshold);
  -[CRSearchQuery setOptions:](v5, "setOptions:", self->_options);
  -[CRSearchQuery setPageRange:](v5, "setPageRange:", self->_pageRange.location, self->_pageRange.length);
  -[CRSearchQuery setWeightDecayer:](v5, "setWeightDecayer:", self->_weightDecayer);
  -[CRSearchQuery setComparator:](v5, "setComparator:", self->_comparator);
  return v5;
}

+ (id)frecencyComparator
{
  return &__block_literal_global_1;
}

uint64_t __88__CRSearchQuery_frecencyComparatorForSearch_preferredKinds_sendingAddress_queryOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _internalFrecency(a2, a3, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

+ (id)rankedFrecencyComparatorWithPreferredSources:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__CRSearchQuery_rankedFrecencyComparatorWithPreferredSources___block_invoke;
  v8[3] = &unk_1E4D323A8;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A85A3228](v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

uint64_t __62__CRSearchQuery_rankedFrecencyComparatorWithPreferredSources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  unint64_t v28;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "decayedWeight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v9, "decayedWeight");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  if (vabdd_f64(v13, v16) > 0.1)
  {
    if (v13 <= v16)
      v17 = 1;
    else
      v17 = -1;
    goto LABEL_20;
  }
  if (!objc_msgSend(v10, "count"))
    goto LABEL_14;
  objc_msgSend(v8, "originalSource");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (__CFString *)v18;
  else
    v20 = CFSTR("<null>");
  v21 = v20;

  objc_msgSend(v9, "originalSource");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (__CFString *)v22;
  else
    v24 = CFSTR("<null>");
  v25 = v24;

  if (-[__CFString isEqualToString:](v21, "isEqualToString:", v25))
  {

LABEL_14:
    objc_msgSend(v9, "mostRecentDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mostRecentDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v26, "compare:", v27);

    if (!v17)
      v17 = _internalFrecency(v8, v9, 0, 0, 0, 0);
    goto LABEL_20;
  }
  v28 = objc_msgSend(v10, "indexOfObject:", v21);
  if (v28 < objc_msgSend(v10, "indexOfObject:", v25))
    v17 = -1;
  else
    v17 = 1;

LABEL_20:
  return v17;
}

- (CRSearchPredicate)searchPredicate
{
  return self->_searchPredicate;
}

- (void)setImplicitGroupThreshold:(unint64_t)a3
{
  self->_implicitGroupThreshold = a3;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setPageRange:(_NSRange)a3
{
  self->_pageRange = a3;
}

- (void)setWeightDecayer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
