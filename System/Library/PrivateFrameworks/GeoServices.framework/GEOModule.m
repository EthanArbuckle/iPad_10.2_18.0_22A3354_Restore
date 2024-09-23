@implementation GEOModule

- (GEOModule)initWithModule:(id)a3 moduleConfigProvider:(id)a4
{
  id v7;
  id v8;
  GEOModule *v9;
  GEOModule *v10;
  GEOModule *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOModule;
  v9 = -[GEOModule init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_module, a3);
    objc_storeStrong((id *)&v10->_moduleConfigProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (int)type
{
  int result;
  int v4;

  result = -[GEOPDModule hasType](self->_module, "hasType");
  if (result)
  {
    v4 = -[GEOPDModule type](self->_module, "type") - 1;
    if (v4 > 0x2D)
      return 0;
    else
      return dword_189CD2888[v4];
  }
  return result;
}

- (GEOModuleConfiguration)configuration
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int v10;
  const __CFString *v11;
  unsigned int v12;
  const __CFString *v13;
  const char *v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[GEOPDModule options](self->_module, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasWebContentUrl");

  if (v4)
  {
    GEOGetPlaceCardLayoutLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Accessing a layout that is pre-Sky and we notice that there is a web module.  Creating a web module config.", (uint8_t *)&v16, 2u);
    }

    -[GEOPDModule options](self->_module, "options");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject webContentUrl](v6, "webContentUrl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOModuleConfiguration moduleConfigurationForURL:](GEOModuleConfiguration, "moduleConfigurationForURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  v9 = -[GEOModule configurationExpectation](self, "configurationExpectation");
  if (-[GEOPDModule hasModuleConfigurationIndex](self->_module, "hasModuleConfigurationIndex"))
  {
    -[GEOModuleConfigurationProvider moduleConfigurationForIndex:](self->_moduleConfigProvider, "moduleConfigurationForIndex:", -[GEOPDModule moduleConfigurationIndex](self->_module, "moduleConfigurationIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || v9 != 2)
      return (GEOModuleConfiguration *)v8;
    GEOGetPlaceCardLayoutLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v10 = -[GEOModule type](self, "type") - 1;
    if (v10 > 0x2C)
      v11 = CFSTR("MODULE_TYPE_UNKNOWN");
    else
      v11 = off_1E1C09BB8[v10];
    v16 = 138412290;
    v17 = v11;
    v15 = "The module configuration %@ is required to to have a configuration and does not have a matching configuration";
  }
  else
  {
    if (v9 != 2)
      return (GEOModuleConfiguration *)0;
    GEOGetPlaceCardLayoutLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v12 = -[GEOModule type](self, "type") - 1;
    if (v12 > 0x2C)
      v13 = CFSTR("MODULE_TYPE_UNKNOWN");
    else
      v13 = off_1E1C09BB8[v12];
    v16 = 138412290;
    v17 = v13;
    v15 = "The module configuration %@ is required to to have a configuration and does not have an index.";
  }
  _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 0xCu);
LABEL_21:
  v8 = 0;
LABEL_22:

  return (GEOModuleConfiguration *)v8;
}

- (BOOL)hasConfiguration
{
  return -[GEOPDModule hasModuleConfigurationIndex](self->_module, "hasModuleConfigurationIndex");
}

- (int)configurationExpectation
{
  unsigned int v2;
  int v3;

  v2 = -[GEOModule type](self, "type");
  v3 = ((1 << v2) & 0x8000001024) != 0;
  if (((1 << v2) & 0x4806000000) != 0)
    v3 = 2;
  if (v2 <= 0x27)
    return v3;
  else
    return 0;
}

- (BOOL)isExpectedToHaveConfiguration
{
  return -[GEOModule configurationExpectation](self, "configurationExpectation") == 2;
}

- (id)description
{
  return -[GEOPDModule description](self->_module, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleConfigProvider, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

@end
