@implementation INCalendarEvent

- (INCalendarEvent)initWithEventIdentifier:(id)a3 title:(id)a4 dateTimeRange:(id)a5 participants:(id)a6 location:(id)a7 isContactBirthday:(id)a8 calendarPunchoutURI:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  INCalendarEvent *v22;
  uint64_t v23;
  NSString *eventIdentifier;
  uint64_t v25;
  NSString *title;
  uint64_t v27;
  INDateComponentsRange *dateTimeRange;
  uint64_t v29;
  NSArray *participants;
  uint64_t v31;
  CLPlacemark *location;
  uint64_t v33;
  NSNumber *isContactBirthday;
  uint64_t v35;
  NSString *calendarPunchoutURI;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)INCalendarEvent;
  v22 = -[INCalendarEvent init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    eventIdentifier = v22->_eventIdentifier;
    v22->_eventIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    title = v22->_title;
    v22->_title = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    dateTimeRange = v22->_dateTimeRange;
    v22->_dateTimeRange = (INDateComponentsRange *)v27;

    v29 = objc_msgSend(v18, "copy");
    participants = v22->_participants;
    v22->_participants = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    location = v22->_location;
    v22->_location = (CLPlacemark *)v31;

    v33 = objc_msgSend(v20, "copy");
    isContactBirthday = v22->_isContactBirthday;
    v22->_isContactBirthday = (NSNumber *)v33;

    v35 = objc_msgSend(v21, "copy");
    calendarPunchoutURI = v22->_calendarPunchoutURI;
    v22->_calendarPunchoutURI = (NSString *)v35;

  }
  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_eventIdentifier, "hash");
  v4 = -[NSString hash](self->_title, "hash") ^ v3;
  v5 = -[INDateComponentsRange hash](self->_dateTimeRange, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_participants, "hash");
  v7 = -[CLPlacemark hash](self->_location, "hash");
  v8 = v7 ^ -[NSNumber hash](self->_isContactBirthday, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_calendarPunchoutURI, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INCalendarEvent *v4;
  INCalendarEvent *v5;
  NSString *eventIdentifier;
  NSString *title;
  INDateComponentsRange *dateTimeRange;
  NSArray *participants;
  CLPlacemark *location;
  NSNumber *isContactBirthday;
  NSString *calendarPunchoutURI;
  BOOL v13;

  v4 = (INCalendarEvent *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      eventIdentifier = self->_eventIdentifier;
      v13 = 0;
      if (eventIdentifier == v5->_eventIdentifier || -[NSString isEqual:](eventIdentifier, "isEqual:"))
      {
        title = self->_title;
        if (title == v5->_title || -[NSString isEqual:](title, "isEqual:"))
        {
          dateTimeRange = self->_dateTimeRange;
          if (dateTimeRange == v5->_dateTimeRange || -[INDateComponentsRange isEqual:](dateTimeRange, "isEqual:"))
          {
            participants = self->_participants;
            if (participants == v5->_participants || -[NSArray isEqual:](participants, "isEqual:"))
            {
              location = self->_location;
              if (location == v5->_location || -[CLPlacemark isEqual:](location, "isEqual:"))
              {
                isContactBirthday = self->_isContactBirthday;
                if (isContactBirthday == v5->_isContactBirthday
                  || -[NSNumber isEqual:](isContactBirthday, "isEqual:"))
                {
                  calendarPunchoutURI = self->_calendarPunchoutURI;
                  if (calendarPunchoutURI == v5->_calendarPunchoutURI
                    || -[NSString isEqual:](calendarPunchoutURI, "isEqual:"))
                  {
                    v13 = 1;
                  }
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (INCalendarEvent)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  INCalendarEvent *v23;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("eventIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateTimeRange"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("participants"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isContactBirthday"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("calendarPunchoutURI"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[INCalendarEvent initWithEventIdentifier:title:dateTimeRange:participants:location:isContactBirthday:calendarPunchoutURI:](self, "initWithEventIdentifier:title:dateTimeRange:participants:location:isContactBirthday:calendarPunchoutURI:", v7, v11, v12, v16, v17, v18, v22);
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *eventIdentifier;
  id v5;

  eventIdentifier = self->_eventIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventIdentifier, CFSTR("eventIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateTimeRange, CFSTR("dateTimeRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_participants, CFSTR("participants"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isContactBirthday, CFSTR("isContactBirthday"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_calendarPunchoutURI, CFSTR("calendarPunchoutURI"));

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
  objc_msgSend(v6, "encodeObject:", self->_eventIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("eventIdentifier"));

  objc_msgSend(v6, "encodeObject:", self->_title);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("title"));

  objc_msgSend(v6, "encodeObject:", self->_dateTimeRange);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("dateTimeRange"));

  objc_msgSend(v6, "encodeObject:", self->_participants);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("participants"));

  objc_msgSend(v6, "encodeObject:", self->_location);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("location"));

  objc_msgSend(v6, "encodeObject:", self->_isContactBirthday);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("isContactBirthday"));

  objc_msgSend(v6, "encodeObject:", self->_calendarPunchoutURI);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("calendarPunchoutURI"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INCalendarEvent descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INCalendarEvent;
  -[INCalendarEvent description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCalendarEvent _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t eventIdentifier;
  NSString *title;
  uint64_t v5;
  INDateComponentsRange *dateTimeRange;
  uint64_t v7;
  NSArray *participants;
  uint64_t v9;
  CLPlacemark *location;
  void *v11;
  NSNumber *isContactBirthday;
  void *v13;
  NSString *calendarPunchoutURI;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[7];
  _QWORD v24[9];

  v24[7] = *MEMORY[0x1E0C80C00];
  eventIdentifier = (uint64_t)self->_eventIdentifier;
  v22 = eventIdentifier;
  v23[0] = CFSTR("eventIdentifier");
  if (!eventIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    eventIdentifier = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)eventIdentifier;
  v24[0] = eventIdentifier;
  v23[1] = CFSTR("title");
  title = self->_title;
  v5 = (uint64_t)title;
  if (!title)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v5;
  v24[1] = v5;
  v23[2] = CFSTR("dateTimeRange");
  dateTimeRange = self->_dateTimeRange;
  v7 = (uint64_t)dateTimeRange;
  if (!dateTimeRange)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v7;
  v24[2] = v7;
  v23[3] = CFSTR("participants");
  participants = self->_participants;
  v9 = (uint64_t)participants;
  if (!participants)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v9;
  v24[3] = v9;
  v23[4] = CFSTR("location");
  location = self->_location;
  v11 = location;
  if (!location)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v11;
  v23[5] = CFSTR("isContactBirthday");
  isContactBirthday = self->_isContactBirthday;
  v13 = isContactBirthday;
  if (!isContactBirthday)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v13;
  v23[6] = CFSTR("calendarPunchoutURI");
  calendarPunchoutURI = self->_calendarPunchoutURI;
  v15 = calendarPunchoutURI;
  if (!calendarPunchoutURI)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (calendarPunchoutURI)
  {
    if (isContactBirthday)
      goto LABEL_17;
  }
  else
  {

    if (isContactBirthday)
    {
LABEL_17:
      if (location)
        goto LABEL_18;
      goto LABEL_26;
    }
  }

  if (location)
  {
LABEL_18:
    if (participants)
      goto LABEL_19;
    goto LABEL_27;
  }
LABEL_26:

  if (participants)
  {
LABEL_19:
    if (dateTimeRange)
      goto LABEL_20;
LABEL_28:

    if (title)
      goto LABEL_21;
    goto LABEL_29;
  }
LABEL_27:

  if (!dateTimeRange)
    goto LABEL_28;
LABEL_20:
  if (title)
    goto LABEL_21;
LABEL_29:

LABEL_21:
  if (!v22)

  return v16;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (INDateComponentsRange)dateTimeRange
{
  return self->_dateTimeRange;
}

- (NSArray)participants
{
  return self->_participants;
}

- (CLPlacemark)location
{
  return self->_location;
}

- (NSNumber)isContactBirthday
{
  return self->_isContactBirthday;
}

- (NSString)calendarPunchoutURI
{
  return self->_calendarPunchoutURI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarPunchoutURI, 0);
  objc_storeStrong((id *)&self->_isContactBirthday, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_dateTimeRange, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("eventIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dateTimeRange"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("participants"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("location"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isContactBirthday"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("calendarPunchoutURI"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventIdentifier:title:dateTimeRange:participants:location:isContactBirthday:calendarPunchoutURI:", v9, v10, v13, v16, v19, v20, v21);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INCalendarEvent participants](self, "participants", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = v3;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[INCalendarEvent participants](self, "participants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

@end
