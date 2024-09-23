@implementation _HKSampleQueryConfiguration

- (_HKSampleQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKSampleQueryConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *sortDescriptors;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *queryDescriptors;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_HKSampleQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v26, sel_initWithCoder_, v4);
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

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("queryDescriptors"));
    v14 = objc_claimAutoreleasedReturnValue();
    queryDescriptors = v5->_queryDescriptors;
    v5->_queryDescriptors = (NSArray *)v14;

    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
    v5->_includeAutomaticTimeZones = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeAutomaticTimeZones"));
    v5->_includeContributorInformation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeContributor"));
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v5->_sortDescriptors;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20++), "allowEvaluation");
        }
        while (v18 != v20);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v18);
    }

  }
  return v5;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKSampleQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors);
  objc_msgSend(v4, "setLimit:", self->_limit);
  objc_msgSend(v4, "setIncludeAutomaticTimeZones:", self->_includeAutomaticTimeZones);
  objc_msgSend(v4, "setIncludeContributorInformation:", self->_includeContributorInformation);
  objc_msgSend(v4, "setQueryDescriptors:", self->_queryDescriptors);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKSampleQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDescriptors, CFSTR("sortDescriptors"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryDescriptors, CFSTR("queryDescriptors"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("limit"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeAutomaticTimeZones, CFSTR("includeAutomaticTimeZones"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeContributorInformation, CFSTR("includeContributor"));

}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (void)setQueryDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (BOOL)includeAutomaticTimeZones
{
  return self->_includeAutomaticTimeZones;
}

- (void)setIncludeAutomaticTimeZones:(BOOL)a3
{
  self->_includeAutomaticTimeZones = a3;
}

- (BOOL)includeContributorInformation
{
  return self->_includeContributorInformation;
}

- (void)setIncludeContributorInformation:(BOOL)a3
{
  self->_includeContributorInformation = a3;
}

@end
