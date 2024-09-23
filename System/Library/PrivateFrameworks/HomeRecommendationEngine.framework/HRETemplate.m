@implementation HRETemplate

- (HRETemplate)init
{
  HRETemplate *v2;
  HRETemplate *v3;
  NSString *title;
  NSSet *rules;
  NSString *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HRETemplate;
  v2 = -[HRETemplate init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = 0;

    rules = v3->_rules;
    v3->_rules = 0;

    identifier = v3->_identifier;
    v3->_identifier = 0;

    v3->_starterRank = 0.0;
    v3->_splitStrategy = 0;
    v3->_sortingPriority = 1.79769313e308;
  }
  return v3;
}

- (id)createStarterRecommendationInHome:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HREIdentifierBuilder *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  v5 = objc_alloc(-[HRETemplate recommendationClass](self, "recommendationClass"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)objc_msgSend(v7, "initWithHome:", v4);
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[HRETemplate identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("(template:%@)"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HREIdentifierBuilder initWithBaseIdentifier:]([HREIdentifierBuilder alloc], "initWithBaseIdentifier:", v11);
  objc_msgSend(v8, "setIdentifierBuilder:", v12);

  objc_msgSend(v8, "identifierBuilder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("home"));

  -[HRETemplate sortingPriority](self, "sortingPriority");
  objc_msgSend(v8, "setSortingPriority:");
  objc_msgSend(v8, "setSourceTemplate:", self);
  v16 = (void *)MEMORY[0x24BDD17C8];
  -[HRETemplate identifier](self, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("template-%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultAnalyticsData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE4CDD0]);

  return v8;
}

- (Class)recommendationClass
{
  return 0;
}

- (NSSet)involvedAccessoryTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSSet)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
  objc_storeStrong((id *)&self->_rules, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)splitStrategy
{
  return self->_splitStrategy;
}

- (void)setSplitStrategy:(unint64_t)a3
{
  self->_splitStrategy = a3;
}

- (double)sortingPriority
{
  return self->_sortingPriority;
}

- (void)setSortingPriority:(double)a3
{
  self->_sortingPriority = a3;
}

- (double)starterRank
{
  return self->_starterRank;
}

- (void)setStarterRank:(double)a3
{
  self->_starterRank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
