@implementation HMDTimeOfDayTimePeriodElement

- (HMDTimeOfDayTimePeriodElement)initWithHour:(unint64_t)a3 minute:(unint64_t)a4
{
  HMDTimeOfDayTimePeriodElement *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDTimeOfDayTimePeriodElement;
  result = -[HMDTimeOfDayTimePeriodElement init](&v7, sel_init);
  if (result)
  {
    result->_hour = a3;
    result->_minute = a4;
  }
  return result;
}

- (HMDTimeOfDayTimePeriodElement)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  HMDTimeOfDayTimePeriodElement *v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "doesTypeMatch:against:", v4, v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDTODTPE.ck.h"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDTODTPE.ck.m"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    self = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:](self, "initWithHour:minute:", v8, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)serializedRegistrationForRemoteMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDTimeOfDayTimePeriodElement;
  -[HMDTimePeriodElement serializedRegistrationForRemoteMessage](&v8, sel_serializedRegistrationForRemoteMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDTimeOfDayTimePeriodElement hour](self, "hour"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("HMDTODTPE.ck.h"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDTimeOfDayTimePeriodElement minute](self, "minute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HMDTODTPE.ck.m"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6 && (v7 = -[HMDTimeOfDayTimePeriodElement hour](self, "hour"), v7 == objc_msgSend(v6, "hour")))
  {
    v8 = -[HMDTimeOfDayTimePeriodElement minute](self, "minute");
    v9 = v8 == objc_msgSend(v6, "minute");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDTimeOfDayTimePeriodElement hour](self, "hour"), CFSTR("HMDTODTPE.ck.h"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDTimeOfDayTimePeriodElement minute](self, "minute"), CFSTR("HMDTODTPE.ck.m"));

}

- (HMDTimeOfDayTimePeriodElement)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMDTODTPE.ck.h"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMDTODTPE.ck.m"));

  return -[HMDTimeOfDayTimePeriodElement initWithHour:minute:](self, "initWithHour:minute:", v5, v6);
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDTimeOfDayTimePeriodElement hour](self, "hour"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Hour"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDTimeOfDayTimePeriodElement minute](self, "minute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Minute"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (unint64_t)minute
{
  return self->_minute;
}

+ (id)type
{
  return CFSTR("HMDTODTPE.type");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
