@implementation DNDScheduleSettings

- (DNDScheduleSettings)init
{
  return (DNDScheduleSettings *)-[DNDScheduleSettings _initWithSettings:](self, "_initWithSettings:", 0);
}

- (id)_initWithSettings:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  DNDScheduleSettings *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "scheduleEnabledSetting");
  objc_msgSend(v4, "timePeriod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "bedtimeBehaviorEnabledSetting");

  v8 = -[DNDScheduleSettings initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:](self, "initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:", v5, v6, v7);
  return v8;
}

- (DNDScheduleSettings)initWithScheduleEnabledSetting:(unint64_t)a3 timePeriod:(id)a4 bedtimeBehaviorEnabledSetting:(unint64_t)a5
{
  id v8;
  DNDScheduleSettings *v9;
  DNDScheduleSettings *v10;
  void *v11;
  void *v12;
  DNDScheduleTimePeriod *v13;
  DNDScheduleTimePeriod *timePeriod;
  objc_super v16;

  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDScheduleSettings;
  v9 = -[DNDScheduleSettings init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_scheduleEnabledSetting = a3;
    v11 = (void *)objc_msgSend(v8, "copy");
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = objc_alloc_init(DNDScheduleTimePeriod);
    timePeriod = v10->_timePeriod;
    v10->_timePeriod = v13;

    v10->_bedtimeBehaviorEnabledSetting = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[DNDScheduleSettings scheduleEnabledSetting](self, "scheduleEnabledSetting");
  -[DNDScheduleSettings timePeriod](self, "timePeriod");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[DNDScheduleSettings bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DNDScheduleSettings *v8;
  DNDScheduleSettings *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;

  v8 = (DNDScheduleSettings *)a3;
  if (self == v8)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v10 = -[DNDScheduleSettings scheduleEnabledSetting](self, "scheduleEnabledSetting");
      if (v10 != -[DNDScheduleSettings scheduleEnabledSetting](v9, "scheduleEnabledSetting"))
      {
        v15 = 0;
LABEL_18:

        goto LABEL_19;
      }
      -[DNDScheduleSettings timePeriod](self, "timePeriod");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDScheduleSettings timePeriod](v9, "timePeriod");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[DNDScheduleSettings timePeriod](self, "timePeriod");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v15 = 0;
          goto LABEL_17;
        }
        v3 = (void *)v13;
        -[DNDScheduleSettings timePeriod](v9, "timePeriod");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v15 = 0;
          goto LABEL_16;
        }
        v4 = (void *)v14;
        -[DNDScheduleSettings timePeriod](self, "timePeriod");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDScheduleSettings timePeriod](v9, "timePeriod");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqual:", v6))
        {
          v15 = 0;
LABEL_13:

LABEL_16:
          goto LABEL_17;
        }
      }
      v16 = -[DNDScheduleSettings bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting");
      v15 = v16 == -[DNDScheduleSettings bedtimeBehaviorEnabledSetting](v9, "bedtimeBehaviorEnabledSetting");
      if (v11 != v12)
        goto LABEL_13;
LABEL_17:

      goto LABEL_18;
    }
    v15 = 0;
  }
LABEL_19:

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  DNDEnabledSettingToString(-[DNDScheduleSettings scheduleEnabledSetting](self, "scheduleEnabledSetting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDScheduleSettings timePeriod](self, "timePeriod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DNDEnabledSettingToString(-[DNDScheduleSettings bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<schedule: enabled: %@; period: %@; bedtime: %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDScheduleSettings _initWithSettings:]([DNDMutableScheduleSettings alloc], "_initWithSettings:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDScheduleSettings)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  DNDScheduleSettings *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduleEnabledSetting"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timePeriod"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bedtimeBehaviorEnabledSetting"));

  v8 = -[DNDScheduleSettings initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:](self, "initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDScheduleSettings scheduleEnabledSetting](self, "scheduleEnabledSetting"), CFSTR("scheduleEnabledSetting"));
  -[DNDScheduleSettings timePeriod](self, "timePeriod");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("timePeriod"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDScheduleSettings bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting"), CFSTR("bedtimeBehaviorEnabledSetting"));
}

- (unint64_t)scheduleEnabledSetting
{
  return self->_scheduleEnabledSetting;
}

- (DNDScheduleTimePeriod)timePeriod
{
  return self->_timePeriod;
}

- (unint64_t)bedtimeBehaviorEnabledSetting
{
  return self->_bedtimeBehaviorEnabledSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePeriod, 0);
}

@end
