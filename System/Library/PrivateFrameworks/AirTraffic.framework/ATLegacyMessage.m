@implementation ATLegacyMessage

- (id)parameterForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_params, "objectForKey:", a3);
}

- (id)responseWithResultError:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  ATLegacyMessage *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(ATLegacyMessage);
  -[ATLegacyMessage setMessageId:](v8, "setMessageId:", -[ATLegacyMessage messageId](self, "messageId"));
  -[ATLegacyMessage setMessageType:](v8, "setMessageType:", 1);
  -[ATLegacyMessage name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATLegacyMessage setName:](v8, "setName:", v9);

  -[ATLegacyMessage setResult:](v8, "setResult:", v7);
  -[ATLegacyMessage setParameters:](v8, "setParameters:", v6);

  -[ATLegacyMessage setSessionNumber:](v8, "setSessionNumber:", -[ATLegacyMessage sessionNumber](self, "sessionNumber"));
  return v8;
}

- (id)partialResponseWithParameters:(id)a3
{
  id v4;
  ATLegacyMessage *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(ATLegacyMessage);
  -[ATLegacyMessage setMessageId:](v5, "setMessageId:", -[ATLegacyMessage messageId](self, "messageId"));
  -[ATLegacyMessage setMessageType:](v5, "setMessageType:", 2);
  -[ATLegacyMessage name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATLegacyMessage setName:](v5, "setName:", v6);

  -[ATLegacyMessage setParameters:](v5, "setParameters:", v4);
  -[ATLegacyMessage setSessionNumber:](v5, "setSessionNumber:", -[ATLegacyMessage sessionNumber](self, "sessionNumber"));
  return v5;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *name;
  void *v7;
  NSDictionary *params;
  NSError *v9;
  NSData *payload;
  NSData *sig;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", LODWORD(self->_messageType));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_messageId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Id"));

  if (self->_name)
    name = (const __CFString *)self->_name;
  else
    name = &stru_24C4CBA48;
  objc_msgSend(v3, "setObject:forKey:", name, CFSTR("Command"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_session);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("Session"));

  params = self->_params;
  if (params)
    objc_msgSend(v3, "setObject:forKey:", params, CFSTR("Params"));
  v9 = self->_result;
  if (v9)
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("Result"));
  payload = self->_payload;
  if (payload)
    objc_msgSend(v3, "setObject:forKey:", payload, CFSTR("Payload"));
  sig = self->_sig;
  if (sig)
    objc_msgSend(v3, "setObject:forKey:", sig, CFSTR("Sig"));
  return v3;
}

- (id)data
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1770];
  -[ATLegacyMessage dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATLegacyMessage)initWithDictionary:(id)a3
{
  id v4;
  ATLegacyMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATLegacyMessage;
  v5 = -[ATLegacyMessage init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATLegacyMessage setMessageType:](v5, "setMessageType:", objc_msgSend(v6, "unsignedIntValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("Session"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATLegacyMessage setMessageId:](v5, "setMessageId:", objc_msgSend(v7, "unsignedIntValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("Command"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATLegacyMessage setName:](v5, "setName:", v8);

    objc_msgSend(v4, "objectForKey:", CFSTR("Result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATLegacyMessage setResult:](v5, "setResult:", v9);

    objc_msgSend(v4, "objectForKey:", CFSTR("Params"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATLegacyMessage setParameters:](v5, "setParameters:", v10);

    objc_msgSend(v4, "objectForKey:", CFSTR("Payload"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATLegacyMessage setPayload:](v5, "setPayload:", v11);

    objc_msgSend(v4, "objectForKey:", CFSTR("Session"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_session = objc_msgSend(v12, "unsignedIntValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("Sig"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATLegacyMessage setSig:](v5, "setSig:", v13);

  }
  return v5;
}

- (id)description
{
  void *v3;
  NSString *name;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  name = self->_name;
  +[ATLegacyMessage _messageTypeString:](ATLegacyMessage, "_messageTypeString:", self->_messageType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ %@. id=%u, Session=%u, params=%@]"), name, v5, self->_messageId, self->_session, self->_params);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (unsigned)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(unsigned int)a3
{
  self->_messageId = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setDataClass:(id)a3
{
  objc_storeStrong((id *)&self->_dataClass, a3);
}

- (NSError)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSDictionary)parameters
{
  return self->_params;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_params, a3);
}

- (unsigned)sessionNumber
{
  return self->_session;
}

- (void)setSessionNumber:(unsigned int)a3
{
  self->_session = a3;
}

- (NSData)sig
{
  return self->_sig;
}

- (void)setSig:(id)a3
{
  objc_storeStrong((id *)&self->_sig, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (unsigned)nextSessionNumber
{
  unsigned int v2;
  unsigned int result;

  do
  {
    v2 = __ldxr((unsigned int *)&__sessionNumber);
    result = v2 + 1;
  }
  while (__stxr(v2 + 1, (unsigned int *)&__sessionNumber));
  return result;
}

+ (unsigned)currentSessionNumber
{
  return __sessionNumber;
}

+ (void)setSessionNumber:(unsigned int)a3
{
  __sessionNumber = a3;
}

+ (id)messageWithName:(id)a3 parameters:(id)a4
{
  return +[ATLegacyMessage messageWithName:parameters:session:](ATLegacyMessage, "messageWithName:parameters:session:", a3, a4, __sessionNumber);
}

+ (id)messageWithName:(id)a3 parameters:(id)a4 session:(unsigned int)a5
{
  id v7;
  id v8;
  ATLegacyMessage *v9;
  unsigned int v10;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(ATLegacyMessage);
  v9->_session = a5;
  -[ATLegacyMessage setName:](v9, "setName:", v8);

  -[ATLegacyMessage setParameters:](v9, "setParameters:", v7);
  do
    v10 = __ldxr(&__nextMessageId);
  while (__stxr(v10 + 1, &__nextMessageId));
  -[ATLegacyMessage setMessageId:](v9, "setMessageId:");
  -[ATLegacyMessage setMessageType:](v9, "setMessageType:", 0);
  return v9;
}

+ (id)messageFromHeader:(id)a3 withParams:(id)a4 andPayload:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  +[ATLegacyMessage messageFromDictionary:](ATLegacyMessage, "messageFromDictionary:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setParameters:", v8);

  objc_msgSend(v9, "setPayload:", v7);
  return v9;
}

+ (id)messageFromDictionary:(id)a3
{
  id v3;
  ATLegacyMessage *v4;

  v3 = a3;
  v4 = -[ATLegacyMessage initWithDictionary:]([ATLegacyMessage alloc], "initWithDictionary:", v3);

  return v4;
}

+ (id)messageFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[ATLegacyMessage messageFromDictionary:](ATLegacyMessage, "messageFromDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = os_log_create("com.apple.amp.AirTraffic", "iTunesSync");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v3;
      _os_log_impl(&dword_20BB5D000, v6, OS_LOG_TYPE_ERROR, "Couldn't create message, data %{public}@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)_messageTypeString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("<unknown type!>");
  else
    return off_24C4CA258[a3];
}

@end
