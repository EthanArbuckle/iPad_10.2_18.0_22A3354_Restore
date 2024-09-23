@implementation _HKObserverQueryServerConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKObserverQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKObserverQueryServerConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *queryDescriptors;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKObserverQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_observeUnfrozenSeries = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("observe_unfrozen"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("queryDescriptors"));
    v9 = objc_claimAutoreleasedReturnValue();
    queryDescriptors = v5->_queryDescriptors;
    v5->_queryDescriptors = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKObserverQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_observeUnfrozenSeries, CFSTR("observe_unfrozen"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryDescriptors, CFSTR("queryDescriptors"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKObserverQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setObserveUnfrozenSeries:", self->_observeUnfrozenSeries);
  objc_msgSend(v4, "setQueryDescriptors:", self->_queryDescriptors);
  return v4;
}

- (BOOL)observeUnfrozenSeries
{
  return self->_observeUnfrozenSeries;
}

- (void)setObserveUnfrozenSeries:(BOOL)a3
{
  self->_observeUnfrozenSeries = a3;
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (void)setQueryDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
}

@end
