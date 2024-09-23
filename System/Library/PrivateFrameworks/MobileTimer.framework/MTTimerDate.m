@implementation MTTimerDate

- (MTTimerDate)initWithDate:(id)a3
{
  id v4;
  void *v5;
  MTTimerDate *v6;

  v4 = a3;
  MTCurrentDateProvider();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MTTimerDate initWithDate:currentDateProvider:](self, "initWithDate:currentDateProvider:", v4, v5);

  return v6;
}

- (MTTimerDate)initWithDate:(id)a3 currentDateProvider:(id)a4
{
  id v6;
  id v7;
  MTTimerDate *v8;
  uint64_t v9;
  NSDate *date;
  uint64_t v11;
  id currentDateProvider;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTTimerDate;
  v8 = -[MTTimerDate init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    date = v8->_date;
    v8->_date = (NSDate *)v9;

    v11 = objc_msgSend(v7, "copy");
    currentDateProvider = v8->_currentDateProvider;
    v8->_currentDateProvider = (id)v11;

  }
  return v8;
}

- (double)remainingTime
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  void *v7;
  double v8;

  (*((void (**)(void))self->_currentDateProvider + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerDate date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mtIsAfterDate:", v3);

  v6 = 0.0;
  if (v5)
  {
    -[MTTimerDate date](self, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v3);
    v6 = v8;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE3E7BF8))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
    v7 = -[MTTimerDate isEqualToTime:](self, "isEqualToTime:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isEqualToTime:(id)a3
{
  return MTCompareTimerTimes(self, a3) == 0;
}

- (int64_t)compare:(id)a3
{
  return MTCompareTimerTimes(self, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTTimerDate)initWithCoder:(id)a3
{
  id v4;
  MTTimerDate *v5;
  uint64_t v6;
  NSDate *date;
  void *v8;
  uint64_t v9;
  id currentDateProvider;

  v4 = a3;
  v5 = -[MTTimerDate initWithDate:](self, "initWithDate:", 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTimerTimeDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    MTCurrentDateProvider();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    currentDateProvider = v5->_currentDateProvider;
    v5->_currentDateProvider = (id)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTTimerDate date](self, "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTTimerTimeDate"));

}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
