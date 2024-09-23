@implementation NMSOutgoingResponse

- (NMSOutgoingResponse)init
{
  NMSOutgoingResponse *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NMSOutgoingResponse;
  v2 = -[NMSOutgoingResponse init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)os_transaction_create();
    -[NMSOutgoingResponse setTransaction:](v2, "setTransaction:", v3);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NMSOutgoingResponse;
  -[NMSOutgoingResponse dealloc](&v2, sel_dealloc);
}

- (void)send
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  objc_msgSend(WeakRetained, "messageCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_sendResponse:", self);
}

- (void)setPbResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id pbResponse;
  id v8;
  NSData *v9;
  NSData *data;
  id WeakRetained;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  objc_msgSend(WeakRetained, "messageCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pbMappingForMessageID:", objc_msgSend(WeakRetained, "messageID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pbResponse = self->_pbResponse;
  self->_pbResponse = v4;
  v8 = v4;

  objc_msgSend(self->_pbResponse, "data");
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v9;

}

- (id)_makePBResponse
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  objc_msgSend(WeakRetained, "messageCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pbMappingForMessageID:", objc_msgSend(WeakRetained, "messageID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseClass");
  v5 = (void *)objc_opt_new();

  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  -[NMSOutgoingResponse request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v13.receiver = self;
  v13.super_class = (Class)NMSOutgoingResponse;
  -[NMSOutgoingResponse description](&v13, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NMSPriorityString(-[NMSOutgoingResponse priority](self, "priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "messageID");
  -[NMSOutgoingResponse idsIdentifier](self, "idsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSOutgoingResponse data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {%@ priority, messageID=%hu, idsID=%@, requestID=%@, data=%lu bytes}"), v5, v6, v7, v8, v9, objc_msgSend(v10, "length"));

  return (NSString *)v11;
}

- (id)CPObfuscatedDescriptionObject
{
  id v3;
  double v4;
  NMSObfuscatableDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  -[NMSOutgoingResponse sendTimeout](self, "sendTimeout");
  objc_msgSend(v3, "setSecond:", vcvtmd_s64_f64(v4));
  v5 = objc_alloc_init(NMSObfuscatableDescription);
  v18.receiver = self;
  v18.super_class = (Class)NMSOutgoingResponse;
  -[NMSOutgoingResponse debugDescription](&v18, sel_debugDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription setPrefixString:](v5, "setPrefixString:", v6);

  -[NMSOutgoingResponse request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NMSPriorityString(-[NMSOutgoingResponse priority](self, "priority"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v5, "addDescription:value:", CFSTR("Priority"), v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v7, "messageID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v5, "addDescription:value:", CFSTR("Request messageID"), v9);

  if (self->_pbResponse)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSObfuscatableDescription addDescription:value:](v5, "addDescription:value:", CFSTR("Protobuf class"), v11);

  }
  else
  {
    -[NMSObfuscatableDescription addDescription:value:](v5, "addDescription:value:", CFSTR("Protobuf class"), CFSTR("none"));
  }
  -[NMSOutgoingResponse idsIdentifier](self, "idsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v5, "addDescription:value:", CFSTR("IDS ID"), v12);

  objc_msgSend(v7, "idsIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v5, "addDescription:value:", CFSTR("Request IDS ID"), v13);

  objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v3, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v5, "addDescription:value:", CFSTR("Send timeout"), v14);

  -[NMSOutgoingResponse data](self, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addObfuscatedDescription:value:](v5, "addObfuscatedDescription:value:", CFSTR("Data"), v15);

  -[NMSOutgoingResponse persistentUserInfo](self, "persistentUserInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v5, "addDescription:value:", CFSTR("User info"), v16);

  return v5;
}

- (NSSet)targetDeviceIDs
{
  return self->targetDeviceIDs;
}

- (void)setTargetDeviceIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NMSIncomingRequest)request
{
  return (NMSIncomingRequest *)objc_loadWeakRetained((id *)&self->_request);
}

- (void)setRequest:(id)a3
{
  objc_storeWeak((id *)&self->_request, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (double)sendTimeout
{
  return self->_sendTimeout;
}

- (void)setSendTimeout:(double)a3
{
  self->_sendTimeout = a3;
}

- (NSDictionary)persistentUserInfo
{
  return self->_persistentUserInfo;
}

- (void)setPersistentUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_persistentUserInfo, a3);
}

- (NSDictionary)extraIDSOptions
{
  return self->_extraIDSOptions;
}

- (void)setExtraIDSOptions:(id)a3
{
  objc_storeStrong((id *)&self->_extraIDSOptions, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (BOOL)isSent
{
  return self->_sent;
}

- (void)setSent:(BOOL)a3
{
  self->_sent = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)pbResponse
{
  return self->_pbResponse;
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
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_extraIDSOptions, 0);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_request);
  objc_storeStrong((id *)&self->targetDeviceIDs, 0);
}

@end
