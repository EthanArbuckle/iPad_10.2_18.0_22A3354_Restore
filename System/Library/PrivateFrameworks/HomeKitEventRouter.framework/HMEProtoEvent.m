@implementation HMEProtoEvent

- (BOOL)hasEventData
{
  return self->_eventData != 0;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
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
  v8.super_class = (Class)HMEProtoEvent;
  -[HMEProtoEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEProtoEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HMEProtoEventMetadata *eventMetadata;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  eventData = self->_eventData;
  if (eventData)
    objc_msgSend(v3, "setObject:forKey:", eventData, CFSTR("eventData"));
  eventMetadata = self->_eventMetadata;
  if (eventMetadata)
  {
    -[HMEProtoEventMetadata dictionaryRepresentation](eventMetadata, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("eventMetadata"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMEProtoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_eventData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_eventMetadata)
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
  if (self->_eventData)
  {
    objc_msgSend(v4, "setEventData:");
    v4 = v5;
  }
  if (self->_eventMetadata)
  {
    objc_msgSend(v5, "setEventMetadata:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_eventData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[HMEProtoEventMetadata copyWithZone:](self->_eventMetadata, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *eventData;
  HMEProtoEventMetadata *eventMetadata;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((eventData = self->_eventData, !((unint64_t)eventData | v4[1]))
     || -[NSData isEqual:](eventData, "isEqual:")))
  {
    eventMetadata = self->_eventMetadata;
    if ((unint64_t)eventMetadata | v4[2])
      v7 = -[HMEProtoEventMetadata isEqual:](eventMetadata, "isEqual:");
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
  uint64_t v3;

  v3 = -[NSData hash](self->_eventData, "hash");
  return -[HMEProtoEventMetadata hash](self->_eventMetadata, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HMEProtoEventMetadata *eventMetadata;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[HMEProtoEvent setEventData:](self, "setEventData:");
    v4 = v7;
  }
  eventMetadata = self->_eventMetadata;
  v6 = v4[2];
  if (eventMetadata)
  {
    if (v6)
    {
      -[HMEProtoEventMetadata mergeFrom:](eventMetadata, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HMEProtoEvent setEventMetadata:](self, "setEventMetadata:");
    goto LABEL_8;
  }

}

- (NSData)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (HMEProtoEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMetadata, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
}

@end
