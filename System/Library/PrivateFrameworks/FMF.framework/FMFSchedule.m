@implementation FMFSchedule

- (FMFSchedule)initWithDictionary:(id)a3
{
  id v4;
  FMFSchedule *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  FMFSchedule *v23;
  NSObject *v24;

  v4 = a3;
  if (v4)
  {
    v5 = -[FMFSchedule init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startHour"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMFSchedule setStartHour:](v5, "setStartHour:", objc_msgSend(v6, "unsignedIntegerValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startMin"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMFSchedule setStartMin:](v5, "setStartMin:", objc_msgSend(v7, "unsignedIntegerValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endHour"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMFSchedule setEndHour:](v5, "setEndHour:", objc_msgSend(v8, "unsignedIntegerValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endMin"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMFSchedule setEndMin:](v5, "setEndMin:", objc_msgSend(v9, "unsignedIntegerValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spanDays"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMFSchedule setSpanDays:](v5, "setSpanDays:", objc_msgSend(v10, "unsignedIntegerValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("daysOfWeek"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMFSchedule setDaysOfWeek:](v5, "setDaysOfWeek:", objc_msgSend(v11, "unsignedIntegerValue") & 0x7F);

      v12 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fenceTz"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeZoneWithName:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMFSchedule setTimeZone:](v5, "setTimeZone:", v14);

      -[FMFSchedule validityError](v5, "validityError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        LogCategory_Daemon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[FMFSchedule initWithDictionary:].cold.2((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

        v5 = 0;
      }

    }
    self = v5;
    v23 = self;
  }
  else
  {
    LogCategory_Daemon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[FMFSchedule initWithDictionary:].cold.1(v24);

    v23 = 0;
  }

  return v23;
}

