@implementation CTCarrierSpaceUsagePlanItemData

- (CTCarrierSpaceUsagePlanItemData)init
{
  CTCarrierSpaceUsagePlanItemData *v2;
  CTCarrierSpaceUsagePlanItemData *v3;
  NSString *capacity;
  NSString *maxDataBeforeThrottling;
  NSString *thisDeviceDataUsed;
  NSString *sharedDataUsed;
  NSString *sharedPlanIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTCarrierSpaceUsagePlanItemData;
  v2 = -[CTCarrierSpaceUsagePlanItemData init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    capacity = v2->_capacity;
    v2->_units = 0;
    v2->_capacity = 0;

    maxDataBeforeThrottling = v3->_maxDataBeforeThrottling;
    v3->_maxDataBeforeThrottling = 0;

    thisDeviceDataUsed = v3->_thisDeviceDataUsed;
    v3->_thisDeviceDataUsed = 0;

    sharedDataUsed = v3->_sharedDataUsed;
    v3->_sharedDataUsed = 0;

    sharedPlanIdentifier = v3->_sharedPlanIdentifier;
    v3->_sharedPlanIdentifier = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", units=%s"), CTCarrierSpaceDataUnitsAsString(-[CTCarrierSpaceUsagePlanItemData units](self, "units")));
  -[CTCarrierSpaceUsagePlanItemData capacity](self, "capacity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", capacity=%@"), v4);

  -[CTCarrierSpaceUsagePlanItemData maxDataBeforeThrottling](self, "maxDataBeforeThrottling");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", maxDataBeforeThrottling=%@"), v5);

  -[CTCarrierSpaceUsagePlanItemData thisDeviceDataUsed](self, "thisDeviceDataUsed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", used=%@"), v6);

  -[CTCarrierSpaceUsagePlanItemData sharedDataUsed](self, "sharedDataUsed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", sharedDataUsed=%@"), v7);

  -[CTCarrierSpaceUsagePlanItemData sharedPlanIdentifier](self, "sharedPlanIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", sharedPlanIdentifier=%@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  CTCarrierSpaceUsagePlanItemData *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;

  v7 = (CTCarrierSpaceUsagePlanItemData *)a3;
  if (v7 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[CTCarrierSpaceUsagePlanItemData units](self, "units");
      if (v8 == -[CTCarrierSpaceUsagePlanItemData units](v7, "units"))
      {
        -[CTCarrierSpaceUsagePlanItemData capacity](self, "capacity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceUsagePlanItemData capacity](v7, "capacity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 != v10)
        {
          -[CTCarrierSpaceUsagePlanItemData capacity](self, "capacity");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpaceUsagePlanItemData capacity](v7, "capacity");
          v38 = v11;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEqualToString:"))
          {
            v12 = 0;
            goto LABEL_32;
          }
        }
        -[CTCarrierSpaceUsagePlanItemData maxDataBeforeThrottling](self, "maxDataBeforeThrottling");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceUsagePlanItemData maxDataBeforeThrottling](v7, "maxDataBeforeThrottling");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 != v14)
        {
          -[CTCarrierSpaceUsagePlanItemData maxDataBeforeThrottling](self, "maxDataBeforeThrottling");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpaceUsagePlanItemData maxDataBeforeThrottling](v7, "maxDataBeforeThrottling");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v5, "isEqualToString:", v3))
          {
            v12 = 0;
LABEL_30:

LABEL_31:
            if (v9 == v10)
            {
LABEL_33:

              goto LABEL_34;
            }
LABEL_32:

            goto LABEL_33;
          }
        }
        -[CTCarrierSpaceUsagePlanItemData thisDeviceDataUsed](self, "thisDeviceDataUsed");
        v15 = objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceUsagePlanItemData thisDeviceDataUsed](v7, "thisDeviceDataUsed");
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v15;
        if (v15 == v36)
        {
          v35 = v3;
        }
        else
        {
          -[CTCarrierSpaceUsagePlanItemData thisDeviceDataUsed](self, "thisDeviceDataUsed");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpaceUsagePlanItemData thisDeviceDataUsed](v7, "thisDeviceDataUsed");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v16;
          if (!objc_msgSend(v16, "isEqualToString:"))
          {
            v12 = 0;
            v20 = (void *)v36;
            v19 = v37;
LABEL_28:

LABEL_29:
            if (v13 == v14)
              goto LABEL_31;
            goto LABEL_30;
          }
          v35 = v3;
        }
        -[CTCarrierSpaceUsagePlanItemData sharedDataUsed](self, "sharedDataUsed");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceUsagePlanItemData sharedDataUsed](v7, "sharedDataUsed");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 == v18)
        {
          v30 = v5;
          v31 = v14;
        }
        else
        {
          -[CTCarrierSpaceUsagePlanItemData sharedDataUsed](self, "sharedDataUsed");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpaceUsagePlanItemData sharedDataUsed](v7, "sharedDataUsed");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v4, "isEqualToString:"))
          {
            v12 = 0;
            goto LABEL_26;
          }
          v30 = v5;
          v31 = v14;
        }
        -[CTCarrierSpaceUsagePlanItemData sharedPlanIdentifier](self, "sharedPlanIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceUsagePlanItemData sharedPlanIdentifier](v7, "sharedPlanIdentifier");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v21 == (void *)v22)
        {

          v12 = 1;
        }
        else
        {
          v23 = (void *)v22;
          -[CTCarrierSpaceUsagePlanItemData sharedPlanIdentifier](self, "sharedPlanIdentifier");
          v28 = v4;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpaceUsagePlanItemData sharedPlanIdentifier](v7, "sharedPlanIdentifier");
          v29 = v13;
          v25 = v17;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v24, "isEqualToString:", v26);

          v17 = v25;
          v13 = v29;

          v4 = v28;
        }
        v5 = v30;
        v14 = v31;
        if (v17 == v18)
        {
LABEL_27:

          v20 = (void *)v36;
          v19 = v37;
          v3 = v35;
          if (v37 == (void *)v36)
            goto LABEL_29;
          goto LABEL_28;
        }
