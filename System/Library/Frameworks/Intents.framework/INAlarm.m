@implementation INAlarm

- (INAlarm)initWithIdentifier:(id)a3 dateTime:(id)a4 label:(id)a5 enabled:(id)a6 firing:(id)a7 alarmRepeatScheduleOptions:(unint64_t)a8 sleepAlarmAttribute:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  INAlarm *v21;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSDateComponents *dateTime;
  uint64_t v26;
  INSpeakableString *label;
  uint64_t v28;
  NSNumber *enabled;
  uint64_t v30;
  NSNumber *firing;
  uint64_t v32;
  INSleepAlarmAttribute *sleepAlarmAttribute;
  objc_super v35;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)INAlarm;
  v21 = -[INAlarm init](&v35, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    dateTime = v21->_dateTime;
    v21->_dateTime = (NSDateComponents *)v24;

    v26 = objc_msgSend(v17, "copy");
    label = v21->_label;
    v21->_label = (INSpeakableString *)v26;

    v28 = objc_msgSend(v18, "copy");
    enabled = v21->_enabled;
    v21->_enabled = (NSNumber *)v28;

    v30 = objc_msgSend(v19, "copy");
    firing = v21->_firing;
    v21->_firing = (NSNumber *)v30;

    v21->_alarmRepeatScheduleOptions = a8;
    v32 = objc_msgSend(v20, "copy");
    sleepAlarmAttribute = v21->_sleepAlarmAttribute;
    v21->_sleepAlarmAttribute = (INSleepAlarmAttribute *)v32;

  }
  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSDateComponents hash](self->_dateTime, "hash") ^ v3;
  v5 = -[INSpeakableString hash](self->_label, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_enabled, "hash");
  v7 = v6 ^ -[NSNumber hash](self->_firing, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_alarmRepeatScheduleOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = v7 ^ v9 ^ -[INSleepAlarmAttribute hash](self->_sleepAlarmAttribute, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  INAlarm *v4;
  INAlarm *v5;
  NSString *identifier;
  NSDateComponents *dateTime;
  INSpeakableString *label;
  NSNumber *enabled;
  NSNumber *firing;
  INSleepAlarmAttribute *sleepAlarmAttribute;
  BOOL v12;

  v4 = (INAlarm *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v12 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        dateTime = self->_dateTime;
        if (dateTime == v5->_dateTime || -[NSDateComponents isEqual:](dateTime, "isEqual:"))
        {
          label = self->_label;
          if (label == v5->_label || -[INSpeakableString isEqual:](label, "isEqual:"))
          {
            enabled = self->_enabled;
            if (enabled == v5->_enabled || -[NSNumber isEqual:](enabled, "isEqual:"))
            {
              firing = self->_firing;
              if ((firing == v5->_firing || -[NSNumber isEqual:](firing, "isEqual:"))
                && self->_alarmRepeatScheduleOptions == v5->_alarmRepeatScheduleOptions)
              {
                sleepAlarmAttribute = self->_sleepAlarmAttribute;
                if (sleepAlarmAttribute == v5->_sleepAlarmAttribute
                  || -[INSleepAlarmAttribute isEqual:](sleepAlarmAttribute, "isEqual:"))
                {
                  v12 = 1;
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (INAlarm)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  INAlarm *v15;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firing"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("alarmRepeatScheduleOptions"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sleepAlarmAttribute"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[INAlarm initWithIdentifier:dateTime:label:enabled:firing:alarmRepeatScheduleOptions:sleepAlarmAttribute:](self, "initWithIdentifier:dateTime:label:enabled:firing:alarmRepeatScheduleOptions:sleepAlarmAttribute:", v8, v9, v10, v11, v12, v13, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateTime, CFSTR("dateTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enabled, CFSTR("enabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firing, CFSTR("firing"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_alarmRepeatScheduleOptions, CFSTR("alarmRepeatScheduleOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sleepAlarmAttribute, CFSTR("sleepAlarmAttribute"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("identifier"));

  objc_msgSend(v6, "encodeObject:", self->_dateTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("dateTime"));

  objc_msgSend(v6, "encodeObject:", self->_label);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("label"));

  objc_msgSend(v6, "encodeObject:", self->_enabled);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("enabled"));

  objc_msgSend(v6, "encodeObject:", self->_firing);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("firing"));

  INAlarmRepeatScheduleOptionsGetNames(self->_alarmRepeatScheduleOptions);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("alarmRepeatScheduleOptions"));

  objc_msgSend(v6, "encodeObject:", self->_sleepAlarmAttribute);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("sleepAlarmAttribute"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INAlarm descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INAlarm;
  -[INAlarm description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAlarm _dictionaryRepresentation](self, "_dictionaryRepresentation");
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
  NSDateComponents *dateTime;
  uint64_t v5;
  INSpeakableString *label;
  uint64_t v7;
  NSNumber *enabled;
  void *v9;
  NSNumber *firing;
  void *v11;
  void *v12;
  INSleepAlarmAttribute *sleepAlarmAttribute;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[7];
  _QWORD v23[9];

  v23[7] = *MEMORY[0x1E0C80C00];
  identifier = (uint64_t)self->_identifier;
  v21 = identifier;
  v22[0] = CFSTR("identifier");
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    identifier = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)identifier;
  v23[0] = identifier;
  v22[1] = CFSTR("dateTime");
  dateTime = self->_dateTime;
  v5 = (uint64_t)dateTime;
  if (!dateTime)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v5;
  v23[1] = v5;
  v22[2] = CFSTR("label");
  label = self->_label;
  v7 = (uint64_t)label;
  if (!label)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v7;
  v23[2] = v7;
  v22[3] = CFSTR("enabled");
  enabled = self->_enabled;
  v9 = enabled;
  if (!enabled)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v7, v19, v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[3] = v9;
  v22[4] = CFSTR("firing");
  firing = self->_firing;
  v11 = firing;
  if (!firing)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[4] = v11;
  v22[5] = CFSTR("alarmRepeatScheduleOptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_alarmRepeatScheduleOptions, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v12;
  v22[6] = CFSTR("sleepAlarmAttribute");
  sleepAlarmAttribute = self->_sleepAlarmAttribute;
  v14 = sleepAlarmAttribute;
  if (!sleepAlarmAttribute)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!sleepAlarmAttribute)

  if (firing)
  {
    if (enabled)
      goto LABEL_17;
  }
  else
  {

    if (enabled)
    {
LABEL_17:
      if (label)
        goto LABEL_18;
LABEL_24:

      if (dateTime)
        goto LABEL_19;
      goto LABEL_25;
    }
  }

  if (!label)
    goto LABEL_24;
LABEL_18:
  if (dateTime)
    goto LABEL_19;
LABEL_25:

LABEL_19:
  if (!v21)

  return v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDateComponents)dateTime
{
  return self->_dateTime;
}

- (INSpeakableString)label
{
  return self->_label;
}

- (NSNumber)enabled
{
  return self->_enabled;
}

- (NSNumber)firing
{
  return self->_firing;
}

- (unint64_t)alarmRepeatScheduleOptions
{
  return self->_alarmRepeatScheduleOptions;
}

- (INSleepAlarmAttribute)sleepAlarmAttribute
{
  return self->_sleepAlarmAttribute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarmAttribute, 0);
  objc_storeStrong((id *)&self->_firing, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dateTime, 0);
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
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dateTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("label"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("enabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("firing"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("alarmRepeatScheduleOptions"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v20 = v18;

    v21 = INAlarmRepeatScheduleOptionsWithNames(v20);
    v22 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sleepAlarmAttribute"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:dateTime:label:enabled:firing:alarmRepeatScheduleOptions:sleepAlarmAttribute:", v26, v11, v14, v15, v16, v21, v24);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
