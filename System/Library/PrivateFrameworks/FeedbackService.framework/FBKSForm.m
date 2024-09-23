@implementation FBKSForm

- (FBKSForm)initWithIdentifier:(id)a3
{
  id v4;
  FBKSForm *v5;
  FBKSForm_FrameworkPrivateName *v6;
  FBKSForm_FrameworkPrivateName *swiftObject;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKSForm;
  v5 = -[FBKSForm init](&v9, sel_init);
  if (v5)
  {
    v6 = -[FBKSForm_FrameworkPrivateName initWithIdentifier:]([FBKSForm_FrameworkPrivateName alloc], "initWithIdentifier:", v4);
    swiftObject = v5->_swiftObject;
    v5->_swiftObject = v6;

  }
  return v5;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[FBKSForm swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  void *v5;

  -[FBKSForm swiftObject](self, "swiftObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuthenticationMethod:", a3);

  self->_authenticationMethod = a3;
}

- (void)prefill:(id)a3 answer:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FBKSForm swiftObject](self, "swiftObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prefillWithQuestion:answer:", v7, v6);

}

- (int64_t)authenticationMethod
{
  return self->_authenticationMethod;
}

- (FBKSForm_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
  objc_storeStrong((id *)&self->_swiftObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftObject, 0);
}

@end
