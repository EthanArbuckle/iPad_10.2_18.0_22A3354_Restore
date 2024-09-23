@implementation HMAccessCodeRemoveRequest

- (HMAccessCodeRemoveRequest)initWithAccessoryAccessCode:(id)a3
{
  id v5;
  HMAccessCodeRemoveRequest *v6;
  HMAccessCodeRemoveRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessCodeRemoveRequest;
  v6 = -[HMAccessCodeRemoveRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accessoryAccessCode, a3);

  return v7;
}

- (id)createAccessCodeRemoveRequestValue
{
  HMAccessCodeRemoveRequestValue *v3;
  void *v4;
  void *v5;
  HMAccessCodeRemoveRequestValue *v6;

  v3 = [HMAccessCodeRemoveRequestValue alloc];
  -[HMAccessCodeRemoveRequest accessoryAccessCode](self, "accessoryAccessCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createAccessoryAccessCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMAccessCodeRemoveRequestValue initWithAccessoryAccessCodeValue:](v3, "initWithAccessoryAccessCodeValue:", v5);

  return v6;
}

- (HMAccessoryAccessCode)accessoryAccessCode
{
  return (HMAccessoryAccessCode *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryAccessCode, 0);
}

@end
