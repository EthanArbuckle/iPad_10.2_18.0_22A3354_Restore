@implementation INAirportGate

- (INAirportGate)initWithAirport:(INAirport *)airport terminal:(NSString *)terminal gate:(NSString *)gate
{
  INAirport *v8;
  NSString *v9;
  NSString *v10;
  INAirportGate *v11;
  uint64_t v12;
  INAirport *v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  objc_super v19;

  v8 = airport;
  v9 = terminal;
  v10 = gate;
  v19.receiver = self;
  v19.super_class = (Class)INAirportGate;
  v11 = -[INAirportGate init](&v19, sel_init);
  if (v11)
  {
    v12 = -[INAirport copy](v8, "copy");
    v13 = v11->_airport;
    v11->_airport = (INAirport *)v12;

    v14 = -[NSString copy](v9, "copy");
    v15 = v11->_terminal;
    v11->_terminal = (NSString *)v14;

    v16 = -[NSString copy](v10, "copy");
    v17 = v11->_gate;
    v11->_gate = (NSString *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[INAirport hash](self->_airport, "hash");
  v4 = -[NSString hash](self->_terminal, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_gate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INAirportGate *v4;
  INAirportGate *v5;
  INAirport *airport;
  NSString *terminal;
  NSString *gate;
  BOOL v9;

  v4 = (INAirportGate *)a3;
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
      airport = self->_airport;
      v9 = 0;
      if (airport == v5->_airport || -[INAirport isEqual:](airport, "isEqual:"))
      {
        terminal = self->_terminal;
        if (terminal == v5->_terminal || -[NSString isEqual:](terminal, "isEqual:"))
        {
          gate = self->_gate;
          if (gate == v5->_gate || -[NSString isEqual:](gate, "isEqual:"))
            v9 = 1;
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

- (INAirportGate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  INAirportGate *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("airport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("terminal"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("gate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INAirportGate initWithAirport:terminal:gate:](self, "initWithAirport:terminal:gate:", v5, v9, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  INAirport *airport;
  id v5;

  airport = self->_airport;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", airport, CFSTR("airport"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_terminal, CFSTR("terminal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gate, CFSTR("gate"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_airport);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("airport"));

  objc_msgSend(v6, "encodeObject:", self->_terminal);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("terminal"));

  objc_msgSend(v6, "encodeObject:", self->_gate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("gate"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INAirportGate descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INAirportGate;
  -[INAirportGate description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAirportGate _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INAirport *airport;
  void *v4;
  NSString *terminal;
  void *v6;
  NSString *gate;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("airport");
  airport = self->_airport;
  v4 = airport;
  if (!airport)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("terminal");
  terminal = self->_terminal;
  v6 = terminal;
  if (!terminal)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("gate");
  gate = self->_gate;
  v8 = gate;
  if (!gate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (gate)
  {
    if (terminal)
      goto LABEL_9;
LABEL_12:

    if (airport)
      return v9;
LABEL_13:

    return v9;
  }

  if (!terminal)
    goto LABEL_12;
LABEL_9:
  if (!airport)
    goto LABEL_13;
  return v9;
}

- (INAirport)airport
{
  return self->_airport;
}

- (NSString)terminal
{
  return self->_terminal;
}

- (NSString)gate
{
  return self->_gate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gate, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_airport, 0);
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
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("airport"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("terminal"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("gate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAirport:terminal:gate:", v11, v12, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
