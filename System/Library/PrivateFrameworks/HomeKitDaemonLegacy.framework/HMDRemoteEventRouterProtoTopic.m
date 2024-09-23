@implementation HMDRemoteEventRouterProtoTopic

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

- (BOOL)hasEventUUID
{
  return self->_eventUUID != 0;
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
  v8.super_class = (Class)HMDRemoteEventRouterProtoTopic;
  -[HMDRemoteEventRouterProtoTopic description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoTopic dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *eventUUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  topic = self->_topic;
  if (topic)
    objc_msgSend(v3, "setObject:forKey:", topic, CFSTR("topic"));
  eventUUID = self->_eventUUID;
  if (eventUUID)
    objc_msgSend(v4, "setObject:forKey:", eventUUID, CFSTR("eventUUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMDRemoteEventRouterProtoTopicReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_eventUUID)
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
  if (self->_topic)
  {
    objc_msgSend(v4, "setTopic:");
    v4 = v5;
  }
  if (self->_eventUUID)
  {
    objc_msgSend(v5, "setEventUUID:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_topic, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_eventUUID, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *topic;
  NSString *eventUUID;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((topic = self->_topic, !((unint64_t)topic | v4[2]))
     || -[NSString isEqual:](topic, "isEqual:")))
  {
    eventUUID = self->_eventUUID;
    if ((unint64_t)eventUUID | v4[1])
      v7 = -[NSString isEqual:](eventUUID, "isEqual:");
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
  return -[NSString hash](self->_eventUUID, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[HMDRemoteEventRouterProtoTopic setTopic:](self, "setTopic:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[HMDRemoteEventRouterProtoTopic setEventUUID:](self, "setEventUUID:");
    v4 = v5;
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

- (NSString)eventUUID
{
  return self->_eventUUID;
}

- (void)setEventUUID:(id)a3
{
  objc_storeStrong((id *)&self->_eventUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_eventUUID, 0);
}

@end
