@implementation FHSmartCompoundFeatureRankedValue

- (FHSmartCompoundFeatureRankedValue)initWithLabelAndRank:(id)a3 featureRank:(id)a4
{
  id v7;
  id v8;
  FHSmartCompoundFeatureRankedValue *v9;
  FHSmartCompoundFeatureRankedValue *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[FHSmartCompoundFeatureRankedValue init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureLabel, a3);
    objc_storeStrong((id *)&v10->_featureRank, a4);
  }

  return v10;
}

- (FHSmartCompoundFeatureRankedValue)initWithLabelAndIntegerRank:(id)a3 featureRank:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  FHSmartCompoundFeatureRankedValue *v12;
  _QWORD v14[2];
  int v15;

  v6 = (void *)MEMORY[0x24BDD1518];
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a3;
  objc_msgSend(v7, "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "decimalValue");
  }
  else
  {
    v14[0] = 0;
    v14[1] = 0;
    v15 = 0;
  }
  objc_msgSend(v6, "decimalNumberWithDecimal:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndRank:featureRank:](self, "initWithLabelAndRank:featureRank:", v8, v11);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  FHSmartCompoundFeatureRankedValue *v4;
  FHSmartCompoundFeatureRankedValue *v5;
  NSString *featureLabel;
  void *v7;
  NSDecimalNumber *featureRank;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (FHSmartCompoundFeatureRankedValue *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    featureLabel = self->_featureLabel;
    -[FHSmartCompoundFeatureRankedValue featureLabel](v5, "featureLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](featureLabel, "isEqual:", v7))
    {
      featureRank = self->_featureRank;
      -[FHSmartCompoundFeatureRankedValue featureRank](v5, "featureRank");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDecimalNumber isEqual:](featureRank, "isEqual:", v9))
      {
        -[FHSmartCompoundFeatureRankedValue eventIdentifiers](self, "eventIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHSmartCompoundFeatureRankedValue eventIdentifiers](v5, "eventIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (FHEqualObjects(v10, v11))
        {
          -[FHSmartCompoundFeatureRankedValue eventStartDate](self, "eventStartDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHSmartCompoundFeatureRankedValue eventStartDate](v5, "eventStartDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (FHEqualObjects(v12, v13))
          {
            -[FHSmartCompoundFeatureRankedValue eventEndDate](self, "eventEndDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[FHSmartCompoundFeatureRankedValue eventEndDate](v5, "eventEndDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = FHEqualObjects(v14, v15);

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_featureLabel, "hash");
  v4 = (char *)self->_featureRank + 32 * v3 - v3;
  -[FHSmartCompoundFeatureRankedValue eventIdentifiers](self, "eventIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - (_QWORD)v4 + 32 * (_QWORD)v4;

  -[FHSmartCompoundFeatureRankedValue eventStartDate](self, "eventStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[FHSmartCompoundFeatureRankedValue eventEndDate](self, "eventEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8 + 28629151;

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("\"%@\","), self->_featureLabel);
  -[NSDecimalNumber doubleValue](self->_featureRank, "doubleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("\"%f\"), v4);
  -[FHSmartCompoundFeatureRankedValue eventIdentifiers](self, "eventIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FHSmartCompoundFeatureRankedValue eventIdentifiers](self, "eventIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\"Event identifiers: %@\"), v6);

  }
  -[FHSmartCompoundFeatureRankedValue eventStartDate](self, "eventStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FHSmartCompoundFeatureRankedValue eventStartDate](self, "eventStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\"Event start date: %@\"), v8);

  }
  -[FHSmartCompoundFeatureRankedValue eventEndDate](self, "eventEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[FHSmartCompoundFeatureRankedValue eventEndDate](self, "eventEndDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\"Event end date:%@\"), v10);

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *featureLabel;
  id v5;

  featureLabel = self->_featureLabel;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", featureLabel, CFSTR("featureLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_featureRank, CFSTR("featureRank"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventIdentifiers, CFSTR("eventIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventStartDate, CFSTR("eventStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventEndDate, CFSTR("eventEndDate"));

}

- (FHSmartCompoundFeatureRankedValue)initWithCoder:(id)a3
{
  id v4;
  FHSmartCompoundFeatureRankedValue *v5;
  uint64_t v6;
  NSString *featureLabel;
  uint64_t v8;
  NSDecimalNumber *featureRank;
  uint64_t v10;
  NSArray *eventIdentifiers;
  uint64_t v12;
  NSDate *eventStartDate;
  uint64_t v14;
  NSDate *eventEndDate;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FHSmartCompoundFeatureRankedValue;
  v5 = -[FHSmartCompoundFeatureRankedValue init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureLabel"));
    v6 = objc_claimAutoreleasedReturnValue();
    featureLabel = v5->_featureLabel;
    v5->_featureLabel = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureRank"));
    v8 = objc_claimAutoreleasedReturnValue();
    featureRank = v5->_featureRank;
    v5->_featureRank = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventIdentifiers"));
    v10 = objc_claimAutoreleasedReturnValue();
    eventIdentifiers = v5->_eventIdentifiers;
    v5->_eventIdentifiers = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventStartDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    eventStartDate = v5->_eventStartDate;
    v5->_eventStartDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventEndDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    eventEndDate = v5->_eventEndDate;
    v5->_eventEndDate = (NSDate *)v14;

  }
  return v5;
}

- (NSString)featureLabel
{
  return self->_featureLabel;
}

- (NSDecimalNumber)featureRank
{
  return self->_featureRank;
}

- (NSArray)eventIdentifiers
{
  return self->_eventIdentifiers;
}

- (void)setEventIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)eventStartDate
{
  return self->_eventStartDate;
}

- (void)setEventStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)eventEndDate
{
  return self->_eventEndDate;
}

- (void)setEventEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventEndDate, 0);
  objc_storeStrong((id *)&self->_eventStartDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifiers, 0);
  objc_storeStrong((id *)&self->_featureRank, 0);
  objc_storeStrong((id *)&self->_featureLabel, 0);
}

@end
