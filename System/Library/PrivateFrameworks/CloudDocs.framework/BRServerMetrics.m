@implementation BRServerMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithServerMetrics:", self);
}

- (BRServerMetrics)initWithServerMetrics:(id)a3
{
  id v4;
  BRServerMetrics *v5;
  uint64_t v6;
  NSNumber *quotaUsed;
  uint64_t v8;
  NSNumber *recursiveChildCount;
  uint64_t v10;
  NSNumber *sharedByMeRecursiveCount;
  uint64_t v12;
  NSNumber *sharedAliasRecursiveCount;
  uint64_t v14;
  NSNumber *childCount;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRServerMetrics;
  v5 = -[BRServerMetrics init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "quotaUsed");
    v6 = objc_claimAutoreleasedReturnValue();
    quotaUsed = v5->_quotaUsed;
    v5->_quotaUsed = (NSNumber *)v6;

    objc_msgSend(v4, "recursiveChildCount");
    v8 = objc_claimAutoreleasedReturnValue();
    recursiveChildCount = v5->_recursiveChildCount;
    v5->_recursiveChildCount = (NSNumber *)v8;

    objc_msgSend(v4, "sharedByMeRecursiveCount");
    v10 = objc_claimAutoreleasedReturnValue();
    sharedByMeRecursiveCount = v5->_sharedByMeRecursiveCount;
    v5->_sharedByMeRecursiveCount = (NSNumber *)v10;

    objc_msgSend(v4, "sharedAliasRecursiveCount");
    v12 = objc_claimAutoreleasedReturnValue();
    sharedAliasRecursiveCount = v5->_sharedAliasRecursiveCount;
    v5->_sharedAliasRecursiveCount = (NSNumber *)v12;

    objc_msgSend(v4, "childCount");
    v14 = objc_claimAutoreleasedReturnValue();
    childCount = v5->_childCount;
    v5->_childCount = (NSNumber *)v14;

  }
  return v5;
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4;
  id v6;
  BRServerMetrics *v7;
  uint64_t v8;
  NSNumber *quotaUsed;
  uint64_t v10;
  NSNumber *recursiveChildCount;
  uint64_t v12;
  NSNumber *sharedByMeRecursiveCount;
  uint64_t v14;
  NSNumber *sharedAliasRecursiveCount;
  uint64_t v16;
  NSNumber *childCount;
  objc_super v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRServerMetrics;
  v7 = -[BRServerMetrics init](&v19, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "numberAtIndex:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    quotaUsed = v7->_quotaUsed;
    v7->_quotaUsed = (NSNumber *)v8;

    objc_msgSend(v6, "numberAtIndex:", (v4 + 1));
    v10 = objc_claimAutoreleasedReturnValue();
    recursiveChildCount = v7->_recursiveChildCount;
    v7->_recursiveChildCount = (NSNumber *)v10;

    objc_msgSend(v6, "numberAtIndex:", (v4 + 2));
    v12 = objc_claimAutoreleasedReturnValue();
    sharedByMeRecursiveCount = v7->_sharedByMeRecursiveCount;
    v7->_sharedByMeRecursiveCount = (NSNumber *)v12;

    objc_msgSend(v6, "numberAtIndex:", (v4 + 3));
    v14 = objc_claimAutoreleasedReturnValue();
    sharedAliasRecursiveCount = v7->_sharedAliasRecursiveCount;
    v7->_sharedAliasRecursiveCount = (NSNumber *)v14;

    objc_msgSend(v6, "numberAtIndex:", (v4 + 4));
    v16 = objc_claimAutoreleasedReturnValue();
    childCount = v7->_childCount;
    v7->_childCount = (NSNumber *)v16;

  }
  return v7;
}

