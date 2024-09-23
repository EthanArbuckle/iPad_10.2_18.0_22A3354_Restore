@implementation HREActionVarianceCollection

- (HREActionVarianceCollection)initWithRules:(id)a3
{
  id v4;
  HREActionVarianceCollection *v5;
  uint64_t v6;
  NSMutableDictionary *rules;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HREActionVarianceCollection;
  v5 = -[HREActionVarianceCollection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    rules = v5->_rules;
    v5->_rules = (NSMutableDictionary *)v6;

  }
  return v5;
}

+ (id)varianceRuleCollectionWithRules:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "na_dictionaryWithKeyGenerator:", &__block_literal_global_9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithRules:", v6);
  return v7;
}

uint64_t __63__HREActionVarianceCollection_varianceRuleCollectionWithRules___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

- (BOOL)anyRulePassesForAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  +[HREActionVariance varianceKeyForAction:](HREActionVariance, "varianceKeyForAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HREActionVarianceCollection rules](self, "rules");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = objc_msgSend(v7, "passesForAction:", v4);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HREActionVarianceCollection rules](self, "rules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HREActionVarianceCollection rules](self, "rules");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (NSMutableDictionary)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
  objc_storeStrong((id *)&self->_rules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
}

@end
