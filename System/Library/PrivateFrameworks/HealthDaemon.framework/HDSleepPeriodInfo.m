@implementation HDSleepPeriodInfo

- (HDSleepPeriodInfo)initWithUserSetSchedules:(id)a3
{
  id v4;
  HDSleepPeriodInfo *v5;
  uint64_t v6;
  NSArray *userSetSchedules;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSleepPeriodInfo;
  v5 = -[HDSleepPeriodInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    userSetSchedules = v5->_userSetSchedules;
    v5->_userSetSchedules = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)userSetSchedules
{
  return self->_userSetSchedules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSetSchedules, 0);
}

@end
