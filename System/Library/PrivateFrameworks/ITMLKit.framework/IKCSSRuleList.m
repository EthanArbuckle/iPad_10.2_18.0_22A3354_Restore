@implementation IKCSSRuleList

- (IKCSSRuleList)init
{
  IKCSSRuleList *v2;
  uint64_t v3;
  NSMutableArray *rules;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IKCSSRuleList;
  v2 = -[IKCSSRuleList init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    rules = v2->rules;
    v2->rules = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addRule:(id)a3
{
  -[NSMutableArray addObject:](self->rules, "addObject:", a3);
}

- (id)firstRule
{
  return (id)-[NSMutableArray firstObject](self->rules, "firstObject");
}

- (id)lastRule
{
  return (id)-[NSMutableArray lastObject](self->rules, "lastObject");
}

- (id)ruleAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->rules, "objectAtIndex:", a3);
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->rules, "count");
}

- (id)description
{
  int64_t v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = -[IKCSSRuleList count](self, "count") - 1;
  if (v3 < 1)
  {
    v8 = &stru_1E9F50578;
  }
  else
  {
    v4 = 0;
    v5 = &stru_1E9F50578;
    do
    {
      -[IKCSSRuleList ruleAtIndex:](self, "ruleAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("%@, "), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v4;
      v5 = v8;
    }
    while (v3 != v4);
  }
  if (-[IKCSSRuleList count](self, "count"))
  {
    -[IKCSSRuleList ruleAtIndex:](self, "ruleAtIndex:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->rules, 0);
}

@end
