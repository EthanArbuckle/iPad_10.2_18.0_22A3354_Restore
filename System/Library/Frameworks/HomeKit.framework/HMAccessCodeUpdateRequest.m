@implementation HMAccessCodeUpdateRequest

- (HMAccessCodeUpdateRequest)initWithAccessoryAccessCode:(id)a3 updatedAccessCodeValue:(id)a4
{
  id v7;
  id v8;
  HMAccessCodeUpdateRequest *v9;
  HMAccessCodeUpdateRequest *v10;
  uint64_t v11;
  HMAccessCodeValue *updatedAccessCodeValue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessCodeUpdateRequest;
  v9 = -[HMAccessCodeUpdateRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryAccessCode, a3);
    v11 = objc_msgSend(v8, "copy");
    updatedAccessCodeValue = v10->_updatedAccessCodeValue;
    v10->_updatedAccessCodeValue = (HMAccessCodeValue *)v11;

  }
  return v10;
}

- (id)createAccessCodeUpdateRequestValue
{
  HMAccessCodeUpdateRequestValue *v3;
  void *v4;
  void *v5;
  void *v6;
  HMAccessCodeUpdateRequestValue *v7;

  v3 = [HMAccessCodeUpdateRequestValue alloc];
  -[HMAccessCodeUpdateRequest accessoryAccessCode](self, "accessoryAccessCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createAccessoryAccessCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessCodeUpdateRequest updatedAccessCodeValue](self, "updatedAccessCodeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMAccessCodeUpdateRequestValue initWithAccessoryAccessCodeValue:updatedAccessCodeValue:](v3, "initWithAccessoryAccessCodeValue:updatedAccessCodeValue:", v5, v6);

  return v7;
}

- (HMAccessoryAccessCode)accessoryAccessCode
{
  return (HMAccessoryAccessCode *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessCodeValue)updatedAccessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAccessCodeValue, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCode, 0);
}

@end
