@implementation HMMTRWeekDaySchedule

- (HMMTRWeekDaySchedule)initWithDaysMask:(id)a3 startHour:(id)a4 startMinute:(id)a5 endHour:(id)a6 endMinute:(id)a7 status:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMMTRWeekDaySchedule *v18;
  HMMTRWeekDaySchedule *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMMTRWeekDaySchedule;
  v18 = -[HMMTRWeekDaySchedule init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_daysMask, a3);
    objc_storeStrong((id *)&v19->_startHour, a4);
    objc_storeStrong((id *)&v19->_startMinute, a5);
    objc_storeStrong((id *)&v19->_endHour, a6);
    objc_storeStrong((id *)&v19->_endMinute, a7);
    objc_storeStrong((id *)&v19->_status, a8);
  }

  return v19;
}

- (HMMTRWeekDaySchedule)initWithDaysMask:(id)a3 startHour:(id)a4 startMinute:(id)a5 endHour:(id)a6 endMinute:(id)a7
{
  return -[HMMTRWeekDaySchedule initWithDaysMask:startHour:startMinute:endHour:endMinute:status:](self, "initWithDaysMask:startHour:startMinute:endHour:endMinute:status:", a3, a4, a5, a6, a7, 0);
}

- (HMMTRWeekDaySchedule)initWithMTRSchedule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMMTRWeekDaySchedule *v11;

  v4 = a3;
  objc_msgSend(v4, "daysMask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startHour");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startMinute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endHour");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endMinute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "status");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMMTRWeekDaySchedule initWithDaysMask:startHour:startMinute:endHour:endMinute:status:](self, "initWithDaysMask:startHour:startMinute:endHour:endMinute:status:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (id)convertToMTRScheduleAtScheduleIndex:(int64_t)a3 forUserAtUserIndex:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = objc_alloc_init(MEMORY[0x24BDDB730]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWeekDayIndex:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserIndex:", v9);

  -[HMMTRWeekDaySchedule daysMask](self, "daysMask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDaysMask:", v10);

  -[HMMTRWeekDaySchedule startHour](self, "startHour");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStartHour:", v11);

  -[HMMTRWeekDaySchedule startMinute](self, "startMinute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStartMinute:", v12);

  -[HMMTRWeekDaySchedule endHour](self, "endHour");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEndHour:", v13);

  -[HMMTRWeekDaySchedule endMinute](self, "endMinute");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEndMinute:", v14);

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
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_10;
  -[HMMTRWeekDaySchedule daysMask](self, "daysMask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "daysMask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_10;
  -[HMMTRWeekDaySchedule startHour](self, "startHour");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startHour");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (!v12)
    goto LABEL_10;
  -[HMMTRWeekDaySchedule endHour](self, "endHour");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endHour");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if (!v15)
    goto LABEL_10;
  -[HMMTRWeekDaySchedule endMinute](self, "endMinute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endMinute");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = HMFEqualObjects();

  if (v18)
  {
    -[HMMTRWeekDaySchedule startMinute](self, "startMinute");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startMinute");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

  }
  else
  {
LABEL_10:
    v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[HMMTRWeekDaySchedule daysMask](self, "daysMask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMMTRWeekDaySchedule startHour](self, "startHour");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMMTRWeekDaySchedule startMinute](self, "startMinute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HMMTRWeekDaySchedule endHour](self, "endHour");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[HMMTRWeekDaySchedule endMinute](self, "endMinute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMMTRWeekDaySchedule *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init(HMMTRWeekDaySchedule);
  -[HMMTRWeekDaySchedule daysMask](self, "daysMask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRWeekDaySchedule setDaysMask:](v4, "setDaysMask:", v5);

  -[HMMTRWeekDaySchedule startHour](self, "startHour");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRWeekDaySchedule setStartHour:](v4, "setStartHour:", v6);

  -[HMMTRWeekDaySchedule startMinute](self, "startMinute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRWeekDaySchedule setStartMinute:](v4, "setStartMinute:", v7);

  -[HMMTRWeekDaySchedule endHour](self, "endHour");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRWeekDaySchedule setEndHour:](v4, "setEndHour:", v8);

  -[HMMTRWeekDaySchedule endMinute](self, "endMinute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRWeekDaySchedule setEndMinute:](v4, "setEndMinute:", v9);

  -[HMMTRWeekDaySchedule status](self, "status");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRWeekDaySchedule setStatus:](v4, "setStatus:", v10);

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("hh:mm a"));
  objc_msgSend((id)objc_opt_class(), "dateWithHour:andMinute:", -[NSNumber unsignedIntegerValue](self->_startHour, "unsignedIntegerValue"), -[NSNumber unsignedIntegerValue](self->_startMinute, "unsignedIntegerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "dateWithHour:andMinute:", -[NSNumber unsignedIntegerValue](self->_endHour, "unsignedIntegerValue"), -[NSNumber unsignedIntegerValue](self->_endMinute, "unsignedIntegerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "HMDaysOfTheWeekToString:", -[NSNumber unsignedIntegerValue](self->_daysMask, "unsignedIntegerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: DaysOfWeek:%@; From %@ to %@>"), v10, v11, v5, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSNumber)daysMask
{
  return self->_daysMask;
}

- (void)setDaysMask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)startHour
{
  return self->_startHour;
}

- (void)setStartHour:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)startMinute
{
  return self->_startMinute;
}

- (void)setStartMinute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)endHour
{
  return self->_endHour;
}

- (void)setEndHour:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)endMinute
{
  return self->_endMinute;
}

- (void)setEndMinute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_endMinute, 0);
  objc_storeStrong((id *)&self->_endHour, 0);
  objc_storeStrong((id *)&self->_startMinute, 0);
  objc_storeStrong((id *)&self->_startHour, 0);
  objc_storeStrong((id *)&self->_daysMask, 0);
}

+ (id)dateWithHour:(unint64_t)a3 andMinute:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHour:", a3);
  objc_msgSend(v8, "setMinute:", a4);
  objc_msgSend(v8, "setSecond:", 0);
  objc_msgSend(v6, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)appendDayToString:(id)a3 daysString:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if ((unint64_t)objc_msgSend(v5, "length") >= 2)
    objc_msgSend(v5, "appendString:", CFSTR(", "));
  objc_msgSend(v5, "appendString:", v6);

}

+ (id)HMDaysOfTheWeekToString:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(CFSTR("<"), "mutableCopy");
  if ((v3 & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "appendDayToString:daysString:", CFSTR("Sun"), v4);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend((id)objc_opt_class(), "appendDayToString:daysString:", CFSTR("Mon"), v4);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend((id)objc_opt_class(), "appendDayToString:daysString:", CFSTR("Tue"), v4);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend((id)objc_opt_class(), "appendDayToString:daysString:", CFSTR("Wed"), v4);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend((id)objc_opt_class(), "appendDayToString:daysString:", CFSTR("Fri"), v4);
    if ((v3 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend((id)objc_opt_class(), "appendDayToString:daysString:", CFSTR("Thu"), v4);
  if ((v3 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v3 & 0x40) != 0)
LABEL_8:
    objc_msgSend((id)objc_opt_class(), "appendDayToString:daysString:", CFSTR("Sat"), v4);
LABEL_9:
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

@end
