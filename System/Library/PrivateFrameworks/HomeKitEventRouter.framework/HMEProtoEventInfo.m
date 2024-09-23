@implementation HMEProtoEventInfo

- (BOOL)hasTopic
{
  return self->_topic != 0;
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
  v8.super_class = (Class)HMEProtoEventInfo;
  -[HMEProtoEventInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEProtoEventInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *topic;
  HMEProtoEvent *event;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  topic = self->_topic;
  if (topic)
    objc_msgSend(v3, "setObject:forKey:", topic, CFSTR("topic"));
  event = self->_event;
  if (event)
  {
    -[HMEProtoEvent dictionaryRepresentation](event, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("event"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMEProtoEventInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_topic)
  {
    PBDataWriterWriteStringField();
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
  if (self->_topic)
  {
    objc_msgSend(v4, "setTopic:");
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
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_topic, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[HMEProtoEvent copyWithZone:](self->_event, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *topic;
  HMEProtoEvent *event;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((topic = self->_topic, !((unint64_t)topic | v4[2]))
     || -[NSString isEqual:](topic, "isEqual:")))
  {
    event = self->_event;
    if ((unint64_t)event | v4[1])
      v7 = -[HMEProtoEvent isEqual:](event, "isEqual:");
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

  v3 = -[NSString hash](self->_topic, "hash");
  return -[HMEProtoEvent hash](self->_event, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HMEProtoEvent *event;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HMEProtoEventInfo setTopic:](self, "setTopic:");
    v4 = v7;
  }
  event = self->_event;
  v6 = v4[1];
  if (event)
  {
    if (v6)
    {
      -[HMEProtoEvent mergeFrom:](event, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HMEProtoEventInfo setEvent:](self, "setEvent:");
    goto LABEL_8;
  }

}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (HMEProtoEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
