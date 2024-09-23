@implementation VCCCMessage

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCCCMessage setTopic:](self, "setTopic:", 0);
  -[VCCCMessage setPayload:](self, "setPayload:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCCCMessage;
  -[VCCCMessage dealloc](&v3, sel_dealloc);
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCCCMessage;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCCCMessage description](&v3, sel_description), -[VCCCMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *topic;
  NSData *payload;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_transactionID), CFSTR("transactionID"));
  topic = self->_topic;
  if (topic)
    objc_msgSend(v3, "setObject:forKey:", topic, CFSTR("topic"));
  payload = self->_payload;
  if (payload)
    objc_msgSend(v3, "setObject:forKey:", payload, CFSTR("payload"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCCMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteStringField();
  if (self->_payload)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = self->_transactionID;
  objc_msgSend(a3, "setTopic:", self->_topic);
  if (self->_payload)
    objc_msgSend(a3, "setPayload:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = self->_transactionID;

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_topic, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = -[NSData copyWithZone:](self->_payload, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *topic;
  NSData *payload;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if (self->_transactionID == *((_QWORD *)a3 + 1))
    {
      topic = self->_topic;
      if (!((unint64_t)topic | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](topic, "isEqual:")) != 0)
      {
        payload = self->_payload;
        if ((unint64_t)payload | *((_QWORD *)a3 + 2))
          LOBYTE(v5) = -[NSData isEqual:](payload, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = 2654435761u * self->_transactionID;
  v4 = -[NSString hash](self->_topic, "hash");
  return v4 ^ -[NSData hash](self->_payload, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  self->_transactionID = *((_QWORD *)a3 + 1);
  if (*((_QWORD *)a3 + 3))
    -[VCCCMessage setTopic:](self, "setTopic:");
  if (*((_QWORD *)a3 + 2))
    -[VCCCMessage setPayload:](self, "setPayload:");
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unint64_t)a3
{
  self->_transactionID = a3;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
