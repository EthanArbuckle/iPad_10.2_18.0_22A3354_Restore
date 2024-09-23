@implementation VSSubscriptionFetchOptionDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedValuePredicate, 0);
  objc_storeStrong((id *)&self->_allowedClass, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSString)key
{
  return self->_key;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (BOOL)isContainer
{
  return self->_container;
}

- (NSPredicate)allowedValuePredicate
{
  return self->_allowedValuePredicate;
}

- (Class)allowedClass
{
  return self->_allowedClass;
}

- (void)setAllowedValuePredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSSubscriptionFetchOptionDescription *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(VSSubscriptionFetchOptionDescription);
  -[VSSubscriptionFetchOptionDescription key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSubscriptionFetchOptionDescription setKey:](v4, "setKey:", v5);

  -[VSSubscriptionFetchOptionDescription defaultValue](self, "defaultValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSubscriptionFetchOptionDescription setDefaultValue:](v4, "setDefaultValue:", v6);

  -[VSSubscriptionFetchOptionDescription setContainer:](v4, "setContainer:", -[VSSubscriptionFetchOptionDescription isContainer](self, "isContainer"));
  -[VSSubscriptionFetchOptionDescription setMinCount:](v4, "setMinCount:", -[VSSubscriptionFetchOptionDescription minCount](self, "minCount"));
  -[VSSubscriptionFetchOptionDescription setAllowedClass:](v4, "setAllowedClass:", -[VSSubscriptionFetchOptionDescription allowedClass](self, "allowedClass"));
  -[VSSubscriptionFetchOptionDescription allowedValuePredicate](self, "allowedValuePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSubscriptionFetchOptionDescription setAllowedValuePredicate:](v4, "setAllowedValuePredicate:", v7);

  return v4;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAllowedClass:(Class)a3
{
  objc_storeStrong((id *)&self->_allowedClass, a3);
}

- (unint64_t)minCount
{
  return self->_minCount;
}

- (VSSubscriptionFetchOptionDescription)init
{
  VSSubscriptionFetchOptionDescription *v2;
  VSSubscriptionFetchOptionDescription *v3;
  NSString *key;
  uint64_t v5;
  Class allowedClass;
  uint64_t v7;
  NSPredicate *allowedValuePredicate;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSSubscriptionFetchOptionDescription;
  v2 = -[VSSubscriptionFetchOptionDescription init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    key = v2->_key;
    v2->_key = (NSString *)&stru_1E93A8CC0;

    objc_opt_class();
    v5 = objc_claimAutoreleasedReturnValue();
    allowedClass = v3->_allowedClass;
    v3->_allowedClass = (Class)v5;

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    allowedValuePredicate = v3->_allowedValuePredicate;
    v3->_allowedValuePredicate = (NSPredicate *)v7;

  }
  return v3;
}

- (void)setMinCount:(unint64_t)a3
{
  self->_minCount = a3;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong(&self->_defaultValue, a3);
}

- (void)setContainer:(BOOL)a3
{
  self->_container = a3;
}

@end
