@implementation BMPBSiriIntentEvent

- (BOOL)hasIntentId
{
  return self->_intentId != 0;
}

- (BOOL)hasEventType
{
  return self->_eventType != 0;
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
  v8.super_class = (Class)BMPBSiriIntentEvent;
  -[BMPBSiriIntentEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSiriIntentEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *intentId;
  NSString *eventType;
  NSData *eventData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  intentId = self->_intentId;
  if (intentId)
    objc_msgSend(v3, "setObject:forKey:", intentId, CFSTR("intentId"));
  eventType = self->_eventType;
  if (eventType)
    objc_msgSend(v4, "setObject:forKey:", eventType, CFSTR("eventType"));
  eventData = self->_eventData;
  if (eventData)
    objc_msgSend(v4, "setObject:forKey:", eventData, CFSTR("eventData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriIntentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_intentId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_eventType)
  {
    PBDataWriterWriteStringField();
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
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_intentId)
  {
    objc_msgSend(v4, "setIntentId:");
    v4 = v5;
  }
  if (self->_eventType)
  {
    objc_msgSend(v5, "setEventType:");
    v4 = v5;
  }
  if (self->_eventData)
  {
    objc_msgSend(v5, "setEventData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_intentId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_eventType, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSData copyWithZone:](self->_eventData, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *intentId;
  NSString *eventType;
  NSData *eventData;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((intentId = self->_intentId, !((unint64_t)intentId | v4[3]))
     || -[NSString isEqual:](intentId, "isEqual:"))
    && ((eventType = self->_eventType, !((unint64_t)eventType | v4[2]))
     || -[NSString isEqual:](eventType, "isEqual:")))
  {
    eventData = self->_eventData;
    if ((unint64_t)eventData | v4[1])
      v8 = -[NSData isEqual:](eventData, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_intentId, "hash");
  v4 = -[NSString hash](self->_eventType, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_eventData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[BMPBSiriIntentEvent setIntentId:](self, "setIntentId:");
  if (v4[2])
    -[BMPBSiriIntentEvent setEventType:](self, "setEventType:");
  if (v4[1])
    -[BMPBSiriIntentEvent setEventData:](self, "setEventData:");

}

- (NSString)intentId
{
  return self->_intentId;
}

- (void)setIntentId:(id)a3
{
  objc_storeStrong((id *)&self->_intentId, a3);
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
  objc_storeStrong((id *)&self->_eventType, a3);
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
  objc_storeStrong((id *)&self->_intentId, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
}

@end
