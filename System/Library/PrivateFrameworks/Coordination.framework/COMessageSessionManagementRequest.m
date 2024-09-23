@implementation COMessageSessionManagementRequest

- (COMessageSessionManagementRequest)initWithCommandType:(int64_t)a3 payload:(id)a4 payloadType:(id)a5 topic:(id)a6 subTopic:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  COMessageSessionManagementRequest *v17;
  COMessageSessionManagementRequest *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)COMessageSessionManagementRequest;
  v17 = -[COMessageChannelRequest init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_commandType = a3;
    objc_storeStrong((id *)&v17->_payload, a4);
    objc_storeStrong((id *)&v18->_payloadType, a5);
    objc_storeStrong((id *)&v18->_topic, a6);
    objc_storeStrong((id *)&v18->_subTopic, a7);
  }

  return v18;
}

- (COMessageSessionManagementRequest)initWithCommandType:(int64_t)a3 error:(id)a4 topic:(id)a5 subTopic:(id)a6
{
  id v11;
  id v12;
  id v13;
  COMessageSessionManagementRequest *v14;
  COMessageSessionManagementRequest *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)COMessageSessionManagementRequest;
  v14 = -[COMessageChannelRequest init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_commandType = a3;
    objc_storeStrong((id *)&v14->_remoteError, a4);
    objc_storeStrong((id *)&v15->_topic, a5);
    objc_storeStrong((id *)&v15->_subTopic, a6);
  }

  return v15;
}

- (COMessageSessionManagementRequest)initWithCoder:(id)a3
{
  id v4;
  COMessageSessionManagementRequest *v5;
  uint64_t v6;
  NSData *payload;
  uint64_t v8;
  NSString *payloadType;
  uint64_t v10;
  NSString *topic;
  uint64_t v12;
  NSString *subTopic;
  uint64_t v14;
  NSError *remoteError;
  COMessageSessionManagementRequest *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)COMessageSessionManagementRequest;
  v5 = -[COMessageChannelRequest initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_9;
  v5->_commandType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestCommandType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v6 = objc_claimAutoreleasedReturnValue();
  payload = v5->_payload;
  v5->_payload = (NSData *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadType"));
  v8 = objc_claimAutoreleasedReturnValue();
  payloadType = v5->_payloadType;
  v5->_payloadType = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topic"));
  v10 = objc_claimAutoreleasedReturnValue();
  topic = v5->_topic;
  v5->_topic = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subTopic"));
  v12 = objc_claimAutoreleasedReturnValue();
  subTopic = v5->_subTopic;
  v5->_subTopic = (NSString *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteError"));
  v14 = objc_claimAutoreleasedReturnValue();
  remoteError = v5->_remoteError;
  v5->_remoteError = (NSError *)v14;

  if (v5->_payload)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
  }
  if (v5->_payloadType && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v5->_remoteError && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_10:
    v16 = 0;
  }
  else
  {
LABEL_9:
    v16 = v5;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)COMessageSessionManagementRequest;
  v4 = a3;
  -[COMessageChannelRequest encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[COMessageSessionManagementRequest commandType](self, "commandType", v10.receiver, v10.super_class), CFSTR("requestCommandType"));
  -[COMessageSessionManagementRequest payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("payload"));

  -[COMessageSessionManagementRequest payloadType](self, "payloadType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("payloadType"));

  -[COMessageSessionManagementRequest topic](self, "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("topic"));

  -[COMessageSessionManagementRequest subTopic](self, "subTopic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("subTopic"));

  -[COMessageSessionManagementRequest remoteError](self, "remoteError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("remoteError"));

}

+ (id)acceptableResponses
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)commandType
{
  return self->_commandType;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (NSError)remoteError
{
  return self->_remoteError;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)subTopic
{
  return self->_subTopic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTopic, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_remoteError, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
