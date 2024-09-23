@implementation HMWeekDayScheduleRule

- (BOOL)validTimes:(id)a3 endTime:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  v10 = 0;
  if ((objc_msgSend(v5, "hour") & 0x8000000000000000) == 0
    && objc_msgSend(v5, "hour") <= 23
    && (objc_msgSend(v5, "minute") & 0x8000000000000000) == 0
    && objc_msgSend(v5, "minute") <= 59
    && (objc_msgSend(v6, "hour") & 0x8000000000000000) == 0
    && objc_msgSend(v6, "hour") <= 23
    && (objc_msgSend(v6, "minute") & 0x8000000000000000) == 0
    && objc_msgSend(v6, "minute") <= 59)
  {
    v7 = objc_msgSend(v6, "hour");
    if (v7 >= objc_msgSend(v5, "hour"))
    {
      v8 = objc_msgSend(v6, "hour");
      if (v8 != objc_msgSend(v5, "hour") || (v9 = objc_msgSend(v6, "minute"), v9 > objc_msgSend(v5, "minute")))
        v10 = 1;
    }
  }

  return v10;
}

- (HMWeekDayScheduleRule)initWithStartTime:(id)a3 endTime:(id)a4 daysOfTheWeek:(unint64_t)a5
{
  id v8;
  id v9;
  HMWeekDayScheduleRule *v10;
  HMWeekDayScheduleRule *v11;
  HMWeekDayScheduleRule *v12;
  NSDateComponents *v13;
  NSDateComponents *startTime;
  NSDateComponents *v15;
  NSDateComponents *endTime;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMWeekDayScheduleRule;
  v10 = -[HMWeekDayScheduleRule init](&v18, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_7:
    v12 = v11;
    goto LABEL_9;
  }
  v12 = 0;
  if (v8 && v9 && a5)
  {
    if (!-[HMWeekDayScheduleRule validTimes:endTime:](v10, "validTimes:endTime:", v8, v9))
    {
      v12 = 0;
      goto LABEL_9;
    }
    v13 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E0C99D78]);
    startTime = v11->_startTime;
    v11->_startTime = v13;

    -[NSDateComponents setHour:](v11->_startTime, "setHour:", objc_msgSend(v8, "hour"));
    -[NSDateComponents setMinute:](v11->_startTime, "setMinute:", objc_msgSend(v8, "minute"));
    v15 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E0C99D78]);
    endTime = v11->_endTime;
    v11->_endTime = v15;

    -[NSDateComponents setHour:](v11->_endTime, "setHour:", objc_msgSend(v9, "hour"));
    -[NSDateComponents setMinute:](v11->_endTime, "setMinute:", objc_msgSend(v9, "minute"));
    v11->_daysOfTheWeek = a5;
    goto LABEL_7;
  }
LABEL_9:

  return v12;
}

- (HMWeekDayScheduleRule)initWithStartTime:(id)a3 endTime:(id)a4
{
  return -[HMWeekDayScheduleRule initWithStartTime:endTime:daysOfTheWeek:](self, "initWithStartTime:endTime:daysOfTheWeek:", a3, a4, 127);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  void *v20;
  void *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMWeekDayScheduleRule startTime](self, "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hour");
    objc_msgSend(v6, "startTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == objc_msgSend(v9, "hour"))
    {
      -[HMWeekDayScheduleRule startTime](self, "startTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "minute");
      objc_msgSend(v6, "startTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == objc_msgSend(v12, "minute"))
      {
        -[HMWeekDayScheduleRule endTime](self, "endTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hour");
        objc_msgSend(v6, "endTime");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 == objc_msgSend(v15, "hour"))
        {
          -[HMWeekDayScheduleRule endTime](self, "endTime");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v21, "minute");
          objc_msgSend(v6, "endTime");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 == objc_msgSend(v20, "minute"))
          {
            v17 = -[HMWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek");
            v18 = v17 == objc_msgSend(v6, "daysOfTheWeek");
          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[HMWeekDayScheduleRule startTime](self, "startTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMWeekDayScheduleRule endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[HMWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek");

  return v7;
}

- (id)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  -[HMWeekDayScheduleRule startTime](self, "startTime");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return MEMORY[0x1E0C9AA70];
  v4 = (void *)v3;
  -[HMWeekDayScheduleRule endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return MEMORY[0x1E0C9AA70];
  v13[0] = CFSTR("HMWeekDayScheduleRuleCodingKeyStartTime");
  -[HMWeekDayScheduleRule startTime](self, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HMSecondsFromDateComponent(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v13[1] = CFSTR("HMWeekDayScheduleRuleCodingKeyEndTime");
  -[HMWeekDayScheduleRule endTime](self, "endTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMSecondsFromDateComponent(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v13[2] = CFSTR("HMWeekDayScheduleRuleCodingKeyDaysOfTheWeek");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HMWeekDayScheduleRule)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMWeekDayScheduleRule *v10;

  v4 = a3;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("HMWeekDayScheduleRuleCodingKeyStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("HMWeekDayScheduleRuleCodingKeyEndTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("HMWeekDayScheduleRuleCodingKeyDaysOfTheWeek"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HMDateComponentFromSecondsOfDay(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMDateComponentFromSecondsOfDay(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMWeekDayScheduleRule initWithStartTime:endTime:daysOfTheWeek:](self, "initWithStartTime:endTime:daysOfTheWeek:", v8, v9, objc_msgSend(v7, "unsignedIntegerValue"));

  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableWeekDayScheduleRule *v4;
  void *v5;
  void *v6;
  HMMutableWeekDayScheduleRule *v7;

  v4 = +[HMMutableWeekDayScheduleRule allocWithZone:](HMMutableWeekDayScheduleRule, "allocWithZone:", a3);
  -[HMWeekDayScheduleRule startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMWeekDayScheduleRule endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMWeekDayScheduleRule initWithStartTime:endTime:daysOfTheWeek:](v4, "initWithStartTime:endTime:daysOfTheWeek:", v5, v6, -[HMWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek"));

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMWeekDayScheduleRule startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMWeekDayScheduleRuleCodingKeyStartTime"));

  -[HMWeekDayScheduleRule endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMWeekDayScheduleRuleCodingKeyEndTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMWeekDayScheduleRuleCodingKeyDaysOfTheWeek"));

}

- (HMWeekDayScheduleRule)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMWeekDayScheduleRule *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMWeekDayScheduleRuleCodingKeyStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMWeekDayScheduleRuleCodingKeyEndTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMWeekDayScheduleRuleCodingKeyDaysOfTheWeek"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMWeekDayScheduleRule initWithStartTime:endTime:daysOfTheWeek:](self, "initWithStartTime:endTime:daysOfTheWeek:", v5, v6, objc_msgSend(v7, "unsignedIntegerValue"));
  return v8;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMWeekDayScheduleRule startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("startTime"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMWeekDayScheduleRule endTime](self, "endTime", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("endTime"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  HMDaysOfTheWeekToConciseString(-[HMWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("daysOfTheWeek"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (NSDateComponents)startTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSDateComponents)endTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (unint64_t)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (void)setDaysOfTheWeek:(unint64_t)a3
{
  self->_daysOfTheWeek = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
