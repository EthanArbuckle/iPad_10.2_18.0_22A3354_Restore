@implementation _HKDeepBreathingSessionConfiguration

+ (id)sessionConfigurationWithStartDate:(id)a3 sessionDuration:(double)a4 inhaleExhaleRatio:(double)a5 respirationsPerMinute:(double)a6
{
  id v10;
  void *v11;

  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithStartDate:sessionDuration:inhaleExhaleRatio:respirationsPerMinute:", v10, a4, a5, a6);

  return v11;
}

- (id)_initWithStartDate:(id)a3 sessionDuration:(double)a4 inhaleExhaleRatio:(double)a5 respirationsPerMinute:(double)a6
{
  id v10;
  _HKDeepBreathingSessionConfiguration *v11;
  uint64_t v12;
  NSDate *startDate;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_HKDeepBreathingSessionConfiguration;
  v11 = -[_HKDeepBreathingSessionConfiguration init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    v11->_sessionDuration = a4;
    v11->_inhaleExhaleRatio = a5;
    v11->_respirationsPerMinute = a6;
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSDate *startDate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  startDate = self->_startDate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sessionDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_inhaleExhaleRatio);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_respirationsPerMinute);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, startDate:%@, sessionDuration:%@, inhaleExhaleRatio:%@, respirationsPerMinute:%@>"), v4, self, startDate, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKDeepBreathingSessionConfiguration;
  v4 = -[HKTaskConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSDate copy](self->_startDate, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v4[2] = *(_QWORD *)&self->_sessionDuration;
  v4[3] = *(_QWORD *)&self->_inhaleExhaleRatio;
  v4[4] = *(_QWORD *)&self->_respirationsPerMinute;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKDeepBreathingSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKDeepBreathingSessionConfiguration *v5;
  uint64_t v6;
  NSDate *startDate;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKDeepBreathingSessionConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sessionDuration"));
    v5->_sessionDuration = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("inhaleExhaleRatio"));
    v5->_inhaleExhaleRatio = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("respirationsPerMinute"));
    v5->_respirationsPerMinute = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKDeepBreathingSessionConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("sessionDuration"), self->_sessionDuration);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("inhaleExhaleRatio"), self->_inhaleExhaleRatio);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("respirationsPerMinute"), self->_respirationsPerMinute);

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)sessionDuration
{
  return self->_sessionDuration;
}

- (void)setSessionDuration:(double)a3
{
  self->_sessionDuration = a3;
}

- (double)inhaleExhaleRatio
{
  return self->_inhaleExhaleRatio;
}

- (void)setInhaleExhaleRatio:(double)a3
{
  self->_inhaleExhaleRatio = a3;
}

- (double)respirationsPerMinute
{
  return self->_respirationsPerMinute;
}

- (void)setRespirationsPerMinute:(double)a3
{
  self->_respirationsPerMinute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
