@implementation FCNewsTabiEventAggregationDurationEventConditions

- (FCNewsTabiEventAggregationDurationEventConditions)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiEventAggregationDurationEventConditions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCNewsTabiEventAggregationDurationEventConditions;
  v5 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](&v7, sel_initWithDictionary_, v4);
  if (v5)
    v5->_duration = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("duration"), 0.0);

  return v5;
}

- (FCNewsTabiEventAggregationDurationEventConditions)init
{
  return -[FCNewsTabiEventAggregationDurationEventConditions initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiEventAggregationBaseEventConditions probability](self, "probability");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tprobability: %f;"), v4);
  -[FCNewsTabiEventAggregationDurationEventConditions duration](self, "duration");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tduration: %f;"), v5);
  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (double)duration
{
  return self->_duration;
}

@end
