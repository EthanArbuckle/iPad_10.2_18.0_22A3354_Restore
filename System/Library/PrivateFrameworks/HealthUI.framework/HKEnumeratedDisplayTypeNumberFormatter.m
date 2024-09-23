@implementation HKEnumeratedDisplayTypeNumberFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (HKEnumeratedDisplayTypeNumberFormatter)initWithDisplayType:(id)a3
{
  id v4;
  HKEnumeratedDisplayTypeNumberFormatter *v5;
  uint64_t v6;
  NSDictionary *valueLabels;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKEnumeratedDisplayTypeNumberFormatter;
  v5 = -[HKEnumeratedDisplayTypeNumberFormatter init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "hk_enumeratedValueLabels");
    v6 = objc_claimAutoreleasedReturnValue();
    valueLabels = v5->_valueLabels;
    v5->_valueLabels = (NSDictionary *)v6;

  }
  return v5;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  return -[NSDictionary objectForKeyedSubscript:](self->_valueLabels, "objectForKeyedSubscript:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabels, 0);
}

@end
