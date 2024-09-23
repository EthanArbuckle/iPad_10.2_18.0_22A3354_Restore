@implementation CTCATargetVisibility

- (id)description
{
  void *v3;
  unint64_t v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTCATargetVisibility aggregateVisibility](self, "aggregateVisibility");
  if (v4 > 3)
    v5 = "???";
  else
    v5 = off_1E1533CE8[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR(", aggregateVisibility=%s"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAggregateVisibility:", -[CTCATargetVisibility aggregateVisibility](self, "aggregateVisibility"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTCATargetVisibility aggregateVisibility](self, "aggregateVisibility"), CFSTR("aggregateVisibility"));

}

- (CTCATargetVisibility)initWithCoder:(id)a3
{
  id v4;
  CTCATargetVisibility *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTCATargetVisibility;
  v5 = -[CTCATargetVisibility init](&v7, sel_init);
  if (v5)
    v5->_aggregateVisibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("aggregateVisibility"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)aggregateVisibility
{
  return self->_aggregateVisibility;
}

- (void)setAggregateVisibility:(int64_t)a3
{
  self->_aggregateVisibility = a3;
}

@end
