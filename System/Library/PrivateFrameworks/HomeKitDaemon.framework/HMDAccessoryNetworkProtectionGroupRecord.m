@implementation HMDAccessoryNetworkProtectionGroupRecord

- (HMDAccessoryNetworkProtectionGroupRecord)initWithGroup:(id)a3 active:(BOOL)a4 persisted:(BOOL)a5
{
  id v9;
  HMDAccessoryNetworkProtectionGroupRecord *v10;
  HMDAccessoryNetworkProtectionGroupRecord *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryNetworkProtectionGroupRecord;
  v10 = -[HMDAccessoryNetworkProtectionGroupRecord init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_active = a4;
    v10->_persisted = a5;
    objc_storeStrong((id *)&v10->_group, a3);
  }

  return v11;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isPersisted
{
  return self->_persisted;
}

- (void)setPersisted:(BOOL)a3
{
  self->_persisted = a3;
}

- (HMDAccessoryNetworkProtectionGroup)group
{
  return (HMDAccessoryNetworkProtectionGroup *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

+ (id)recordWithGroup:(id)a3 active:(BOOL)a4 persisted:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  HMDAccessoryNetworkProtectionGroupRecord *v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[HMDAccessoryNetworkProtectionGroupRecord initWithGroup:active:persisted:]([HMDAccessoryNetworkProtectionGroupRecord alloc], "initWithGroup:active:persisted:", v7, v6, v5);

  return v8;
}

@end
