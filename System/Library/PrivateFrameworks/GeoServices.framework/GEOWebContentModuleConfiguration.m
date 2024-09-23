@implementation GEOWebContentModuleConfiguration

- (GEOWebContentModuleConfiguration)initWithWebModuleConfiguration:(id)a3
{
  id v5;
  GEOWebContentModuleConfiguration *v6;
  GEOWebContentModuleConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOWebContentModuleConfiguration;
  v6 = -[GEOWebContentModuleConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_webModuleConfig, a3);

  return v7;
}

- (BOOL)shouldDrawPlatter
{
  GEOPDWebModuleConfiguration *webModuleConfig;

  webModuleConfig = self->_webModuleConfig;
  return webModuleConfig
      && (*(_BYTE *)&webModuleConfig->_flags & 2) != 0
      && webModuleConfig->_shouldRenderBackgroundPlatter;
}

- (NSURL)url
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[GEOPDWebModuleConfiguration url]((id *)&self->_webModuleConfig->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (id)description
{
  return -[GEOPDWebModuleConfiguration description](self->_webModuleConfig, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webModuleConfig, 0);
}

@end
