@implementation _INPBFindEventsIntent

- (void)setDateTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_dateTimeRange, a3);
}

- (BOOL)hasDateTimeRange
{
  return self->_dateTimeRange != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
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

- (void)setRequestedEventAttribute:(int)a3
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
    self->_requestedEventAttribute = a3;
  }
}

- (BOOL)hasRequestedEventAttribute
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRequestedEventAttribute:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)requestedEventAttributeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E228B6D0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestedEventAttribute:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVENT_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARTICIPANTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DATETIME")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSearchQuery:(id)a3
{
  NSString *v4;
  NSString *searchQuery;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  searchQuery = self->_searchQuery;
  self->_searchQuery = v4;

}

- (BOOL)hasSearchQuery
{
  return self->_searchQuery != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFindEventsIntentReadFrom(self, (uint64_t)a3);
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
  -[_INPBFindEventsIntent dateTimeRange](self, "dateTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBFindEventsIntent dateTimeRange](self, "dateTimeRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFindEventsIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBFindEventsIntent intentMetadata](self, "intentMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFindEventsIntent location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBFindEventsIntent location](self, "location");
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

  if (-[_INPBFindEventsIntent hasRequestedEventAttribute](self, "hasRequestedEventAttribute", v17))
    PBDataWriterWriteInt32Field();
  -[_INPBFindEventsIntent searchQuery](self, "searchQuery");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    PBDataWriterWriteStringField();

}

- (_INPBFindEventsIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBFindEventsIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBFindEventsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBFindEventsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBFindEventsIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBFindEventsIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBFindEventsIntent *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = -[_INPBFindEventsIntent init](+[_INPBFindEventsIntent allocWithZone:](_INPBFindEventsIntent, "allocWithZone:"), "init");
  v6 = -[_INPBDateTimeRangeValue copyWithZone:](self->_dateTimeRange, "copyWithZone:", a3);
  -[_INPBFindEventsIntent setDateTimeRange:](v5, "setDateTimeRange:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBFindEventsIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = -[_INPBLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  -[_INPBFindEventsIntent setLocation:](v5, "setLocation:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_participants, "copyWithZone:", a3);
  -[_INPBFindEventsIntent setParticipants:](v5, "setParticipants:", v9);

  if (-[_INPBFindEventsIntent hasRequestedEventAttribute](self, "hasRequestedEventAttribute"))
    -[_INPBFindEventsIntent setRequestedEventAttribute:](v5, "setRequestedEventAttribute:", -[_INPBFindEventsIntent requestedEventAttribute](self, "requestedEventAttribute"));
  v10 = (void *)-[NSString copyWithZone:](self->_searchQuery, "copyWithZone:", a3);
  -[_INPBFindEventsIntent setSearchQuery:](v5, "setSearchQuery:", v10);

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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int requestedEventAttribute;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  BOOL v34;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[_INPBFindEventsIntent dateTimeRange](self, "dateTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateTimeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBFindEventsIntent dateTimeRange](self, "dateTimeRange");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBFindEventsIntent dateTimeRange](self, "dateTimeRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateTimeRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBFindEventsIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBFindEventsIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBFindEventsIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBFindEventsIntent location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBFindEventsIntent location](self, "location");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBFindEventsIntent location](self, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBFindEventsIntent participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBFindEventsIntent participants](self, "participants");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBFindEventsIntent participants](self, "participants");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "participants");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_31;
  }
  else
  {

  }
  v27 = -[_INPBFindEventsIntent hasRequestedEventAttribute](self, "hasRequestedEventAttribute");
  if (v27 != objc_msgSend(v4, "hasRequestedEventAttribute"))
    goto LABEL_31;
  if (-[_INPBFindEventsIntent hasRequestedEventAttribute](self, "hasRequestedEventAttribute"))
  {
    if (objc_msgSend(v4, "hasRequestedEventAttribute"))
    {
      requestedEventAttribute = self->_requestedEventAttribute;
      if (requestedEventAttribute != objc_msgSend(v4, "requestedEventAttribute"))
        goto LABEL_31;
    }
  }
  -[_INPBFindEventsIntent searchQuery](self, "searchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBFindEventsIntent searchQuery](self, "searchQuery");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {

LABEL_34:
      v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    -[_INPBFindEventsIntent searchQuery](self, "searchQuery");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchQuery");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if ((v33 & 1) != 0)
      goto LABEL_34;
  }
  else
  {
LABEL_30:

  }
LABEL_31:
  v34 = 0;
LABEL_32:

  return v34;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[_INPBDateTimeRangeValue hash](self->_dateTimeRange, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v5 = -[_INPBLocation hash](self->_location, "hash");
  v6 = -[NSArray hash](self->_participants, "hash");
  if (-[_INPBFindEventsIntent hasRequestedEventAttribute](self, "hasRequestedEventAttribute"))
    v7 = 2654435761 * self->_requestedEventAttribute;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_searchQuery, "hash");
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
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBFindEventsIntent dateTimeRange](self, "dateTimeRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dateTimeRange"));

  -[_INPBFindEventsIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  -[_INPBFindEventsIntent location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("location"));

  if (-[NSArray count](self->_participants, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = self->_participants;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("participants"));
  }
  if (-[_INPBFindEventsIntent hasRequestedEventAttribute](self, "hasRequestedEventAttribute"))
  {
    v17 = -[_INPBFindEventsIntent requestedEventAttribute](self, "requestedEventAttribute");
    if ((v17 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E228B6D0[(v17 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("requestedEventAttribute"));

  }
  if (self->_searchQuery)
  {
    -[_INPBFindEventsIntent searchQuery](self, "searchQuery");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("searchQuery"));

  }
  return v3;
}

- (_INPBDateTimeRangeValue)dateTimeRange
{
  return self->_dateTimeRange;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBLocation)location
{
  return self->_location;
}

- (NSArray)participants
{
  return self->_participants;
}

- (int)requestedEventAttribute
{
  return self->_requestedEventAttribute;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_dateTimeRange, 0);
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
