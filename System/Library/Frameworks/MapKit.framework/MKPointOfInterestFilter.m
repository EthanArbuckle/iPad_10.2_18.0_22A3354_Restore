@implementation MKPointOfInterestFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MKPointOfInterestFilter)filterIncludingAllCategories
{
  return (MKPointOfInterestFilter *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initExcludingCategories:", MEMORY[0x1E0C9AA60]);
}

+ (MKPointOfInterestFilter)filterExcludingAllCategories
{
  return (MKPointOfInterestFilter *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initIncludingCategories:", MEMORY[0x1E0C9AA60]);
}

- (MKPointOfInterestFilter)init
{
  return -[MKPointOfInterestFilter initExcludingCategories:](self, "initExcludingCategories:", MEMORY[0x1E0C9AA60]);
}

- (MKPointOfInterestFilter)initIncludingCategories:(NSArray *)categories
{
  NSArray *v4;
  MKPointOfInterestFilter *v5;
  uint64_t v6;
  NSSet *includedCategories;
  objc_super v9;

  v4 = categories;
  v9.receiver = self;
  v9.super_class = (Class)MKPointOfInterestFilter;
  v5 = -[MKPointOfInterestFilter init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    includedCategories = v5->_includedCategories;
    v5->_includedCategories = (NSSet *)v6;

  }
  return v5;
}

- (MKPointOfInterestFilter)initExcludingCategories:(NSArray *)categories
{
  NSArray *v4;
  MKPointOfInterestFilter *v5;
  uint64_t v6;
  NSSet *excludedCategories;
  objc_super v9;

  v4 = categories;
  v9.receiver = self;
  v9.super_class = (Class)MKPointOfInterestFilter;
  v5 = -[MKPointOfInterestFilter init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    excludedCategories = v5->_excludedCategories;
    v5->_excludedCategories = (NSSet *)v6;

  }
  return v5;
}

- (id)initIncludingCategories:(id)a3 excludingCategories:(id)a4
{
  id v6;
  id v7;
  MKPointOfInterestFilter *v8;
  uint64_t v9;
  NSSet *includedCategories;
  uint64_t v11;
  NSSet *excludedCategories;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MKPointOfInterestFilter;
  v8 = -[MKPointOfInterestFilter init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    includedCategories = v8->_includedCategories;
    v8->_includedCategories = (NSSet *)v9;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    excludedCategories = v8->_excludedCategories;
    v8->_excludedCategories = (NSSet *)v11;

  }
  return v8;
}

- (MKPointOfInterestFilter)initWithCoder:(id)a3
{
  id v4;
  MKPointOfInterestFilter *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *includedCategories;
  uint64_t v11;
  NSSet *excludedCategories;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKPointOfInterestFilter;
  v5 = -[MKPointOfInterestFilter init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MKPointOfInterestFilterInclusions"));
    v9 = objc_claimAutoreleasedReturnValue();
    includedCategories = v5->_includedCategories;
    v5->_includedCategories = (NSSet *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MKPointOfInterestFilterExclusions"));
    v11 = objc_claimAutoreleasedReturnValue();
    excludedCategories = v5->_excludedCategories;
    v5->_excludedCategories = (NSSet *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSSet *includedCategories;
  NSSet *excludedCategories;
  id v7;

  v4 = a3;
  includedCategories = self->_includedCategories;
  v7 = v4;
  if (includedCategories)
  {
    objc_msgSend(v4, "encodeObject:forKey:", includedCategories, CFSTR("MKPointOfInterestFilterInclusions"));
    v4 = v7;
  }
  excludedCategories = self->_excludedCategories;
  if (excludedCategories)
  {
    objc_msgSend(v7, "encodeObject:forKey:", excludedCategories, CFSTR("MKPointOfInterestFilterExclusions"));
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_includedCategories);
    objc_storeStrong(v5 + 2, self->_excludedCategories);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[MKPointOfInterestFilter isEqualToPointOfInterestFilter:](self, "isEqualToPointOfInterestFilter:", v4);

  return v5;
}

- (BOOL)isEqualToPointOfInterestFilter:(id)a3
{
  _QWORD *v4;
  NSSet *includedCategories;
  NSSet *excludedCategories;
  char v7;

  v4 = a3;
  if (v4
    && ((includedCategories = self->_includedCategories, !((unint64_t)includedCategories | v4[1]))
     || -[NSSet isEqualToSet:](includedCategories, "isEqualToSet:")))
  {
    excludedCategories = self->_excludedCategories;
    if ((unint64_t)excludedCategories | v4[2])
      v7 = -[NSSet isEqualToSet:](excludedCategories, "isEqualToSet:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)includesCategory:(MKPointOfInterestCategory)category
{
  NSString *v4;
  NSSet *includedCategories;
  _BOOL4 v6;
  NSSet *excludedCategories;

  v4 = category;
  includedCategories = self->_includedCategories;
  if (includedCategories)
  {
    LOBYTE(v6) = -[NSSet containsObject:](includedCategories, "containsObject:", v4);
  }
  else
  {
    excludedCategories = self->_excludedCategories;
    if (excludedCategories)
      v6 = !-[NSSet containsObject:](excludedCategories, "containsObject:", v4);
    else
      LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)excludesCategory:(MKPointOfInterestCategory)category
{
  NSString *v4;
  NSSet *excludedCategories;
  _BOOL4 v6;
  NSSet *includedCategories;

  v4 = category;
  excludedCategories = self->_excludedCategories;
  if (excludedCategories)
  {
    LOBYTE(v6) = -[NSSet containsObject:](excludedCategories, "containsObject:", v4);
  }
  else
  {
    includedCategories = self->_includedCategories;
    if (includedCategories)
      v6 = !-[NSSet containsObject:](includedCategories, "containsObject:", v4);
    else
      LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_geoPOICategoryFilter
{
  void *v3;
  void *v4;
  void *v5;

  GEOPOICategoriesForPointOfInterestCategories(self->_includedCategories);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GEOPOICategoriesForPointOfInterestCategories(self->_excludedCategories);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D272F8]), "initWithCategoriesToInclude:categoriesToExclude:", v3, v4);

  return v5;
}

- (BOOL)_includesAllCategories
{
  NSSet *excludedCategories;

  if (self->_includedCategories)
  {
    LOBYTE(excludedCategories) = 0;
  }
  else
  {
    excludedCategories = self->_excludedCategories;
    if (excludedCategories)
      LOBYTE(excludedCategories) = -[NSSet count](excludedCategories, "count") == 0;
  }
  return (char)excludedCategories;
}

- (BOOL)_excludesAllCategories
{
  NSSet *includedCategories;

  if (self->_excludedCategories)
  {
    LOBYTE(includedCategories) = 0;
  }
  else
  {
    includedCategories = self->_includedCategories;
    if (includedCategories)
      LOBYTE(includedCategories) = -[NSSet count](includedCategories, "count") == 0;
  }
  return (char)includedCategories;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  if (-[MKPointOfInterestFilter _includesAllCategories](self, "_includesAllCategories"))
  {
    v3 = CFSTR("Include: All");
  }
  else if (-[MKPointOfInterestFilter _excludesAllCategories](self, "_excludesAllCategories"))
  {
    v3 = CFSTR("Exclude: All");
  }
  else
  {
    if (self->_includedCategories)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Include: %@"), self->_includedCategories);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Exclude: %@"), self->_excludedCategories);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: %p %@"), v6, self, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isInclusive
{
  if (-[MKPointOfInterestFilter _includesAllCategories](self, "_includesAllCategories"))
    return 1;
  if (-[MKPointOfInterestFilter _excludesAllCategories](self, "_excludesAllCategories"))
    return 0;
  return self->_includedCategories != 0;
}

- (BOOL)_isAllCategories
{
  return -[MKPointOfInterestFilter _includesAllCategories](self, "_includesAllCategories")
      || -[MKPointOfInterestFilter _excludesAllCategories](self, "_excludesAllCategories");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedCategories, 0);
  objc_storeStrong((id *)&self->_includedCategories, 0);
}

@end
