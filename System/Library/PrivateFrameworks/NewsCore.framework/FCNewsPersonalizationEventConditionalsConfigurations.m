@implementation FCNewsPersonalizationEventConditionalsConfigurations

- (FCNewsPersonalizationEventConditionalsConfigurations)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationEventConditionalsConfigurations *v5;
  void *v6;
  FCNewsPersonalizationArticleReadEventConditionals *v7;
  FCNewsPersonalizationArticleReadEventConditionals *articleReadEventConditionals;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCNewsPersonalizationEventConditionalsConfigurations;
  v5 = -[FCNewsPersonalizationEventConditionalsConfigurations init](&v10, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleRead"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCNewsPersonalizationArticleReadEventConditionals initWithDictionary:]([FCNewsPersonalizationArticleReadEventConditionals alloc], "initWithDictionary:", v6);
    articleReadEventConditionals = v5->_articleReadEventConditionals;
    v5->_articleReadEventConditionals = v7;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleReadEventConditionals, 0);
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationEventConditionalsConfigurations articleReadEventConditionals](self, "articleReadEventConditionals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleReadEventConditionals: %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (FCNewsPersonalizationArticleReadEventConditionals)articleReadEventConditionals
{
  return self->_articleReadEventConditionals;
}

- (void)setArticleReadEventConditionals:(id)a3
{
  objc_storeStrong((id *)&self->_articleReadEventConditionals, a3);
}

@end
