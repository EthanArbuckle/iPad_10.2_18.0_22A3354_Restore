@implementation INEvent

- (INEvent)initWithEventType:(id)a3 eventDescriptors:(id)a4
{
  id v6;
  id v7;
  INEvent *v8;
  uint64_t v9;
  NSString *eventType;
  uint64_t v11;
  NSArray *eventDescriptors;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INEvent;
  v8 = -[INEvent init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    eventType = v8->_eventType;
    v8->_eventType = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    eventDescriptors = v8->_eventDescriptors;
    v8->_eventDescriptors = (NSArray *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_eventType, "hash");
  return -[NSArray hash](self->_eventDescriptors, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INEvent *v4;
  INEvent *v5;
  NSString *eventType;
  NSArray *eventDescriptors;
  BOOL v8;

  v4 = (INEvent *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      eventType = self->_eventType;
      v8 = 0;
      if (eventType == v5->_eventType || -[NSString isEqual:](eventType, "isEqual:"))
      {
        eventDescriptors = self->_eventDescriptors;
        if (eventDescriptors == v5->_eventDescriptors
          || -[NSArray isEqual:](eventDescriptors, "isEqual:"))
        {
          v8 = 1;
        }
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  INEvent *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("eventDescriptors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[INEvent initWithEventType:eventDescriptors:](self, "initWithEventType:eventDescriptors:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *eventType;
  id v5;

  eventType = self->_eventType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventType, CFSTR("eventType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventDescriptors, CFSTR("eventDescriptors"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_eventType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("eventType"));

  objc_msgSend(v6, "encodeObject:", self->_eventDescriptors);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("eventDescriptors"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INEvent descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INEvent;
  -[INEvent description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INEvent _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *eventType;
  void *v4;
  NSArray *eventDescriptors;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("eventType");
  eventType = self->_eventType;
  v4 = eventType;
  if (!eventType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("eventDescriptors");
  v10[0] = v4;
  eventDescriptors = self->_eventDescriptors;
  v6 = eventDescriptors;
  if (!eventDescriptors)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!eventDescriptors)
  {

    if (eventType)
      return v7;
LABEL_9:

    return v7;
  }
  if (!eventType)
    goto LABEL_9;
  return v7;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSArray)eventDescriptors
{
  return self->_eventDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescriptors, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
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

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("eventType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("eventDescriptors"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventType:eventDescriptors:", v11, v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
