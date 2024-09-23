@implementation CTBinarySMS

- (CTBinarySMS)init
{
  CTBinarySMS *v2;
  CTBinarySMS *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTBinarySMS;
  v2 = -[CTBinarySMS init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CTBinarySMS setPortAddressingScheme:](v2, "setPortAddressingScheme:", 0);
    -[CTBinarySMS setSrcPort:](v3, "setSrcPort:", 0);
    -[CTBinarySMS setDstPort:](v3, "setDstPort:", 0);
    -[CTBinarySMS setPayload:](v3, "setPayload:", 0);
    -[CTBinarySMS setDestinationAddress:](v3, "setDestinationAddress:", 0);
    -[CTBinarySMS setSmscAddress:](v3, "setSmscAddress:", 0);
    -[CTBinarySMS setContext:](v3, "setContext:", 0);
    -[CTBinarySMS setSmsType:](v3, "setSmsType:", 0);
  }
  return v3;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CTBinarySMS payload](self, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CTBinarySMS destinationAddress](self, "destinationAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (int)portAddressingScheme
{
  return self->_portAddressingScheme;
}

- (void)setPortAddressingScheme:(int)a3
{
  self->_portAddressingScheme = a3;
}

- (int)srcPort
{
  return self->_srcPort;
}

- (void)setSrcPort:(int)a3
{
  self->_srcPort = a3;
}

- (int)dstPort
{
  return self->_dstPort;
}

- (void)setDstPort:(int)a3
{
  self->_dstPort = a3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (void)setDestinationAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)smscAddress
{
  return self->_smscAddress;
}

- (void)setSmscAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int)smsType
{
  return self->_smsType;
}

- (void)setSmsType:(int)a3
{
  self->_smsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_smscAddress, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