LABEL_26:

        goto LABEL_27;
      }
    }
    v12 = 0;
  }
LABEL_34:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t units;
  id v5;

  units = self->_units;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", units, CFSTR("units"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_capacity, CFSTR("capacity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maxDataBeforeThrottling, CFSTR("maxDataBeforeThrottling"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thisDeviceDataUsed, CFSTR("thisDeviceDataUsed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedDataUsed, CFSTR("sharedDataUsed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedPlanIdentifier, CFSTR("sharedPlanIdentifier"));

}

- (CTCarrierSpaceUsagePlanItemData)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpaceUsagePlanItemData *v5;
  uint64_t v6;
  NSString *capacity;
  uint64_t v8;
  NSString *maxDataBeforeThrottling;
  uint64_t v10;
  NSString *thisDeviceDataUsed;
  uint64_t v12;
  NSString *sharedDataUsed;
  uint64_t v14;
  NSString *sharedPlanIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTCarrierSpaceUsagePlanItemData;
  v5 = -[CTCarrierSpaceUsagePlanItemData init](&v17, sel_init);
  if (v5)
  {
    v5->_units = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("units"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capacity"));
    v6 = objc_claimAutoreleasedReturnValue();
    capacity = v5->_capacity;
    v5->_capacity = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxDataBeforeThrottling"));
    v8 = objc_claimAutoreleasedReturnValue();
    maxDataBeforeThrottling = v5->_maxDataBeforeThrottling;
    v5->_maxDataBeforeThrottling = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thisDeviceDataUsed"));
    v10 = objc_claimAutoreleasedReturnValue();
    thisDeviceDataUsed = v5->_thisDeviceDataUsed;
    v5->_thisDeviceDataUsed = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedDataUsed"));
    v12 = objc_claimAutoreleasedReturnValue();
    sharedDataUsed = v5->_sharedDataUsed;
    v5->_sharedDataUsed = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedPlanIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    sharedPlanIdentifier = v5->_sharedPlanIdentifier;
    v5->_sharedPlanIdentifier = (NSString *)v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)units
{
  return self->_units;
}

- (void)setUnits:(int64_t)a3
{
  self->_units = a3;
}

- (NSString)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_capacity, a3);
}

- (NSString)maxDataBeforeThrottling
{
  return self->_maxDataBeforeThrottling;
}

- (void)setMaxDataBeforeThrottling:(id)a3
{
  objc_storeStrong((id *)&self->_maxDataBeforeThrottling, a3);
}

- (NSString)thisDeviceDataUsed
{
  return self->_thisDeviceDataUsed;
}

- (void)setThisDeviceDataUsed:(id)a3
{
  objc_storeStrong((id *)&self->_thisDeviceDataUsed, a3);
}

- (NSString)sharedDataUsed
{
  return self->_sharedDataUsed;
}

- (void)setSharedDataUsed:(id)a3
{
  objc_storeStrong((id *)&self->_sharedDataUsed, a3);
}

- (NSString)sharedPlanIdentifier
{
  return self->_sharedPlanIdentifier;
}

- (void)setSharedPlanIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharedPlanIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedPlanIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedDataUsed, 0);
  objc_storeStrong((id *)&self->_thisDeviceDataUsed, 0);
  objc_storeStrong((id *)&self->_maxDataBeforeThrottling, 0);
  objc_storeStrong((id *)&self->_capacity, 0);
}

@end
