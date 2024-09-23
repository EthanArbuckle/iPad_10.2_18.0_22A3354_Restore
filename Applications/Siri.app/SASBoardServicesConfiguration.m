@implementation SASBoardServicesConfiguration

- (id)_init
{
  SASBoardServicesConfiguration *v2;
  SASBoardServicesConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SASBoardServicesConfiguration;
  v2 = -[SASBoardServicesConfiguration init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[SASBoardServicesConfiguration setMachServiceIdentifier:](v2, "setMachServiceIdentifier:", CFSTR("com.apple.siri.activation.service"));
    -[SASBoardServicesConfiguration setPresentationDomain:](v3, "setPresentationDomain:", CFSTR("com.apple.siri.activation"));
    -[SASBoardServicesConfiguration setPresentationIdentifier:](v3, "setPresentationIdentifier:", CFSTR("com.apple.siri.activation.presentation"));
    -[SASBoardServicesConfiguration setSignalDomain:](v3, "setSignalDomain:", CFSTR("com.apple.siri.activation"));
    -[SASBoardServicesConfiguration setSignalIdentifier:](v3, "setSignalIdentifier:", CFSTR("com.apple.siri.activation.signal"));
  }
  return v3;
}

- (SASBoardServicesConfiguration)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

+ (id)configuration
{
  if (qword_100150400 != -1)
    dispatch_once(&qword_100150400, &stru_100123F48);
  return (id)qword_1001503F8;
}

- (id)domainForService:(int64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SASBoardServicesConfiguration signalDomain](self, "signalDomain"));
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SASBoardServicesConfiguration presentationDomain](self, "presentationDomain"));
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (id)identifierForService:(int64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SASBoardServicesConfiguration signalIdentifier](self, "signalIdentifier"));
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SASBoardServicesConfiguration presentationIdentifier](self, "presentationIdentifier"));
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (NSString)machServiceIdentifier
{
  return self->_machServiceIdentifier;
}

- (void)setMachServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_machServiceIdentifier, a3);
}

- (NSString)presentationDomain
{
  return self->_presentationDomain;
}

- (void)setPresentationDomain:(id)a3
{
  objc_storeStrong((id *)&self->_presentationDomain, a3);
}

- (NSString)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void)setPresentationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentationIdentifier, a3);
}

- (NSString)signalDomain
{
  return self->_signalDomain;
}

- (void)setSignalDomain:(id)a3
{
  objc_storeStrong((id *)&self->_signalDomain, a3);
}

- (NSString)signalIdentifier
{
  return self->_signalIdentifier;
}

- (void)setSignalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_signalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalIdentifier, 0);
  objc_storeStrong((id *)&self->_signalDomain, 0);
  objc_storeStrong((id *)&self->_presentationIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationDomain, 0);
  objc_storeStrong((id *)&self->_machServiceIdentifier, 0);
}

@end
