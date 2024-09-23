@implementation _INPBAirportGate

- (void)setAirport:(id)a3
{
  objc_storeStrong((id *)&self->_airport, a3);
}

- (BOOL)hasAirport
{
  return self->_airport != 0;
}

- (void)setGate:(id)a3
{
  NSString *v4;
  NSString *gate;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  gate = self->_gate;
  self->_gate = v4;

}

- (BOOL)hasGate
{
  return self->_gate != 0;
}

- (void)setTerminal:(id)a3
{
  NSString *v4;
  NSString *terminal;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  terminal = self->_terminal;
  self->_terminal = v4;

}

- (BOOL)hasTerminal
{
  return self->_terminal != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAirportGateReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_INPBAirportGate airport](self, "airport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBAirportGate airport](self, "airport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBAirportGate gate](self, "gate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBAirportGate terminal](self, "terminal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }

}

- (_INPBAirportGate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAirportGate *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAirportGate *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAirportGate *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAirportGate initWithData:](self, "initWithData:", v6);

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
  -[_INPBAirportGate data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAirportGate *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = -[_INPBAirportGate init](+[_INPBAirportGate allocWithZone:](_INPBAirportGate, "allocWithZone:"), "init");
  v6 = -[_INPBAirport copyWithZone:](self->_airport, "copyWithZone:", a3);
  -[_INPBAirportGate setAirport:](v5, "setAirport:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_gate, "copyWithZone:", a3);
  -[_INPBAirportGate setGate:](v5, "setGate:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_terminal, "copyWithZone:", a3);
  -[_INPBAirportGate setTerminal:](v5, "setTerminal:", v8);

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBAirportGate airport](self, "airport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "airport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBAirportGate airport](self, "airport");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAirportGate airport](self, "airport");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "airport");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBAirportGate gate](self, "gate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBAirportGate gate](self, "gate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBAirportGate gate](self, "gate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBAirportGate terminal](self, "terminal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "terminal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBAirportGate terminal](self, "terminal");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBAirportGate terminal](self, "terminal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "terminal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[_INPBAirport hash](self->_airport, "hash");
  v4 = -[NSString hash](self->_gate, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_terminal, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBAirportGate airport](self, "airport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("airport"));

  if (self->_gate)
  {
    -[_INPBAirportGate gate](self, "gate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("gate"));

  }
  if (self->_terminal)
  {
    -[_INPBAirportGate terminal](self, "terminal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("terminal"));

  }
  return v3;
}

- (_INPBAirport)airport
{
  return self->_airport;
}

- (NSString)gate
{
  return self->_gate;
}

- (NSString)terminal
{
  return self->_terminal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_gate, 0);
  objc_storeStrong((id *)&self->_airport, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
