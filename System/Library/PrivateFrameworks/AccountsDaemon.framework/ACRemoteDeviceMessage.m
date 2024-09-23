@implementation ACRemoteDeviceMessage

+ (id)_whitelistedClasses
{
  if (_whitelistedClasses_onceToken != -1)
    dispatch_once(&_whitelistedClasses_onceToken, &__block_literal_global_5);
  return (id)_whitelistedClasses_whitelistedClasses;
}

void __44__ACRemoteDeviceMessage__whitelistedClasses__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v13 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_whitelistedClasses_whitelistedClasses;
  _whitelistedClasses_whitelistedClasses = v10;

}

- (ACRemoteDeviceMessage)init
{
  ACRemoteDeviceMessage *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACRemoteDeviceMessage;
  v2 = -[ACRemoteDeviceMessage init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

  }
  return v2;
}

- (ACRemoteDeviceMessage)initWithData:(id)a3
{
  id v5;
  ACRemoteDeviceMessage *v6;
  uint64_t v7;
  NSData *data;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSString *identifier;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *payload;
  void *v18;
  void *v19;
  ACRemoteDeviceMessage *v20;
  NSObject *v21;
  void *v23;
  id v24;
  objc_super v25;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACRemoteDeviceMessage.m"), 62, CFSTR("No data was provided to initalize ACRemoteDeviceMessage!"));

  }
  v25.receiver = self;
  v25.super_class = (Class)ACRemoteDeviceMessage;
  v6 = -[ACRemoteDeviceMessage init](&v25, sel_init);
  if (!v6)
    goto LABEL_6;
  v7 = objc_msgSend(v5, "copy");
  data = v6->_data;
  v6->_data = (NSData *)v7;

  v9 = (void *)MEMORY[0x24BDD1620];
  +[ACRemoteDeviceMessage _whitelistedClasses](ACRemoteDeviceMessage, "_whitelistedClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v10, v5, &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;

  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("idn"));
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v13;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("pld"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
    payload = v6->_payload;
    v6->_payload = (NSMutableDictionary *)v16;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("nrp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_needsReply = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("irp"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_isReply = objc_msgSend(v19, "BOOLValue");

LABEL_6:
    v20 = v6;
    goto LABEL_10;
  }
  _ACLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[ACRemoteDeviceMessage initWithData:].cold.1((uint64_t)v12, v21);

  v20 = 0;
LABEL_10:

  return v20;
}

- (void)_setPayloadObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *payload;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  payload = self->_payload;
  if (!payload)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = self->_payload;
    self->_payload = v8;

    payload = self->_payload;
  }
  -[NSMutableDictionary setValue:forKey:](payload, "setValue:forKey:", v10, v6);
  -[ACRemoteDeviceMessage _invalidateCachedData](self, "_invalidateCachedData");

}

- (id)_payloadObjectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_payload, "objectForKeyedSubscript:", a3);
}

- (void)setNeedsReply:(BOOL)a3
{
  if (self->_needsReply != a3)
  {
    self->_needsReply = a3;
    -[ACRemoteDeviceMessage _invalidateCachedData](self, "_invalidateCachedData");
  }
}

- (void)setIsReply:(BOOL)a3
{
  if (self->_isReply != a3)
  {
    self->_isReply = a3;
    -[ACRemoteDeviceMessage _invalidateCachedData](self, "_invalidateCachedData");
  }
}

- (void)_invalidateCachedData
{
  NSData *data;

  data = self->_data;
  self->_data = 0;

}

- (NSData)data
{
  NSData *data;
  id v4;
  void *v5;
  NSMutableDictionary *payload;
  NSString *identifier;
  void *v8;
  void *v9;
  NSData *v10;
  NSData *v11;

  data = self->_data;
  if (!data)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = v4;
    payload = self->_payload;
    if (payload)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", payload, CFSTR("pld"));
    identifier = self->_identifier;
    if (identifier)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", identifier, CFSTR("idn"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_needsReply);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("nrp"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isReply);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("irp"));

    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    v11 = self->_data;
    self->_data = v10;

    data = self->_data;
  }
  return data;
}

