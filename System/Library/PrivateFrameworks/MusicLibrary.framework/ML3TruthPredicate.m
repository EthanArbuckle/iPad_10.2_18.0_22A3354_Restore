@implementation ML3TruthPredicate

- (ML3TruthPredicate)initWithCoder:(id)a3
{
  id v4;
  ML3TruthPredicate *v5;
  ML3TruthPredicate *v6;
  char v7;
  void *v8;
  ML3TruthPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3TruthPredicate;
  v5 = -[ML3TruthPredicate init](&v11, sel_init);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("truthValue"));
    v6->_truthValue = v7;
    v8 = (void *)objc_opt_class();
    if ((v7 & 1) != 0)
      objc_msgSend(v8, "truePredicate");
    else
      objc_msgSend(v8, "falsePredicate");
    v9 = (ML3TruthPredicate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ML3TruthPredicate;
  v4 = a3;
  -[ML3Predicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_truthValue, CFSTR("truthValue"), v5.receiver, v5.super_class);

}

- (id)_predicateString
{
  if (self->_truthValue)
    return CFSTR(" 1 ");
  else
    return CFSTR(" 0 ");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ML3TruthPredicate;
  -[ML3TruthPredicate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3TruthPredicate _predicateString](self, "_predicateString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(NOT %@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ML3TruthPredicate *v4;
  BOOL v5;
  objc_super v7;

  v4 = (ML3TruthPredicate *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ML3TruthPredicate;
    v5 = -[ML3Predicate isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_truthValue == v4->_truthValue;
  }

  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ML3TruthPredicate;
  return -[ML3Predicate hash](&v3, sel_hash) + self->_truthValue;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[ML3TruthPredicate _predicateString](self, "_predicateString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

}

- (BOOL)isTrueAlways
{
  return self->_truthValue;
}

- (BOOL)isFalseAlways
{
  return self->_truthValue;
}

+ (id)truePredicate
{
  if (truePredicate_onceToken != -1)
    dispatch_once(&truePredicate_onceToken, &__block_literal_global_5471);
  return (id)truePredicate_predicate;
}

+ (id)falsePredicate
{
  if (falsePredicate_onceToken != -1)
    dispatch_once(&falsePredicate_onceToken, &__block_literal_global_33_5469);
  return (id)falsePredicate_predicate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __35__ML3TruthPredicate_falsePredicate__block_invoke()
{
  ML3TruthPredicate *v0;
  void *v1;

  v0 = objc_alloc_init(ML3TruthPredicate);
  v1 = (void *)falsePredicate_predicate;
  falsePredicate_predicate = (uint64_t)v0;

  *(_BYTE *)(falsePredicate_predicate + 8) = 0;
}

void __34__ML3TruthPredicate_truePredicate__block_invoke()
{
  ML3TruthPredicate *v0;
  void *v1;

  v0 = objc_alloc_init(ML3TruthPredicate);
  v1 = (void *)truePredicate_predicate;
  truePredicate_predicate = (uint64_t)v0;

  *(_BYTE *)(truePredicate_predicate + 8) = 1;
}

@end
