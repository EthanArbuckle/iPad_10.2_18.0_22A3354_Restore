@implementation DKComponentPredicate

+ (id)componentPredicateWithDomain:(id)a3 exactMatch:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDomain:exactMatch:", v6, v4);

  return v7;
}

- (DKComponentPredicate)initWithDomain:(id)a3 exactMatch:(BOOL)a4
{
  id v7;
  DKComponentPredicate *v8;
  DKComponentPredicate *v9;
  void *v10;
  uint64_t v11;
  NSString *type;
  uint64_t v13;
  NSString *identifier;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DKComponentPredicate;
  v8 = -[DKComponentPredicate init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_domain, a3);
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    type = v9->_type;
    v9->_type = (NSString *)v11;

    if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v13 = objc_claimAutoreleasedReturnValue();
      identifier = v9->_identifier;
      v9->_identifier = (NSString *)v13;

    }
    v9->_exactMatch = a4;

  }
  return v9;
}

+ (id)componentPredicateWithType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:identifier:", v7, v6);

  return v8;
}

- (DKComponentPredicate)initWithType:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  DKComponentPredicate *v9;
  DKComponentPredicate *v10;
  id *p_domain;
  void *v12;
  uint64_t v13;
  id v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DKComponentPredicate;
  v9 = -[DKComponentPredicate init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
    p_domain = (id *)&v10->_domain;
    objc_storeStrong((id *)&v10->_domain, a3);
    if (v8)
    {
      objc_msgSend(*p_domain, "stringByAppendingString:", CFSTR("."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *p_domain;
      *p_domain = (id)v13;

    }
  }

  return v10;
}

+ (id)componentPredicateMatchingComponentIdentity:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithDomain:exactMatch:", v6, 1);
  return v7;
}

- (BOOL)matchesComponentIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKComponentPredicate domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else if (-[DKComponentPredicate exactMatch](self, "exactMatch"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[DKComponentPredicate domain](self, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "hasPrefix:", v11);

  }
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[DKComponentPredicate domain](self, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 + (-[DKComponentPredicate exactMatch](self, "exactMatch") ^ 1);

  return v5;
}

- (BOOL)isEqualToComponentPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DKComponentPredicate domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  DKComponentPredicate *v4;
  BOOL v5;

  v4 = (DKComponentPredicate *)a3;
  v5 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[DKComponentPredicate isEqualToComponentPredicate:](self, "isEqualToComponentPredicate:", v4);

  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)exactMatch
{
  return self->_exactMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
