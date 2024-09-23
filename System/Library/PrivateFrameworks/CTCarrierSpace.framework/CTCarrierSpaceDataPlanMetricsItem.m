@implementation CTCarrierSpaceDataPlanMetricsItem

- (CTCarrierSpaceDataPlanMetricsItem)init
{
  CTCarrierSpaceDataPlanMetricsItem *v2;
  CTCarrierSpaceDataPlanMetricsItem *v3;
  NSNumber *capacityBytes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTCarrierSpaceDataPlanMetricsItem;
  v2 = -[CTCarrierSpaceDataPlanMetricsItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    capacityBytes = v2->_capacityBytes;
    v2->_capacityBytes = 0;

    v3->_capacityValid = 0;
    v3->_units = 0;
    v3->_capacity = 0;
  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCarrierSpaceDataPlanMetricsItem capacityBytes](self, "capacityBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", capacityBytes=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", capacityValid=%d"), -[CTCarrierSpaceDataPlanMetricsItem capacityValid](self, "capacityValid"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", capacity=%lu %s"), -[CTCarrierSpaceDataPlanMetricsItem capacity](self, "capacity"), CTCarrierSpaceDataUnitsAsString(-[CTCarrierSpaceDataPlanMetricsItem units](self, "units")));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTCarrierSpaceDataPlanMetricsItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CTCarrierSpaceDataPlanMetricsItem *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTCarrierSpaceDataPlanMetricsItem capacityBytes](self, "capacityBytes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpaceDataPlanMetricsItem capacityBytes](v4, "capacityBytes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        v9 = 1;
      }
      else
      {
        -[CTCarrierSpaceDataPlanMetricsItem capacityBytes](self, "capacityBytes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceDataPlanMetricsItem capacityBytes](v4, "capacityBytes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)capacityValid
{
  return self->_capacityBytes != 0;
}

- (int64_t)units
{
  return 2;
}

- (unint64_t)capacity
{
  unint64_t result;

  result = (unint64_t)self->_capacityBytes;
  if (result)
    return (unint64_t)CTCarrierSpaceConvertDataUnits(1, 2, (double)(unint64_t)objc_msgSend((id)result, "unsignedIntegerValue"));
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_capacityBytes, CFSTR("capacityBytes"));
}

- (CTCarrierSpaceDataPlanMetricsItem)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpaceDataPlanMetricsItem *v5;
  uint64_t v6;
  NSNumber *capacityBytes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTCarrierSpaceDataPlanMetricsItem;
  v5 = -[CTCarrierSpaceDataPlanMetricsItem init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capacityBytes"));
    v6 = objc_claimAutoreleasedReturnValue();
    capacityBytes = v5->_capacityBytes;
    v5->_capacityBytes = (NSNumber *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)capacityBytes
{
  return self->_capacityBytes;
}

- (void)setCapacityBytes:(id)a3
{
  objc_storeStrong((id *)&self->_capacityBytes, a3);
}

- (void)setCapacityValid:(BOOL)a3
{
  self->_capacityValid = a3;
}

- (void)setUnits:(int64_t)a3
{
  self->_units = a3;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capacityBytes, 0);
}

@end
