@implementation HMAccessCodeAddRequest

- (HMAccessCodeAddRequest)initWithAccessCodeValue:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  HMAccessCodeAddRequest *v8;
  uint64_t v9;
  HMAccessCodeValue *accessCodeValue;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMAccessCodeAddRequest;
  v8 = -[HMAccessCodeAddRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accessCodeValue = v8->_accessCodeValue;
    v8->_accessCodeValue = (HMAccessCodeValue *)v9;

    objc_storeStrong((id *)&v8->_accessory, a4);
  }

  return v8;
}

- (id)createAccessCodeAddRequestValue
{
  HMAccessCodeAddRequestValue *v3;
  void *v4;
  void *v5;
  void *v6;
  HMAccessCodeAddRequestValue *v7;

  v3 = [HMAccessCodeAddRequestValue alloc];
  -[HMAccessCodeAddRequest accessCodeValue](self, "accessCodeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessCodeAddRequest accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMAccessCodeAddRequestValue initWithAccessCodeValue:accessoryUUID:](v3, "initWithAccessCodeValue:accessoryUUID:", v4, v6);

  return v7;
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_accessCodeValue, 0);
}

@end
