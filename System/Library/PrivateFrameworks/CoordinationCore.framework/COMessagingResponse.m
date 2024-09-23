@implementation COMessagingResponse

- (COMessagingResponse)initWithCoder:(id)a3
{
  id v4;
  COMessagingResponse *v5;
  uint64_t v6;
  NSData *payload;
  uint64_t v8;
  NSString *payloadType;
  COMessagingResponse *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)COMessagingResponse;
  v5 = -[COMeshResponse initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v6 = objc_claimAutoreleasedReturnValue();
  payload = v5->_payload;
  v5->_payload = (NSData *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadType"));
  v8 = objc_claimAutoreleasedReturnValue();
  payloadType = v5->_payloadType;
  v5->_payloadType = (NSString *)v8;

  if (v5->_payload)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
  }
  if (v5->_payloadType && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
LABEL_7:
    v10 = 0;
  else
LABEL_6:
    v10 = v5;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)COMessagingResponse;
  v4 = a3;
  -[COMeshResponse encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[COMessagingResponse payload](self, "payload", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("payload"));

  -[COMessagingResponse payloadType](self, "payloadType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("payloadType"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
