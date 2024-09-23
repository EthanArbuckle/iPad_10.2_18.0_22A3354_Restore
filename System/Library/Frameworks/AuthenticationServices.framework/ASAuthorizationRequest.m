@implementation ASAuthorizationRequest

+ (ASAuthorizationRequest)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ASAuthorizationRequest)init
{
  -[ASAuthorizationRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ASAuthorizationRequest)initWithProvider:(id)a3
{
  id v5;
  ASAuthorizationRequest *v6;
  ASAuthorizationRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASAuthorizationRequest;
  v6 = -[ASAuthorizationRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_provider, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return a3 == 0;
}

- (id)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
