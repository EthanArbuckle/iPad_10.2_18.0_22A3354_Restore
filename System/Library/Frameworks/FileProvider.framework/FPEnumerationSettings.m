@implementation FPEnumerationSettings

- (void)encodeWithCoder:(id)a3
{
  NSArray *sortDescriptors;
  id v5;

  sortDescriptors = self->_sortDescriptors;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sortDescriptors, CFSTR("sortDescriptors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_searchQuery, CFSTR("searchQuery"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSArray copy](self->_sortDescriptors, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSFileProviderSearchQuery copy](self->_searchQuery, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (FPEnumerationSettings)init
{
  FPEnumerationSettings *v2;
  uint64_t v3;
  NSArray *sortDescriptors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FPEnumerationSettings;
  v2 = -[FPEnumerationSettings init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "fp_sortDescriptorByDisplayName");
    v3 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v2->_sortDescriptors;
    v2->_sortDescriptors = (NSArray *)v3;

  }
  return v2;
}

- (NSArray)sortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSFileProviderSearchQuery)searchQuery
{
  return (NSFileProviderSearchQuery *)objc_getProperty(self, a2, 16, 1);
}

- (FPEnumerationSettings)initWithCoder:(id)a3
{
  id v4;
  FPEnumerationSettings *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *sortDescriptors;
  void *v11;
  uint64_t v12;
  NSFileProviderSearchQuery *searchQuery;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPEnumerationSettings;
  v5 = -[FPEnumerationSettings init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sortDescriptors"));
    v9 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("searchQuery"));
    v12 = objc_claimAutoreleasedReturnValue();
    searchQuery = v5->_searchQuery;
    v5->_searchQuery = (NSFileProviderSearchQuery *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSearchQuery:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

@end