- (BRServerMetrics)initWithCoder:(id)a3
{
  id v4;
  BRServerMetrics *v5;
  uint64_t v6;
  NSNumber *quotaUsed;
  uint64_t v8;
  NSNumber *recursiveChildCount;
  uint64_t v10;
  NSNumber *sharedByMeRecursiveCount;
  uint64_t v12;
  NSNumber *sharedAliasRecursiveCount;
  uint64_t v14;
  NSNumber *childCount;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRServerMetrics;
  v5 = -[BRServerMetrics init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quota-used"));
    v6 = objc_claimAutoreleasedReturnValue();
    quotaUsed = v5->_quotaUsed;
    v5->_quotaUsed = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rec-child-count"));
    v8 = objc_claimAutoreleasedReturnValue();
    recursiveChildCount = v5->_recursiveChildCount;
    v5->_recursiveChildCount = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shared-by-me"));
    v10 = objc_claimAutoreleasedReturnValue();
    sharedByMeRecursiveCount = v5->_sharedByMeRecursiveCount;
    v5->_sharedByMeRecursiveCount = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shared-alias"));
    v12 = objc_claimAutoreleasedReturnValue();
    sharedAliasRecursiveCount = v5->_sharedAliasRecursiveCount;
    v5->_sharedAliasRecursiveCount = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("child-count"));
    v14 = objc_claimAutoreleasedReturnValue();
    childCount = v5->_childCount;
    v5->_childCount = (NSNumber *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *quotaUsed;
  id v5;

  quotaUsed = self->_quotaUsed;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", quotaUsed, CFSTR("quota-used"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recursiveChildCount, CFSTR("rec-child-count"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedByMeRecursiveCount, CFSTR("shared-by-me"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedAliasRecursiveCount, CFSTR("shared-alias"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_childCount, CFSTR("child-count"));

}

- (id)description
{
  void *v3;
  NSNumber *quotaUsed;
  NSNumber *recursiveChildCount;
  NSNumber *sharedByMeRecursiveCount;
  NSNumber *sharedAliasRecursiveCount;
  NSNumber *childCount;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 64);
  quotaUsed = self->_quotaUsed;
  if (quotaUsed)
    objc_msgSend(v3, "appendFormat:", CFSTR("qta:%llu "), -[NSNumber unsignedLongLongValue](quotaUsed, "unsignedLongLongValue"));
  recursiveChildCount = self->_recursiveChildCount;
  if (recursiveChildCount)
    objc_msgSend(v3, "appendFormat:", CFSTR("rcc:%llu "), -[NSNumber unsignedLongLongValue](recursiveChildCount, "unsignedLongLongValue"));
  sharedByMeRecursiveCount = self->_sharedByMeRecursiveCount;
  if (sharedByMeRecursiveCount)
    objc_msgSend(v3, "appendFormat:", CFSTR("sbm:%llu "), -[NSNumber unsignedLongLongValue](sharedByMeRecursiveCount, "unsignedLongLongValue"));
  sharedAliasRecursiveCount = self->_sharedAliasRecursiveCount;
  if (sharedAliasRecursiveCount)
    objc_msgSend(v3, "appendFormat:", CFSTR("stm:%llu "), -[NSNumber unsignedLongLongValue](sharedAliasRecursiveCount, "unsignedLongLongValue"));
  childCount = self->_childCount;
  if (childCount)
    objc_msgSend(v3, "appendFormat:", CFSTR("cc:%llu "), -[NSNumber unsignedLongLongValue](childCount, "unsignedLongLongValue"));
  return v3;
}

- (NSNumber)quotaUsed
{
  return self->_quotaUsed;
}

- (void)setQuotaUsed:(id)a3
{
  objc_storeStrong((id *)&self->_quotaUsed, a3);
}

- (NSNumber)recursiveChildCount
{
  return self->_recursiveChildCount;
}

- (void)setRecursiveChildCount:(id)a3
{
  objc_storeStrong((id *)&self->_recursiveChildCount, a3);
}

- (NSNumber)sharedByMeRecursiveCount
{
  return self->_sharedByMeRecursiveCount;
}

- (void)setSharedByMeRecursiveCount:(id)a3
{
  objc_storeStrong((id *)&self->_sharedByMeRecursiveCount, a3);
}

- (NSNumber)sharedAliasRecursiveCount
{
  return self->_sharedAliasRecursiveCount;
}

- (void)setSharedAliasRecursiveCount:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAliasRecursiveCount, a3);
}

- (NSNumber)childCount
{
  return self->_childCount;
}

- (void)setChildCount:(id)a3
{
  objc_storeStrong((id *)&self->_childCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childCount, 0);
  objc_storeStrong((id *)&self->_sharedAliasRecursiveCount, 0);
  objc_storeStrong((id *)&self->_sharedByMeRecursiveCount, 0);
  objc_storeStrong((id *)&self->_recursiveChildCount, 0);
  objc_storeStrong((id *)&self->_quotaUsed, 0);
}

@end
