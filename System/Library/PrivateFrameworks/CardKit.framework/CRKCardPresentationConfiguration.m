@implementation CRKCardPresentationConfiguration

- (CRKCardPresentationConfiguration)initWithContent:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  CRKCardPresentationConfiguration *v7;

  v4 = (objc_class *)MEMORY[0x24BE15478];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContent:format:", v5, 0);

  v7 = -[CRKCardPresentationConfiguration initWithCardRequest:](self, "initWithCardRequest:", v6);
  return v7;
}

- (CRKCardPresentationConfiguration)initWithCardRequest:(id)a3
{
  id v5;
  CRKCardPresentationConfiguration *v6;
  CRKCardPresentationConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKCardPresentationConfiguration;
  v6 = -[CRKCardPresentationConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cardRequest, a3);
    *(_WORD *)&v7->_respectsUserConsent = 257;
  }

  return v7;
}

- (CRContent)content
{
  return (CRContent *)-[CRSCardRequest content](self->_cardRequest, "content");
}

- (CRSCardRequest)cardRequest
{
  return self->_cardRequest;
}

- (BOOL)respectsUserConsent
{
  return self->_respectsUserConsent;
}

- (void)setRespectsUserConsent:(BOOL)a3
{
  self->_respectsUserConsent = a3;
}

- (BOOL)loadsBundleProviders
{
  return self->_loadsBundleProviders;
}

- (void)setLoadsBundleProviders:(BOOL)a3
{
  self->_loadsBundleProviders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardRequest, 0);
}

@end
