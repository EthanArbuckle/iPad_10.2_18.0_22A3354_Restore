@implementation _INPBTicketedEvent

- (void)setCategory:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_category = a3;
  }
}

- (BOOL)hasCategory
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCategory:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)categoryAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("UNKNOWN");
  if (a3 == 2)
  {
    v3 = CFSTR("MOVIE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("MOVIE")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setEventDuration:(id)a3
{
  objc_storeStrong((id *)&self->_eventDuration, a3);
}

- (BOOL)hasEventDuration
{
  return self->_eventDuration != 0;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)hasLocation
{
  return self->_location != 0;
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

- (BOOL)readFrom:(id)a3
{
  return _INPBTicketedEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[_INPBTicketedEvent hasCategory](self, "hasCategory"))
    PBDataWriterWriteInt32Field();
  -[_INPBTicketedEvent eventDuration](self, "eventDuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBTicketedEvent eventDuration](self, "eventDuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTicketedEvent location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBTicketedEvent location](self, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTicketedEvent name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }

}

- (_INPBTicketedEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBTicketedEvent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTicketedEvent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBTicketedEvent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBTicketedEvent initWithData:](self, "initWithData:", v6);

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
  -[_INPBTicketedEvent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBTicketedEvent *v5;
  id v6;
  id v7;
  void *v8;

  v5 = -[_INPBTicketedEvent init](+[_INPBTicketedEvent allocWithZone:](_INPBTicketedEvent, "allocWithZone:"), "init");
  if (-[_INPBTicketedEvent hasCategory](self, "hasCategory"))
    -[_INPBTicketedEvent setCategory:](v5, "setCategory:", -[_INPBTicketedEvent category](self, "category"));
  v6 = -[_INPBDateTimeRange copyWithZone:](self->_eventDuration, "copyWithZone:", a3);
  -[_INPBTicketedEvent setEventDuration:](v5, "setEventDuration:", v6);

  v7 = -[_INPBLocationValue copyWithZone:](self->_location, "copyWithZone:", a3);
  -[_INPBTicketedEvent setLocation:](v5, "setLocation:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  -[_INPBTicketedEvent setName:](v5, "setName:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int category;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  v5 = -[_INPBTicketedEvent hasCategory](self, "hasCategory");
  if (v5 != objc_msgSend(v4, "hasCategory"))
    goto LABEL_21;
  if (-[_INPBTicketedEvent hasCategory](self, "hasCategory"))
  {
    if (objc_msgSend(v4, "hasCategory"))
    {
      category = self->_category;
      if (category != objc_msgSend(v4, "category"))
        goto LABEL_21;
    }
  }
  -[_INPBTicketedEvent eventDuration](self, "eventDuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBTicketedEvent eventDuration](self, "eventDuration");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBTicketedEvent eventDuration](self, "eventDuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventDuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBTicketedEvent location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBTicketedEvent location](self, "location");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBTicketedEvent location](self, "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBTicketedEvent name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBTicketedEvent name](self, "name");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBTicketedEvent name](self, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (-[_INPBTicketedEvent hasCategory](self, "hasCategory"))
    v3 = 2654435761 * self->_category;
  else
    v3 = 0;
  v4 = -[_INPBDateTimeRange hash](self->_eventDuration, "hash") ^ v3;
  v5 = -[_INPBLocationValue hash](self->_location, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_name, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBTicketedEvent hasCategory](self, "hasCategory"))
  {
    v4 = -[_INPBTicketedEvent category](self, "category");
    if ((_DWORD)v4 == 1)
    {
      v5 = CFSTR("UNKNOWN");
    }
    else if ((_DWORD)v4 == 2)
    {
      v5 = CFSTR("MOVIE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("category"));

  }
  -[_INPBTicketedEvent eventDuration](self, "eventDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("eventDuration"));

  -[_INPBTicketedEvent location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("location"));

  if (self->_name)
  {
    -[_INPBTicketedEvent name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("name"));

  }
  return v3;
}

- (int)category
{
  return self->_category;
}

- (_INPBDateTimeRange)eventDuration
{
  return self->_eventDuration;
}

- (_INPBLocationValue)location
{
  return self->_location;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_eventDuration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
