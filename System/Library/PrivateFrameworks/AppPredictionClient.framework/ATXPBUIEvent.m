@implementation ATXPBUIEvent

- (uint64_t)event
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)consumerSubType
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void)setEvent:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setConsumerSubType:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_event)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUIEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (BOOL)hasConsumerSubType
{
  if (result)
    return *(_QWORD *)(result + 8) != 0;
  return result;
}

- (BOOL)hasEvent
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
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
  v8.super_class = (Class)ATXPBUIEvent;
  -[ATXPBUIEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUIEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *consumerSubType;
  NSData *event;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v3, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  event = self->_event;
  if (event)
    objc_msgSend(v4, "setObject:forKey:", event, CFSTR("event"));
  return v4;
}

- (void)copyTo:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v6 = v3;
    if (v4)
    {
      -[ATXPBUIEvent setConsumerSubType:]((uint64_t)v3, v4);
      v3 = v6;
    }
    v5 = *(void **)(a1 + 16);
    if (v5)
    {
      -[ATXPBUIEvent setEvent:]((uint64_t)v6, v5);
      v3 = v6;
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_event, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *consumerSubType;
  NSData *event;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((consumerSubType = self->_consumerSubType, !((unint64_t)consumerSubType | v4[1]))
     || -[NSString isEqual:](consumerSubType, "isEqual:")))
  {
    event = self->_event;
    if ((unint64_t)event | v4[2])
      v7 = -[NSData isEqual:](event, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_consumerSubType, "hash");
  return -[NSData hash](self->_event, "hash") ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)v3[1];
    v6 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 8), v4);
      v3 = v6;
    }
    v5 = (void *)v3[2];
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 16), v5);
      v3 = v6;
    }
  }

}

@end
