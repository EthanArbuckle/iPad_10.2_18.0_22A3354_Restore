@implementation _INPBAlarm

- (void)setAlarmRepeatScheduleOptions:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)alarmRepeatScheduleOptions
{
  return self->_alarmRepeatScheduleOptions.list;
}

- (void)clearAlarmRepeatScheduleOptions
{
  PBRepeatedInt32Clear();
}

- (void)addAlarmRepeatScheduleOptions:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)alarmRepeatScheduleOptionsCount
{
  return self->_alarmRepeatScheduleOptions.count;
}

- (int)alarmRepeatScheduleOptionsAtIndex:(unint64_t)a3
{
  return self->_alarmRepeatScheduleOptions.list[a3];
}

- (id)alarmRepeatScheduleOptionsAsString:(int)a3
{
  if (a3 < 8)
    return off_1E2294CA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAlarmRepeatScheduleOptions:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONDAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TUESDAY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEDNESDAY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THURSDAY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRIDAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SATURDAY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUNDAY")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_dateTime, a3);
}

- (BOOL)hasDateTime
{
  return self->_dateTime != 0;
}

- (void)setEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enabled = a3;
}

- (BOOL)hasEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setFiring:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_firing = a3;
}

- (BOOL)hasFiring
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasFiring:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setSleepAlarmAttribute:(id)a3
{
  objc_storeStrong((id *)&self->_sleepAlarmAttribute, a3);
}

- (BOOL)hasSleepAlarmAttribute
{
  return self->_sleepAlarmAttribute != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAlarmReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (self->_alarmRepeatScheduleOptions.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_alarmRepeatScheduleOptions.count);
  }
  -[_INPBAlarm dateTime](self, "dateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBAlarm dateTime](self, "dateTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBAlarm hasEnabled](self, "hasEnabled"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBAlarm hasFiring](self, "hasFiring"))
    PBDataWriterWriteBOOLField();
  -[_INPBAlarm identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[_INPBAlarm label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBAlarm label](self, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBAlarm sleepAlarmAttribute](self, "sleepAlarmAttribute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[_INPBAlarm sleepAlarmAttribute](self, "sleepAlarmAttribute");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBAlarm clearAlarmRepeatScheduleOptions](self, "clearAlarmRepeatScheduleOptions");
  v3.receiver = self;
  v3.super_class = (Class)_INPBAlarm;
  -[_INPBAlarm dealloc](&v3, sel_dealloc);
}

- (_INPBAlarm)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAlarm *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAlarm *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAlarm *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAlarm initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBAlarm data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAlarm *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = -[_INPBAlarm init](+[_INPBAlarm allocWithZone:](_INPBAlarm, "allocWithZone:"), "init");
  PBRepeatedInt32Copy();
  v6 = -[_INPBDateTime copyWithZone:](self->_dateTime, "copyWithZone:", a3);
  -[_INPBAlarm setDateTime:](v5, "setDateTime:", v6);

  if (-[_INPBAlarm hasEnabled](self, "hasEnabled"))
    -[_INPBAlarm setEnabled:](v5, "setEnabled:", -[_INPBAlarm enabled](self, "enabled"));
  if (-[_INPBAlarm hasFiring](self, "hasFiring"))
    -[_INPBAlarm setFiring:](v5, "setFiring:", -[_INPBAlarm firing](self, "firing"));
  v7 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBAlarm setIdentifier:](v5, "setIdentifier:", v7);

  v8 = -[_INPBDataString copyWithZone:](self->_label, "copyWithZone:", a3);
  -[_INPBAlarm setLabel:](v5, "setLabel:", v8);

  v9 = -[_INPBSleepAlarmAttribute copyWithZone:](self->_sleepAlarmAttribute, "copyWithZone:", a3);
  -[_INPBAlarm setSleepAlarmAttribute:](v5, "setSleepAlarmAttribute:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int enabled;
  int v14;
  int firing;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedInt32IsEqual())
    goto LABEL_31;
  -[_INPBAlarm dateTime](self, "dateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBAlarm dateTime](self, "dateTime");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAlarm dateTime](self, "dateTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_31;
  }
  else
  {

  }
  v12 = -[_INPBAlarm hasEnabled](self, "hasEnabled");
  if (v12 != objc_msgSend(v4, "hasEnabled"))
    goto LABEL_31;
  if (-[_INPBAlarm hasEnabled](self, "hasEnabled"))
  {
    if (objc_msgSend(v4, "hasEnabled"))
    {
      enabled = self->_enabled;
      if (enabled != objc_msgSend(v4, "enabled"))
        goto LABEL_31;
    }
  }
  v14 = -[_INPBAlarm hasFiring](self, "hasFiring");
  if (v14 != objc_msgSend(v4, "hasFiring"))
    goto LABEL_31;
  if (-[_INPBAlarm hasFiring](self, "hasFiring"))
  {
    if (objc_msgSend(v4, "hasFiring"))
    {
      firing = self->_firing;
      if (firing != objc_msgSend(v4, "firing"))
        goto LABEL_31;
    }
  }
  -[_INPBAlarm identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBAlarm identifier](self, "identifier");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_INPBAlarm identifier](self, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBAlarm label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBAlarm label](self, "label");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBAlarm label](self, "label");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBAlarm sleepAlarmAttribute](self, "sleepAlarmAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepAlarmAttribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBAlarm sleepAlarmAttribute](self, "sleepAlarmAttribute");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
    {

LABEL_34:
      v31 = 1;
      goto LABEL_32;
    }
    v27 = (void *)v26;
    -[_INPBAlarm sleepAlarmAttribute](self, "sleepAlarmAttribute");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sleepAlarmAttribute");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if ((v30 & 1) != 0)
      goto LABEL_34;
  }
  else
  {
LABEL_30:

  }
