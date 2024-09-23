@implementation INAlarmSearch

- (INAlarmSearch)initWithAlarmReferenceType:(int64_t)a3 identifier:(id)a4 time:(id)a5 label:(id)a6 alarmSearchStatus:(int64_t)a7 includeSleepAlarm:(id)a8 period:(int64_t)a9 isMeridianInferred:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  INAlarmSearch *v21;
  INAlarmSearch *v22;
  uint64_t v23;
  NSString *identifier;
  uint64_t v25;
  INDateComponentsRange *time;
  uint64_t v27;
  INSpeakableString *label;
  uint64_t v29;
  NSNumber *includeSleepAlarm;
  uint64_t v31;
  NSNumber *isMeridianInferred;
  objc_super v34;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a10;
  v34.receiver = self;
  v34.super_class = (Class)INAlarmSearch;
  v21 = -[INAlarmSearch init](&v34, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_alarmReferenceType = a3;
    v23 = objc_msgSend(v16, "copy");
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    time = v22->_time;
    v22->_time = (INDateComponentsRange *)v25;

    v27 = objc_msgSend(v18, "copy");
    label = v22->_label;
    v22->_label = (INSpeakableString *)v27;

    v22->_alarmSearchStatus = a7;
    v29 = objc_msgSend(v19, "copy");
    includeSleepAlarm = v22->_includeSleepAlarm;
    v22->_includeSleepAlarm = (NSNumber *)v29;

    v22->_period = a9;
    v31 = objc_msgSend(v20, "copy");
    isMeridianInferred = v22->_isMeridianInferred;
    v22->_isMeridianInferred = (NSNumber *)v31;

  }
  return v22;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_alarmReferenceType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_identifier, "hash");
  v6 = v5 ^ -[INDateComponentsRange hash](self->_time, "hash");
  v7 = v6 ^ -[INSpeakableString hash](self->_label, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_alarmSearchStatus);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = v7 ^ v9 ^ -[NSNumber hash](self->_includeSleepAlarm, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_period);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v10 ^ v12 ^ -[NSNumber hash](self->_isMeridianInferred, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  INAlarmSearch *v4;
  INAlarmSearch *v5;
  NSString *identifier;
  INDateComponentsRange *time;
  INSpeakableString *label;
  NSNumber *includeSleepAlarm;
  NSNumber *isMeridianInferred;
  BOOL v11;

  v4 = (INAlarmSearch *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v11 = 0;
      if (self->_alarmReferenceType == v5->_alarmReferenceType)
      {
        identifier = self->_identifier;
        if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
        {
          time = self->_time;
          if (time == v5->_time || -[INDateComponentsRange isEqual:](time, "isEqual:"))
          {
            label = self->_label;
            if ((label == v5->_label || -[INSpeakableString isEqual:](label, "isEqual:"))
              && self->_alarmSearchStatus == v5->_alarmSearchStatus)
            {
              includeSleepAlarm = self->_includeSleepAlarm;
              if ((includeSleepAlarm == v5->_includeSleepAlarm
                 || -[NSNumber isEqual:](includeSleepAlarm, "isEqual:"))
                && self->_period == v5->_period)
              {
                isMeridianInferred = self->_isMeridianInferred;
                if (isMeridianInferred == v5->_isMeridianInferred
                  || -[NSNumber isEqual:](isMeridianInferred, "isEqual:"))
                {
                  v11 = 1;
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (INAlarmSearch)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  INAlarmSearch *v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alarmReferenceType"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alarmSearchStatus"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("includeSleepAlarm"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("period"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isMeridianInferred"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[INAlarmSearch initWithAlarmReferenceType:identifier:time:label:alarmSearchStatus:includeSleepAlarm:period:isMeridianInferred:](self, "initWithAlarmReferenceType:identifier:time:label:alarmSearchStatus:includeSleepAlarm:period:isMeridianInferred:", v5, v9, v10, v11, v12, v13, v14, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t alarmReferenceType;
  id v5;

  alarmReferenceType = self->_alarmReferenceType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", alarmReferenceType, CFSTR("alarmReferenceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_time, CFSTR("time"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_alarmSearchStatus, CFSTR("alarmSearchStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_includeSleepAlarm, CFSTR("includeSleepAlarm"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_period, CFSTR("period"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isMeridianInferred, CFSTR("isMeridianInferred"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_alarmReferenceType - 1;
  if (v8 > 3)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2294C68[v8];
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("alarmReferenceType"));

  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("identifier"));

  objc_msgSend(v6, "encodeObject:", self->_time);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("time"));

  objc_msgSend(v6, "encodeObject:", self->_label);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("label"));

  v14 = self->_alarmSearchStatus - 1;
  if (v14 > 3)
    v15 = CFSTR("unknown");
  else
    v15 = off_1E2294E58[v14];
  v16 = v15;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("alarmSearchStatus"));

  objc_msgSend(v6, "encodeObject:", self->_includeSleepAlarm);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, CFSTR("includeSleepAlarm"));

  v18 = self->_period - 1;
  if (v18 > 7)
    v19 = CFSTR("unknown");
  else
    v19 = off_1E2294B58[v18];
  v20 = v19;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, CFSTR("period"));

  objc_msgSend(v6, "encodeObject:", self->_isMeridianInferred);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, CFSTR("isMeridianInferred"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INAlarmSearch descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INAlarmSearch;
  -[INAlarmSearch description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAlarmSearch _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t identifier;
  INDateComponentsRange *time;
  uint64_t v5;
  INSpeakableString *label;
  void *v7;
  void *v8;
  NSNumber *includeSleepAlarm;
  void *v10;
  void *v11;
  NSNumber *isMeridianInferred;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[8];
  _QWORD v22[10];

  v22[8] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("alarmReferenceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_alarmReferenceType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("identifier");
  identifier = (uint64_t)self->_identifier;
  v19 = identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    identifier = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)identifier;
  v22[1] = identifier;
  v21[2] = CFSTR("time");
  time = self->_time;
  v5 = (uint64_t)time;
  if (!time)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v16 = v5;
  v22[2] = v5;
  v21[3] = CFSTR("label");
  label = self->_label;
  v7 = label;
  if (!label)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v5, v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v7;
  v21[4] = CFSTR("alarmSearchStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_alarmSearchStatus, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v8;
  v21[5] = CFSTR("includeSleepAlarm");
  includeSleepAlarm = self->_includeSleepAlarm;
  v10 = includeSleepAlarm;
  if (!includeSleepAlarm)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v10;
  v21[6] = CFSTR("period");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_period);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v11;
  v21[7] = CFSTR("isMeridianInferred");
  isMeridianInferred = self->_isMeridianInferred;
  v13 = isMeridianInferred;
  if (!isMeridianInferred)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isMeridianInferred)

  if (!includeSleepAlarm)
  if (label)
  {
    if (time)
      goto LABEL_17;
  }
  else
  {

    if (time)
      goto LABEL_17;
  }

LABEL_17:
  if (!v19)

  return v14;
}

- (int64_t)alarmReferenceType
{
  return self->_alarmReferenceType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (INDateComponentsRange)time
{
  return self->_time;
}

- (INSpeakableString)label
{
  return self->_label;
}

- (int64_t)alarmSearchStatus
{
  return self->_alarmSearchStatus;
}

- (NSNumber)includeSleepAlarm
{
  return self->_includeSleepAlarm;
}

- (int64_t)period
{
  return self->_period;
}

- (NSNumber)isMeridianInferred
{
  return self->_isMeridianInferred;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isMeridianInferred, 0);
  objc_storeStrong((id *)&self->_includeSleepAlarm, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v25;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("alarmReferenceType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = INAlarmReferenceTypeWithString(v9);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("time"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("label"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("alarmSearchStatus"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = INAlarmSearchStatusWithString(v17);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("includeSleepAlarm"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("period"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = INAlarmPeriodWithString(v20);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isMeridianInferred"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAlarmReferenceType:identifier:time:label:alarmSearchStatus:includeSleepAlarm:period:isMeridianInferred:", v25, v10, v13, v16, v18, v19, v21, v22);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end
