@implementation CMEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMEvent)initWithCoder:(id)a3
{
  id v4;
  CMEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMEvent;
  v5 = -[CMEvent init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    -[CMEvent setEventType:](v5, "setEventType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ev")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("pd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMEvent setPeerDisplayName:](v5, "setPeerDisplayName:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMEvent setUuid:](v5, "setUuid:", v8);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CMEvent setTimestamp:](v5, "setTimestamp:");
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  objc_msgSend(v7, "encodeInteger:forKey:", -[CMEvent eventType](self, "eventType"), CFSTR("ev"));
  -[CMEvent peerDisplayName](self, "peerDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pd"));

  -[CMEvent uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("uuid"));

  -[CMEvent timestamp](self, "timestamp");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("t"));
  objc_autoreleasePoolPop(v4);

}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSString)peerDisplayName
{
  return self->_peerDisplayName;
}

- (void)setPeerDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_peerDisplayName, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_peerDisplayName, 0);
}

@end
