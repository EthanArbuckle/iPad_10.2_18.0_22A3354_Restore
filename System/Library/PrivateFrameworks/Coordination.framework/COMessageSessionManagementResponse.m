@implementation COMessageSessionManagementResponse

- (COMessageSessionManagementResponse)initWithPayload:(id)a3 payloadType:(id)a4
{
  id v7;
  id v8;
  COMessageSessionManagementResponse *v9;
  COMessageSessionManagementResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COMessageSessionManagementResponse;
  v9 = -[COMessageChannelResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payload, a3);
    objc_storeStrong((id *)&v10->_payloadType, a4);
  }

  return v10;
}

- (COMessageSessionManagementResponse)initWithRemoteError:(id)a3
{
  id v5;
  COMessageSessionManagementResponse *v6;
  COMessageSessionManagementResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMessageSessionManagementResponse;
  v6 = -[COMessageChannelResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_remoteError, a3);

  return v7;
}

- (COMessageSessionManagementResponse)initWithCoder:(id)a3
{
  id v4;
  COMessageSessionManagementResponse *v5;
  uint64_t v6;
  NSData *payload;
  uint64_t v8;
  NSString *payloadType;
  uint64_t v10;
  NSError *remoteError;
  COMessageSessionManagementResponse *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)COMessageSessionManagementResponse;
  v5 = -[COMessageChannelResponse initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v6 = objc_claimAutoreleasedReturnValue();
  payload = v5->_payload;
  v5->_payload = (NSData *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadType"));
  v8 = objc_claimAutoreleasedReturnValue();
  payloadType = v5->_payloadType;
  v5->_payloadType = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteError"));
  v10 = objc_claimAutoreleasedReturnValue();
  remoteError = v5->_remoteError;
  v5->_remoteError = (NSError *)v10;

  if (v5->_payload)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
  }
  if (v5->_payloadType && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v5->_remoteError && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_9:
    v12 = 0;
  }
  else
  {
LABEL_8:
    v12 = v5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)COMessageSessionManagementResponse;
  v4 = a3;
  -[COMessageChannelResponse encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[COMessageSessionManagementResponse payload](self, "payload", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("payload"));

  -[COMessageSessionManagementResponse payloadType](self, "payloadType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("payloadType"));

  -[COMessageSessionManagementResponse remoteError](self, "remoteError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("remoteError"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteError, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
