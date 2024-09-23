@implementation _HKStatisticsQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKStatisticsQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOptions:", self->_options);
  objc_msgSend(v4, "setMergeStrategy:", self->_mergeStrategy);
  objc_msgSend(v4, "setDateInterval:", self->_dateInterval);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKStatisticsQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKStatisticsQueryServerConfiguration *v5;
  uint64_t v6;
  NSDateInterval *dateInterval;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKStatisticsQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    v5->_mergeStrategy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mergeStrategy"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
    v6 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKStatisticsQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_mergeStrategy, CFSTR("mergeStrategy"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));

}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)mergeStrategy
{
  return self->_mergeStrategy;
}

- (void)setMergeStrategy:(unint64_t)a3
{
  self->_mergeStrategy = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
