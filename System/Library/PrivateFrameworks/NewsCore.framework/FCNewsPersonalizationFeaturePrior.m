@implementation FCNewsPersonalizationFeaturePrior

- (FCNewsPersonalizationFeaturePrior)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationFeaturePrior *v5;
  FCNewsPersonalizationFeaturePrior *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCNewsPersonalizationFeaturePrior;
  v5 = -[FCNewsPersonalizationFeaturePrior init](&v10, sel_init);
  if (!v5)
  {
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("clicks"), 0);
  v6 = (FCNewsPersonalizationFeaturePrior *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("impressions"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      v6 = 0;
      goto LABEL_7;
    }
    v8 = (void *)v7;
    -[FCNewsPersonalizationFeaturePrior doubleValue](v6, "doubleValue");
    -[FCNewsPersonalizationFeaturePrior setClicks:](v5, "setClicks:");
    objc_msgSend(v8, "doubleValue");
    -[FCNewsPersonalizationFeaturePrior setImpressions:](v5, "setImpressions:");

    goto LABEL_5;
  }
LABEL_7:

  return v6;
}

- (void)setImpressions:(double)a3
{
  self->_impressions = a3;
}

- (void)setClicks:(double)a3
{
  self->_clicks = a3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationFeaturePrior clicks](self, "clicks");
  objc_msgSend(v3, "appendFormat:", CFSTR("; clicks: %f"), v4);
  -[FCNewsPersonalizationFeaturePrior impressions](self, "impressions");
  objc_msgSend(v3, "appendFormat:", CFSTR("; impressions: %f"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (double)clicks
{
  return self->_clicks;
}

- (double)impressions
{
  return self->_impressions;
}

@end
