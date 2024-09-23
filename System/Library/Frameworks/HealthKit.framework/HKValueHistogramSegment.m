@implementation HKValueHistogramSegment

- (HKValueHistogramSegment)initWithQuantityRange:(id)a3 count:(int64_t)a4
{
  id v7;
  HKValueHistogramSegment *v8;
  HKValueHistogramSegment *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKValueHistogramSegment;
  v8 = -[HKValueHistogramSegment init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_quantityRange, a3);
    v9->_count = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HKValueHistogramSegment *v4;
  HKValueHistogramSegment *v5;
  HKQuantityRange *quantityRange;
  void *v7;
  int64_t count;
  BOOL v9;

  v4 = (HKValueHistogramSegment *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (-[HKValueHistogramSegment isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    quantityRange = self->_quantityRange;
    -[HKValueHistogramSegment quantityRange](v5, "quantityRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HKQuantityRange isEqual:](quantityRange, "isEqual:", v7))
    {
      count = self->_count;
      v9 = count == -[HKValueHistogramSegment count](v5, "count");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p range=%@ count=%ld>"), objc_opt_class(), self, self->_quantityRange, self->_count);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKValueHistogramSegment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HKValueHistogramSegment *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quantityRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));

  v7 = -[HKValueHistogramSegment initWithQuantityRange:count:](self, "initWithQuantityRange:count:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  HKQuantityRange *quantityRange;
  id v5;

  quantityRange = self->_quantityRange;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", quantityRange, CFSTR("quantityRange"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_count, CFSTR("count"));

}

- (HKQuantityRange)quantityRange
{
  return self->_quantityRange;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityRange, 0);
}

@end
