@implementation DNDScheduleTimePeriod

- (DNDScheduleTimePeriod)init
{
  return (DNDScheduleTimePeriod *)-[DNDScheduleTimePeriod _initWithPeriod:](self, "_initWithPeriod:", 0);
}

- (id)_initWithPeriod:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v7 = objc_msgSend(v4, "weekdays");
  else
    v7 = 0xFFFFFFFFLL;
  v8 = -[DNDScheduleTimePeriod _initWithStartTime:endTime:weekdays:](self, "_initWithStartTime:endTime:weekdays:", v5, v6, v7);

  return v8;
}

- (id)_initWithStartTime:(id)a3 endTime:(id)a4 weekdays:(unint64_t)a5
{
  id v8;
  id v9;
  DNDScheduleTimePeriod *v10;
  void *v11;
  void *v12;
  DNDScheduleTime *v13;
  DNDScheduleTime *startTime;
  void *v15;
  void *v16;
  DNDScheduleTime *v17;
  DNDScheduleTime *endTime;
  unint64_t v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)DNDScheduleTimePeriod;
  v10 = -[DNDScheduleTimePeriod init](&v21, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend(v8, "copy");
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      +[DNDScheduleTime defaultStartTime](DNDScheduleTime, "defaultStartTime");
      v13 = (DNDScheduleTime *)objc_claimAutoreleasedReturnValue();
    }
    startTime = v10->_startTime;
    v10->_startTime = v13;

    v15 = (void *)objc_msgSend(v9, "copy");
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      +[DNDScheduleTime defaultEndTime](DNDScheduleTime, "defaultEndTime");
      v17 = (DNDScheduleTime *)objc_claimAutoreleasedReturnValue();
    }
    endTime = v10->_endTime;
    v10->_endTime = v17;

    v19 = 127;
    if (a5 != 0xFFFFFFFF)
      v19 = a5;
    v10->_weekdays = v19;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[DNDScheduleTimePeriod startTime](self, "startTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDScheduleTimePeriod endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[DNDScheduleTimePeriod weekdays](self, "weekdays");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  DNDScheduleTimePeriod *v7;
  DNDScheduleTimePeriod *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v7 = (DNDScheduleTimePeriod *)a3;
  if (self == v7)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[DNDScheduleTimePeriod startTime](self, "startTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDScheduleTimePeriod startTime](v8, "startTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[DNDScheduleTimePeriod startTime](self, "startTime");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v14 = 0;
          goto LABEL_28;
        }
        v3 = (void *)v11;
        -[DNDScheduleTimePeriod startTime](v8, "startTime");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v14 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v4 = (void *)v12;
        -[DNDScheduleTimePeriod startTime](self, "startTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDScheduleTimePeriod startTime](v8, "startTime");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v5))
        {
          v14 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v5;
        v27 = v13;
        v28 = v4;
      }
      -[DNDScheduleTimePeriod endTime](self, "endTime");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDScheduleTimePeriod endTime](v8, "endTime");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
        goto LABEL_16;
      -[DNDScheduleTimePeriod endTime](self, "endTime");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {

        v14 = 0;
        goto LABEL_25;
      }
      v5 = (void *)v17;
      -[DNDScheduleTimePeriod endTime](v8, "endTime");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        v14 = 0;
        goto LABEL_23;
      }
      v24 = (void *)v18;
      -[DNDScheduleTimePeriod endTime](self, "endTime");
      v19 = objc_claimAutoreleasedReturnValue();
      -[DNDScheduleTimePeriod endTime](v8, "endTime");
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v19;
      v21 = (void *)v19;
      v4 = (void *)v20;
      if (objc_msgSend(v21, "isEqual:", v20))
      {
LABEL_16:
        v22 = -[DNDScheduleTimePeriod weekdays](self, "weekdays");
        v14 = v22 == -[DNDScheduleTimePeriod weekdays](v8, "weekdays");
        if (v15 == v16)
        {

LABEL_24:
LABEL_25:
          v13 = v27;
          v4 = v28;
          v5 = v26;
          if (v9 != v10)
            goto LABEL_26;
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        v14 = 0;
      }

LABEL_23:
      goto LABEL_24;
    }
    v14 = 0;
  }
LABEL_29:

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DNDScheduleTimePeriod startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDScheduleTimePeriod endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromDNDWeekdays(-[DNDScheduleTimePeriod weekdays](self, "weekdays"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<period: s: %@; e: %@; weekdays: %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDScheduleTimePeriod _initWithPeriod:]([DNDMutableScheduleTimePeriod alloc], "_initWithPeriod:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDScheduleTimePeriod)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  DNDScheduleTimePeriod *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("weekdays")))
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("weekdays"));
  else
    v7 = 0xFFFFFFFFLL;
  v8 = -[DNDScheduleTimePeriod _initWithStartTime:endTime:weekdays:](self, "_initWithStartTime:endTime:weekdays:", v5, v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DNDScheduleTimePeriod startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("startTime"));

  -[DNDScheduleTimePeriod endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("endTime"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[DNDScheduleTimePeriod weekdays](self, "weekdays"), CFSTR("weekdays"));
}

- (DNDScheduleTime)startTime
{
  return self->_startTime;
}

- (DNDScheduleTime)endTime
{
  return self->_endTime;
}

- (unint64_t)weekdays
{
  return self->_weekdays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
