@implementation INTicketedEvent

- (INTicketedEvent)initWithCategory:(INTicketedEventCategory)category name:(NSString *)name eventDuration:(INDateComponentsRange *)eventDuration location:(CLPlacemark *)location
{
  NSString *v10;
  INDateComponentsRange *v11;
  CLPlacemark *v12;
  INTicketedEvent *v13;
  INTicketedEvent *v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  INDateComponentsRange *v18;
  uint64_t v19;
  CLPlacemark *v20;
  objc_super v22;

  v10 = name;
  v11 = eventDuration;
  v12 = location;
  v22.receiver = self;
  v22.super_class = (Class)INTicketedEvent;
  v13 = -[INTicketedEvent init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_category = category;
    v15 = -[NSString copy](v10, "copy");
    v16 = v14->_name;
    v14->_name = (NSString *)v15;

    v17 = -[INDateComponentsRange copy](v11, "copy");
    v18 = v14->_eventDuration;
    v14->_eventDuration = (INDateComponentsRange *)v17;

    v19 = -[CLPlacemark copy](v12, "copy");
    v20 = v14->_location;
    v14->_location = (CLPlacemark *)v19;

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_category);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_name, "hash");
  v6 = v5 ^ -[INDateComponentsRange hash](self->_eventDuration, "hash");
  v7 = v6 ^ -[CLPlacemark hash](self->_location, "hash") ^ v4;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  INTicketedEvent *v4;
  INTicketedEvent *v5;
  NSString *name;
  INDateComponentsRange *eventDuration;
  CLPlacemark *location;
  BOOL v9;

  v4 = (INTicketedEvent *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9 = 0;
      if (self->_category == v5->_category)
      {
        name = self->_name;
        if (name == v5->_name || -[NSString isEqual:](name, "isEqual:"))
        {
          eventDuration = self->_eventDuration;
          if (eventDuration == v5->_eventDuration || -[INDateComponentsRange isEqual:](eventDuration, "isEqual:"))
          {
            location = self->_location;
            if (location == v5->_location || -[CLPlacemark isEqual:](location, "isEqual:"))
              v9 = 1;
          }
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INTicketedEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INTicketedEvent *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[INTicketedEvent initWithCategory:name:eventDuration:location:](self, "initWithCategory:name:eventDuration:location:", v5, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t category;
  id v5;

  category = self->_category;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventDuration, CFSTR("eventDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_category == 1)
    v8 = CFSTR("movie");
  else
    v8 = CFSTR("unknown");
  v9 = v8;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("category"));

  objc_msgSend(v6, "encodeObject:", self->_name);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("name"));

  objc_msgSend(v6, "encodeObject:", self->_eventDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("eventDuration"));

  objc_msgSend(v6, "encodeObject:", self->_location);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("location"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INTicketedEvent descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INTicketedEvent;
  -[INTicketedEvent description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTicketedEvent _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSString *name;
  void *v5;
  INDateComponentsRange *eventDuration;
  void *v7;
  CLPlacemark *location;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_category);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("name");
  name = self->_name;
  v5 = name;
  if (!name)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v5;
  v12[2] = CFSTR("eventDuration");
  eventDuration = self->_eventDuration;
  v7 = eventDuration;
  if (!eventDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v7;
  v12[3] = CFSTR("location");
  location = self->_location;
  v9 = location;
  if (!location)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (location)
  {
    if (eventDuration)
      goto LABEL_9;
LABEL_12:

    if (name)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!eventDuration)
    goto LABEL_12;
LABEL_9:
  if (!name)
    goto LABEL_13;
LABEL_10:

  return v10;
}

- (INTicketedEventCategory)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
}

- (INDateComponentsRange)eventDuration
{
  return self->_eventDuration;
}

- (CLPlacemark)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_eventDuration, 0);
  objc_storeStrong((id *)&self->_name, 0);
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("category"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("movie"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("eventDuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("location"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCategory:name:eventDuration:location:", v10, v11, v14, v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
