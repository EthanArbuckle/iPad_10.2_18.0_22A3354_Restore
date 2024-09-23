@implementation HMDCoordinationPingNotification

- (HMDCoordinationPingNotification)initWithPrimaryResidentUUID:(id)a3
{
  id v5;
  HMDCoordinationPingNotification *v6;
  HMDCoordinationPingNotification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCoordinationPingNotification;
  v6 = -[COMeshCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_primaryResidentUUID, a3);

  return v7;
}

- (HMDCoordinationPingNotification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDCoordinationPingNotification *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryResidentUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HMDCoordinationPingNotification;
  v6 = -[COMeshCommand initWithCoder:](&v8, sel_initWithCoder_, v4);

  if (v6)
    objc_storeStrong((id *)&v6->_primaryResidentUUID, v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDCoordinationPingNotification;
  v4 = a3;
  -[COMeshCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMDCoordinationPingNotification primaryResidentUUID](self, "primaryResidentUUID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("primaryResidentUUID"));

}

- (NSUUID)primaryResidentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryResidentUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