- (id)description
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  _BOOL4 v9;
  __CFString *v10;
  void *v11;
  NSString *identifier;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (self->_isReply)
  {
    v3 = -[ACRemoteDeviceMessage success](self, "success");
    v4 = CFSTR("FAIL ");
    if (v3)
      v4 = CFSTR("SUCCESS");
    v5 = v4;
    -[ACRemoteDeviceMessage error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[ACRemoteDeviceMessage error](self, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = &stru_24C7E3E98;
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v5, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDD17C8];
    -[ACRemoteDeviceMessage sentMessageIdentifier](self, "sentMessageIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("{Reply to %@: %@}"), v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[ACRemoteDeviceMessage needsReply](self, "needsReply");
    v10 = &stru_24C7E3E98;
    if (v9)
      v10 = CFSTR("(RSVP!) ");
    v11 = (void *)MEMORY[0x24BDD17C8];
    identifier = self->_identifier;
    v13 = v10;
    -[ACRemoteDeviceMessage command](self, "command");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[ACRemoteDeviceMessage account](self, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("{%@Internal ID: %@. Command: %@. Account ID: %@.}"), v13, identifier, v8, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)needsReply
{
  return self->_needsReply;
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

+ (id)actionMessageWithCommand:(id)a3 account:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  ACRemoteDeviceMessage *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACRemoteDeviceMessage.m"), 162, CFSTR("No command was provided to initialize action ACRemoteDeviceMessage!"));

  }
  v12 = objc_alloc_init(ACRemoteDeviceMessage);
  objc_msgSend(v10, "_loadAllCachedProperties");
  -[ACRemoteDeviceMessage _setPayloadObject:forKey:](v12, "_setPayloadObject:forKey:", v9, CFSTR("cmd"));
  _ACDLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "internalCredential");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413058;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v11;
    _os_log_debug_impl(&dword_20D8CB000, v13, OS_LOG_TYPE_DEBUG, "@\"Creating action message with command '%@', account '%@ [credential:%@]', options '%@'\", (uint8_t *)&v17, 0x2Au);

  }
  if (v10)
    -[ACRemoteDeviceMessage _setPayloadObject:forKey:](v12, "_setPayloadObject:forKey:", v10, CFSTR("acc"));
  if (v11)
    -[ACRemoteDeviceMessage _setPayloadObject:forKey:](v12, "_setPayloadObject:forKey:", v11, CFSTR("opt"));

  return v12;
}

- (NSString)command
{
  return (NSString *)-[ACRemoteDeviceMessage _payloadObjectForKey:](self, "_payloadObjectForKey:", CFSTR("cmd"));
}

- (ACAccount)account
{
  return (ACAccount *)-[ACRemoteDeviceMessage _payloadObjectForKey:](self, "_payloadObjectForKey:", CFSTR("acc"));
}

- (NSDictionary)options
{
  return (NSDictionary *)-[ACRemoteDeviceMessage _payloadObjectForKey:](self, "_payloadObjectForKey:", CFSTR("opt"));
}

+ (id)replyForMessage:(id)a3 withSuccess:(BOOL)a4 result:(id)a5 error:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  ACRemoteDeviceMessage *v14;
  void *v15;
  void *v16;
  void *v18;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACRemoteDeviceMessage.m"), 204, CFSTR("No message was provided to initalize reply ACRemoteDeviceMessage!"));

  }
  v14 = objc_alloc_init(ACRemoteDeviceMessage);
  -[ACRemoteDeviceMessage setIsReply:](v14, "setIsReply:", 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACRemoteDeviceMessage _setPayloadObject:forKey:](v14, "_setPayloadObject:forKey:", v15, CFSTR("suc"));

  -[ACRemoteDeviceMessage _setPayloadObject:forKey:](v14, "_setPayloadObject:forKey:", v13, CFSTR("err"));
  objc_msgSend(v11, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACRemoteDeviceMessage _setPayloadObject:forKey:](v14, "_setPayloadObject:forKey:", v16, CFSTR("sid"));

  if (v12)
    -[ACRemoteDeviceMessage _setPayloadObject:forKey:](v14, "_setPayloadObject:forKey:", v12, CFSTR("res"));

  return v14;
}

+ (id)replyForMessage:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  return (id)objc_msgSend(a1, "replyForMessage:withSuccess:result:error:", a3, a4, 0, a5);
}

- (NSString)sentMessageIdentifier
{
  return (NSString *)-[ACRemoteDeviceMessage _payloadObjectForKey:](self, "_payloadObjectForKey:", CFSTR("sid"));
}

- (BOOL)success
{
  void *v2;
  char v3;

  -[ACRemoteDeviceMessage _payloadObjectForKey:](self, "_payloadObjectForKey:", CFSTR("suc"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSError)error
{
  return (NSError *)-[ACRemoteDeviceMessage _payloadObjectForKey:](self, "_payloadObjectForKey:", CFSTR("err"));
}

- (NSSecureCoding)result
{
  return (NSSecureCoding *)-[ACRemoteDeviceMessage _payloadObjectForKey:](self, "_payloadObjectForKey:", CFSTR("res"));
}

- (void)initWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_ERROR, "\"Failed to decode message data, error: %@\", (uint8_t *)&v2, 0xCu);
}

@end
