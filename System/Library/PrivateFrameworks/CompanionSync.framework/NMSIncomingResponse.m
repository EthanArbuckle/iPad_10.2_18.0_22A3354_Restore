@implementation NMSIncomingResponse

- (NSString)description
{
  id v3;
  void *v4;
  uint64_t v5;
  id pbResponse;
  objc_class *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v13.receiver = self;
  v13.super_class = (Class)NMSIncomingResponse;
  -[NMSIncomingResponse description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NMSIncomingResponse messageID](self, "messageID");
  pbResponse = self->_pbResponse;
  if (pbResponse)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("none");
  }
  -[NMSIncomingResponse idsIdentifier](self, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSIncomingResponse data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {messageID=%hu, protobuf class=%@, idsID=%@, data=%lu bytes}"), v4, v5, v8, v9, objc_msgSend(v10, "length"));

  if (pbResponse)
  return (NSString *)v11;
}

- (id)CPObfuscatedDescriptionObject
{
  NMSObfuscatableDescription *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc_init(NMSObfuscatableDescription);
  v14.receiver = self;
  v14.super_class = (Class)NMSIncomingResponse;
  -[NMSIncomingResponse debugDescription](&v14, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription setPrefixString:](v3, "setPrefixString:", v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[NMSIncomingResponse messageID](self, "messageID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("MessageID"), v5);

  if (self->_pbResponse)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("Protobuf class"), v7);

  }
  else
  {
    -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("Protobuf class"), CFSTR("none"));
  }
  -[NMSIncomingResponse idsIdentifier](self, "idsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("IDS ID"), v8);

  -[NMSIncomingResponse requestIDSIdentifier](self, "requestIDSIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("Request IDS ID"), v9);

  -[NMSIncomingResponse requestSent](self, "requestSent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("Request sent"), v10);

  -[NMSIncomingResponse data](self, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addObfuscatedDescription:value:](v3, "addObfuscatedDescription:value:", CFSTR("Data"), v11);

  -[NMSIncomingResponse requestPersistentUserInfo](self, "requestPersistentUserInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("Request user info"), v12);

  return v3;
}

- (NSString)sourceDeviceID
{
  return self->sourceDeviceID;
}

- (void)setSourceDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->sourceDeviceID, a3);
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)requestIDSIdentifier
{
  return self->_requestIDSIdentifier;
}

- (void)setRequestIDSIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)requestSent
{
  return self->_requestSent;
}

- (void)setRequestSent:(id)a3
{
  objc_storeStrong((id *)&self->_requestSent, a3);
}

- (NSDictionary)requestPersistentUserInfo
{
  return self->_requestPersistentUserInfo;
}

- (void)setRequestPersistentUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_requestPersistentUserInfo, a3);
}

- (id)pbResponse
{
  return self->_pbResponse;
}

- (void)setPbResponse:(id)a3
{
  objc_storeStrong(&self->_pbResponse, a3);
}

- (IDSMessageContext)idsContext
{
  return self->_idsContext;
}

- (void)setIdsContext:(id)a3
{
  objc_storeStrong((id *)&self->_idsContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsContext, 0);
  objc_storeStrong(&self->_pbResponse, 0);
  objc_storeStrong((id *)&self->_requestPersistentUserInfo, 0);
  objc_storeStrong((id *)&self->_requestSent, 0);
  objc_storeStrong((id *)&self->_requestIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->sourceDeviceID, 0);
}

@end
