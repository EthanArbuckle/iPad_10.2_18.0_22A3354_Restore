@implementation NMSOutgoingRequest

+ (id)requestWithMessageID:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setMessageID:", v3);
  return v4;
}

- (NMSOutgoingRequest)init
{
  NMSOutgoingRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NMSOutgoingRequest;
  result = -[NMSOutgoingRequest init](&v3, sel_init);
  if (result)
    result->_priority = 1;
  return result;
}

- (void)setPbRequest:(id)a3
{
  NSData *v5;
  NSData *data;
  id v7;

  objc_storeStrong(&self->_pbRequest, a3);
  v7 = a3;
  objc_msgSend(self->_pbRequest, "data");
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v5;

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
  v11.super_class = (Class)NMSOutgoingRequest;
  -[NMSOutgoingRequest description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NMSPriorityString(-[NMSOutgoingRequest priority](self, "priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NMSOutgoingRequest messageID](self, "messageID");
  -[NMSOutgoingRequest idsIdentifier](self, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSOutgoingRequest data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {%@ priority, messageID=%hu, idsID=%@, data=%lu bytes}"), v4, v5, v6, v7, objc_msgSend(v8, "length"));

  return (NSString *)v9;
}

- (id)CPObfuscatedDescriptionObject
{
  id v3;
  double v4;
  id v5;
  double v6;
  NMSObfuscatableDescription *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  -[NMSOutgoingRequest sendTimeout](self, "sendTimeout");
  objc_msgSend(v3, "setSecond:", vcvtmd_s64_f64(v4));
  v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  -[NMSOutgoingRequest responseTimeout](self, "responseTimeout");
  objc_msgSend(v5, "setSecond:", vcvtmd_s64_f64(v6));
  v7 = objc_alloc_init(NMSObfuscatableDescription);
  v20.receiver = self;
  v20.super_class = (Class)NMSOutgoingRequest;
  -[NMSOutgoingRequest description](&v20, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription setPrefixString:](v7, "setPrefixString:", v8);

  NMSPriorityString(-[NMSOutgoingRequest priority](self, "priority"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v7, "addDescription:value:", CFSTR("Priority"), v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[NMSOutgoingRequest messageID](self, "messageID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v7, "addDescription:value:", CFSTR("MessageID"), v10);

  if (self->_pbRequest)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSObfuscatableDescription addDescription:value:](v7, "addDescription:value:", CFSTR("Protobuf class"), v12);

  }
  else
  {
    -[NMSObfuscatableDescription addDescription:value:](v7, "addDescription:value:", CFSTR("Protobuf class"), CFSTR("none"));
  }
  -[NMSOutgoingRequest idsIdentifier](self, "idsIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v7, "addDescription:value:", CFSTR("IDS ID"), v13);

  objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v3, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v7, "addDescription:value:", CFSTR("Send timeout"), v14);

  objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v5, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v7, "addDescription:value:", CFSTR("Response timeout"), v15);

  if (-[NMSOutgoingRequest shouldEncrypt](self, "shouldEncrypt"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  -[NMSObfuscatableDescription addDescription:value:](v7, "addDescription:value:", CFSTR("Should encrypt"), v16);
  -[NMSOutgoingRequest data](self, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addObfuscatedDescription:value:](v7, "addObfuscatedDescription:value:", CFSTR("Data"), v17);

  -[NMSOutgoingRequest persistentUserInfo](self, "persistentUserInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v7, "addDescription:value:", CFSTR("User info"), v18);

  return v7;
}

- (NSSet)targetDeviceIDs
{
  return self->targetDeviceIDs;
}

- (void)setTargetDeviceIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
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

- (double)responseTimeout
{
  return self->_responseTimeout;
}

- (void)setResponseTimeout:(double)a3
{
  self->_responseTimeout = a3;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void)setShouldEncrypt:(BOOL)a3
{
  self->_shouldEncrypt = a3;
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

- (NMSMessageCenter)messageCenter
{
  return (NMSMessageCenter *)objc_loadWeakRetained((id *)&self->_messageCenter);
}

- (void)setMessageCenter:(id)a3
{
  objc_storeWeak((id *)&self->_messageCenter, a3);
}

- (id)pbRequest
{
  return self->_pbRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbRequest, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->_extraIDSOptions, 0);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->targetDeviceIDs, 0);
}

@end
