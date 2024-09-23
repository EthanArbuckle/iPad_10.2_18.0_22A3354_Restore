@implementation MOCategoryShieldPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedContent, 0);
  objc_storeStrong((id *)&self->_specificCategories, 0);
}

- (int64_t)policy
{
  return self->_policy;
}

- (MOCategoryShieldPolicy)initWithPolicy:(int64_t)a3 specificCategories:(id)a4 excludedContent:(id)a5
{
  id v9;
  id v10;
  MOCategoryShieldPolicy *v11;
  MOCategoryShieldPolicy *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MOCategoryShieldPolicy;
  v11 = -[MOCategoryShieldPolicy init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_policy = a3;
    objc_storeStrong((id *)&v11->_specificCategories, a4);
    objc_storeStrong((id *)&v12->_excludedContent, a5);
  }

  return v12;
}

+ (id)nonePolicy
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPolicy:specificCategories:excludedContent:", 0, 0, 0);
}

+ (id)specificPolicyWithCategories:(id)a3 excludedContent:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPolicy:specificCategories:excludedContent:", 1, v6, v5);

  return v7;
}

+ (id)allPolicyWithExcludedContent:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPolicy:specificCategories:excludedContent:", 2, 0, v3);

  return v4;
}

- (NSArray)specificCategories
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)excludedContent
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

@end
