@implementation HMDCoordinationPingRequest

- (HMDCoordinationPingRequest)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDCoordinationPingRequest;
  return -[COMeshCommand initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDCoordinationPingRequest;
  -[COMeshCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)acceptableResponses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

@end
