@implementation HMMTRYearDaySchedule

- (HMMTRYearDaySchedule)initWithStartTime:(id)a3 endTime:(id)a4 status:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMTRYearDaySchedule *v12;
  HMMTRYearDaySchedule *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRYearDaySchedule;
  v12 = -[HMMTRYearDaySchedule init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startTime, a3);
    objc_storeStrong((id *)&v13->_endTime, a4);
    objc_storeStrong((id *)&v13->_status, a5);
  }

  return v13;
}

- (HMMTRYearDaySchedule)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  HMMTRYearDaySchedule *v9;

  v6 = a4;
  +[HMMTRUtilities dateToMatterEpoch:](HMMTRUtilities, "dateToMatterEpoch:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMTRUtilities dateToMatterEpoch:](HMMTRUtilities, "dateToMatterEpoch:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMMTRYearDaySchedule initWithStartTime:endTime:status:](self, "initWithStartTime:endTime:status:", v7, v8, 0);
  return v9;
}

- (HMMTRYearDaySchedule)initWithMTRSchedule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRYearDaySchedule *v8;

  v4 = a3;
  objc_msgSend(v4, "localStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localEndTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMMTRYearDaySchedule initWithStartTime:endTime:status:](self, "initWithStartTime:endTime:status:", v5, v6, v7);
  return v8;
}

- (id)convertToMTRScheduleAtScheduleIndex:(int64_t)a3 forUserAtUserIndex:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = objc_alloc_init(MEMORY[0x24BDDB738]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setYearDayIndex:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserIndex:", v9);

  -[HMMTRYearDaySchedule startTime](self, "startTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalStartTime:", v10);

  -[HMMTRYearDaySchedule endTime](self, "endTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalEndTime:", v11);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (-[HMMTRYearDaySchedule startTime](self, "startTime"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "startTime"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = HMFEqualObjects(),
        v8,
        v7,
        v9))
  {
    -[HMMTRYearDaySchedule endTime](self, "endTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMMTRYearDaySchedule startTime](self, "startTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMMTRYearDaySchedule endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMMTRYearDaySchedule *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(HMMTRYearDaySchedule);
  -[HMMTRYearDaySchedule startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRYearDaySchedule setStartTime:](v4, "setStartTime:", v5);

  -[HMMTRYearDaySchedule endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRYearDaySchedule setEndTime:](v4, "setEndTime:", v6);

  -[HMMTRYearDaySchedule status](self, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRYearDaySchedule setStatus:](v4, "setStatus:", v7);

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMTRUtilities matterEpochToDate:](HMMTRUtilities, "matterEpochToDate:", self->_startTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMTRUtilities matterEpochToDate:](HMMTRUtilities, "matterEpochToDate:", self->_endTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: From %@ to %@>"), v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
