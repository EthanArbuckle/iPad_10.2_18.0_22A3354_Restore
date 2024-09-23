@implementation ATXPBContextHeuristicsEvent

- (BOOL)hasContextName
{
  return self->_contextName != 0;
}

- (void)setIsStart:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isStart = a3;
}

- (void)setHasIsStart:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsStart
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasContextType
{
  return self->_contextType != 0;
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
  v8.super_class = (Class)ATXPBContextHeuristicsEvent;
  -[ATXPBContextHeuristicsEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBContextHeuristicsEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *contextName;
  void *v6;
  NSString *contextType;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  contextName = self->_contextName;
  if (contextName)
    objc_msgSend(v3, "setObject:forKey:", contextName, CFSTR("contextName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStart);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("isStart"));

  }
  contextType = self->_contextType;
  if (contextType)
    objc_msgSend(v4, "setObject:forKey:", contextType, CFSTR("contextType"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBContextHeuristicsEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_contextName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_contextType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_contextName)
  {
    objc_msgSend(v4, "setContextName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_isStart;
    v4[28] |= 1u;
  }
  if (self->_contextType)
  {
    objc_msgSend(v5, "setContextType:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_contextName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_isStart;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_contextType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *contextName;
  char v6;
  NSString *contextType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  contextName = self->_contextName;
  if ((unint64_t)contextName | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](contextName, "isEqual:"))
      goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_isStart)
      {
        if (*((_BYTE *)v4 + 24))
          goto LABEL_14;
      }
      else if (!*((_BYTE *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_8;
LABEL_14:
  contextType = self->_contextType;
  if ((unint64_t)contextType | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](contextType, "isEqual:");
  else
    v6 = 1;
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_contextName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_isStart;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_contextType, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXPBContextHeuristicsEvent setContextName:](self, "setContextName:");
    v4 = v5;
  }
  if (v4[28])
  {
    self->_isStart = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXPBContextHeuristicsEvent setContextType:](self, "setContextType:");
    v4 = v5;
  }

}

- (NSString)contextName
{
  return self->_contextName;
}

- (void)setContextName:(id)a3
{
  objc_storeStrong((id *)&self->_contextName, a3);
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (NSString)contextType
{
  return self->_contextType;
}

- (void)setContextType:(id)a3
{
  objc_storeStrong((id *)&self->_contextType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
}

@end
