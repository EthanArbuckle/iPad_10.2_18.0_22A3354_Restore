@implementation IKCSSStylesheet

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[IKCSSStylesheet ruleList](self, "ruleList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{ruleList: %@}"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (IKCSSRuleList)ruleList
{
  return self->_ruleList;
}

- (void)setRuleList:(id)a3
{
  objc_storeStrong((id *)&self->_ruleList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleList, 0);
}

@end
