@implementation SECSFARule

- (BOOL)hasEventType
{
  return self->_eventType != 0;
}

- (BOOL)hasMatch
{
  return self->_match != 0;
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (void)setRepeatAfterSeconds:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_repeatAfterSeconds = a3;
}

- (void)setHasRepeatAfterSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRepeatAfterSeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasProcess
{
  return self->_process != 0;
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
  v8.super_class = (Class)SECSFARule;
  -[SECSFARule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SECSFARule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *eventType;
  NSData *match;
  SECSFAAction *action;
  void *v8;
  void *v9;
  NSString *process;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  eventType = self->_eventType;
  if (eventType)
    objc_msgSend(v3, "setObject:forKey:", eventType, CFSTR("eventType"));
  match = self->_match;
  if (match)
    objc_msgSend(v4, "setObject:forKey:", match, CFSTR("match"));
  action = self->_action;
  if (action)
  {
    -[SECSFAAction dictionaryRepresentation](action, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("action"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_repeatAfterSeconds);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("repeatAfterSeconds"));

  }
  process = self->_process;
  if (process)
    objc_msgSend(v4, "setObject:forKey:", process, CFSTR("process"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SECSFARuleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_eventType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_match)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_action)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_process)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_eventType)
  {
    objc_msgSend(v4, "setEventType:");
    v4 = v5;
  }
  if (self->_match)
  {
    objc_msgSend(v5, "setMatch:");
    v4 = v5;
  }
  if (self->_action)
  {
    objc_msgSend(v5, "setAction:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_repeatAfterSeconds;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_process)
  {
    objc_msgSend(v5, "setProcess:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_eventType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSData copyWithZone:](self->_match, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[SECSFAAction copyWithZone:](self->_action, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_repeatAfterSeconds;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_process, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *eventType;
  NSData *match;
  SECSFAAction *action;
  NSString *process;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  eventType = self->_eventType;
  if ((unint64_t)eventType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](eventType, "isEqual:"))
      goto LABEL_15;
  }
  match = self->_match;
  if ((unint64_t)match | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](match, "isEqual:"))
      goto LABEL_15;
  }
  action = self->_action;
  if ((unint64_t)action | *((_QWORD *)v4 + 2))
  {
    if (!-[SECSFAAction isEqual:](action, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_repeatAfterSeconds != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  process = self->_process;
  if ((unint64_t)process | *((_QWORD *)v4 + 5))
    v9 = -[NSString isEqual:](process, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_eventType, "hash");
  v4 = -[NSData hash](self->_match, "hash");
  v5 = -[SECSFAAction hash](self->_action, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_repeatAfterSeconds;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_process, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SECSFAAction *action;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[SECSFARule setEventType:](self, "setEventType:");
    v4 = v7;
  }
  if (v4[4])
  {
    -[SECSFARule setMatch:](self, "setMatch:");
    v4 = v7;
  }
  action = self->_action;
  v6 = v4[2];
  if (action)
  {
    if (!v6)
      goto LABEL_11;
    -[SECSFAAction mergeFrom:](action, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[SECSFARule setAction:](self, "setAction:");
  }
  v4 = v7;
LABEL_11:
  if ((v4[6] & 1) != 0)
  {
    self->_repeatAfterSeconds = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[5])
  {
    -[SECSFARule setProcess:](self, "setProcess:");
    v4 = v7;
  }

}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
  objc_storeStrong((id *)&self->_eventType, a3);
}

- (NSData)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (SECSFAAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (int64_t)repeatAfterSeconds
{
  return self->_repeatAfterSeconds;
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_storeStrong((id *)&self->_process, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
