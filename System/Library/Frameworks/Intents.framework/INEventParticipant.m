@implementation INEventParticipant

- (INEventParticipant)initWithPerson:(id)a3 status:(int64_t)a4 isUser:(id)a5 isEventOrganizer:(id)a6
{
  id v10;
  id v11;
  id v12;
  INEventParticipant *v13;
  uint64_t v14;
  INPerson *person;
  uint64_t v16;
  NSNumber *isUser;
  uint64_t v18;
  NSNumber *isEventOrganizer;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)INEventParticipant;
  v13 = -[INEventParticipant init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    person = v13->_person;
    v13->_person = (INPerson *)v14;

    v13->_status = a4;
    v16 = objc_msgSend(v11, "copy");
    isUser = v13->_isUser;
    v13->_isUser = (NSNumber *)v16;

    v18 = objc_msgSend(v12, "copy");
    isEventOrganizer = v13->_isEventOrganizer;
    v13->_isEventOrganizer = (NSNumber *)v18;

  }
  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[INPerson hash](self->_person, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[NSNumber hash](self->_isUser, "hash");
  v7 = v5 ^ v6 ^ -[NSNumber hash](self->_isEventOrganizer, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  INEventParticipant *v4;
  INEventParticipant *v5;
  INPerson *person;
  NSNumber *isUser;
  NSNumber *isEventOrganizer;
  BOOL v9;

  v4 = (INEventParticipant *)a3;
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
      person = self->_person;
      v9 = 0;
      if ((person == v5->_person || -[INPerson isEqual:](person, "isEqual:")) && self->_status == v5->_status)
      {
        isUser = self->_isUser;
        if (isUser == v5->_isUser || -[NSNumber isEqual:](isUser, "isEqual:"))
        {
          isEventOrganizer = self->_isEventOrganizer;
          if (isEventOrganizer == v5->_isEventOrganizer
            || -[NSNumber isEqual:](isEventOrganizer, "isEqual:"))
          {
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

- (INEventParticipant)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  INEventParticipant *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("person"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isEventOrganizer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[INEventParticipant initWithPerson:status:isUser:isEventOrganizer:](self, "initWithPerson:status:isUser:isEventOrganizer:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  INPerson *person;
  id v5;

  person = self->_person;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", person, CFSTR("person"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isUser, CFSTR("isUser"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isEventOrganizer, CFSTR("isEventOrganizer"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_person);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("person"));

  v9 = self->_status - 1;
  if (v9 > 6)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E22932F8[v9];
  v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("status"));

  objc_msgSend(v6, "encodeObject:", self->_isUser);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("isUser"));

  objc_msgSend(v6, "encodeObject:", self->_isEventOrganizer);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("isEventOrganizer"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INEventParticipant descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INEventParticipant;
  -[INEventParticipant description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INEventParticipant _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INPerson *person;
  void *v4;
  void *v5;
  NSNumber *isUser;
  void *v7;
  NSNumber *isEventOrganizer;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("person");
  person = self->_person;
  v4 = person;
  if (!person)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("isUser");
  isUser = self->_isUser;
  v7 = isUser;
  if (!isUser)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v7;
  v12[3] = CFSTR("isEventOrganizer");
  isEventOrganizer = self->_isEventOrganizer;
  v9 = isEventOrganizer;
  if (!isEventOrganizer)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (isEventOrganizer)
  {
    if (isUser)
      goto LABEL_9;
  }
  else
  {

    if (isUser)
      goto LABEL_9;
  }

LABEL_9:
  if (!person)

  return v10;
}

- (INPerson)person
{
  return self->_person;
}

- (int64_t)status
{
  return self->_status;
}

- (NSNumber)isUser
{
  return self->_isUser;
}

- (NSNumber)isEventOrganizer
{
  return self->_isEventOrganizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEventOrganizer, 0);
  objc_storeStrong((id *)&self->_isUser, 0);
  objc_storeStrong((id *)&self->_person, 0);
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("person"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("status"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = INEventParticipantStatusWithString(v12);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isUser"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isEventOrganizer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPerson:status:isUser:isEventOrganizer:", v11, v13, v14, v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INEventParticipant person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_intents_cacheableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  if (objc_msgSend(v3, "count"))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INEventParticipant person](self, "person");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

}

@end
