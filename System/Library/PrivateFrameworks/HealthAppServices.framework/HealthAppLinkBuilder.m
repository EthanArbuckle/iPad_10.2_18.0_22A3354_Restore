@implementation HealthAppLinkBuilder

- (HealthAppLinkBuilder)init
{
  void *v3;
  HealthAppLinkBuilder *v4;

  objc_msgSend(MEMORY[0x1E0CB6A10], "primaryProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HealthAppLinkBuilder initWithProfileIdentifier:](self, "initWithProfileIdentifier:", v3);

  return v4;
}

- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3
{
  return -[HealthAppLinkBuilder initWithProfileIdentifier:source:useExternalURLScheme:](self, "initWithProfileIdentifier:source:useExternalURLScheme:", a3, 0, 0);
}

- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3 source:(id)a4
{
  return -[HealthAppLinkBuilder initWithProfileIdentifier:source:useExternalURLScheme:](self, "initWithProfileIdentifier:source:useExternalURLScheme:", a3, a4, 0);
}

- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3 useExternalURLScheme:(BOOL)a4
{
  return -[HealthAppLinkBuilder initWithProfileIdentifier:source:useExternalURLScheme:](self, "initWithProfileIdentifier:source:useExternalURLScheme:", a3, 0, a4);
}

- (HealthAppLinkBuilder)initWithProfileIdentifier:(id)a3 source:(id)a4 useExternalURLScheme:(BOOL)a5
{
  id v9;
  id v10;
  HealthAppLinkBuilder *v11;
  HealthAppLinkBuilder *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HealthAppLinkBuilder;
  v11 = -[HealthAppLinkBuilder init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_profileIdentifier, a3);
    objc_storeStrong((id *)&v12->_source, a4);
    v12->_useExternalURLScheme = a5;
  }

  return v12;
}

- (HealthAppLinkBuilder)initWithHealthStore:(id)a3
{
  void *v4;
  HealthAppLinkBuilder *v5;

  objc_msgSend(a3, "profileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HealthAppLinkBuilder initWithProfileIdentifier:source:useExternalURLScheme:](self, "initWithProfileIdentifier:source:useExternalURLScheme:", v4, 0, 0);

  return v5;
}

- (HealthAppLinkBuilder)initWithHealthStore:(id)a3 useExternalURLScheme:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  HealthAppLinkBuilder *v7;

  v4 = a4;
  objc_msgSend(a3, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HealthAppLinkBuilder initWithProfileIdentifier:source:useExternalURLScheme:](self, "initWithProfileIdentifier:source:useExternalURLScheme:", v6, 0, v4);

  return v7;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (BOOL)useExternalURLScheme
{
  return self->_useExternalURLScheme;
}

- (void)setUseExternalURLScheme:(BOOL)a3
{
  self->_useExternalURLScheme = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
}

@end
