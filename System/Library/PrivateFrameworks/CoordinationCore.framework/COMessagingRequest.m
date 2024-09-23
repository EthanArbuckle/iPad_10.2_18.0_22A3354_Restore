@implementation COMessagingRequest

- (COMessagingRequest)initWithCoder:(id)a3
{
  id v4;
  COMessagingRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSData *payload;
  uint64_t v10;
  NSString *payloadType;
  uint64_t v12;
  NSString *topic;
  COMessagingRequest *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)COMessagingRequest;
  v5 = -[COMeshCommand initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_requestID = objc_msgSend(v6, "unsignedIntValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_requestType = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v8 = objc_claimAutoreleasedReturnValue();
  payload = v5->_payload;
  v5->_payload = (NSData *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadType"));
  v10 = objc_claimAutoreleasedReturnValue();
  payloadType = v5->_payloadType;
  v5->_payloadType = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topic"));
  v12 = objc_claimAutoreleasedReturnValue();
  topic = v5->_topic;
  v5->_topic = (NSString *)v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
LABEL_5:
    v14 = v5;
  else
LABEL_6:
    v14 = 0;

  return v14;
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
  v10.super_class = (Class)COMessagingRequest;
  v4 = a3;
  -[COMeshCommand encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[COMessagingRequest requestID](self, "requestID", v10.receiver, v10.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[COMessagingRequest requestType](self, "requestType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("requestType"));

  -[COMessagingRequest payload](self, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("payload"));

  -[COMessagingRequest payloadType](self, "payloadType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("payloadType"));

  -[COMessagingRequest topic](self, "topic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("topic"));

}

+ (id)acceptableResponses
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COMessagingRequest)initWithRequestID:(unsigned int)a3 requestType:(int64_t)a4 payload:(id)a5 payloadType:(id)a6 topic:(id)a7
{
  id v13;
  id v14;
  id v15;
  COMessagingRequest *v16;
  COMessagingRequest *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)COMessagingRequest;
  v16 = -[COMeshCommand init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_requestID = a3;
    v16->_requestType = a4;
    objc_storeStrong((id *)&v16->_payload, a5);
    objc_storeStrong((id *)&v17->_payloadType, a6);
    objc_storeStrong((id *)&v17->_topic, a7);
  }

  return v17;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, id = %u>"), v5, self, -[COMessagingRequest requestID](self, "requestID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)requestID
{
  return self->_requestID;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (NSString)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
