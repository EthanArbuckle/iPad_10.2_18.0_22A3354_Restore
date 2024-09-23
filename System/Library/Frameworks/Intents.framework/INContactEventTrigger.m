@implementation INContactEventTrigger

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INContactEventTrigger triggerContact](self, "triggerContact");
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
  -[INContactEventTrigger triggerContact](self, "triggerContact");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

}

- (INContactEventTrigger)initWithTriggerContact:(id)a3
{
  id v4;
  INContactEventTrigger *v5;
  uint64_t v6;
  INPerson *triggerContact;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INContactEventTrigger;
  v5 = -[INContactEventTrigger init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    triggerContact = v5->_triggerContact;
    v5->_triggerContact = (INPerson *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[INPerson hash](self->_triggerContact, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INContactEventTrigger *v4;
  INContactEventTrigger *v5;
  INPerson *triggerContact;
  BOOL v7;

  v4 = (INContactEventTrigger *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      triggerContact = self->_triggerContact;
      v7 = triggerContact == v5->_triggerContact || -[INPerson isEqual:](triggerContact, "isEqual:");

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INContactEventTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  INContactEventTrigger *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerContact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[INContactEventTrigger initWithTriggerContact:](self, "initWithTriggerContact:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_triggerContact, CFSTR("triggerContact"));
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_triggerContact);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("triggerContact"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INContactEventTrigger descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INContactEventTrigger;
  -[INContactEventTrigger description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INContactEventTrigger _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INPerson *triggerContact;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("triggerContact");
  triggerContact = self->_triggerContact;
  v3 = triggerContact;
  if (!triggerContact)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!triggerContact)

  return v4;
}

- (INPerson)triggerContact
{
  return self->_triggerContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerContact, 0);
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

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerContact"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTriggerContact:", v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
