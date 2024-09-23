@implementation HKInteractiveChartSinglePointEventIdentifierData

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;

  -[HKInteractiveChartSinglePointEventIdentifierData identifiers](self, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v11.receiver = self;
    v11.super_class = (Class)HKInteractiveChartSinglePointEventIdentifierData;
    -[HKInteractiveChartSinglePointData description](&v11, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartSinglePointEventIdentifierData identifiers](self, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@, identifiers: %@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HKInteractiveChartSinglePointEventIdentifierData;
    -[HKInteractiveChartSinglePointData description](&v10, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
