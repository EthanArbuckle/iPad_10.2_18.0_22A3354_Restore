@implementation _HKQuantitySeriesSampleQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_HKQuantitySeriesSampleQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = (void *)-[HKQuantitySample copy](self->_quantitySample, "copy");
  objc_msgSend(v4, "setQuantitySample:", v5);

  objc_msgSend(v4, "setSeriesAnchor:", self->_seriesAnchor);
  objc_msgSend(v4, "setMode:", self->_mode);
  objc_msgSend(v4, "setOptions:", self->_options);
  v6 = (void *)-[NSDate copy](self->_maximumStartDate, "copy");
  objc_msgSend(v4, "setMaximumStartDate:", v6);

  v7 = (void *)-[NSUUID copy](self->_latestUUID, "copy");
  objc_msgSend(v4, "setLatestUUID:", v7);

  v8 = (void *)-[NSDate copy](self->_latestSampleStartDate, "copy");
  objc_msgSend(v4, "setLatestSampleStartDate:", v8);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKQuantitySeriesSampleQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKQuantitySeriesSampleQueryServerConfiguration *v5;
  uint64_t v6;
  HKQuantitySample *quantitySample;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HKQuantitySeriesSampleQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sample"));
    v6 = objc_claimAutoreleasedReturnValue();
    quantitySample = v5->_quantitySample;
    v5->_quantitySample = (HKQuantitySample *)v6;

    v5->_seriesAnchor = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("anchor"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mode")))
      v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
    else
      v8 = 0;
    v5->_mode = v8;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("options")))
      v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    else
      v9 = 0;
    v5->_options = v9;
    v10 = objc_msgSend(v4, "containsValueForKey:", CFSTR("maxStart"));
    if (v10)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxStart"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_storeStrong((id *)&v5->_maximumStartDate, v11);
    if (v10)

    v12 = objc_msgSend(v4, "containsValueForKey:", CFSTR("latestUUID"));
    if (v12)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestUUID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_storeStrong((id *)&v5->_latestUUID, v13);
    if (v12)

    v14 = objc_msgSend(v4, "containsValueForKey:", CFSTR("latestStart"));
    if (v14)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestStart"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    objc_storeStrong((id *)&v5->_latestSampleStartDate, v15);
    if (v14)

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *maximumStartDate;
  NSUUID *latestUUID;
  NSDate *latestSampleStartDate;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HKQuantitySeriesSampleQueryServerConfiguration;
  -[HKQueryServerConfiguration encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantitySample, CFSTR("sample"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_seriesAnchor, CFSTR("anchor"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"));
  maximumStartDate = self->_maximumStartDate;
  if (maximumStartDate)
    objc_msgSend(v4, "encodeObject:forKey:", maximumStartDate, CFSTR("maxStart"));
  latestUUID = self->_latestUUID;
  if (latestUUID)
    objc_msgSend(v4, "encodeObject:forKey:", latestUUID, CFSTR("latestUUID"));
  latestSampleStartDate = self->_latestSampleStartDate;
  if (latestSampleStartDate)
    objc_msgSend(v4, "encodeObject:forKey:", latestSampleStartDate, CFSTR("latestStart"));

}

- (HKQuantitySample)quantitySample
{
  return self->_quantitySample;
}

- (void)setQuantitySample:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)seriesAnchor
{
  return self->_seriesAnchor;
}

- (void)setSeriesAnchor:(int64_t)a3
{
  self->_seriesAnchor = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSDate)maximumStartDate
{
  return self->_maximumStartDate;
}

- (void)setMaximumStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSUUID)latestUUID
{
  return self->_latestUUID;
}

- (void)setLatestUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)latestSampleStartDate
{
  return self->_latestSampleStartDate;
}

- (void)setLatestSampleStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSampleStartDate, 0);
  objc_storeStrong((id *)&self->_latestUUID, 0);
  objc_storeStrong((id *)&self->_maximumStartDate, 0);
  objc_storeStrong((id *)&self->_quantitySample, 0);
}

@end
