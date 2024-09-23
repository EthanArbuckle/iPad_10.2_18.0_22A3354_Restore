@implementation HKHRAFibBurdenHistogramResult

- (HKHRAFibBurdenHistogramResult)initWithDayOfWeekHistogram:(id)a3 timeOfDayHistogram:(id)a4
{
  id v7;
  id v8;
  HKHRAFibBurdenHistogramResult *v9;
  HKHRAFibBurdenHistogramResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHRAFibBurdenHistogramResult;
  v9 = -[HKHRAFibBurdenHistogramResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dayOfWeekHistogram, a3);
    objc_storeStrong((id *)&v10->_timeOfDayHistogram, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HKHRAFibBurdenHistogramResult *v4;
  HKHRAFibBurdenHistogramResult *v5;
  BOOL v6;

  v4 = (HKHRAFibBurdenHistogramResult *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[HKHRAFibBurdenDayOfWeekHistogram isEqual:](self->_dayOfWeekHistogram, "isEqual:", v5->_dayOfWeekHistogram))
        v6 = -[HKHRAFibBurdenTimeOfDayHistogram isEqual:](self->_timeOfDayHistogram, "isEqual:", v5->_timeOfDayHistogram);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HKHRAFibBurdenDayOfWeekHistogram hash](self->_dayOfWeekHistogram, "hash");
  return -[HKHRAFibBurdenTimeOfDayHistogram hash](self->_timeOfDayHistogram, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKHRAFibBurdenDayOfWeekHistogram *dayOfWeekHistogram;
  id v5;

  dayOfWeekHistogram = self->_dayOfWeekHistogram;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dayOfWeekHistogram, CFSTR("DayOfWeekHistogramKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeOfDayHistogram, CFSTR("TimeOfDayHistogramKey"));

}

- (HKHRAFibBurdenHistogramResult)initWithCoder:(id)a3
{
  id v4;
  HKHRAFibBurdenHistogramResult *v5;
  uint64_t v6;
  HKHRAFibBurdenDayOfWeekHistogram *dayOfWeekHistogram;
  uint64_t v8;
  HKHRAFibBurdenTimeOfDayHistogram *timeOfDayHistogram;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHRAFibBurdenHistogramResult;
  v5 = -[HKHRAFibBurdenHistogramResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DayOfWeekHistogramKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    dayOfWeekHistogram = v5->_dayOfWeekHistogram;
    v5->_dayOfWeekHistogram = (HKHRAFibBurdenDayOfWeekHistogram *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TimeOfDayHistogramKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeOfDayHistogram = v5->_timeOfDayHistogram;
    v5->_timeOfDayHistogram = (HKHRAFibBurdenTimeOfDayHistogram *)v8;

  }
  return v5;
}

- (HKHRAFibBurdenDayOfWeekHistogram)dayOfWeekHistogram
{
  return self->_dayOfWeekHistogram;
}

- (HKHRAFibBurdenTimeOfDayHistogram)timeOfDayHistogram
{
  return self->_timeOfDayHistogram;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfDayHistogram, 0);
  objc_storeStrong((id *)&self->_dayOfWeekHistogram, 0);
}

@end
