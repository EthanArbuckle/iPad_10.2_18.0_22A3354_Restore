@implementation HKCurrentActivityCacheQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKCurrentActivityCacheQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSDateComponents copy](self->_statisticsIntervalComponents, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCurrentActivityCacheQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKCurrentActivityCacheQueryServerConfiguration *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDateComponents *statisticsIntervalComponents;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKCurrentActivityCacheQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_statisticsIntervalComponents);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    statisticsIntervalComponents = v5->_statisticsIntervalComponents;
    v5->_statisticsIntervalComponents = (NSDateComponents *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDateComponents *statisticsIntervalComponents;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKCurrentActivityCacheQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  statisticsIntervalComponents = self->_statisticsIntervalComponents;
  NSStringFromSelector(sel_statisticsIntervalComponents);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", statisticsIntervalComponents, v6, v7.receiver, v7.super_class);

}

- (NSDateComponents)statisticsIntervalComponents
{
  return self->_statisticsIntervalComponents;
}

- (void)setStatisticsIntervalComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsIntervalComponents, 0);
}

@end
