@implementation FCNewsPersonalizationAggregateModificationData

- (FCNewsPersonalizationAggregateModificationData)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationAggregateModificationData *v5;
  FCNewsPersonalizationAggregateModificationData *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCNewsPersonalizationAggregateModificationData;
  v5 = -[FCNewsPersonalizationAggregateModificationData init](&v12, sel_init);
  if (!v5)
  {
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("clicks"), 0);
  v6 = (FCNewsPersonalizationAggregateModificationData *)objc_claimAutoreleasedReturnValue();
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
    -[FCNewsPersonalizationAggregateModificationData doubleValue](v6, "doubleValue");
    v5->_clicks = v9;
    objc_msgSend(v8, "doubleValue");
    v5->_impressions = v10;

    goto LABEL_5;
  }
LABEL_7:

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationAggregateModificationData clicks](self, "clicks");
  objc_msgSend(v3, "appendFormat:", CFSTR("; clicks: %f"), v4);
  -[FCNewsPersonalizationAggregateModificationData impressions](self, "impressions");
  objc_msgSend(v3, "appendFormat:", CFSTR("; impressions: %f"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (double)clicks
{
  return self->_clicks;
}

- (void)setClicks:(double)a3
{
  self->_clicks = a3;
}

- (double)impressions
{
  return self->_impressions;
}

- (void)setImpressions:(double)a3
{
  self->_impressions = a3;
}

@end
