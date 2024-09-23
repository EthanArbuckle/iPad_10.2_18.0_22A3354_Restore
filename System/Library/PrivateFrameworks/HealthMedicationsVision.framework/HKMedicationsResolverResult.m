@implementation HKMedicationsResolverResult

- (id)description
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = -[HKMedicationsResolverResult looksGeneric](self, "looksGeneric");
  v4 = CFSTR("Not Generic");
  if (v3)
    v4 = CFSTR("Generic");
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationsResolverResult;
  v5 = v4;
  -[HKMedicationsResolverResult description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationsResolverResult resolvedIds](self, "resolvedIds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationsResolverResult usedNgrams](self, "usedNgrams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" %@ %@ %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)looksGeneric
{
  return self->_looksGeneric;
}

- (void)setLooksGeneric:(BOOL)a3
{
  self->_looksGeneric = a3;
}

- (NSArray)resolvedIds
{
  return self->_resolvedIds;
}

- (void)setResolvedIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)ngramList
{
  return self->_ngramList;
}

- (void)setNgramList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)numberOfNewNgrams
{
  return self->_numberOfNewNgrams;
}

- (void)setNumberOfNewNgrams:(int64_t)a3
{
  self->_numberOfNewNgrams = a3;
}

- (int64_t)numberOfUsedNgrams
{
  return self->_numberOfUsedNgrams;
}

- (void)setNumberOfUsedNgrams:(int64_t)a3
{
  self->_numberOfUsedNgrams = a3;
}

- (NSArray)usedNgrams
{
  return self->_usedNgrams;
}

- (void)setUsedNgrams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedNgrams, 0);
  objc_storeStrong((id *)&self->_ngramList, 0);
  objc_storeStrong((id *)&self->_resolvedIds, 0);
}

@end
