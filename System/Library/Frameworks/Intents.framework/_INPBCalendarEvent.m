@implementation _INPBCalendarEvent

- (void)setCalendarPunchoutURI:(id)a3
{
  NSString *v4;
  NSString *calendarPunchoutURI;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  calendarPunchoutURI = self->_calendarPunchoutURI;
  self->_calendarPunchoutURI = v4;

}

- (BOOL)hasCalendarPunchoutURI
{
  return self->_calendarPunchoutURI != 0;
}

- (void)setDateTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_dateTimeRange, a3);
}

- (BOOL)hasDateTimeRange
{
  return self->_dateTimeRange != 0;
}

- (void)setEventIdentifier:(id)a3
{
  NSString *v4;
  NSString *eventIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  eventIdentifier = self->_eventIdentifier;
  self->_eventIdentifier = v4;

}

- (BOOL)hasEventIdentifier
{
  return self->_eventIdentifier != 0;
}

- (void)setIsContactBirthday:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isContactBirthday = a3;
}

- (BOOL)hasIsContactBirthday
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsContactBirthday:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setParticipants:(id)a3
{
  NSArray *v4;
  NSArray *participants;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  participants = self->_participants;
  self->_participants = v4;

}

- (void)clearParticipants
{
  -[NSArray removeAllObjects](self->_participants, "removeAllObjects");
}

- (void)addParticipants:(id)a3
{
  id v4;
  NSArray *participants;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  participants = self->_participants;
  v8 = v4;
  if (!participants)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_participants;
    self->_participants = v6;

    v4 = v8;
    participants = self->_participants;
  }
  -[NSArray addObject:](participants, "addObject:", v4);

}

- (unint64_t)participantsCount
{
  return -[NSArray count](self->_participants, "count");
}

