@implementation CPLScopeStatusCounts

- (CPLScopeStatusCounts)initWithFlagsCounts:(id)a3
{
  id v4;
  CPLScopeStatusCounts *v5;
  uint64_t v6;
  NSDictionary *countPerFlags;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLScopeStatusCounts;
  v5 = -[CPLScopeStatusCounts init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    countPerFlags = v5->_countPerFlags;
    v5->_countPerFlags = (NSDictionary *)v6;

  }
  return v5;
}

- (CPLScopeStatusCounts)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  CPLScopeStatusCounts *v7;

  v4 = initWithCoder__onceToken_21713;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&initWithCoder__onceToken_21713, &__block_literal_global_21714);
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", initWithCoder__countPerFlagsClasses, CFSTR("counts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CPLScopeStatusCounts initWithFlagsCounts:](self, "initWithFlagsCounts:", v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_countPerFlags, CFSTR("counts"));
}

- (void)_computeSummariesIfNecessary
{
  NSDictionary *countPerFlags;
  _QWORD v4[5];

  if (!self->_hasCachedSummaries)
  {
    countPerFlags = self->_countPerFlags;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52__CPLScopeStatusCounts__computeSummariesIfNecessary__block_invoke;
    v4[3] = &unk_1E60DDD18;
    v4[4] = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](countPerFlags, "enumerateKeysAndObjectsUsingBlock:", v4);
    self->_hasCachedSummaries = 1;
  }
}

- (unint64_t)countOfSharingRecords
{
  -[CPLScopeStatusCounts _computeSummariesIfNecessary](self, "_computeSummariesIfNecessary");
  return self->_countOfSharingRecords;
}

- (unint64_t)countOfUnsharingRecords
{
  -[CPLScopeStatusCounts _computeSummariesIfNecessary](self, "_computeSummariesIfNecessary");
  return self->_countOfUnsharingRecords;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ "), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLScopeStatusCounts _computeSummariesIfNecessary](self, "_computeSummariesIfNecessary");
  objc_msgSend(v3, "appendFormat:", CFSTR("sharing records: %tu / unsharing records: %tu"), self->_countOfSharingRecords, self->_countOfUnsharingRecords);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSDictionary)countPerFlags
{
  return self->_countPerFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countPerFlags, 0);
}

void __52__CPLScopeStatusCounts__computeSummariesIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  if ((v5 & 1) != 0)
  {
    v7 = 16;
    v6 = v9;
    goto LABEL_5;
  }
  v6 = v9;
  if ((v5 & 2) != 0)
  {
    v7 = 24;
LABEL_5:
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
    v6 = v9;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + v7) += v8;
  }

}

void __38__CPLScopeStatusCounts_initWithCoder___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  v3 = (void *)initWithCoder__countPerFlagsClasses;
  initWithCoder__countPerFlagsClasses = v2;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
