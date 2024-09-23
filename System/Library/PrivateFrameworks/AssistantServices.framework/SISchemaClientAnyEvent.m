@implementation SISchemaClientAnyEvent

- (id)si_dictionaryRepresentation
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (objc_class *)SIReflectionInferClassFromEventType();
    if (v4)
    {
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("eventType"));

    }
    if (self->_eventData)
    {
      -[SISchemaClientAnyEvent eventType](self, "eventType");
      -[SISchemaClientAnyEvent eventData](self, "eventData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SIReflectionHydrateProtoFromEventTypeAndData();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v7, "dictionaryRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("eventData"));

      }
    }
  }
  return v3;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEventData
{
  return self->_eventData != 0;
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
  v8.super_class = (Class)SISchemaClientAnyEvent;
  -[SISchemaClientAnyEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaClientAnyEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *eventData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_eventType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("eventType"));

  }
  eventData = self->_eventData;
  if (eventData)
    objc_msgSend(v3, "setObject:forKey:", eventData, CFSTR("eventData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientAnyEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_eventData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_eventType;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  if (self->_eventData)
  {
    v5 = v4;
    objc_msgSend(v4, "setEventData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_eventData, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *eventData;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_eventType != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  eventData = self->_eventData;
  if ((unint64_t)eventData | *((_QWORD *)v4 + 1))
    v6 = -[NSData isEqual:](eventData, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_eventType;
  else
    v2 = 0;
  return -[NSData hash](self->_eventData, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[5] & 1) != 0)
  {
    self->_eventType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[SISchemaClientAnyEvent setEventData:](self, "setEventData:");
    v4 = v5;
  }

}

- (int)eventType
{
  return self->_eventType;
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
}

@end
