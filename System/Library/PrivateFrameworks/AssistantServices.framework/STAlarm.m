@implementation STAlarm

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[STSiriModelObject identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(v4, "setEnabled:", -[STAlarm isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setDaysOfWeek:", -[STAlarm daysOfWeek](self, "daysOfWeek"));
  objc_msgSend(v4, "setHourOfDay:", -[STAlarm hourOfDay](self, "hourOfDay"));
  objc_msgSend(v4, "setMinuteOfHour:", -[STAlarm minuteOfHour](self, "minuteOfHour"));
  -[STAlarm label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v6);

  objc_msgSend(v4, "setSleepAlarm:", -[STAlarm isSleepAlarm](self, "isSleepAlarm"));
  objc_msgSend(v4, "setOverrideAlarm:", -[STAlarm isOverrideAlarm](self, "isOverrideAlarm"));
  objc_msgSend(v4, "setBedtimeHour:", -[STAlarm bedtimeHour](self, "bedtimeHour"));
  objc_msgSend(v4, "setBedtimeMinute:", -[STAlarm bedtimeMinute](self, "bedtimeMinute"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAlarm;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_enabled, CFSTR("_enabled"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_daysOfWeek, CFSTR("_daysOfWeek"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_hourOfDay, CFSTR("_hourOfDay"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minuteOfHour, CFSTR("_minuteOfHour"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("_label"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_sleepAlarm, CFSTR("_sleepAlarm"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_overrideAlarm, CFSTR("_overrideAlarm"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_bedtimeHour, CFSTR("_bedtimeHour"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_bedtimeMinute, CFSTR("_bedtimeMinute"));

}

- (STAlarm)initWithCoder:(id)a3
{
  id v4;
  STAlarm *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STAlarm;
  v5 = -[STSiriModelObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enabled"));
    v5->_daysOfWeek = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_daysOfWeek"));
    v5->_hourOfDay = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_hourOfDay"));
    v5->_minuteOfHour = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_minuteOfHour"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_sleepAlarm = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_sleepAlarm"));
    v5->_overrideAlarm = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_overrideAlarm"));
    v5->_bedtimeHour = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_bedtimeHour"));
    v5->_bedtimeMinute = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_bedtimeMinute"));
  }

  return v5;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)daysOfWeek
{
  return self->_daysOfWeek;
}

- (void)setDaysOfWeek:(int64_t)a3
{
  self->_daysOfWeek = a3;
}

- (int64_t)hourOfDay
{
  return self->_hourOfDay;
}

- (void)setHourOfDay:(int64_t)a3
{
  self->_hourOfDay = a3;
}

- (int64_t)minuteOfHour
{
  return self->_minuteOfHour;
}

- (void)setMinuteOfHour:(int64_t)a3
{
  self->_minuteOfHour = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isSleepAlarm
{
  return self->_sleepAlarm;
}

- (void)setSleepAlarm:(BOOL)a3
{
  self->_sleepAlarm = a3;
}

- (BOOL)isOverrideAlarm
{
  return self->_overrideAlarm;
}

- (void)setOverrideAlarm:(BOOL)a3
{
  self->_overrideAlarm = a3;
}

- (int64_t)bedtimeHour
{
  return self->_bedtimeHour;
}

- (void)setBedtimeHour:(int64_t)a3
{
  self->_bedtimeHour = a3;
}

- (int64_t)bedtimeMinute
{
  return self->_bedtimeMinute;
}

- (void)setBedtimeMinute:(int64_t)a3
{
  self->_bedtimeMinute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
