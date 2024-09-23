@implementation _CRAndConjunctionPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subpredicates, 0);
}

- (id)asNSPredicate
{
  void *v2;
  void *v3;

  -[NSArray _cn_map:](self->_subpredicates, "_cn_map:", &__block_literal_global);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_CRAndConjunctionPredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _CRAndConjunctionPredicate *v7;

  v4 = a3;
  +[CRSearchPredicate secureCodableSubclasses](CRSearchPredicate, "secureCodableSubclasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("subpredicates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_CRAndConjunctionPredicate initWithSubpredicates:](self, "initWithSubpredicates:", v6);
  return v7;
}

- (_CRAndConjunctionPredicate)initWithSubpredicates:(id)a3
{
  id v4;
  _CRAndConjunctionPredicate *v5;
  uint64_t v6;
  NSArray *subpredicates;
  _CRAndConjunctionPredicate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CRAndConjunctionPredicate;
  v5 = -[CRSearchPredicate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    subpredicates = v5->_subpredicates;
    v5->_subpredicates = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_subpredicates, CFSTR("subpredicates"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _CRAndConjunctionPredicate *v4;
  NSArray *subpredicates;
  BOOL v6;

  v4 = (_CRAndConjunctionPredicate *)a3;
  v6 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (subpredicates = self->_subpredicates, (unint64_t)subpredicates | (unint64_t)v4->_subpredicates)
      && !-[NSArray isEqual:](subpredicates, "isEqual:"))
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "arrayHash:", self->_subpredicates) + 527;
}

- (NSArray)subpredicates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

@end
