@implementation HKMCRecentBasalBodyTemperature

- (void)encodeWithCoder:(id)a3
{
  HKQuantity *mostRecent;
  id v5;

  mostRecent = self->_mostRecent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mostRecent, CFSTR("MostRecent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_upperQuantile, CFSTR("UpperQuantile"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_median, CFSTR("Median"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lowerQuantile, CFSTR("LowerQuantile"));

}

- (HKMCRecentBasalBodyTemperature)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKMCRecentBasalBodyTemperature *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MostRecent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UpperQuantile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Median"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LowerQuantile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HKMCRecentBasalBodyTemperature initWithMostRecent:upperQuantile:median:lowerQuantile:](self, "initWithMostRecent:upperQuantile:median:lowerQuantile:", v5, v6, v7, v8);
  return v9;
}

- (HKMCRecentBasalBodyTemperature)initWithMostRecent:(id)a3 upperQuantile:(id)a4 median:(id)a5 lowerQuantile:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKMCRecentBasalBodyTemperature *v15;
  HKMCRecentBasalBodyTemperature *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKMCRecentBasalBodyTemperature;
  v15 = -[HKMCRecentBasalBodyTemperature init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mostRecent, a3);
    objc_storeStrong((id *)&v16->_upperQuantile, a4);
    objc_storeStrong((id *)&v16->_median, a5);
    objc_storeStrong((id *)&v16->_lowerQuantile, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HKMCRecentBasalBodyTemperature shortDescription](self, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD4048], "degreeCelsiusUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[HKQuantity doubleValueForUnit:](self->_mostRecent, "doubleValueForUnit:", v3);
  v6 = v5;
  -[HKQuantity doubleValueForUnit:](self->_lowerQuantile, "doubleValueForUnit:", v3);
  v8 = v7;
  -[HKQuantity doubleValueForUnit:](self->_median, "doubleValueForUnit:", v3);
  v10 = v9;
  -[HKQuantity doubleValueForUnit:](self->_upperQuantile, "doubleValueForUnit:", v3);
  objc_msgSend(v4, "stringWithFormat:", CFSTR("last:%.2f [%.2f, %.2f, %.2f] %@"), v6, v8, v10, v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  HKMCRecentBasalBodyTemperature *v4;
  HKMCRecentBasalBodyTemperature *v5;
  HKQuantity *mostRecent;
  HKQuantity *v7;
  HKQuantity *upperQuantile;
  HKQuantity *v9;
  HKQuantity *median;
  HKQuantity *v11;
  HKQuantity *lowerQuantile;
  HKQuantity *v13;
  char v14;

  v4 = (HKMCRecentBasalBodyTemperature *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      mostRecent = self->_mostRecent;
      v7 = v5->_mostRecent;
      if (mostRecent != v7 && (!v7 || !-[HKQuantity isEqual:](mostRecent, "isEqual:")))
        goto LABEL_17;
      upperQuantile = self->_upperQuantile;
      v9 = v5->_upperQuantile;
      if (upperQuantile != v9 && (!v9 || !-[HKQuantity isEqual:](upperQuantile, "isEqual:")))
        goto LABEL_17;
      median = self->_median;
      v11 = v5->_median;
      if (median != v11 && (!v11 || !-[HKQuantity isEqual:](median, "isEqual:")))
        goto LABEL_17;
      lowerQuantile = self->_lowerQuantile;
      v13 = v5->_lowerQuantile;
      if (lowerQuantile == v13)
      {
        v14 = 1;
        goto LABEL_18;
      }
      if (v13)
        v14 = -[HKQuantity isEqual:](lowerQuantile, "isEqual:");
      else
LABEL_17:
        v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[HKQuantity hash](self->_mostRecent, "hash");
  v4 = -[HKQuantity hash](self->_upperQuantile, "hash") ^ v3;
  v5 = -[HKQuantity hash](self->_median, "hash");
  return v4 ^ v5 ^ -[HKQuantity hash](self->_lowerQuantile, "hash");
}

- (HKQuantity)mostRecent
{
  return self->_mostRecent;
}

- (HKQuantity)upperQuantile
{
  return self->_upperQuantile;
}

- (HKQuantity)median
{
  return self->_median;
}

- (HKQuantity)lowerQuantile
{
  return self->_lowerQuantile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerQuantile, 0);
  objc_storeStrong((id *)&self->_median, 0);
  objc_storeStrong((id *)&self->_upperQuantile, 0);
  objc_storeStrong((id *)&self->_mostRecent, 0);
}

@end
