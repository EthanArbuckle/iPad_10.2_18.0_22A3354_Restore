@implementation HKHeartRateSummaryReading

- (HKHeartRateSummaryReading)initWithDate:(id)a3 quantity:(id)a4 context:(int64_t)a5
{
  id v9;
  id v10;
  HKHeartRateSummaryReading *v11;
  HKHeartRateSummaryReading *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKHeartRateSummaryReading;
  v11 = -[HKHeartRateSummaryReading init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_date, a3);
    objc_storeStrong((id *)&v12->_quantity, a4);
    v12->_context = a5;
  }

  return v12;
}

- (HKHeartRateSummaryReading)initWithDate:(id)a3 quantity:(id)a4
{
  return -[HKHeartRateSummaryReading initWithDate:quantity:context:](self, "initWithDate:quantity:context:", a3, a4, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("Date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_quantity, CFSTR("Quantity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_context, CFSTR("Context"));

}

- (HKHeartRateSummaryReading)initWithCoder:(id)a3
{
  id v4;
  HKHeartRateSummaryReading *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  HKQuantity *quantity;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHeartRateSummaryReading;
  v5 = -[HKHeartRateSummaryReading init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Quantity"));
    v8 = objc_claimAutoreleasedReturnValue();
    quantity = v5->_quantity;
    v5->_quantity = (HKQuantity *)v8;

    v5->_context = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Context"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  HKQuantity *quantity;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  quantity = self->_quantity;
  +[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](quantity, "doubleValueForUnit:", v6);
  v8 = v7;
  _NSStringFromPrivateHeartRateContext(self->_context);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %.1fbpm (%@) @ %@>"), v4, self, v8, v9, self->_date);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HKHeartRateSummaryReading *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v8 = (HKHeartRateSummaryReading *)a3;
  if (self == v8)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HKHeartRateSummaryReading date](self, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHeartRateSummaryReading date](v8, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10)
      {
        -[HKHeartRateSummaryReading quantity](self, "quantity", v18, v20);
      }
      else
      {
        -[HKHeartRateSummaryReading date](v8, "date");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v12 = 0;
          goto LABEL_23;
        }
        v3 = (void *)v11;
        -[HKHeartRateSummaryReading date](self, "date");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKHeartRateSummaryReading date](v8, "date");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v4, "isEqual:", v5))
        {
          v12 = 0;
LABEL_22:

          goto LABEL_23;
        }
        -[HKHeartRateSummaryReading quantity](self, "quantity", v5, v4);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHeartRateSummaryReading quantity](v8, "quantity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
        goto LABEL_15;
      -[HKHeartRateSummaryReading quantity](v8, "quantity");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {

        v12 = 0;
        goto LABEL_21;
      }
      v6 = (void *)v15;
      -[HKHeartRateSummaryReading quantity](self, "quantity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHeartRateSummaryReading quantity](v8, "quantity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqual:", v5))
      {
LABEL_15:
        v16 = -[HKHeartRateSummaryReading context](self, "context");
        v12 = v16 == -[HKHeartRateSummaryReading context](v8, "context");
        if (v13 == v14)
        {

          goto LABEL_20;
        }
      }
      else
      {
        v12 = 0;
      }

LABEL_20:
LABEL_21:
      v5 = v19;
      v4 = v21;
      if (v9 != v10)
        goto LABEL_22;
LABEL_23:

      goto LABEL_24;
    }
    v12 = 0;
  }
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[HKHeartRateSummaryReading date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKHeartRateSummaryReading quantity](self, "quantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[HKHeartRateSummaryReading context](self, "context");

  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (int64_t)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
