@implementation HKPopulationNormsUnboundedEndAxisLabel

- (HKPopulationNormsUnboundedEndAxisLabel)initWithRangeStart:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKPopulationNormsUnboundedEndAxisLabel;
  return -[HKPopulationNormsAxisLabel initWithRangeStart:end:](&v4, sel_initWithRangeStart_end_, a3, 0);
}

- (id)stringRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKPopulationNormsUnboundedEndAxisLabel;
  -[HKPopulationNormsAxisLabel stringRepresentation](&v8, sel_stringRepresentation);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@_UNBOUNDED_UPPER_RANGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
