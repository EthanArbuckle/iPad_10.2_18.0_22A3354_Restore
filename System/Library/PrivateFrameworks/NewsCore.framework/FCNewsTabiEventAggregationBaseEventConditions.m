@implementation FCNewsTabiEventAggregationBaseEventConditions

- (FCNewsTabiEventAggregationBaseEventConditions)initWithProbability:(double)a3
{
  FCNewsTabiEventAggregationBaseEventConditions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FCNewsTabiEventAggregationBaseEventConditions;
  result = -[FCNewsTabiEventAggregationBaseEventConditions init](&v5, sel_init);
  if (result)
    result->_probability = a3;
  return result;
}

- (FCNewsTabiEventAggregationBaseEventConditions)initWithDictionary:(id)a3
{
  return -[FCNewsTabiEventAggregationBaseEventConditions initWithProbability:](self, "initWithProbability:", FCAppConfigurationDoubleValue(a3, (uint64_t)CFSTR("probability"), 0.0));
}

- (FCNewsTabiEventAggregationBaseEventConditions)init
{
  return -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiEventAggregationBaseEventConditions probability](self, "probability");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tprobability: %f;"), v4);
  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (double)probability
{
  return self->_probability;
}

@end
