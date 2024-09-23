@implementation _HKCorrelationQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKCorrelationQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setFilterDictionary:", self->_filterDictionary);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKCorrelationQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKCorrelationQueryServerConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *filterDictionary;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKCorrelationQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("filterDictionary"));
    v10 = objc_claimAutoreleasedReturnValue();
    filterDictionary = v5->_filterDictionary;
    v5->_filterDictionary = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKCorrelationQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_filterDictionary, CFSTR("filterDictionary"), v5.receiver, v5.super_class);

}

- (NSDictionary)filterDictionary
{
  return self->_filterDictionary;
}

- (void)setFilterDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterDictionary, 0);
}

@end
