@implementation HMDAccessoryBundle

- (HMDAccessoryBundle)initWithAccessory:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  HMDAccessoryBundle *v8;
  HMDAccessoryBundle *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAccessoryBundle;
  v8 = -[HMDAccessoryBundle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HMDAccessoryBundle setAccessory:](v8, "setAccessory:", v6);
    -[HMDAccessoryBundle setContext:](v9, "setContext:", v7);
  }

  return v9;
}

- (HMDHAPAccessory)accessory
{
  return self->accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->accessory, a3);
}

- (HMFObject)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->context, 0);
  objc_storeStrong((id *)&self->accessory, 0);
}

@end
