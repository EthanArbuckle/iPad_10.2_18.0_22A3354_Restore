@implementation HKMetadataValueRange

- (HKMetadataValueRange)initWithMinValue:(id)a3 maxValue:(id)a4
{
  id v7;
  id v8;
  HKMetadataValueRange *v9;
  HKMetadataValueRange *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMetadataValueRange;
  v9 = -[HKMetadataValueRange init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_minValue, a3);
    objc_storeStrong(&v10->_maxValue, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HKMetadataValueRange *v4;
  HKMetadataValueRange *v5;
  id minValue;
  void *v7;
  id maxValue;
  void *v9;
  char v10;

  v4 = (HKMetadataValueRange *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (-[HKMetadataValueRange isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    minValue = self->_minValue;
    -[HKMetadataValueRange minValue](v5, "minValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(minValue, "isEqual:", v7))
    {
      maxValue = self->_maxValue;
      -[HKMetadataValueRange maxValue](v5, "maxValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(maxValue, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(self->_minValue, "hash");
  return objc_msgSend(self->_maxValue, "hash") ^ v3;
}

- (id)minValue
{
  return self->_minValue;
}

- (id)maxValue
{
  return self->_maxValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_maxValue, 0);
  objc_storeStrong(&self->_minValue, 0);
}

@end
