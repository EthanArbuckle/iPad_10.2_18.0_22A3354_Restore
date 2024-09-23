@implementation _HKQuantityDistributionQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKQuantityDistributionQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setStartDate:", self->_startDate);
  objc_msgSend(v4, "setEndDate:", self->_endDate);
  objc_msgSend(v4, "setContextStyle:", self->_contextStyle);
  objc_msgSend(v4, "setAnchorDate:", self->_anchorDate);
  objc_msgSend(v4, "setIntervalComponents:", self->_intervalComponents);
  objc_msgSend(v4, "setHistogramAnchor:", self->_histogramAnchor);
  objc_msgSend(v4, "setHistogramBucketSize:", self->_histogramBucketSize);
  objc_msgSend(v4, "setOptions:", self->_options);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKQuantityDistributionQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKQuantityDistributionQueryServerConfiguration *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  uint64_t v10;
  NSDate *anchorDate;
  uint64_t v12;
  NSDateComponents *intervalComponents;
  uint64_t v14;
  HKQuantity *histogramAnchor;
  uint64_t v16;
  HKQuantity *histogramBucketSize;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_HKQuantityDistributionQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startConfigDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endConfigDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v5->_contextStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contextStyleKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchorDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    anchorDate = v5->_anchorDate;
    v5->_anchorDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intervalComponents"));
    v12 = objc_claimAutoreleasedReturnValue();
    intervalComponents = v5->_intervalComponents;
    v5->_intervalComponents = (NSDateComponents *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogramAnchor"));
    v14 = objc_claimAutoreleasedReturnValue();
    histogramAnchor = v5->_histogramAnchor;
    v5->_histogramAnchor = (HKQuantity *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogramBucketSize"));
    v16 = objc_claimAutoreleasedReturnValue();
    histogramBucketSize = v5->_histogramBucketSize;
    v5->_histogramBucketSize = (HKQuantity *)v16;

    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("optionsKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKQuantityDistributionQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("startConfigDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("endConfigDate"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_contextStyle, CFSTR("contextStyleKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorDate, CFSTR("anchorDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intervalComponents, CFSTR("intervalComponents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_histogramAnchor, CFSTR("histogramAnchor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_histogramBucketSize, CFSTR("histogramBucketSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("optionsKey"));

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)contextStyle
{
  return self->_contextStyle;
}

- (void)setContextStyle:(int64_t)a3
{
  self->_contextStyle = a3;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (void)setAnchorDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (void)setIntervalComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (HKQuantity)histogramAnchor
{
  return self->_histogramAnchor;
}

- (void)setHistogramAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (HKQuantity)histogramBucketSize
{
  return self->_histogramBucketSize;
}

- (void)setHistogramBucketSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramBucketSize, 0);
  objc_storeStrong((id *)&self->_histogramAnchor, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
