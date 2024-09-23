@implementation HKQuantitySeriesSampleBuilderTaskServerConfiguration

- (HKQuantitySeriesSampleBuilderTaskServerConfiguration)initWithQuantityType:(id)a3 startDate:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKQuantitySeriesSampleBuilderTaskServerConfiguration *v11;
  uint64_t v12;
  HKQuantityType *quantityType;
  uint64_t v14;
  NSDate *startDate;
  uint64_t v16;
  HKDevice *device;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKQuantitySeriesSampleBuilderTaskServerConfiguration;
  v11 = -[HKQuantitySeriesSampleBuilderTaskServerConfiguration init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    quantityType = v11->_quantityType;
    v11->_quantityType = (HKQuantityType *)v12;

    v14 = objc_msgSend(v9, "copy");
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v14;

    v16 = objc_msgSend(v10, "copy");
    device = v11->_device;
    v11->_device = (HKDevice *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKQuantitySeriesSampleBuilderTaskServerConfiguration;
  v4 = -[HKTaskConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setQuantityType:", self->_quantityType);
  objc_msgSend(v4, "setStartDate:", self->_startDate);
  objc_msgSend(v4, "setDevice:", self->_device);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQuantitySeriesSampleBuilderTaskServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKQuantitySeriesSampleBuilderTaskServerConfiguration *v5;
  uint64_t v6;
  HKQuantityType *quantityType;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  HKDevice *device;
  HKQuantitySeriesSampleBuilderTaskServerConfiguration *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKQuantitySeriesSampleBuilderTaskServerConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quantity_type"));
    v6 = objc_claimAutoreleasedReturnValue();
    quantityType = v5->_quantityType;
    v5->_quantityType = (HKQuantityType *)v6;

    if (!v5->_quantityType
      || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("start_date")),
          v8 = objc_claimAutoreleasedReturnValue(),
          startDate = v5->_startDate,
          v5->_startDate = (NSDate *)v8,
          startDate,
          !v5->_startDate))
    {
      v12 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device"));
    v10 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (HKDevice *)v10;

  }
  v12 = v5;
LABEL_7:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKQuantitySeriesSampleBuilderTaskServerConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantityType, CFSTR("quantity_type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("start_date"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_device, CFSTR("device"));

}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void)setQuantityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end
