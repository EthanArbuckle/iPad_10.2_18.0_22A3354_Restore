@implementation ASCredentialProviderViewController

- (ASCredentialProviderExtensionContext)extensionContext
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCredentialProviderViewController;
  -[ASCredentialProviderViewController extensionContext](&v3, sel_extensionContext);
  return (ASCredentialProviderExtensionContext *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)provideCredentialWithoutUserInteractionForIdentity:(ASPasswordCredentialIdentity *)credentialIdentity
{
  id v4;

  +[ASPasswordCredentialRequest requestWithCredentialIdentity:](ASPasswordCredentialRequest, "requestWithCredentialIdentity:", credentialIdentity);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCredentialProviderViewController provideCredentialWithoutUserInteractionForRequest:](self, "provideCredentialWithoutUserInteractionForRequest:", v4);

}

- (void)provideCredentialWithoutUserInteractionForRequest:(id)credentialRequest
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = credentialRequest;
  objc_msgSend(v7, "credentialIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "credentialIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialProviderViewController provideCredentialWithoutUserInteractionForIdentity:](self, "provideCredentialWithoutUserInteractionForIdentity:", v6);

  }
}

- (void)prepareInterfaceToProvideCredentialForRequest:(id)credentialRequest
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = credentialRequest;
  objc_msgSend(v7, "credentialIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "credentialIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialProviderViewController prepareInterfaceToProvideCredentialForIdentity:](self, "prepareInterfaceToProvideCredentialForIdentity:", v6);

  }
}

@end
