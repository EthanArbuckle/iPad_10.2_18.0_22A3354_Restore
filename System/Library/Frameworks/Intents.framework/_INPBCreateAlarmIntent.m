@implementation _INPBCreateAlarmIntent

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
    return off_1E2294B98[a3];
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

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setRelativeOffsetInMinutes:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_relativeOffsetInMinutes = a3;
}

- (BOOL)hasRelativeOffsetInMinutes
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRelativeOffsetInMinutes:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateAlarmIntentReadFrom(self, (uint64_t)a3);
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
  id v12;

  v12 = a3;
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
  -[_INPBCreateAlarmIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBCreateAlarmIntent intentMetadata](self, "intentMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCreateAlarmIntent label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBCreateAlarmIntent label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBCreateAlarmIntent hasRelativeOffsetInMinutes](self, "hasRelativeOffsetInMinutes"))
    PBDataWriterWriteInt32Field();
  -[_INPBCreateAlarmIntent time](self, "time");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (v9)
  {
    -[_INPBCreateAlarmIntent time](self, "time");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBCreateAlarmIntent clearAlarmRepeatScheduleOptions](self, "clearAlarmRepeatScheduleOptions");
  v3.receiver = self;
  v3.super_class = (Class)_INPBCreateAlarmIntent;
  -[_INPBCreateAlarmIntent dealloc](&v3, sel_dealloc);
}

- (_INPBCreateAlarmIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCreateAlarmIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCreateAlarmIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCreateAlarmIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCreateAlarmIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBCreateAlarmIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCreateAlarmIntent *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBCreateAlarmIntent init](+[_INPBCreateAlarmIntent allocWithZone:](_INPBCreateAlarmIntent, "allocWithZone:"), "init");
  PBRepeatedInt32Copy();
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBCreateAlarmIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBDataString copyWithZone:](self->_label, "copyWithZone:", a3);
  -[_INPBCreateAlarmIntent setLabel:](v5, "setLabel:", v7);

  if (-[_INPBCreateAlarmIntent hasRelativeOffsetInMinutes](self, "hasRelativeOffsetInMinutes"))
    -[_INPBCreateAlarmIntent setRelativeOffsetInMinutes:](v5, "setRelativeOffsetInMinutes:", -[_INPBCreateAlarmIntent relativeOffsetInMinutes](self, "relativeOffsetInMinutes"));
  v8 = -[_INPBDateTimeRange copyWithZone:](self->_time, "copyWithZone:", a3);
  -[_INPBCreateAlarmIntent setTime:](v5, "setTime:", v8);

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int relativeOffsetInMinutes;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedInt32IsEqual())
    goto LABEL_22;
  -[_INPBCreateAlarmIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBCreateAlarmIntent intentMetadata](self, "intentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCreateAlarmIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBCreateAlarmIntent label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBCreateAlarmIntent label](self, "label");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBCreateAlarmIntent label](self, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  v17 = -[_INPBCreateAlarmIntent hasRelativeOffsetInMinutes](self, "hasRelativeOffsetInMinutes");
  if (v17 != objc_msgSend(v4, "hasRelativeOffsetInMinutes"))
    goto LABEL_22;
  if (-[_INPBCreateAlarmIntent hasRelativeOffsetInMinutes](self, "hasRelativeOffsetInMinutes"))
  {
    if (objc_msgSend(v4, "hasRelativeOffsetInMinutes"))
    {
      relativeOffsetInMinutes = self->_relativeOffsetInMinutes;
      if (relativeOffsetInMinutes != objc_msgSend(v4, "relativeOffsetInMinutes"))
        goto LABEL_22;
    }
  }
  -[_INPBCreateAlarmIntent time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCreateAlarmIntent time](self, "time");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_25:
      v24 = 1;
      goto LABEL_23;
    }
    v20 = (void *)v19;
    -[_INPBCreateAlarmIntent time](self, "time");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "time");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v24 = 0;
LABEL_23:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = PBRepeatedInt32Hash();
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v5 = -[_INPBDataString hash](self->_label, "hash");
  if (-[_INPBCreateAlarmIntent hasRelativeOffsetInMinutes](self, "hasRelativeOffsetInMinutes"))
    v6 = 2654435761 * self->_relativeOffsetInMinutes;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[_INPBDateTimeRange hash](self->_time, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alarmRepeatScheduleOptions.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBCreateAlarmIntent alarmRepeatScheduleOptionsCount](self, "alarmRepeatScheduleOptionsCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBCreateAlarmIntent alarmRepeatScheduleOptionsCount](self, "alarmRepeatScheduleOptionsCount"))
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
          v7 = off_1E2294B98[v6];
        }
        objc_msgSend(v4, "addObject:", v7);

        ++v5;
      }
      while (v5 < -[_INPBCreateAlarmIntent alarmRepeatScheduleOptionsCount](self, "alarmRepeatScheduleOptionsCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alarmRepeatScheduleOptions"));

  }
  -[_INPBCreateAlarmIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentMetadata"));

  -[_INPBCreateAlarmIntent label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("label"));

  if (-[_INPBCreateAlarmIntent hasRelativeOffsetInMinutes](self, "hasRelativeOffsetInMinutes"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_INPBCreateAlarmIntent relativeOffsetInMinutes](self, "relativeOffsetInMinutes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("relativeOffsetInMinutes"));

  }
  -[_INPBCreateAlarmIntent time](self, "time");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("time"));

  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDataString)label
{
  return self->_label;
}

- (int)relativeOffsetInMinutes
{
  return self->_relativeOffsetInMinutes;
}

- (_INPBDateTimeRange)time
{
  return self->_time;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
