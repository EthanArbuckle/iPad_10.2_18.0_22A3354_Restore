@implementation EKSerializableRecurrenceRule

+ (id)classesForKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[10];
  _QWORD v25[12];

  v25[10] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("frequency");
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v24[1] = CFSTR("interval");
  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v2;
  v24[2] = CFSTR("recurrenceEnd");
  v21 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v3;
  v24[3] = CFSTR("firstDayOfTheWeek");
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v4;
  v24[4] = CFSTR("daysOfTheWeek");
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v5;
  v24[5] = CFSTR("daysOfTheMonth");
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v6;
  v24[6] = CFSTR("daysOfTheYear");
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v7;
  v24[7] = CFSTR("weeksOfTheYear");
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v8;
  v24[8] = CFSTR("monthsOfTheYear");
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v9;
  v24[9] = CFSTR("setPositions");
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (EKSerializableRecurrenceRule)initWithRecurrenceRule:(id)a3
{
  id v4;
  EKSerializableRecurrenceRule *v5;
  void *v6;
  uint64_t v7;
  EKRecurrenceEnd *recurrenceEnd;
  id v9;
  void *v10;
  uint64_t v11;
  NSArray *daysOfTheWeek;
  id v13;
  void *v14;
  uint64_t v15;
  NSArray *daysOfTheMonth;
  id v17;
  void *v18;
  uint64_t v19;
  NSArray *daysOfTheYear;
  id v21;
  void *v22;
  uint64_t v23;
  NSArray *weeksOfTheYear;
  id v25;
  void *v26;
  uint64_t v27;
  NSArray *monthsOfTheYear;
  id v29;
  void *v30;
  uint64_t v31;
  NSArray *setPositions;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)EKSerializableRecurrenceRule;
  v5 = -[EKSerializableRecurrenceRule init](&v34, sel_init);
  if (v5)
  {
    v5->_frequency = objc_msgSend(v4, "frequency");
    v5->_interval = objc_msgSend(v4, "interval");
    objc_msgSend(v4, "recurrenceEnd");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    recurrenceEnd = v5->_recurrenceEnd;
    v5->_recurrenceEnd = (EKRecurrenceEnd *)v7;

    v5->_firstDayOfTheWeek = objc_msgSend(v4, "firstDayOfTheWeek");
    v9 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v4, "daysOfTheWeek");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithArray:copyItems:", v10, 1);
    daysOfTheWeek = v5->_daysOfTheWeek;
    v5->_daysOfTheWeek = (NSArray *)v11;

    v13 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v4, "daysOfTheMonth");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithArray:copyItems:", v14, 1);
    daysOfTheMonth = v5->_daysOfTheMonth;
    v5->_daysOfTheMonth = (NSArray *)v15;

    v17 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v4, "daysOfTheYear");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithArray:copyItems:", v18, 1);
    daysOfTheYear = v5->_daysOfTheYear;
    v5->_daysOfTheYear = (NSArray *)v19;

    v21 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v4, "weeksOfTheYear");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithArray:copyItems:", v22, 1);
    weeksOfTheYear = v5->_weeksOfTheYear;
    v5->_weeksOfTheYear = (NSArray *)v23;

    v25 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v4, "monthsOfTheYear");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "initWithArray:copyItems:", v26, 1);
    monthsOfTheYear = v5->_monthsOfTheYear;
    v5->_monthsOfTheYear = (NSArray *)v27;

    v29 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v4, "setPositions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "initWithArray:copyItems:", v30, 1);
    setPositions = v5->_setPositions;
    v5->_setPositions = (NSArray *)v31;

  }
  return v5;
}

- (id)createRecurrenceRule:(id *)a3
{
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EKRecurrenceRule *v13;
  void *v14;
  EKRecurrenceRule *v16;

  if (-[EKSerializableRecurrenceRule interval](self, "interval", a3) <= 0)
  {
    v14 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKSerializableRecurrenceRule createRecurrenceRule:].cold.1(v14, self);
    v13 = 0;
  }
  else
  {
    v16 = [EKRecurrenceRule alloc];
    v4 = -[EKSerializableRecurrenceRule frequency](self, "frequency");
    v5 = -[EKSerializableRecurrenceRule interval](self, "interval");
    -[EKSerializableRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableRecurrenceRule setPositions](self, "setPositions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v16, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v4, v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v13;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (int64_t)interval
{
  return self->_interval;
}

- (EKRecurrenceEnd)recurrenceEnd
{
  return self->_recurrenceEnd;
}

- (void)setRecurrenceEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)firstDayOfTheWeek
{
  return self->_firstDayOfTheWeek;
}

- (NSArray)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (NSArray)daysOfTheMonth
{
  return self->_daysOfTheMonth;
}

- (NSArray)daysOfTheYear
{
  return self->_daysOfTheYear;
}

- (NSArray)weeksOfTheYear
{
  return self->_weeksOfTheYear;
}

- (NSArray)monthsOfTheYear
{
  return self->_monthsOfTheYear;
}

- (NSArray)setPositions
{
  return self->_setPositions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setPositions, 0);
  objc_storeStrong((id *)&self->_monthsOfTheYear, 0);
  objc_storeStrong((id *)&self->_weeksOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheMonth, 0);
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);
  objc_storeStrong((id *)&self->_recurrenceEnd, 0);
}

- (void)createRecurrenceRule:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a2, "interval");
  _os_log_error_impl(&dword_1A2318000, v3, OS_LOG_TYPE_ERROR, "Serialized recurrence rule has invalid interval (%d). Ignoring.", (uint8_t *)v4, 8u);

}

@end
