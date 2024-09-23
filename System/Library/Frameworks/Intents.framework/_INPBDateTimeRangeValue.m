@implementation _INPBDateTimeRangeValue

- (void)setAllDay:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_allDay = a3;
}

- (BOOL)hasAllDay
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAllDay:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setEndCalendar:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endCalendar = a3;
}

- (BOOL)hasEndCalendar
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEndCalendar:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setEndDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_endDateTime, a3);
}

- (BOOL)hasEndDateTime
{
  return self->_endDateTime != 0;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setRecurrence:(id)a3
{
  objc_storeStrong((id *)&self->_recurrence, a3);
}

- (BOOL)hasRecurrence
{
  return self->_recurrence != 0;
}

- (void)setStartCalendar:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startCalendar = a3;
}

- (BOOL)hasStartCalendar
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasStartCalendar:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setStartDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_startDateTime, a3);
}

- (BOOL)hasStartDateTime
{
  return self->_startDateTime != 0;
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDateTimeRangeValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (-[_INPBDateTimeRangeValue hasAllDay](self, "hasAllDay"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBDateTimeRangeValue hasEndCalendar](self, "hasEndCalendar"))
    PBDataWriterWriteInt64Field();
  -[_INPBDateTimeRangeValue endDateTime](self, "endDateTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBDateTimeRangeValue endDateTime](self, "endDateTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDateTimeRangeValue name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBDateTimeRangeValue recurrence](self, "recurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBDateTimeRangeValue recurrence](self, "recurrence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBDateTimeRangeValue hasStartCalendar](self, "hasStartCalendar"))
    PBDataWriterWriteInt64Field();
  -[_INPBDateTimeRangeValue startDateTime](self, "startDateTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBDateTimeRangeValue startDateTime](self, "startDateTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDateTimeRangeValue valueMetadata](self, "valueMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[_INPBDateTimeRangeValue valueMetadata](self, "valueMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v12 = v14;
  }

}

- (_INPBDateTimeRangeValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDateTimeRangeValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDateTimeRangeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDateTimeRangeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDateTimeRangeValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBDateTimeRangeValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDateTimeRangeValue *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v5 = -[_INPBDateTimeRangeValue init](+[_INPBDateTimeRangeValue allocWithZone:](_INPBDateTimeRangeValue, "allocWithZone:"), "init");
  if (-[_INPBDateTimeRangeValue hasAllDay](self, "hasAllDay"))
    -[_INPBDateTimeRangeValue setAllDay:](v5, "setAllDay:", -[_INPBDateTimeRangeValue allDay](self, "allDay"));
  if (-[_INPBDateTimeRangeValue hasEndCalendar](self, "hasEndCalendar"))
    -[_INPBDateTimeRangeValue setEndCalendar:](v5, "setEndCalendar:", -[_INPBDateTimeRangeValue endCalendar](self, "endCalendar"));
  v6 = -[_INPBDateTime copyWithZone:](self->_endDateTime, "copyWithZone:", a3);
  -[_INPBDateTimeRangeValue setEndDateTime:](v5, "setEndDateTime:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  -[_INPBDateTimeRangeValue setName:](v5, "setName:", v7);

  v8 = -[_INPBRecurrenceValue copyWithZone:](self->_recurrence, "copyWithZone:", a3);
  -[_INPBDateTimeRangeValue setRecurrence:](v5, "setRecurrence:", v8);

  if (-[_INPBDateTimeRangeValue hasStartCalendar](self, "hasStartCalendar"))
    -[_INPBDateTimeRangeValue setStartCalendar:](v5, "setStartCalendar:", -[_INPBDateTimeRangeValue startCalendar](self, "startCalendar"));
  v9 = -[_INPBDateTime copyWithZone:](self->_startDateTime, "copyWithZone:", a3);
  -[_INPBDateTimeRangeValue setStartDateTime:](v5, "setStartDateTime:", v9);

  v10 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBDateTimeRangeValue setValueMetadata:](v5, "setValueMetadata:", v10);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int allDay;
  int v7;
  int64_t endCalendar;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
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
  int v26;
  int64_t startCalendar;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  BOOL v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  v5 = -[_INPBDateTimeRangeValue hasAllDay](self, "hasAllDay");
  if (v5 != objc_msgSend(v4, "hasAllDay"))
    goto LABEL_39;
  if (-[_INPBDateTimeRangeValue hasAllDay](self, "hasAllDay"))
  {
    if (objc_msgSend(v4, "hasAllDay"))
    {
      allDay = self->_allDay;
      if (allDay != objc_msgSend(v4, "allDay"))
        goto LABEL_39;
    }
  }
  v7 = -[_INPBDateTimeRangeValue hasEndCalendar](self, "hasEndCalendar");
  if (v7 != objc_msgSend(v4, "hasEndCalendar"))
    goto LABEL_39;
  if (-[_INPBDateTimeRangeValue hasEndCalendar](self, "hasEndCalendar"))
  {
    if (objc_msgSend(v4, "hasEndCalendar"))
    {
      endCalendar = self->_endCalendar;
      if (endCalendar != objc_msgSend(v4, "endCalendar"))
        goto LABEL_39;
    }
  }
  -[_INPBDateTimeRangeValue endDateTime](self, "endDateTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDateTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_38;
  -[_INPBDateTimeRangeValue endDateTime](self, "endDateTime");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[_INPBDateTimeRangeValue endDateTime](self, "endDateTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDateTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (!v15)
      goto LABEL_39;
  }
  else
  {

  }
  -[_INPBDateTimeRangeValue name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_38;
  -[_INPBDateTimeRangeValue name](self, "name");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_INPBDateTimeRangeValue name](self, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_39;
  }
  else
  {

  }
  -[_INPBDateTimeRangeValue recurrence](self, "recurrence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_38;
  -[_INPBDateTimeRangeValue recurrence](self, "recurrence");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBDateTimeRangeValue recurrence](self, "recurrence");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recurrence");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_39;
  }
  else
  {

  }
  v26 = -[_INPBDateTimeRangeValue hasStartCalendar](self, "hasStartCalendar");
  if (v26 != objc_msgSend(v4, "hasStartCalendar"))
    goto LABEL_39;
  if (-[_INPBDateTimeRangeValue hasStartCalendar](self, "hasStartCalendar"))
  {
    if (objc_msgSend(v4, "hasStartCalendar"))
    {
      startCalendar = self->_startCalendar;
      if (startCalendar != objc_msgSend(v4, "startCalendar"))
        goto LABEL_39;
    }
  }
  -[_INPBDateTimeRangeValue startDateTime](self, "startDateTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDateTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_38;
  -[_INPBDateTimeRangeValue startDateTime](self, "startDateTime");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_INPBDateTimeRangeValue startDateTime](self, "startDateTime");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDateTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_39;
  }
  else
  {

  }
  -[_INPBDateTimeRangeValue valueMetadata](self, "valueMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) != (v10 != 0))
  {
    -[_INPBDateTimeRangeValue valueMetadata](self, "valueMetadata");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_42:
      v38 = 1;
      goto LABEL_40;
    }
    v34 = (void *)v33;
    -[_INPBDateTimeRangeValue valueMetadata](self, "valueMetadata");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) != 0)
      goto LABEL_42;
  }
  else
  {
LABEL_38:

  }