- (NSString)validityError
{
  void *v4;

  if (!-[FMFSchedule daysOfWeek](self, "daysOfWeek"))
    return (NSString *)CFSTR("invalid daysOfWeek: FMFDaysOfWeekNone");
  if (-[FMFSchedule startHour](self, "startHour") == 0x7FFFFFFFFFFFFFFFLL)
    return (NSString *)CFSTR("unspecified startHour");
  if (-[FMFSchedule startMin](self, "startMin") == 0x7FFFFFFFFFFFFFFFLL)
    return (NSString *)CFSTR("unspecified startMin");
  if (-[FMFSchedule endHour](self, "endHour") == 0x7FFFFFFFFFFFFFFFLL)
    return (NSString *)CFSTR("unspecified endHour");
  if (-[FMFSchedule endMin](self, "endMin") == 0x7FFFFFFFFFFFFFFFLL)
    return (NSString *)CFSTR("unspecified endMin");
  if (-[FMFSchedule spanDays](self, "spanDays") == 0x7FFFFFFFFFFFFFFFLL)
    return (NSString *)CFSTR("unspecified spanDays");
  -[FMFSchedule timeZone](self, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 0;
  else
    return (NSString *)CFSTR("unspecified timeZone");
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FMFSchedule startHour](self, "startHour"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("startHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FMFSchedule startMin](self, "startMin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("startMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FMFSchedule endHour](self, "endHour"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("endHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FMFSchedule endMin](self, "endMin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("endMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FMFSchedule spanDays](self, "spanDays"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("spanDays"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FMFSchedule daysOfWeek](self, "daysOfWeek"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("daysOfWeek"));

  -[FMFSchedule timeZone](self, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("fenceTz"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v12;
}

- (FMFSchedule)initWithCoder:(id)a3
{
  id v4;
  FMFSchedule *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[FMFSchedule init](self, "init");
  if (v5)
  {
    -[FMFSchedule setStartHour:](v5, "setStartHour:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("startHour")));
    -[FMFSchedule setStartMin:](v5, "setStartMin:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("startMin")));
    -[FMFSchedule setEndHour:](v5, "setEndHour:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("endHour")));
    -[FMFSchedule setEndMin:](v5, "setEndMin:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("endMin")));
    -[FMFSchedule setSpanDays:](v5, "setSpanDays:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("spanDays")));
    -[FMFSchedule setDaysOfWeek:](v5, "setDaysOfWeek:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("daysOfWeek")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fenceTz"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFSchedule setTimeZone:](v5, "setTimeZone:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t startHour;
  id v5;
  void *v6;
  id v7;

  startHour = self->_startHour;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", startHour, CFSTR("startHour"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_startMin, CFSTR("startMin"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_endHour, CFSTR("endHour"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_endMin, CFSTR("endMin"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_daysOfWeek, CFSTR("daysOfWeek"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_spanDays, CFSTR("spanDays"));
  -[FMFSchedule timeZone](self, "timeZone");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("fenceTz"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setStartHour:", self->_startHour);
  objc_msgSend(v4, "setStartMin:", self->_startMin);
  objc_msgSend(v4, "setEndHour:", self->_endHour);
  objc_msgSend(v4, "setEndMin:", self->_endMin);
  objc_msgSend(v4, "setDaysOfWeek:", self->_daysOfWeek);
  objc_msgSend(v4, "setSpanDays:", self->_spanDays);
  v5 = (void *)-[NSTimeZone copy](self->_timeZone, "copy");
  objc_msgSend(v4, "setTimeZone:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[FMFSchedule startHour](self, "startHour");
    if (v6 == objc_msgSend(v5, "startHour")
      && (v7 = -[FMFSchedule startMin](self, "startMin"), v7 == objc_msgSend(v5, "startMin"))
      && (v8 = -[FMFSchedule endMin](self, "endMin"), v8 == objc_msgSend(v5, "endMin"))
      && (v9 = -[FMFSchedule endHour](self, "endHour"), v9 == objc_msgSend(v5, "endHour"))
      && (v10 = -[FMFSchedule daysOfWeek](self, "daysOfWeek"), v10 == objc_msgSend(v5, "daysOfWeek"))
      && (v11 = -[FMFSchedule spanDays](self, "spanDays"), v11 == objc_msgSend(v5, "spanDays")))
    {
      -[FMFSchedule timeZone](self, "timeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToTimeZone:", v13);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[FMFSchedule startHour](self, "startHour");
  v4 = -[FMFSchedule startMin](self, "startMin") ^ v3;
  v5 = -[FMFSchedule endHour](self, "endHour");
  v6 = v4 ^ v5 ^ -[FMFSchedule endMin](self, "endMin");
  v7 = -[FMFSchedule daysOfWeek](self, "daysOfWeek");
  v8 = v7 ^ -[FMFSchedule spanDays](self, "spanDays");
  -[FMFSchedule timeZone](self, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isCurrentAt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FMFSchedule nextStartDateFrom:options:](self, "nextStartDateFrom:options:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[FMFSchedule _endDateForStartDate:](self, "_endDateForStartDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "compare:", v4) == -1 && objc_msgSend(v4, "compare:", v6) == -1;

  }
  else
  {
    v7 = 0;
  }
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[FMFSchedule isCurrentAt:]";
    v12 = 1024;
    v13 = v7;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "%s: %d at: %@", (uint8_t *)&v10, 0x1Cu);
  }

  return v7;
}

- (id)nextStartOrEndDateFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[FMFSchedule nextStartDateFrom:options:](self, "nextStartDateFrom:options:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[FMFSchedule _endDateForStartDate:](self, "_endDateForStartDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && objc_msgSend(v4, "compare:", v6) == -1)
    {
      v7 = v6;
    }
    else
    {
      -[FMFSchedule nextStartDateFrom:options:](self, "nextStartDateFrom:options:", v4, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)previousStartDateFrom:(id)a3
{
  return -[FMFSchedule nextStartDateFrom:options:](self, "nextStartDateFrom:options:", a3, 4);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[FMFSchedule startHour](self, "startHour");
  v6 = -[FMFSchedule startMin](self, "startMin");
  v7 = -[FMFSchedule endHour](self, "endHour");
  v8 = -[FMFSchedule endMin](self, "endMin");
  v9 = -[FMFSchedule spanDays](self, "spanDays");
  -[FMFSchedule _daysOfWeek](self, "_daysOfWeek");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFSchedule timeZone](self, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ sH=%ld sM=%ld eH=%ld eM=%ld spanDays=%ld dOW=%@, tZ=%@>"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_endDateForStartDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[FMFSchedule timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "setHour:", -[FMFSchedule endHour](self, "endHour"));
  objc_msgSend(v5, "setMinute:", -[FMFSchedule endMin](self, "endMin"));
  -[FMFSchedule _gregorian](self, "_gregorian");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextDateAfterDate:matchingComponents:options:", v4, v5, 1024);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[FMFSchedule spanDays](self, "spanDays");
    -[FMFSchedule _gregorian](self, "_gregorian");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9 - (objc_msgSend(v10, "isDate:inSameDayAsDate:", v8, v4) ^ 1);

    if ((v11 & 0x8000000000000000) != 0)
    {
      LogCategory_Daemon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[FMFSchedule _endDateForStartDate:].cold.1((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);

    }
    else if (v11)
    {
      do
      {
        v12 = v8;
        -[FMFSchedule _gregorian](self, "_gregorian");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nextDateAfterDate:matchingComponents:options:", v8, v5, 1024);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 < 2)
          break;
        --v11;
      }
      while (v8);
    }
  }

  return v8;
}

- (id)_daysOfWeek
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (_daysOfWeek_onceToken != -1)
    dispatch_once(&_daysOfWeek_onceToken, &__block_literal_global);
  objc_msgSend((id)_daysOfWeek_daysOfWeekMap, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__FMFSchedule__daysOfWeek__block_invoke_51;
  v6[3] = &unk_1EA4F23D8;
  v6[4] = self;
  objc_msgSend(v3, "fm_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __26__FMFSchedule__daysOfWeek__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EA4FBE38;
  v2[1] = &unk_1EA4FBE68;
  v3[0] = &unk_1EA4FBE50;
  v3[1] = &unk_1EA4FBE80;
  v2[2] = &unk_1EA4FBE98;
  v2[3] = &unk_1EA4FBEC8;
  v3[2] = &unk_1EA4FBEB0;
  v3[3] = &unk_1EA4FBEE0;
  v2[4] = &unk_1EA4FBEF8;
  v2[5] = &unk_1EA4FBF28;
  v3[4] = &unk_1EA4FBF10;
  v3[5] = &unk_1EA4FBF40;
  v2[6] = &unk_1EA4FBF58;
  v3[6] = &unk_1EA4FBF70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_daysOfWeek_daysOfWeekMap;
  _daysOfWeek_daysOfWeekMap = v0;

}

BOOL __26__FMFSchedule__daysOfWeek__block_invoke_51(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend((id)_daysOfWeek_daysOfWeekMap, "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return (objc_msgSend(*(id *)(a1 + 32), "daysOfWeek") & v4) != 0;
}

- (id)nextStartDateFrom:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v6 = a3;
  -[FMFSchedule _daysOfWeek](self, "_daysOfWeek");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__FMFSchedule_nextStartDateFrom_options___block_invoke;
  v13[3] = &unk_1EA4F2400;
  v13[4] = self;
  v14 = v6;
  v15 = a4;
  v8 = v6;
  objc_msgSend(v7, "fm_map:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a4 & 4) != 0)
    v10 = 1;
  else
    v10 = -1;
  objc_msgSend((id)objc_opt_class(), "firstDateFromDates:order:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __41__FMFSchedule_nextStartDateFrom_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_nextStartDateOnDayOfWeek:from:options:", objc_msgSend(a2, "integerValue"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_nextStartDateOnDayOfWeek:(int64_t)a3 from:(id)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = (void *)objc_opt_new();
  -[FMFSchedule timeZone](self, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  objc_msgSend(v9, "setHour:", -[FMFSchedule startHour](self, "startHour"));
  objc_msgSend(v9, "setMinute:", -[FMFSchedule startMin](self, "startMin"));
  objc_msgSend(v9, "setWeekday:", a3);
  -[FMFSchedule _gregorian](self, "_gregorian");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextDateAfterDate:matchingComponents:options:", v8, v9, a5 | 0x400);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)firstDateFromDates:(id)a3 order:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!v8 || objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "compare:", v8) == a4)
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSCalendar)_gregorian
{
  NSCalendar *gregorian;
  NSCalendar *v4;
  void *v5;
  NSCalendar *v6;

  gregorian = self->_gregorian;
  if (!gregorian)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    -[FMFSchedule timeZone](self, "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v4, "setTimeZone:", v5);

    v6 = self->_gregorian;
    self->_gregorian = v4;

    gregorian = self->_gregorian;
  }
  return gregorian;
}

- (unint64_t)startHour
{
  return self->_startHour;
}

- (void)setStartHour:(unint64_t)a3
{
  self->_startHour = a3;
}

- (unint64_t)startMin
{
  return self->_startMin;
}

- (void)setStartMin:(unint64_t)a3
{
  self->_startMin = a3;
}

- (int64_t)daysOfWeek
{
  return self->_daysOfWeek;
}

- (void)setDaysOfWeek:(int64_t)a3
{
  self->_daysOfWeek = a3;
}

- (unint64_t)endHour
{
  return self->_endHour;
}

- (void)setEndHour:(unint64_t)a3
{
  self->_endHour = a3;
}

- (unint64_t)endMin
{
  return self->_endMin;
}

- (void)setEndMin:(unint64_t)a3
{
  self->_endMin = a3;
}

- (unint64_t)spanDays
{
  return self->_spanDays;
}

- (void)setSpanDays:(unint64_t)a3
{
  self->_spanDays = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_gregorian, 0);
}

+ (id)_dateFromHour:(unint64_t)a3 andMinute:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 62, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHour:", a3);
  objc_msgSend(v8, "setMinute:", a4);
  objc_msgSend(v7, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)_enumerateDaysOfWeekInFMFDaysOfWeek:(int64_t)a3 callback:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void (**v12)(void);

  v12 = (void (**)(void))a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "firstWeekday");
  v7 = 0;
  v8 = ((unint64_t)(v6 + 6) * (unsigned __int128)0x2492492492492493uLL) >> 64;
  v9 = v6 + 6 - 7 * ((v8 + ((unint64_t)(v6 + 6 - v8) >> 1)) >> 2);
  v10 = v9;
  do
  {
    if (v10 > 6)
      v11 = 0;
    else
      v11 = qword_1DC841A98[v10];
    if ((v11 & a3) != 0)
      v12[2]();
    if (v10 < 6)
      ++v10;
    else
      v10 = 0;
    ++v7;
  }
  while (v10 != v9);

}

+ (id)_dayStringForDayOfWeek:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = &stru_1EA4F34A0;
  if (a3 > 15)
  {
    switch(a3)
    {
      case 16:
        objc_msgSend(v4, "weekdaySymbols");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = 2;
        break;
      case 32:
        objc_msgSend(v4, "weekdaySymbols");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = 1;
        break;
      case 64:
        objc_msgSend(v4, "weekdaySymbols");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = 0;
        break;
      default:
        goto LABEL_14;
    }
LABEL_13:
    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  switch(a3)
  {
    case 1:
      objc_msgSend(v4, "weekdaySymbols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 6;
      goto LABEL_13;
    case 2:
      objc_msgSend(v4, "weekdaySymbols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 5;
      goto LABEL_13;
    case 4:
      objc_msgSend(v4, "weekdaySymbols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 4;
      goto LABEL_13;
    case 8:
      objc_msgSend(v4, "weekdaySymbols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 3;
      goto LABEL_13;
    default:
      break;
  }
LABEL_14:

  return v6;
}

+ (id)_stringForDaysOfWeek:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  void *v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _QWORD v38[4];
  _QWORD v39[5];

  if (!a3)
    return &stru_1EA4F34A0;
  if (a3 == 127)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_EVERY_DAY"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = 0x7FFFFFFFFFFFFFFFLL;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0x7FFFFFFFFFFFFFFFLL;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 1;
    v8 = (void *)objc_opt_new();
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __46__FMFSchedule_NSString___stringForDaysOfWeek___block_invoke;
    v28 = &unk_1EA4F2DE8;
    v33 = a1;
    v9 = v8;
    v29 = v9;
    v30 = v39;
    v31 = v38;
    v32 = &v34;
    objc_msgSend(a1, "_enumerateDaysOfWeekInFMFDaysOfWeek:callback:", a3, &v25);
    switch(objc_msgSend(v9, "count"))
    {
      case 1:
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_1"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", v12, v13);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 2:
        v15 = (void *)MEMORY[0x1E0CB3940];
        if (*((_BYTE *)v35 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_CONTIGUOUS_2"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_2"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", v12, v13, v17);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      case 3:
        v16 = (void *)MEMORY[0x1E0CB3940];
        if (*((_BYTE *)v35 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_CONTIGUOUS_3"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_3"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v12, v13, v17, v19);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      case 4:
        v18 = (void *)MEMORY[0x1E0CB3940];
        if (*((_BYTE *)v35 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_CONTIGUOUS_4"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_4"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", v12, v13, v17, v19, v21);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5:
        v20 = (void *)MEMORY[0x1E0CB3940];
        if (*((_BYTE *)v35 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_CONTIGUOUS_5"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_5"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 4);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", v12, v13, v17, v19, v21, v23);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      case 6:
        v22 = (void *)MEMORY[0x1E0CB3940];
        if (*((_BYTE *)v35 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_CONTIGUOUS_6"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 4);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_6"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 5);
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", v12, v13, v17, v19, v21, v23, v24, v25, v26, v27, v28);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_28:
LABEL_29:

LABEL_30:
LABEL_31:

LABEL_32:
        break;
      default:
        v14 = &stru_1EA4F34A0;
        break;
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v39, 8);
    return v14;
  }
}

void __46__FMFSchedule_NSString___stringForDaysOfWeek___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 64), "_dayStringForDayOfWeek:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v5 + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(v5 + 24) = a3;
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 1 != a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;

}

+ (id)localizedDaysOfWeekStringFor:(int64_t)a3
{
  return +[FMFSchedule _stringForDaysOfWeek:](FMFSchedule, "_stringForDaysOfWeek:", a3);
}

- (NSString)localizedDaysOfWeekString
{
  return (NSString *)+[FMFSchedule localizedDaysOfWeekStringFor:](FMFSchedule, "localizedDaysOfWeekStringFor:", -[FMFSchedule daysOfWeek](self, "daysOfWeek"));
}

+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4 timeStyle:(unint64_t)a5
{
  void *v6;
  __CFString *v7;

  +[FMFSchedule _dateFromHour:andMinute:](FMFSchedule, "_dateFromHour:andMinute:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v6, 0, a5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1EA4F34A0;
  }

  return v7;
}

+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4
{
  return +[FMFSchedule localizedTimeStringForHour:andMinute:timeStyle:](FMFSchedule, "localizedTimeStringForHour:andMinute:timeStyle:", a3, a4, 1);
}

- (NSString)localizedStartTimeString
{
  return (NSString *)+[FMFSchedule localizedTimeStringForHour:andMinute:](FMFSchedule, "localizedTimeStringForHour:andMinute:", -[FMFSchedule startHour](self, "startHour"), -[FMFSchedule startMin](self, "startMin"));
}

- (NSString)localizedEndTimeString
{
  return (NSString *)+[FMFSchedule localizedTimeStringForHour:andMinute:](FMFSchedule, "localizedTimeStringForHour:andMinute:", -[FMFSchedule endHour](self, "endHour"), -[FMFSchedule endMin](self, "endMin"));
}

- (void)initWithDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DC81B000, log, OS_LOG_TYPE_FAULT, "nil scheduleDict", v1, 2u);
}

- (void)initWithDictionary:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC81B000, a2, a3, "validityError: %@", a5, a6, a7, a8, 2u);
}

- (void)_endDateForStartDate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC81B000, a2, a3, "%@: spanDays should have been >= 0", a5, a6, a7, a8, 2u);
}

@end
