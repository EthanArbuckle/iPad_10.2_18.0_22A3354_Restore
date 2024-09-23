@implementation FHFeatureInsight

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[FHFeatureInsight type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[FHFeatureInsight detectionType](self, "detectionType"), CFSTR("detectionType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHFeatureInsight direction](self, "direction"), CFSTR("direction"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHFeatureInsight window](self, "window"), CFSTR("window"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHFeatureInsight windowReference](self, "windowReference"), CFSTR("windowReference"));
  -[FHFeatureInsight startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("startDate"));

  -[FHFeatureInsight endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("endDate"));

  -[FHFeatureInsight averageAmount](self, "averageAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("averageAmount"));

  -[FHFeatureInsight spendAmount](self, "spendAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("spendAmount"));

  -[FHFeatureInsight spendingInsightAmount](self, "spendingInsightAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("spendingInsightAmount"));

  -[FHFeatureInsight spendingInsightPercentageValue](self, "spendingInsightPercentageValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("spendingInsightPercentageValue"));

  -[FHFeatureInsight currencyCode](self, "currencyCode");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("currencyCode"));

}

- (FHFeatureInsight)initWithCoder:(id)a3
{
  id v4;
  FHFeatureInsight *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *endDate;
  uint64_t v12;
  NSDecimalNumber *averageAmount;
  uint64_t v14;
  NSDecimalNumber *spendAmount;
  uint64_t v16;
  NSDecimalNumber *spendingInsightAmount;
  uint64_t v18;
  NSDecimalNumber *spendingInsightPercentageValue;
  uint64_t v20;
  NSString *currencyCode;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FHFeatureInsight;
  v5 = -[FHFeatureInsight init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->type;
    v5->type = (NSString *)v6;

    v5->detectionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("detectionType"));
    v5->direction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction"));
    v5->window = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("window"));
    v5->windowReference = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("windowReference"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->startDate;
    v5->startDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v5->endDate;
    v5->endDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    averageAmount = v5->averageAmount;
    v5->averageAmount = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spendAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    spendAmount = v5->spendAmount;
    v5->spendAmount = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spendingInsightAmount"));
    v16 = objc_claimAutoreleasedReturnValue();
    spendingInsightAmount = v5->spendingInsightAmount;
    v5->spendingInsightAmount = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spendingInsightPercentageValue"));
    v18 = objc_claimAutoreleasedReturnValue();
    spendingInsightPercentageValue = v5->spendingInsightPercentageValue;
    v5->spendingInsightPercentageValue = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->currencyCode;
    v5->currencyCode = (NSString *)v20;

  }
  return v5;
}

- (NSString)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("type"), self->type);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("detectionType"), self->detectionType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("direction"), self->direction);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("window"), self->window);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("windowReference"), self->windowReference);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("startDate"), self->startDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("endDate"), self->endDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("averageAmount"), self->averageAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("spendAmount"), self->spendAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("spendingInsightAmount"), self->spendingInsightAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("spendingInsightPercentageValue"),
    self->spendingInsightPercentageValue);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("currencyCode"), self->currencyCode);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)type
{
  return self->type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)detectionType
{
  return self->detectionType;
}

- (void)setDetectionType:(int64_t)a3
{
  self->detectionType = a3;
}

- (int64_t)direction
{
  return self->direction;
}

- (void)setDirection:(int64_t)a3
{
  self->direction = a3;
}

- (int64_t)window
{
  return self->window;
}

- (void)setWindow:(int64_t)a3
{
  self->window = a3;
}

- (unint64_t)windowReference
{
  return self->windowReference;
}

- (void)setWindowReference:(unint64_t)a3
{
  self->windowReference = a3;
}

- (NSDate)startDate
{
  return self->startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)endDate
{
  return self->endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)averageAmount
{
  return self->averageAmount;
}

- (void)setAverageAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDecimalNumber)spendAmount
{
  return self->spendAmount;
}

- (void)setSpendAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDecimalNumber)spendingInsightAmount
{
  return self->spendingInsightAmount;
}

- (void)setSpendingInsightAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDecimalNumber)spendingInsightPercentageValue
{
  return self->spendingInsightPercentageValue;
}

- (void)setSpendingInsightPercentageValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)currencyCode
{
  return self->currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->currencyCode, 0);
  objc_storeStrong((id *)&self->spendingInsightPercentageValue, 0);
  objc_storeStrong((id *)&self->spendingInsightAmount, 0);
  objc_storeStrong((id *)&self->spendAmount, 0);
  objc_storeStrong((id *)&self->averageAmount, 0);
  objc_storeStrong((id *)&self->endDate, 0);
  objc_storeStrong((id *)&self->startDate, 0);
  objc_storeStrong((id *)&self->type, 0);
}

@end
