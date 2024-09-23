@implementation NMSIncomingRequest

+ (BOOL)allowsUnrepliedRequestsForUnitTesting
{
  return _allowUnrepliedRequestsForUnitTesting;
}

+ (void)setAllowsUnrepliedRequestsForUnitTesting:(BOOL)a3
{
  _allowUnrepliedRequestsForUnitTesting = a3;
}

- (NMSIncomingRequest)init
{
  NMSIncomingRequest *v2;
  void *v3;
  NMSIncomingRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NMSIncomingRequest;
  v2 = -[NMSIncomingRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)os_transaction_create();
    -[NMSIncomingRequest setTransaction:](v2, "setTransaction:", v3);

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  NSObject *v1;
  id v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "pbRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_211704000, v1, (os_log_type_t)0x90u, "Must not forget about an NMSIncomingRequest without first responding to it. Request is an %{public}@", v6, 0xCu);

  OUTLINED_FUNCTION_12();
}

- (void)configureResponse
{
  NMSOutgoingResponse *v3;
  void *v4;
  void *v5;
  NMSOutgoingResponse *response;

  v3 = objc_alloc_init(NMSOutgoingResponse);
  -[NMSOutgoingResponse setPriority:](v3, "setPriority:", self->_priority);
  -[NMSOutgoingResponse setRequest:](v3, "setRequest:", self);
  if (self->sourceDeviceID)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSOutgoingResponse setTargetDeviceIDs:](v3, "setTargetDeviceIDs:", v4);

  }
  -[NMSIncomingRequest idsContext](self, "idsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSOutgoingResponse setIdsContext:](v3, "setIdsContext:", v5);

  response = self->_response;
  self->_response = v3;

}

- (void)setData:(id)a3
{
  id v5;
  id WeakRetained;
  unsigned __int16 *p_messageID;
  void *v8;
  void *v9;
  id pbRequest;
  NSObject *v11;
  uint64_t v12;

  v5 = a3;
  objc_storeStrong((id *)&self->_data, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
  p_messageID = &self->_messageID;
  objc_msgSend(WeakRetained, "_pbMappingForMessageID:", self->_messageID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "requestClass")), "initWithData:", self->_data);
    pbRequest = self->_pbRequest;
    self->_pbRequest = v9;

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v11 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[NMSIncomingRequest setData:].cold.1(p_messageID, v11, v12);
  }

}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v11.receiver = self;
  v11.super_class = (Class)NMSIncomingRequest;
  -[NMSIncomingRequest description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NMSPriorityString(-[NMSIncomingRequest priority](self, "priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NMSIncomingRequest messageID](self, "messageID");
  -[NMSIncomingRequest idsIdentifier](self, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSIncomingRequest data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {%@ priority, messageID=%hu, idsID=%@, data=%lu bytes}"), v4, v5, v6, v7, objc_msgSend(v8, "length"));

  return (NSString *)v9;
}

- (id)CPObfuscatedDescriptionObject
{
  NMSObfuscatableDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc_init(NMSObfuscatableDescription);
  v14.receiver = self;
  v14.super_class = (Class)NMSIncomingRequest;
  -[NMSIncomingRequest debugDescription](&v14, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription setPrefixString:](v3, "setPrefixString:", v4);

  NMSPriorityString(-[NMSIncomingRequest priority](self, "priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("Priority"), v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[NMSIncomingRequest messageID](self, "messageID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("MessageID"), v6);

  if (self->_pbRequest)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("Protobuf class"), v8);

  }
  else
  {
    -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("Protobuf class"), CFSTR("none"));
  }
  -[NMSIncomingRequest idsIdentifier](self, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("IDS ID"), v9);

  if (-[NMSIncomingRequest expectsResponse](self, "expectsResponse"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("Expects response"), v10);
  -[NMSIncomingRequest data](self, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addObfuscatedDescription:value:](v3, "addObfuscatedDescription:value:", CFSTR("Data"), v11);

  -[NMSIncomingRequest response](self, "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addObfuscatedDescription:value:](v3, "addObfuscatedDescription:value:", CFSTR("Response message"), v12);

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

- (NMSMessageCenter)messageCenter
{
  return (NMSMessageCenter *)objc_loadWeakRetained((id *)&self->_messageCenter);
}

- (void)setMessageCenter:(id)a3
{
  objc_storeWeak((id *)&self->_messageCenter, a3);
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

- (NMSOutgoingResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (id)pbRequest
{
  return self->_pbRequest;
}

- (void)setPbRequest:(id)a3
{
  objc_storeStrong(&self->_pbRequest, a3);
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
  objc_storeStrong(&self->_pbRequest, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->sourceDeviceID, 0);
}

- (void)setData:(uint64_t)a3 .cold.1(unsigned __int16 *a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_23(&dword_211704000, a2, a3, "No Protobuf class mappings for message ID %{companionsync:SYMessageID}hu", (uint8_t *)v4);
  OUTLINED_FUNCTION_3_1();
}

@end