LABEL_31:
  v31 = 0;
LABEL_32:

  return v31;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  v3 = PBRepeatedInt32Hash();
  v4 = -[_INPBDateTime hash](self->_dateTime, "hash");
  if (-[_INPBAlarm hasEnabled](self, "hasEnabled"))
    v5 = 2654435761 * self->_enabled;
  else
    v5 = 0;
  if (-[_INPBAlarm hasFiring](self, "hasFiring"))
    v6 = 2654435761 * self->_firing;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_identifier, "hash");
  v8 = -[_INPBDataString hash](self->_label, "hash");
  return v7 ^ v8 ^ -[_INPBSleepAlarmAttribute hash](self->_sleepAlarmAttribute, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alarmRepeatScheduleOptions.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBAlarm alarmRepeatScheduleOptionsCount](self, "alarmRepeatScheduleOptionsCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBAlarm alarmRepeatScheduleOptionsCount](self, "alarmRepeatScheduleOptionsCount"))
    {
      v5 = 0;
      do
      {
        v6 = self->_alarmRepeatScheduleOptions.list[v5];
        if (v6 >= 8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_alarmRepeatScheduleOptions.list[v5]);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = off_1E2294CA0[v6];
        }
        objc_msgSend(v4, "addObject:", v7);

        ++v5;
      }
      while (v5 < -[_INPBAlarm alarmRepeatScheduleOptionsCount](self, "alarmRepeatScheduleOptionsCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alarmRepeatScheduleOptions"));

  }
  -[_INPBAlarm dateTime](self, "dateTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dateTime"));

  if (-[_INPBAlarm hasEnabled](self, "hasEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBAlarm enabled](self, "enabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("enabled"));

  }
  if (-[_INPBAlarm hasFiring](self, "hasFiring"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBAlarm firing](self, "firing"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("firing"));

  }
  if (self->_identifier)
  {
    -[_INPBAlarm identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("identifier"));

  }
  -[_INPBAlarm label](self, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("label"));

  -[_INPBAlarm sleepAlarmAttribute](self, "sleepAlarmAttribute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("sleepAlarmAttribute"));

  return v3;
}

- (_INPBDateTime)dateTime
{
  return self->_dateTime;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)firing
{
  return self->_firing;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBDataString)label
{
  return self->_label;
}

- (_INPBSleepAlarmAttribute)sleepAlarmAttribute
{
  return self->_sleepAlarmAttribute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarmAttribute, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateTime, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
