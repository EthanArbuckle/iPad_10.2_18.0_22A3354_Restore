@implementation UNLegacyNotificationTrigger

+ (id)triggerWithDate:(id)a3 timeZone:(id)a4 remainingRepeatCount:(int)a5 totalRepeatCount:(int)a6 repeatInterval:(unint64_t)a7 repeatCalendar:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  void *v17;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  v14 = a8;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDate:timeZone:remainingRepeatCount:totalRepeatCount:repeatInterval:repeatCalendar:", v16, v15, v10, v9, a7, v14);

  return v17;
}

+ (id)triggerWithDate:(id)a3 timeZone:(id)a4 repeatInterval:(unint64_t)a5 repeatCalendar:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDate:timeZone:remainingRepeatCount:totalRepeatCount:repeatInterval:repeatCalendar:", v12, v11, 0x80000000, 0x80000000, a5, v10);

  return v13;
}

- (id)_initWithDate:(id)a3 timeZone:(id)a4 remainingRepeatCount:(int)a5 totalRepeatCount:(int)a6 repeatInterval:(unint64_t)a7 repeatCalendar:(id)a8
{
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)UNLegacyNotificationTrigger;
  v17 = -[UNNotificationTrigger _initWithRepeats:](&v25, sel__initWithRepeats_, a7 != 0);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    v19 = (void *)v17[3];
    v17[3] = v18;

    v20 = objc_msgSend(v15, "copy");
    v21 = (void *)v17[4];
    v17[4] = v20;

    *((_DWORD *)v17 + 3) = a5;
    v22 = objc_msgSend(v16, "copy");
    v23 = (void *)v17[5];
    v17[5] = v22;

    v17[6] = a7;
    *((_DWORD *)v17 + 4) = a6;
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UNLegacyNotificationTrigger;
  v3 = -[UNNotificationTrigger hash](&v14, sel_hash);
  -[UNLegacyNotificationTrigger date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[UNLegacyNotificationTrigger timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[UNLegacyNotificationTrigger remainingRepeatCount](self, "remainingRepeatCount");
  -[UNLegacyNotificationTrigger repeatCalendar](self, "repeatCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  v11 = v10 ^ -[UNLegacyNotificationTrigger repeatInterval](self, "repeatInterval") ^ v3;
  v12 = v11 ^ -[UNLegacyNotificationTrigger totalRepeatCount](self, "totalRepeatCount");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v16.receiver = self,
        v16.super_class = (Class)UNLegacyNotificationTrigger,
        -[UNNotificationTrigger isEqual:](&v16, sel_isEqual_, v4)))
  {
    -[UNLegacyNotificationTrigger date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UNEqualObjects(v5, v6))
    {
      -[UNLegacyNotificationTrigger repeatCalendar](self, "repeatCalendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "repeatCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (UNEqualObjects(v7, v8)
        && (v9 = -[UNLegacyNotificationTrigger remainingRepeatCount](self, "remainingRepeatCount"),
            v9 == objc_msgSend(v4, "remainingRepeatCount"))
        && (v10 = -[UNLegacyNotificationTrigger repeatInterval](self, "repeatInterval"),
            v10 == objc_msgSend(v4, "repeatInterval"))
        && (v11 = -[UNLegacyNotificationTrigger totalRepeatCount](self, "totalRepeatCount"),
            v11 == objc_msgSend(v4, "totalRepeatCount")))
      {
        -[UNLegacyNotificationTrigger timeZone](self, "timeZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "timeZone");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = UNEqualObjects(v12, v13);

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

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[UNNotificationTrigger repeats](self, "repeats");
  NSStringFromBOOL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNLegacyNotificationTrigger date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNLegacyNotificationTrigger timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UNLegacyNotificationTrigger remainingRepeatCount](self, "remainingRepeatCount");
  v8 = -[UNLegacyNotificationTrigger totalRepeatCount](self, "totalRepeatCount");
  v9 = -[UNLegacyNotificationTrigger repeatInterval](self, "repeatInterval");
  -[UNLegacyNotificationTrigger repeatCalendar](self, "repeatCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendarIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p; repeats: %@, date: %@, timeZone: %@, remainingRepeatCount: %ld, totalRepeatCount: %ld, repeatInterval: %ld, repeatCalendar: %@>"),
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)willTriggerAfterDate:(id)a3 withRequestedDate:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UNNotificationTrigger repeats](self, "repeats")
    && !-[UNLegacyNotificationTrigger remainingRepeatCount](self, "remainingRepeatCount"))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UNLegacyNotificationTrigger;
    v8 = -[UNNotificationTrigger willTriggerAfterDate:withRequestedDate:](&v10, sel_willTriggerAfterDate_withRequestedDate_, v6, v7);
  }

  return v8;
}

- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99E80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNLegacyNotificationTrigger _nextTriggerDateAfterDate:withRequestedDate:defaultTimeZone:](self, "_nextTriggerDateAfterDate:withRequestedDate:defaultTimeZone:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4 defaultTimeZone:(id)a5
{
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationTrigger.m"), 302, CFSTR("afterDate must not be nil"));

  }
  v12 = -[UNLegacyNotificationTrigger repeatInterval](self, "repeatInterval");
  v13 = v12;
  if (v12)
  {
    v14 = 0;
    do
    {
      v15 = qword_1AA915970[v14];
      if (v14 > 6)
        break;
      ++v14;
    }
    while (v15 != v12);
    if (v15 != v12)
    {
      v20 = 0;
      goto LABEL_39;
    }
  }
  -[UNLegacyNotificationTrigger date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNLegacyNotificationTrigger repeatCalendar](self, "repeatCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v19;

  -[UNLegacyNotificationTrigger timeZone](self, "timeZone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22 && (objc_msgSend(v22, "isEqual:", v11) & 1) == 0)
  {
    v24 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v24, "setTimeZone:", v23);
    objc_msgSend(v24, "components:fromDate:", 254, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateFromComponents:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v26;
  }
  v27 = 0;
  if (v13 > 63)
  {
    if (v13 > 511)
    {
      if (v13 == 512)
        goto LABEL_30;
      if (v13 != 0x2000)
        goto LABEL_35;
    }
    else
    {
      if (v13 == 64)
      {
        v28 = 128;
        goto LABEL_33;
      }
      if (v13 != 256)
        goto LABEL_35;
    }
    v28 = 736;
    goto LABEL_33;
  }
  if (v13 <= 15)
  {
    if (v13 == 4)
    {
      v28 = 248;
      goto LABEL_33;
    }
    if (v13 == 8)
    {
      v28 = 240;
LABEL_33:
      objc_msgSend(v21, "components:fromDate:", v28, v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1AF4228BC]();
      objc_msgSend(v21, "nextDateAfterDate:matchingComponents:options:", v9, v29, 512);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v30);

      if (v27)
      {
        v20 = v27;
        if (objc_msgSend(v27, "compare:", v16) != -1)
          goto LABEL_36;
      }
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (v13 == 16)
  {
LABEL_30:
    v28 = 224;
    goto LABEL_33;
  }
  if (v13 == 32)
  {
    v28 = 192;
    goto LABEL_33;
  }
LABEL_35:
  v20 = v16;

LABEL_36:
  if (objc_msgSend(v20, "compare:", v9) != 1)
  {

    v20 = 0;
  }

LABEL_39:
  return v20;
}

- (double)_retroactiveTriggerHysteresis
{
  double result;
  objc_super v4;

  if ((-[UNLegacyNotificationTrigger repeatInterval](self, "repeatInterval") & 0xC0) != 0)
    return 60.0;
  v4.receiver = self;
  v4.super_class = (Class)UNLegacyNotificationTrigger;
  -[UNNotificationTrigger _retroactiveTriggerHysteresis](&v4, sel__retroactiveTriggerHysteresis);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UNLegacyNotificationTrigger;
  v4 = a3;
  -[UNNotificationTrigger encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[UNLegacyNotificationTrigger date](self, "date", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("date"));

  -[UNLegacyNotificationTrigger timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("timeZone"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[UNLegacyNotificationTrigger remainingRepeatCount](self, "remainingRepeatCount"), CFSTR("remainingRepeatCount"));
  -[UNLegacyNotificationTrigger repeatCalendar](self, "repeatCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("repeatCalendar"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNLegacyNotificationTrigger repeatInterval](self, "repeatInterval"), CFSTR("repeatInterval"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[UNLegacyNotificationTrigger totalRepeatCount](self, "totalRepeatCount"), CFSTR("totalRepeatCount"));

}

- (UNLegacyNotificationTrigger)initWithCoder:(id)a3
{
  id v4;
  UNLegacyNotificationTrigger *v5;
  void *v6;
  uint64_t v7;
  NSDate *date;
  void *v9;
  uint64_t v10;
  NSTimeZone *timeZone;
  void *v12;
  uint64_t v13;
  NSCalendar *repeatCalendar;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UNLegacyNotificationTrigger;
  v5 = -[UNNotificationTrigger initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    date = v5->_date;
    v5->_date = (NSDate *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v10;

    *((_DWORD *)&v5->super._repeats + 1) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("remainingRepeatCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("repeatCalendar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    repeatCalendar = v5->_repeatCalendar;
    v5->_repeatCalendar = (NSCalendar *)v13;

    v5->_repeatInterval = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("repeatInterval"));
    v5->_remainingRepeatCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("totalRepeatCount"));
  }

  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSCalendar)repeatCalendar
{
  return self->_repeatCalendar;
}

- (void)setRepeatCalendar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)remainingRepeatCount
{
  return *((_DWORD *)&self->super._repeats + 1);
}

- (void)setRemainingRepeatCount:(int)a3
{
  *((_DWORD *)&self->super._repeats + 1) = a3;
}

- (int)totalRepeatCount
{
  return self->_remainingRepeatCount;
}

- (void)setTotalRepeatCount:(int)a3
{
  self->_remainingRepeatCount = a3;
}

- (unint64_t)repeatInterval
{
  return self->_repeatInterval;
}

- (void)setRepeatInterval:(unint64_t)a3
{
  self->_repeatInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatCalendar, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
