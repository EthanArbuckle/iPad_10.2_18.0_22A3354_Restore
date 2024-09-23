@implementation CRBasicPayloadCommand

- (id)copyWithZone:(_NSZone *)a3
{
  CRBasicPayloadCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc_init(CRBasicPayloadCommand);
  -[CRBasicPayloadCommand payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[CRBasicPayloadCommand setPayload:](v5, "setPayload:", v7);

  -[CRBasicPayloadCommand userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[CRBasicPayloadCommand setUserInfo:](v5, "setUserInfo:", v9);

  -[CRBasicPayloadCommand setCommandDirection:](v5, "setCommandDirection:", -[CRBasicPayloadCommand commandDirection](self, "commandDirection"));
  return v5;
}

- (NSSecureCoding)payload
{
  return self->payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->payload, a3);
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)commandDirection
{
  return self->commandDirection;
}

- (void)setCommandDirection:(unint64_t)a3
{
  self->commandDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->userInfo, 0);
  objc_storeStrong((id *)&self->payload, 0);
}

@end
