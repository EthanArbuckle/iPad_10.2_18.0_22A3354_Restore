@implementation HKPopulationNormsAxisLabel

- (HKPopulationNormsAxisLabel)initWithValue:(id)a3
{
  return -[HKPopulationNormsAxisLabel initWithRangeStart:end:](self, "initWithRangeStart:end:", a3, 0);
}

- (HKPopulationNormsAxisLabel)initWithRangeStart:(id)a3 end:(id)a4
{
  id v6;
  id v7;
  HKPopulationNormsAxisLabel *v8;
  uint64_t v9;
  NSNumber *rangeStart;
  uint64_t v11;
  NSNumber *rangeEnd;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKPopulationNormsAxisLabel;
  v8 = -[HKPopulationNormsAxisLabel init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    rangeStart = v8->_rangeStart;
    v8->_rangeStart = (NSNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    rangeEnd = v8->_rangeEnd;
    v8->_rangeEnd = (NSNumber *)v11;

  }
  return v8;
}

- (NSString)separatorString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RANGE_SEPARATOR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)stringRepresentation
{
  void *v3;
  NSNumber *rangeEnd;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  HKLocalizedStringForNumberWithDecimalPrecision(self->_rangeStart, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  rangeEnd = self->_rangeEnd;
  if (rangeEnd)
  {
    HKLocalizedStringForNumberWithDecimalPrecision(rangeEnd, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[HKPopulationNormsAxisLabel separatorString](self, "separatorString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@%@"), v3, v7, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

- (NSNumber)rangeStart
{
  return self->_rangeStart;
}

- (void)setRangeStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)rangeEnd
{
  return self->_rangeEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeEnd, 0);
  objc_storeStrong((id *)&self->_rangeStart, 0);
}

@end