LABEL_39:
  v38 = 0;
LABEL_40:

  return v38;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if (-[_INPBDateTimeRangeValue hasAllDay](self, "hasAllDay"))
    v3 = 2654435761 * self->_allDay;
  else
    v3 = 0;
  if (-[_INPBDateTimeRangeValue hasEndCalendar](self, "hasEndCalendar"))
    v4 = 2654435761 * self->_endCalendar;
  else
    v4 = 0;
  v5 = -[_INPBDateTime hash](self->_endDateTime, "hash");
  v6 = -[NSString hash](self->_name, "hash");
  v7 = -[_INPBRecurrenceValue hash](self->_recurrence, "hash");
  if (-[_INPBDateTimeRangeValue hasStartCalendar](self, "hasStartCalendar"))
    v8 = 2654435761 * self->_startCalendar;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  v10 = v8 ^ -[_INPBDateTime hash](self->_startDateTime, "hash");
  return v9 ^ v10 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBDateTimeRangeValue hasAllDay](self, "hasAllDay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBDateTimeRangeValue allDay](self, "allDay"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("allDay"));

  }
  if (-[_INPBDateTimeRangeValue hasEndCalendar](self, "hasEndCalendar"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBDateTimeRangeValue endCalendar](self, "endCalendar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("endCalendar"));

  }
  -[_INPBDateTimeRangeValue endDateTime](self, "endDateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("endDateTime"));

  if (self->_name)
  {
    -[_INPBDateTimeRangeValue name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("name"));

  }
  -[_INPBDateTimeRangeValue recurrence](self, "recurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("recurrence"));

  if (-[_INPBDateTimeRangeValue hasStartCalendar](self, "hasStartCalendar"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBDateTimeRangeValue startCalendar](self, "startCalendar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("startCalendar"));

  }
  -[_INPBDateTimeRangeValue startDateTime](self, "startDateTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("startDateTime"));

  -[_INPBDateTimeRangeValue valueMetadata](self, "valueMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("valueMetadata"));

  return v3;
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (int64_t)endCalendar
{
  return self->_endCalendar;
}

- (_INPBDateTime)endDateTime
{
  return self->_endDateTime;
}

- (NSString)name
{
  return self->_name;
}

- (_INPBRecurrenceValue)recurrence
{
  return self->_recurrence;
}

- (int64_t)startCalendar
{
  return self->_startCalendar;
}

- (_INPBDateTime)startDateTime
{
  return self->_startDateTime;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_startDateTime, 0);
  objc_storeStrong((id *)&self->_recurrence, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_endDateTime, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
