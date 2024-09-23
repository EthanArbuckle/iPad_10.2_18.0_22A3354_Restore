@implementation MPMediaContainmentPredicate

- (id)_ML3PredicateForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0D51240];
  -[MPMediaContainmentPredicate property](self, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class propertyForMPMediaEntityProperty:](a3, "propertyForMPMediaEntityProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaContainmentPredicate values](self, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithProperty:values:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSSet)values
{
  return self->_values;
}

- (NSString)property
{
  return self->_property;
}

- (id)ML3PredicateForTrack
{
  return -[MPMediaContainmentPredicate _ML3PredicateForEntityClass:](self, "_ML3PredicateForEntityClass:", objc_opt_class());
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v8[1];
    v8[1] = v9;

    v11 = objc_msgSend(v7, "copy");
    v12 = (void *)v8[2];
    v8[2] = v11;

  }
  return v8;
}

- (MPMediaContainmentPredicate)initWithCoder:(id)a3
{
  id v4;
  MPMediaContainmentPredicate *v5;
  uint64_t v6;
  NSString *property;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSSet *values;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPMediaContainmentPredicate;
  v5 = -[MPMediaContainmentPredicate init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containmentProperty"));
    v6 = objc_claimAutoreleasedReturnValue();
    property = v5->_property;
    v5->_property = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("containmentValues"));
    v12 = objc_claimAutoreleasedReturnValue();
    values = v5->_values;
    v5->_values = (NSSet *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *property;
  id v5;

  property = self->_property;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", property, CFSTR("containmentProperty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_values, CFSTR("containmentValues"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p property:'%@' values:%@>"), v5, self, self->_property, self->_values);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *property;
  NSSet *values;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMediaContainmentPredicate;
  if (-[MPMediaContainmentPredicate isEqual:](&v9, sel_isEqual_, v4)
    && ((property = self->_property, property == (NSString *)v4[1])
     || -[NSString isEqualToString:](property, "isEqualToString:")))
  {
    values = self->_values;
    if (values == (NSSet *)v4[2])
      v7 = 1;
    else
      v7 = -[NSSet isEqual:](values, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPMediaContainmentPredicate;
  v3 = -[MPMediaContainmentPredicate hash](&v6, sel_hash);
  v4 = -[NSString hash](self->_property, "hash") ^ v3;
  return v4 ^ -[NSSet hash](self->_values, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)ML3PredicateForContainer
{
  return -[MPMediaContainmentPredicate _ML3PredicateForEntityClass:](self, "_ML3PredicateForEntityClass:", objc_opt_class());
}

@end
