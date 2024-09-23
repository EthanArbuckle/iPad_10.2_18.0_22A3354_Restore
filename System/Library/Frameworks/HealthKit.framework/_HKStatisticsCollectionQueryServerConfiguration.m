@implementation _HKStatisticsCollectionQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKStatisticsCollectionQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAnchorDate:", self->_anchorDate);
  objc_msgSend(v4, "setOptions:", self->_options);
  objc_msgSend(v4, "setIntervalComponents:", self->_intervalComponents);
  objc_msgSend(v4, "setMergeStrategy:", self->_mergeStrategy);
  objc_msgSend(v4, "setDateInterval:", self->_dateInterval);
  objc_msgSend(v4, "setCacheSettings:", self->_cacheSettings);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKStatisticsCollectionQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKStatisticsCollectionQueryServerConfiguration *v5;
  uint64_t v6;
  NSDate *anchorDate;
  uint64_t v8;
  NSDateComponents *intervalComponents;
  uint64_t v10;
  NSDateInterval *dateInterval;
  uint64_t v12;
  HKStatisticsCollectionCacheSettings *cacheSettings;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_HKStatisticsCollectionQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchor"));
    v6 = objc_claimAutoreleasedReturnValue();
    anchorDate = v5->_anchorDate;
    v5->_anchorDate = (NSDate *)v6;

    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interval"));
    v8 = objc_claimAutoreleasedReturnValue();
    intervalComponents = v5->_intervalComponents;
    v5->_intervalComponents = (NSDateComponents *)v8;

    v5->_mergeStrategy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mergeStrategy"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
    v10 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheSettings"));
    v12 = objc_claimAutoreleasedReturnValue();
    cacheSettings = v5->_cacheSettings;
    v5->_cacheSettings = (HKStatisticsCollectionCacheSettings *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKStatisticsCollectionQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorDate, CFSTR("anchor"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intervalComponents, CFSTR("interval"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_mergeStrategy, CFSTR("mergeStrategy"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cacheSettings, CFSTR("cacheSettings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));

}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (void)setAnchorDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (void)setIntervalComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (HKStatisticsCollectionCacheSettings)cacheSettings
{
  return self->_cacheSettings;
}

- (void)setCacheSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end
