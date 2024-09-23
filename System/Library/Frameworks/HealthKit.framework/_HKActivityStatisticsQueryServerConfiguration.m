@implementation _HKActivityStatisticsQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKActivityStatisticsQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setStartDate:", self->_startDate);
  objc_msgSend(v4, "setEndDate:", self->_endDate);
  objc_msgSend(v4, "setMoveIntervalComponents:", self->_moveIntervalComponents);
  objc_msgSend(v4, "setExerciseIntervalComponents:", self->_exerciseIntervalComponents);
  objc_msgSend(v4, "setUpdateInterval:", self->_updateInterval);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKActivityStatisticsQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKActivityStatisticsQueryServerConfiguration *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDate *endDate;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDateComponents *moveIntervalComponents;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSDateComponents *exerciseIntervalComponents;
  void *v22;
  double v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_HKActivityStatisticsQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_startDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_endDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_moveIntervalComponents);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    moveIntervalComponents = v5->_moveIntervalComponents;
    v5->_moveIntervalComponents = (NSDateComponents *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_exerciseIntervalComponents);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    exerciseIntervalComponents = v5->_exerciseIntervalComponents;
    v5->_exerciseIntervalComponents = (NSDateComponents *)v20;

    NSStringFromSelector(sel_updateInterval);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v22);
    v5->_updateInterval = v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *startDate;
  void *v6;
  NSDate *endDate;
  void *v8;
  NSDateComponents *moveIntervalComponents;
  void *v10;
  NSDateComponents *exerciseIntervalComponents;
  void *v12;
  double updateInterval;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_HKActivityStatisticsQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  startDate = self->_startDate;
  NSStringFromSelector(sel_startDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", startDate, v6, v15.receiver, v15.super_class);

  endDate = self->_endDate;
  NSStringFromSelector(sel_endDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", endDate, v8);

  moveIntervalComponents = self->_moveIntervalComponents;
  NSStringFromSelector(sel_moveIntervalComponents);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", moveIntervalComponents, v10);

  exerciseIntervalComponents = self->_exerciseIntervalComponents;
  NSStringFromSelector(sel_exerciseIntervalComponents);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", exerciseIntervalComponents, v12);

  updateInterval = self->_updateInterval;
  NSStringFromSelector(sel_updateInterval);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v14, updateInterval);

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

- (NSDateComponents)moveIntervalComponents
{
  return self->_moveIntervalComponents;
}

- (void)setMoveIntervalComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDateComponents)exerciseIntervalComponents
{
  return self->_exerciseIntervalComponents;
}

- (void)setExerciseIntervalComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exerciseIntervalComponents, 0);
  objc_storeStrong((id *)&self->_moveIntervalComponents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
