@implementation HMMRTCSessionVoucher

- (HMMRTCSessionVoucher)initWithUUID:(id)a3 serviceName:(id)a4
{
  id v7;
  id v8;
  HMMRTCSessionVoucher *v9;
  HMMRTCSessionVoucher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMRTCSessionVoucher;
  v9 = -[HMMRTCSessionVoucher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_serviceName, a4);
  }

  return v10;
}

- (HMMRTCSessionVoucher)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMMRTCSessionVoucher *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMMRTCSessionVoucher initWithUUID:serviceName:](self, "initWithUUID:serviceName:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMMRTCSessionVoucher uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  -[HMMRTCSessionVoucher serviceName](self, "serviceName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("service"));

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
