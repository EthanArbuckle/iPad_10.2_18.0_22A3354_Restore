@implementation _HKInteractiveChartDistributionStyleKey

- (_HKInteractiveChartDistributionStyleKey)initWithDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 predicateName:(id)a5
{
  id v9;
  _HKInteractiveChartDistributionStyleKey *v10;
  _HKInteractiveChartDistributionStyleKey *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_HKInteractiveChartDistributionStyleKey;
  v10 = -[_HKInteractiveChartDistributionStyleKey init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_style = a3;
    v10->_timeScope = a4;
    objc_storeStrong((id *)&v10->_predicateName, a5);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = -[_HKInteractiveChartDistributionStyleKey style](self, "style");
    if (v6 == objc_msgSend(v5, "style")
      && (v7 = -[_HKInteractiveChartDistributionStyleKey timeScope](self, "timeScope"),
          v7 == objc_msgSend(v5, "timeScope")))
    {
      -[_HKInteractiveChartDistributionStyleKey predicateName](self, "predicateName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicateName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[_HKInteractiveChartDistributionStyleKey style](self, "style");
  v4 = -[_HKInteractiveChartDistributionStyleKey timeScope](self, "timeScope") ^ v3;
  -[_HKInteractiveChartDistributionStyleKey predicateName](self, "predicateName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _HKInteractiveChartDistributionStyleKey *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  _HKInteractiveChartDistributionStyleKey *v8;

  v4 = [_HKInteractiveChartDistributionStyleKey alloc];
  v5 = -[_HKInteractiveChartDistributionStyleKey style](self, "style");
  v6 = -[_HKInteractiveChartDistributionStyleKey timeScope](self, "timeScope");
  -[_HKInteractiveChartDistributionStyleKey predicateName](self, "predicateName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_HKInteractiveChartDistributionStyleKey initWithDistributionStyle:timeScope:predicateName:](v4, "initWithDistributionStyle:timeScope:predicateName:", v5, v6, v7);

  return v8;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (NSString)predicateName
{
  return self->_predicateName;
}

- (void)setPredicateName:(id)a3
{
  objc_storeStrong((id *)&self->_predicateName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateName, 0);
}

@end
