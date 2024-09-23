@implementation HMAttributeRequest

- (HMAttributeRequest)initWithAccessoryProfile:(id)a3 attribute:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMAttributeRequest *v10;
  id *v11;
  id *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMAttributeRequest;
    v11 = -[HMRequestBase _init](&v14, sel__init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a3);
      objc_storeStrong(v12 + 2, a4);
    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (HMAccessoryProfile)accessoryProfile
{
  return self->_accessoryProfile;
}

- (NSString)attribute
{
  return self->_attribute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribute, 0);
  objc_storeStrong((id *)&self->_accessoryProfile, 0);
}

@end
