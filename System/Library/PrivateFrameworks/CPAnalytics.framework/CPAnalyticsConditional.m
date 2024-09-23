@implementation CPAnalyticsConditional

- (CPAnalyticsConditional)initWithConfig:(id)a3
{
  id v4;
  CPAnalyticsConditional *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  NSPredicate *predicate;
  CPAnalyticsConditional *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPAnalyticsConditional;
  v5 = -[CPAnalyticsConditional init](&v14, sel_init);
  if (!v5)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  -[CPAnalyticsConditional _validateAndParseConfig:forKey:](v5, "_validateAndParseConfig:forKey:", v4, CFSTR("property"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsConditional _validateAndParseConfig:forKey:](v5, "_validateAndParseConfig:forKey:", v4, CFSTR("predicate"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9
    || (objc_storeStrong((id *)&v5->_property, v6),
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v8),
        (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_11;
  }
  predicate = v5->_predicate;
  v5->_predicate = (NSPredicate *)v10;

LABEL_9:
  v12 = v5;
LABEL_12:

  return v12;
}

- (id)_validateAndParseConfig:(id)a3 forKey:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (NSString)property
{
  return self->_property;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end
