@implementation _HKQuantityDistributionData

- (_HKQuantityDistributionData)initWithStartDate:(id)a3 endDate:(id)a4 minimumBucketValue:(id)a5 minimumValue:(id)a6 maximumValue:(id)a7 averageValue:(id)a8 duration:(id)a9 histogramCounts:(id)a10
{
  return -[_HKQuantityDistributionData initWithStartDate:endDate:minimumBucketValue:minimumValue:maximumValue:averageValue:duration:histogramCounts:contextIdentifiers:](self, "initWithStartDate:endDate:minimumBucketValue:minimumValue:maximumValue:averageValue:duration:histogramCounts:contextIdentifiers:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (_HKQuantityDistributionData)initWithStartDate:(id)a3 endDate:(id)a4 minimumBucketValue:(id)a5 minimumValue:(id)a6 maximumValue:(id)a7 averageValue:(id)a8 duration:(id)a9 histogramCounts:(id)a10 contextIdentifiers:(id)a11
{
  id v18;
  _HKQuantityDistributionData *v19;
  _HKQuantityDistributionData *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)_HKQuantityDistributionData;
  v19 = -[_HKQuantityDistributionData init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_startDate, a3);
    objc_storeStrong((id *)&v20->_endDate, a4);
    objc_storeStrong((id *)&v20->_minimumBucketValue, a5);
    objc_storeStrong((id *)&v20->_minimumValue, a6);
    objc_storeStrong((id *)&v20->_maximumValue, a7);
    objc_storeStrong((id *)&v20->_averageValue, a8);
    objc_storeStrong((id *)&v20->_duration, a9);
    objc_storeStrong((id *)&v20->_histogramCounts, a10);
    objc_storeStrong((id *)&v20->_contextIdentifiers, a11);
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKQuantityDistributionData)initWithCoder:(id)a3
{
  id v4;
  _HKQuantityDistributionData *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  uint64_t v10;
  HKQuantity *minimumBucketValue;
  uint64_t v12;
  HKQuantity *minimumValue;
  uint64_t v14;
  HKQuantity *maximumValue;
  uint64_t v16;
  HKQuantity *averageValue;
  uint64_t v18;
  HKQuantity *duration;
  void *v20;
  uint64_t v21;
  NSArray *histogramCounts;
  void *v23;
  uint64_t v24;
  NSArray *contextIdentifiers;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_HKQuantityDistributionData;
  v5 = -[_HKQuantityDistributionData init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumBucketValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    minimumBucketValue = v5->_minimumBucketValue;
    v5->_minimumBucketValue = (HKQuantity *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumValueKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    minimumValue = v5->_minimumValue;
    v5->_minimumValue = (HKQuantity *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumValueKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    maximumValue = v5->_maximumValue;
    v5->_maximumValue = (HKQuantity *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageValueKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    averageValue = v5->_averageValue;
    v5->_averageValue = (HKQuantity *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("durationKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    duration = v5->_duration;
    v5->_duration = (HKQuantity *)v18;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("histogramCounts"));
    v21 = objc_claimAutoreleasedReturnValue();
    histogramCounts = v5->_histogramCounts;
    v5->_histogramCounts = (NSArray *)v21;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("contextIdentifiers"));
    v24 = objc_claimAutoreleasedReturnValue();
    contextIdentifiers = v5->_contextIdentifiers;
    v5->_contextIdentifiers = (NSArray *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumBucketValue, CFSTR("minimumBucketValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumValue, CFSTR("minimumValueKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximumValue, CFSTR("maximumValueKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageValue, CFSTR("averageValueKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_duration, CFSTR("durationKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_histogramCounts, CFSTR("histogramCounts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextIdentifiers, CFSTR("contextIdentifiers"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[HKQuantity copyWithZone:](self->_minimumBucketValue, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[HKQuantity copyWithZone:](self->_minimumValue, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[HKQuantity copyWithZone:](self->_maximumValue, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[HKQuantity copyWithZone:](self->_averageValue, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  v18 = -[HKQuantity copyWithZone:](self->_duration, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  v20 = -[NSArray copyWithZone:](self->_histogramCounts, "copyWithZone:", a3);
  v21 = (void *)v5[8];
  v5[8] = v20;

  v22 = -[NSArray copyWithZone:](self->_contextIdentifiers, "copyWithZone:", a3);
  v23 = (void *)v5[9];
  v5[9] = v22;

  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (HKQuantity)minimumBucketValue
{
  return self->_minimumBucketValue;
}

- (HKQuantity)minimumValue
{
  return self->_minimumValue;
}

- (HKQuantity)maximumValue
{
  return self->_maximumValue;
}

- (HKQuantity)averageValue
{
  return self->_averageValue;
}

- (HKQuantity)duration
{
  return self->_duration;
}

- (NSArray)histogramCounts
{
  return self->_histogramCounts;
}

- (NSArray)contextIdentifiers
{
  return self->_contextIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifiers, 0);
  objc_storeStrong((id *)&self->_histogramCounts, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_averageValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_minimumBucketValue, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
