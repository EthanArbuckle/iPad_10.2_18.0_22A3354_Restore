@implementation _HKDatabaseChangesQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKDatabaseChangesQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAnchor:", self->_anchor);
  objc_msgSend(v4, "setSampleTypes:", self->_sampleTypes);
  objc_msgSend(v4, "setIncludeChangeDetails:", self->_includeChangeDetails);
  objc_msgSend(v4, "setChangeDetailsQueryStrategy:", self->_changeDetailsQueryStrategy);
  objc_msgSend(v4, "setAnchorStrategyChangeCountLimit:", self->_anchorStrategyChangeCountLimit);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKDatabaseChangesQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKDatabaseChangesQueryServerConfiguration *v5;
  uint64_t v6;
  HKQueryAnchor *anchor;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *sampleTypes;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HKDatabaseChangesQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryAnchor"));
    v6 = objc_claimAutoreleasedReturnValue();
    anchor = v5->_anchor;
    v5->_anchor = (HKQueryAnchor *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("sampleTypes"));
    v11 = objc_claimAutoreleasedReturnValue();
    sampleTypes = v5->_sampleTypes;
    v5->_sampleTypes = (NSSet *)v11;

    v5->_includeChangeDetails = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeChangeDetails"));
    v5->_changeDetailsQueryStrategy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("queryStrategy"));
    v5->_anchorStrategyChangeCountLimit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("anchorLimit"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKDatabaseChangesQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchor, CFSTR("queryAnchor"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sampleTypes, CFSTR("sampleTypes"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeChangeDetails, CFSTR("includeChangeDetails"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_changeDetailsQueryStrategy, CFSTR("queryStrategy"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_anchorStrategyChangeCountLimit, CFSTR("anchorLimit"));

}

- (NSSet)sampleTypes
{
  return self->_sampleTypes;
}

- (void)setSampleTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)includeChangeDetails
{
  return self->_includeChangeDetails;
}

- (void)setIncludeChangeDetails:(BOOL)a3
{
  self->_includeChangeDetails = a3;
}

- (int64_t)changeDetailsQueryStrategy
{
  return self->_changeDetailsQueryStrategy;
}

- (void)setChangeDetailsQueryStrategy:(int64_t)a3
{
  self->_changeDetailsQueryStrategy = a3;
}

- (int64_t)anchorStrategyChangeCountLimit
{
  return self->_anchorStrategyChangeCountLimit;
}

- (void)setAnchorStrategyChangeCountLimit:(int64_t)a3
{
  self->_anchorStrategyChangeCountLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_sampleTypes, 0);
}

@end
