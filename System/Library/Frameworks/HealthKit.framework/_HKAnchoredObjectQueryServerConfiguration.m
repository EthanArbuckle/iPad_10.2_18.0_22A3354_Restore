@implementation _HKAnchoredObjectQueryServerConfiguration

- (_HKAnchoredObjectQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKAnchoredObjectQueryServerConfiguration *v5;
  HKQueryAnchor *v6;
  void *v7;
  void *v8;
  HKQueryAnchor *anchor;
  HKQueryAnchor *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *queryDescriptors;
  double v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_HKAnchoredObjectQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("query_anchor"));
    v6 = (HKQueryAnchor *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        +[HKQueryAnchor anchorFromValue:](HKQueryAnchor, "anchorFromValue:", objc_msgSend(v7, "unsignedIntegerValue"));
        v6 = (HKQueryAnchor *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

    }
    anchor = v5->_anchor;
    v5->_anchor = v6;
    v10 = v6;

    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("queryDescriptors"));
    v14 = objc_claimAutoreleasedReturnValue();
    queryDescriptors = v5->_queryDescriptors;
    v5->_queryDescriptors = (NSArray *)v14;

    v5->_includeDeletedObjects = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeDeleted"));
    v5->_includeAutomaticTimeZones = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeAutomaticTimeZones"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("collectionInterval"));
    v5->_collectionInterval = v16;
    v5->_includeContributorInformation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeContributor"));

  }
  return v5;
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (BOOL)includeDeletedObjects
{
  return self->_includeDeletedObjects;
}

- (double)collectionInterval
{
  return self->_collectionInterval;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKAnchoredObjectQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAnchor:", self->_anchor);
  objc_msgSend(v4, "setLimit:", self->_limit);
  objc_msgSend(v4, "setIncludeDeletedObjects:", self->_includeDeletedObjects);
  objc_msgSend(v4, "setIncludeAutomaticTimeZones:", self->_includeAutomaticTimeZones);
  objc_msgSend(v4, "setCollectionInterval:", self->_collectionInterval);
  objc_msgSend(v4, "setIncludeContributorInformation:", self->_includeContributorInformation);
  objc_msgSend(v4, "setQueryDescriptors:", self->_queryDescriptors);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKAnchoredObjectQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchor, CFSTR("query_anchor"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("limit"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryDescriptors, CFSTR("queryDescriptors"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeDeletedObjects, CFSTR("includeDeleted"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeAutomaticTimeZones, CFSTR("includeAutomaticTimeZones"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("collectionInterval"), self->_collectionInterval);
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeContributorInformation, CFSTR("includeContributor"));

}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void)setCollectionInterval:(double)a3
{
  self->_collectionInterval = a3;
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (void)setQueryDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setIncludeDeletedObjects:(BOOL)a3
{
  self->_includeDeletedObjects = a3;
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
