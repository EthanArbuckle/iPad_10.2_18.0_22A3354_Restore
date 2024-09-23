@implementation ASAuthorizationSingleSignOnProvider

+ (ASAuthorizationSingleSignOnProvider)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (ASAuthorizationSingleSignOnProvider)authorizationProviderWithIdentityProviderURL:(NSURL *)url
{
  NSURL *v4;
  void *v5;

  v4 = url;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return (ASAuthorizationSingleSignOnProvider *)v5;
}

- (ASAuthorizationSingleSignOnProvider)init
{
  -[ASAuthorizationSingleSignOnProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ASAuthorizationSingleSignOnProvider)initWithURL:(id)a3
{
  id v5;
  ASAuthorizationSingleSignOnProvider *v6;
  ASAuthorizationSingleSignOnProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASAuthorizationSingleSignOnProvider;
  v6 = -[ASAuthorizationSingleSignOnProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_url, a3);

  return v7;
}

- (BOOL)canPerformAuthorization
{
  return objc_msgSend(MEMORY[0x24BE04350], "canPerformAuthorizationWithURL:responseCode:useInternalExtensions:", self->_url, 0, 0);
}

- (ASAuthorizationSingleSignOnRequest)createRequest
{
  void *v2;
  ASAuthorizationSingleSignOnRequest *v3;

  +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:](ASAuthorizationSingleSignOnProvider, "authorizationProviderWithIdentityProviderURL:", self->_url);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[ASAuthorizationSingleSignOnRequest initWithProvider:]([ASAuthorizationSingleSignOnRequest alloc], "initWithProvider:", v2);

  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
