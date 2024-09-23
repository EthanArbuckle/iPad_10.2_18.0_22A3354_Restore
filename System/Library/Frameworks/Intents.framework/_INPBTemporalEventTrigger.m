@implementation _INPBTemporalEventTrigger

- (void)setDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_dateTime, a3);
}

- (BOOL)hasDateTime
{
  return self->_dateTime != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTemporalEventTriggerReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBTemporalEventTrigger dateTime](self, "dateTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBTemporalEventTrigger dateTime](self, "dateTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBTemporalEventTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBTemporalEventTrigger *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTemporalEventTrigger *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBTemporalEventTrigger *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBTemporalEventTrigger initWithData:](self, "initWithData:", v6);

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
  -[_INPBTemporalEventTrigger data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBTemporalEventTrigger *v5;
  id v6;

  v5 = -[_INPBTemporalEventTrigger init](+[_INPBTemporalEventTrigger allocWithZone:](_INPBTemporalEventTrigger, "allocWithZone:"), "init");
  v6 = -[_INPBDateTimeRangeValue copyWithZone:](self->_dateTime, "copyWithZone:", a3);
  -[_INPBTemporalEventTrigger setDateTime:](v5, "setDateTime:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_INPBTemporalEventTrigger dateTime](self, "dateTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_INPBTemporalEventTrigger dateTime](self, "dateTime");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_INPBTemporalEventTrigger dateTime](self, "dateTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[_INPBDateTimeRangeValue hash](self->_dateTime, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBTemporalEventTrigger dateTime](self, "dateTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dateTime"));

  return v3;
}

- (_INPBDateTimeRangeValue)dateTime
{
  return self->_dateTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateTime, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
