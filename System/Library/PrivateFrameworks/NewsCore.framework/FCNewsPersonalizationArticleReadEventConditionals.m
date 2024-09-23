@implementation FCNewsPersonalizationArticleReadEventConditionals

- (FCNewsPersonalizationArticleReadEventConditionals)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationArticleReadEventConditionals *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCNewsPersonalizationArticleReadEventConditionals;
  v5 = -[FCNewsPersonalizationArticleReadEventConditionals init](&v7, sel_init);
  if (v5)
  {
    v5->_minimumDuration = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("minimumDuration"), 0.0);
    v5->_minimumScrollEventCount = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("minimumScrollEventCount"), 0);
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationArticleReadEventConditionals minimumDuration](self, "minimumDuration");
  objc_msgSend(v3, "appendFormat:", CFSTR("; minimumDuration: %f"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("; minimumScrollEventCount: %lld"),
    -[FCNewsPersonalizationArticleReadEventConditionals minimumScrollEventCount](self, "minimumScrollEventCount"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (double)minimumDuration
{
  return self->_minimumDuration;
}

- (void)setMinimumDuration:(double)a3
{
  self->_minimumDuration = a3;
}

- (int64_t)minimumScrollEventCount
{
  return self->_minimumScrollEventCount;
}

- (void)setMinimumScrollEventCount:(int64_t)a3
{
  self->_minimumScrollEventCount = a3;
}

@end
