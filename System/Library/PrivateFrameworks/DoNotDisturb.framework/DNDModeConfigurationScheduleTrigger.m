@implementation DNDModeConfigurationScheduleTrigger

+ (id)defaultScheduleTrigger
{
  DNDModeConfigurationScheduleTrigger *v2;
  DNDScheduleTimePeriod *v3;
  void *v4;
  DNDModeConfigurationScheduleTrigger *v5;

  v2 = [DNDModeConfigurationScheduleTrigger alloc];
  v3 = objc_alloc_init(DNDScheduleTimePeriod);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DNDModeConfigurationScheduleTrigger initWithTimePeriod:creationDate:enabledSetting:](v2, "initWithTimePeriod:creationDate:enabledSetting:", v3, v4, 0);

  return v5;
}

+ (id)triggerWithClientTrigger:(id)a3 creationDate:(id)a4
{
  id v5;
  id v6;
  DNDModeConfigurationScheduleTrigger *v7;
  void *v8;
  uint64_t v9;
  DNDModeConfigurationScheduleTrigger *v10;

  v5 = a4;
  v6 = a3;
  v7 = [DNDModeConfigurationScheduleTrigger alloc];
  objc_msgSend(v6, "timePeriod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "enabledSetting");

  v10 = -[DNDModeConfigurationScheduleTrigger initWithTimePeriod:creationDate:enabledSetting:](v7, "initWithTimePeriod:creationDate:enabledSetting:", v8, v5, v9);
  return v10;
}

- (DNDModeConfigurationScheduleTrigger)initWithTimePeriod:(id)a3 enabledSetting:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  DNDModeConfigurationScheduleTrigger *v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DNDModeConfigurationScheduleTrigger initWithTimePeriod:creationDate:enabledSetting:](self, "initWithTimePeriod:creationDate:enabledSetting:", v7, v8, a4);

  return v9;
}

- (DNDModeConfigurationScheduleTrigger)initWithTimePeriod:(id)a3 creationDate:(id)a4 enabledSetting:(unint64_t)a5
{
  id v8;
  id v9;
  DNDModeConfigurationScheduleTrigger *v10;
  DNDScheduleTimePeriod *v11;
  DNDScheduleTimePeriod *v12;
  uint64_t v13;
  NSDate *creationDate;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDModeConfigurationScheduleTrigger;
  v10 = -[DNDModeConfigurationTrigger initWithEnabledSetting:](&v16, sel_initWithEnabledSetting_, a5);
  if (v10)
  {
    v11 = (DNDScheduleTimePeriod *)objc_msgSend(v8, "copy");
    v12 = v11;
    if (!v11)
      v12 = objc_alloc_init(DNDScheduleTimePeriod);
    objc_storeStrong((id *)&v10->_timePeriod, v12);
    if (!v11)

    v13 = objc_msgSend(v9, "copy");
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v13;

  }
  return v10;
}

- (BOOL)isEnabled
{
  return -[DNDModeConfigurationTrigger enabledSetting](self, "enabledSetting") == 2;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DNDModeConfigurationScheduleTrigger;
  v3 = -[DNDModeConfigurationTrigger hash](&v6, sel_hash);
  v4 = -[DNDScheduleTimePeriod hash](self->_timePeriod, "hash") ^ v3;
  return v4 ^ -[NSDate hash](self->_creationDate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  DNDModeConfigurationScheduleTrigger *v4;
  DNDModeConfigurationScheduleTrigger *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = (DNDModeConfigurationScheduleTrigger *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v27.receiver = self;
      v27.super_class = (Class)DNDModeConfigurationScheduleTrigger;
      if (!-[DNDModeConfigurationTrigger isEqual:](&v27, sel_isEqual_, v5))
      {
        v13 = 0;
LABEL_27:

        goto LABEL_28;
      }
      -[DNDModeConfigurationScheduleTrigger timePeriod](self, "timePeriod");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeConfigurationScheduleTrigger timePeriod](v5, "timePeriod");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDModeConfigurationScheduleTrigger timePeriod](self, "timePeriod");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v9 = (void *)v8;
        -[DNDModeConfigurationScheduleTrigger timePeriod](v5, "timePeriod");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_25:

          goto LABEL_26;
        }
        -[DNDModeConfigurationScheduleTrigger timePeriod](self, "timePeriod");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeConfigurationScheduleTrigger timePeriod](v5, "timePeriod");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      -[DNDModeConfigurationScheduleTrigger creationDate](self, "creationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeConfigurationScheduleTrigger creationDate](v5, "creationDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[DNDModeConfigurationScheduleTrigger creationDate](self, "creationDate");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          -[DNDModeConfigurationScheduleTrigger creationDate](v5, "creationDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            -[DNDModeConfigurationScheduleTrigger creationDate](self, "creationDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDModeConfigurationScheduleTrigger creationDate](v5, "creationDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v22, "isEqual:", v20);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {

          v13 = 0;
        }
      }
      v10 = v25;
      v9 = v26;
      v12 = v23;
      v11 = v24;
      if (v6 == v7)
        goto LABEL_26;
      goto LABEL_24;
    }
    v13 = 0;
  }
LABEL_28:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[DNDModeConfigurationTrigger enabledSetting](self, "enabledSetting");
  -[DNDModeConfigurationScheduleTrigger timePeriod](self, "timePeriod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeConfigurationScheduleTrigger creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; enabledSetting: %llu; timePeriod: %@; creationDate: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeConfigurationScheduleTrigger)initWithCoder:(id)a3
{
  id v4;
  DNDModeConfigurationScheduleTrigger *v5;
  void *v6;
  uint64_t v7;
  DNDScheduleTimePeriod *timePeriod;
  void *v9;
  uint64_t v10;
  NSDate *creationDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DNDModeConfigurationScheduleTrigger;
  v5 = -[DNDModeConfigurationTrigger initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timePeriod"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    timePeriod = v5->_timePeriod;
    v5->_timePeriod = (DNDScheduleTimePeriod *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DNDModeConfigurationScheduleTrigger;
  v4 = a3;
  -[DNDModeConfigurationTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DNDModeConfigurationScheduleTrigger timePeriod](self, "timePeriod", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("timePeriod"));

  -[DNDModeConfigurationScheduleTrigger creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("creationDate"));

}

- (DNDScheduleTimePeriod)timePeriod
{
  return self->_timePeriod;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_creationdate, 0);
  objc_storeStrong((id *)&self->_timePeriod, 0);
}

@end
