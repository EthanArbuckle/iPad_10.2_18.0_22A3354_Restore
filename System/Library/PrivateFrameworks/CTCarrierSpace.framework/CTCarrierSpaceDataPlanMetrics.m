@implementation CTCarrierSpaceDataPlanMetrics

- (CTCarrierSpaceDataPlanMetrics)init
{
  CTCarrierSpaceDataPlanMetrics *v2;
  CTCarrierSpaceDataPlanMetrics *v3;
  NSDate *billingCycleEndDate;
  CTCarrierSpaceDataPlanMetricsItem *domestic;
  NSNumber *domesticCapacity;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTCarrierSpaceDataPlanMetrics;
  v2 = -[CTCarrierSpaceDataPlanMetrics init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    billingCycleEndDate = v2->_billingCycleEndDate;
    v2->_billingCycleEndDate = 0;

    domestic = v3->_domestic;
    v3->_domestic = 0;

    domesticCapacity = v3->_domesticCapacity;
    v3->_regStatus = 0;
    v3->_domesticCapacity = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCarrierSpaceDataPlanMetrics billingCycleEndDate](self, "billingCycleEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", billingCycleEndDate=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", regStatus=%s"), CTCarrierSpaceRegistrationStatusAsString(-[CTCarrierSpaceDataPlanMetrics regStatus](self, "regStatus")));
  -[CTCarrierSpaceDataPlanMetrics domesticCapacity](self, "domesticCapacity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", domesticCapacity=%@"), v5);

  -[CTCarrierSpaceDataPlanMetrics domestic](self, "domestic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", domestic=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTCarrierSpaceDataPlanMetrics *v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (CTCarrierSpaceDataPlanMetrics *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTCarrierSpaceDataPlanMetrics billingCycleEndDate](self, "billingCycleEndDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpaceDataPlanMetrics billingCycleEndDate](v6, "billingCycleEndDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[CTCarrierSpaceDataPlanMetrics billingCycleEndDate](self, "billingCycleEndDate"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTCarrierSpaceDataPlanMetrics billingCycleEndDate](v6, "billingCycleEndDate"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqualToDate:", v4)))
      {
        v10 = -[CTCarrierSpaceDataPlanMetrics regStatus](self, "regStatus");
        if (v10 == -[CTCarrierSpaceDataPlanMetrics regStatus](v6, "regStatus"))
        {
          -[CTCarrierSpaceDataPlanMetrics domesticCapacity](self, "domesticCapacity");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpaceDataPlanMetrics domesticCapacity](v6, "domesticCapacity");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v11 == (void *)v12)
          {

            v9 = 1;
          }
          else
          {
            v13 = (void *)v12;
            -[CTCarrierSpaceDataPlanMetrics domesticCapacity](self, "domesticCapacity");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[CTCarrierSpaceDataPlanMetrics domesticCapacity](v6, "domesticCapacity");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v14, "isEqualToNumber:", v15);

          }
        }
        else
        {
          v9 = 0;
        }
        if (v7 == v8)
          goto LABEL_15;
      }
      else
      {
        v9 = 0;
      }

LABEL_15:
      goto LABEL_16;
    }
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (CTCarrierSpaceDataPlanMetricsItem)domestic
{
  CTCarrierSpaceDataPlanMetricsItem *v2;

  if (self->_regStatus == 2)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_alloc_init(CTCarrierSpaceDataPlanMetricsItem);
    -[CTCarrierSpaceDataPlanMetricsItem setCapacityBytes:](v2, "setCapacityBytes:", self->_domesticCapacity);
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *billingCycleEndDate;
  id v5;

  billingCycleEndDate = self->_billingCycleEndDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", billingCycleEndDate, CFSTR("billingCycleEndDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_regStatus, CFSTR("regStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domesticCapacity, CFSTR("domesticCapacity"));

}

- (CTCarrierSpaceDataPlanMetrics)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpaceDataPlanMetrics *v5;
  uint64_t v6;
  NSDate *billingCycleEndDate;
  uint64_t v8;
  NSNumber *domesticCapacity;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCarrierSpaceDataPlanMetrics;
  v5 = -[CTCarrierSpaceDataPlanMetrics init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingCycleEndDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    billingCycleEndDate = v5->_billingCycleEndDate;
    v5->_billingCycleEndDate = (NSDate *)v6;

    v5->_regStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("regStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domesticCapacity"));
    v8 = objc_claimAutoreleasedReturnValue();
    domesticCapacity = v5->_domesticCapacity;
    v5->_domesticCapacity = (NSNumber *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)billingCycleEndDate
{
  return self->_billingCycleEndDate;
}

- (void)setBillingCycleEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_billingCycleEndDate, a3);
}

- (void)setDomestic:(id)a3
{
  objc_storeStrong((id *)&self->_domestic, a3);
}

- (int64_t)regStatus
{
  return self->_regStatus;
}

- (void)setRegStatus:(int64_t)a3
{
  self->_regStatus = a3;
}

- (NSNumber)domesticCapacity
{
  return self->_domesticCapacity;
}

- (void)setDomesticCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_domesticCapacity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domesticCapacity, 0);
  objc_storeStrong((id *)&self->_domestic, 0);
  objc_storeStrong((id *)&self->_billingCycleEndDate, 0);
}

@end