- (id)participantsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_participants, "objectAtIndexedSubscript:", a3);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCalendarEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBCalendarEvent calendarPunchoutURI](self, "calendarPunchoutURI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBCalendarEvent dateTimeRange](self, "dateTimeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBCalendarEvent dateTimeRange](self, "dateTimeRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCalendarEvent eventIdentifier](self, "eventIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  if (-[_INPBCalendarEvent hasIsContactBirthday](self, "hasIsContactBirthday"))
    PBDataWriterWriteBOOLField();
  -[_INPBCalendarEvent location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBCalendarEvent location](self, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_participants;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  -[_INPBCalendarEvent title](self, "title", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    PBDataWriterWriteStringField();

}

- (_INPBCalendarEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCalendarEvent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCalendarEvent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCalendarEvent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCalendarEvent initWithData:](self, "initWithData:", v6);

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
  -[_INPBCalendarEvent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCalendarEvent *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = -[_INPBCalendarEvent init](+[_INPBCalendarEvent allocWithZone:](_INPBCalendarEvent, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_calendarPunchoutURI, "copyWithZone:", a3);
  -[_INPBCalendarEvent setCalendarPunchoutURI:](v5, "setCalendarPunchoutURI:", v6);

  v7 = -[_INPBDateTimeRangeValue copyWithZone:](self->_dateTimeRange, "copyWithZone:", a3);
  -[_INPBCalendarEvent setDateTimeRange:](v5, "setDateTimeRange:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_eventIdentifier, "copyWithZone:", a3);
  -[_INPBCalendarEvent setEventIdentifier:](v5, "setEventIdentifier:", v8);

  if (-[_INPBCalendarEvent hasIsContactBirthday](self, "hasIsContactBirthday"))
    -[_INPBCalendarEvent setIsContactBirthday:](v5, "setIsContactBirthday:", -[_INPBCalendarEvent isContactBirthday](self, "isContactBirthday"));
  v9 = -[_INPBLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  -[_INPBCalendarEvent setLocation:](v5, "setLocation:", v9);

  v10 = (void *)-[NSArray copyWithZone:](self->_participants, "copyWithZone:", a3);
  -[_INPBCalendarEvent setParticipants:](v5, "setParticipants:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  -[_INPBCalendarEvent setTitle:](v5, "setTitle:", v11);

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int isContactBirthday;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  BOOL v39;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[_INPBCalendarEvent calendarPunchoutURI](self, "calendarPunchoutURI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarPunchoutURI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[_INPBCalendarEvent calendarPunchoutURI](self, "calendarPunchoutURI");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCalendarEvent calendarPunchoutURI](self, "calendarPunchoutURI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calendarPunchoutURI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_36;
  }
  else
  {

  }
  -[_INPBCalendarEvent dateTimeRange](self, "dateTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateTimeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[_INPBCalendarEvent dateTimeRange](self, "dateTimeRange");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBCalendarEvent dateTimeRange](self, "dateTimeRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateTimeRange");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_36;
  }
  else
  {

  }
  -[_INPBCalendarEvent eventIdentifier](self, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[_INPBCalendarEvent eventIdentifier](self, "eventIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBCalendarEvent eventIdentifier](self, "eventIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_36;
  }
  else
  {

  }
  v22 = -[_INPBCalendarEvent hasIsContactBirthday](self, "hasIsContactBirthday");
  if (v22 != objc_msgSend(v4, "hasIsContactBirthday"))
    goto LABEL_36;
  if (-[_INPBCalendarEvent hasIsContactBirthday](self, "hasIsContactBirthday"))
  {
    if (objc_msgSend(v4, "hasIsContactBirthday"))
    {
      isContactBirthday = self->_isContactBirthday;
      if (isContactBirthday != objc_msgSend(v4, "isContactBirthday"))
        goto LABEL_36;
    }
  }
  -[_INPBCalendarEvent location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[_INPBCalendarEvent location](self, "location");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBCalendarEvent location](self, "location");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_36;
  }
  else
  {

  }
  -[_INPBCalendarEvent participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[_INPBCalendarEvent participants](self, "participants");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBCalendarEvent participants](self, "participants");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "participants");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_36;
  }
  else
  {

  }
  -[_INPBCalendarEvent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCalendarEvent title](self, "title");
    v34 = objc_claimAutoreleasedReturnValue();
    if (!v34)
    {

LABEL_39:
      v39 = 1;
      goto LABEL_37;
    }
    v35 = (void *)v34;
    -[_INPBCalendarEvent title](self, "title");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if ((v38 & 1) != 0)
      goto LABEL_39;
  }
  else
  {
LABEL_35:

  }
LABEL_36:
  v39 = 0;
LABEL_37:

  return v39;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_calendarPunchoutURI, "hash");
  v4 = -[_INPBDateTimeRangeValue hash](self->_dateTimeRange, "hash");
  v5 = -[NSString hash](self->_eventIdentifier, "hash");
  if (-[_INPBCalendarEvent hasIsContactBirthday](self, "hasIsContactBirthday"))
    v6 = 2654435761 * self->_isContactBirthday;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[_INPBLocation hash](self->_location, "hash");
  v9 = v8 ^ -[NSArray hash](self->_participants, "hash");
  return v7 ^ v9 ^ -[NSString hash](self->_title, "hash");
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
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_calendarPunchoutURI)
  {
    -[_INPBCalendarEvent calendarPunchoutURI](self, "calendarPunchoutURI");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("calendarPunchoutURI"));

  }
  -[_INPBCalendarEvent dateTimeRange](self, "dateTimeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dateTimeRange"));

  if (self->_eventIdentifier)
  {
    -[_INPBCalendarEvent eventIdentifier](self, "eventIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eventIdentifier"));

  }
  if (-[_INPBCalendarEvent hasIsContactBirthday](self, "hasIsContactBirthday"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBCalendarEvent isContactBirthday](self, "isContactBirthday"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isContactBirthday"));

  }
  -[_INPBCalendarEvent location](self, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("location"));

  if (-[NSArray count](self->_participants, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = self->_participants;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "dictionaryRepresentation", (_QWORD)v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("participants"));
  }
  if (self->_title)
  {
    -[_INPBCalendarEvent title](self, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("title"));

  }
  return v3;
}

- (NSString)calendarPunchoutURI
{
  return self->_calendarPunchoutURI;
}

- (_INPBDateTimeRangeValue)dateTimeRange
{
  return self->_dateTimeRange;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (BOOL)isContactBirthday
{
  return self->_isContactBirthday;
}

- (_INPBLocation)location
{
  return self->_location;
}

- (NSArray)participants
{
  return self->_participants;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_dateTimeRange, 0);
  objc_storeStrong((id *)&self->_calendarPunchoutURI, 0);
}

+ (Class)participantsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
