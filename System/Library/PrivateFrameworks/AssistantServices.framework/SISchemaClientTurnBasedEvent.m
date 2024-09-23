@implementation SISchemaClientTurnBasedEvent

- (id)si_dictionaryRepresentation
{
  void *v3;
  SISchemaClientTurnContext *turnContext;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SISchemaClientAnyEvent *event;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  turnContext = self->_turnContext;
  if (turnContext)
  {
    -[SISchemaClientTurnContext turnID](turnContext, "turnID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v13[0] = 0;
      v13[1] = 0;
      -[SISchemaClientTurnContext turnID](self->_turnContext, "turnID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getBytes:length:", v13, 16);

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v13);
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("turnID"));

      }
    }
  }
  event = self->_event;
  if (event)
  {
    -[SISchemaClientAnyEvent si_dictionaryRepresentation](event, "si_dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("event"));

  }
  return v3;
}

- (BOOL)hasTurnContext
{
  return self->_turnContext != 0;
}

- (BOOL)hasEvent
{
  return self->_event != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SISchemaClientTurnBasedEvent;
  -[SISchemaClientTurnBasedEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaClientTurnBasedEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SISchemaClientTurnContext *turnContext;
  void *v5;
  SISchemaClientAnyEvent *event;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  turnContext = self->_turnContext;
  if (turnContext)
  {
    -[SISchemaClientTurnContext dictionaryRepresentation](turnContext, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("turnContext"));

  }
  event = self->_event;
  if (event)
  {
    -[SISchemaClientAnyEvent dictionaryRepresentation](event, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("event"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientTurnBasedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_turnContext)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_event)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_turnContext)
  {
    objc_msgSend(v4, "setTurnContext:");
    v4 = v5;
  }
  if (self->_event)
  {
    objc_msgSend(v5, "setEvent:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SISchemaClientTurnContext copyWithZone:](self->_turnContext, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[SISchemaClientAnyEvent copyWithZone:](self->_event, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SISchemaClientTurnContext *turnContext;
  SISchemaClientAnyEvent *event;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((turnContext = self->_turnContext, !((unint64_t)turnContext | v4[2]))
     || -[SISchemaClientTurnContext isEqual:](turnContext, "isEqual:")))
  {
    event = self->_event;
    if ((unint64_t)event | v4[1])
      v7 = -[SISchemaClientAnyEvent isEqual:](event, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SISchemaClientTurnContext hash](self->_turnContext, "hash");
  return -[SISchemaClientAnyEvent hash](self->_event, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SISchemaClientTurnContext *turnContext;
  uint64_t v6;
  SISchemaClientAnyEvent *event;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  turnContext = self->_turnContext;
  v6 = v4[2];
  v9 = v4;
  if (turnContext)
  {
    if (!v6)
      goto LABEL_7;
    -[SISchemaClientTurnContext mergeFrom:](turnContext, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SISchemaClientTurnBasedEvent setTurnContext:](self, "setTurnContext:");
  }
  v4 = v9;
LABEL_7:
  event = self->_event;
  v8 = v4[1];
  if (event)
  {
    if (v8)
    {
      -[SISchemaClientAnyEvent mergeFrom:](event, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SISchemaClientTurnBasedEvent setEvent:](self, "setEvent:");
    goto LABEL_12;
  }

}

- (SISchemaClientTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)setTurnContext:(id)a3
{
  objc_storeStrong((id *)&self->_turnContext, a3);
}

- (SISchemaClientAnyEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
