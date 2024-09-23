@implementation HMDeviceSetupResponseMessage

- (HMDeviceSetupResponseMessage)init
{
  return -[HMDeviceSetupResponseMessage initWithPayload:](self, "initWithPayload:", 0);
}

- (HMDeviceSetupResponseMessage)initWithPayload:(id)a3
{
  id v4;
  HMDeviceSetupResponseMessage *v5;
  uint64_t v6;
  NSData *payload;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDeviceSetupResponseMessage;
  v5 = -[HMDeviceSetupResponseMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    payload = v5->_payload;
    v5->_payload = (NSData *)v6;

  }
  return v5;
}

- (HMDeviceSetupResponseMessage)initWithCoder:(id)a3
{
  id v4;
  HMDeviceSetupResponseMessage *v5;
  uint64_t v6;
  NSData *payload;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDeviceSetupResponseMessage;
  v5 = -[TRMessage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.payload"));
    v6 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDeviceSetupResponseMessage;
  v4 = a3;
  -[TRMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMDeviceSetupResponseMessage payload](self, "payload", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.payload"));

}

- (NSData)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
