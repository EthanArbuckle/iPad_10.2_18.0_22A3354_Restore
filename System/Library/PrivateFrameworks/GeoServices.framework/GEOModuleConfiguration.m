@implementation GEOModuleConfiguration

- (GEOModuleConfiguration)initWithModuleConfiguration:(id)a3
{
  id v5;
  GEOModuleConfiguration *v6;
  GEOModuleConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOModuleConfiguration;
  v6 = -[GEOModuleConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_moduleConfig, a3);

  return v7;
}

- (int)type
{
  GEOPDModuleConfiguration *moduleConfig;
  int v3;

  moduleConfig = self->_moduleConfig;
  if (moduleConfig
    && (*(_BYTE *)&moduleConfig->_flags & 1) != 0
    && (v3 = moduleConfig->_moduleConfigurationType - 1, v3 <= 8))
  {
    return dword_189CD2940[v3];
  }
  else
  {
    return 0;
  }
}

- (GEOWebContentModuleConfiguration)webContentConfig
{
  GEOWebContentModuleConfiguration *v3;
  id *v4;
  void *v5;
  GEOWebContentModuleConfiguration *v6;

  if (-[GEOModuleConfiguration type](self, "type") == 4)
  {
    v3 = [GEOWebContentModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDModuleConfigurationValue webModuleConfiguration](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOWebContentModuleConfiguration initWithWebModuleConfiguration:](v3, "initWithWebModuleConfiguration:", v5);

  }
  else
  {
    -[GEOModuleConfiguration _logNoModuleConfigMatchForType](self, "_logNoModuleConfigMatchForType");
    v6 = 0;
  }
  return v6;
}

- (GEORelatedPlaceModuleConfiguration)relatedPlaceConfig
{
  GEORelatedPlaceModuleConfiguration *v3;
  id *v4;
  void *v5;
  GEORelatedPlaceModuleConfiguration *v6;

  if (-[GEOModuleConfiguration type](self, "type") == 3)
  {
    v3 = [GEORelatedPlaceModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDModuleConfigurationValue templatePlaceModuleConfiguration](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEORelatedPlaceModuleConfiguration initWithPlaceTemplateModuleConfiguration:](v3, "initWithPlaceTemplateModuleConfiguration:", v5);

  }
  else
  {
    -[GEOModuleConfiguration _logNoModuleConfigMatchForType](self, "_logNoModuleConfigMatchForType");
    v6 = 0;
  }
  return v6;
}

- (GEOPlaceRibbonConfiguration)placeRibbonConfig
{
  GEOPlaceRibbonConfiguration *v3;
  id *v4;
  void *v5;
  GEOPlaceRibbonConfiguration *v6;

  if (-[GEOModuleConfiguration type](self, "type") == 1)
  {
    v3 = [GEOPlaceRibbonConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDModuleConfigurationValue ribbonModuleConfiguration](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOPlaceRibbonConfiguration initWithRibbonConfiguration:](v3, "initWithRibbonConfiguration:", v5);

  }
  else
  {
    -[GEOModuleConfiguration _logNoModuleConfigMatchForType](self, "_logNoModuleConfigMatchForType");
    v6 = 0;
  }
  return v6;
}

- (GEOButtonModuleConfiguration)actionButtonConfig
{
  GEOButtonModuleConfiguration *v3;
  id *v4;
  void *v5;
  GEOButtonModuleConfiguration *v6;

  if (-[GEOModuleConfiguration type](self, "type") == 2)
  {
    v3 = [GEOButtonModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDModuleConfigurationValue buttonModuleConfiguration](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOButtonModuleConfiguration initWithButtonModuleConfiguration:](v3, "initWithButtonModuleConfiguration:", v5);

  }
  else
  {
    -[GEOModuleConfiguration _logNoModuleConfigMatchForType](self, "_logNoModuleConfigMatchForType");
    v6 = 0;
  }
  return v6;
}

- (GEOHeaderButtonModuleConfiguration)headerButtonConfig
{
  GEOHeaderButtonModuleConfiguration *v3;
  id *v4;
  void *v5;
  GEOHeaderButtonModuleConfiguration *v6;

  if (-[GEOModuleConfiguration type](self, "type") == 5)
  {
    v3 = [GEOHeaderButtonModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDModuleConfigurationValue headerButtonsConfiguration](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOHeaderButtonModuleConfiguration initWithHeaderButtonConfiguration:](v3, "initWithHeaderButtonConfiguration:", v5);

  }
  else
  {
    -[GEOModuleConfiguration _logNoModuleConfigMatchForType](self, "_logNoModuleConfigMatchForType");
    v6 = 0;
  }
  return v6;
}

- (GEOBusinessInfoModuleConfiguration)businessInfoConfig
{
  GEOBusinessInfoModuleConfiguration *v3;
  id *v4;
  void *v5;
  GEOBusinessInfoModuleConfiguration *v6;

  if (-[GEOModuleConfiguration type](self, "type") == 7)
  {
    v3 = [GEOBusinessInfoModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDModuleConfigurationValue businessInfosModuleConfiguration](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOBusinessInfoModuleConfiguration initWithBusinessInfoModuleConfiguration:](v3, "initWithBusinessInfoModuleConfiguration:", v5);

  }
  else
  {
    -[GEOModuleConfiguration _logNoModuleConfigMatchForType](self, "_logNoModuleConfigMatchForType");
    v6 = 0;
  }
  return v6;
}

- (GEOPlaceDetailsModuleConfiguration)placeDetailsConfig
{
  GEOPlaceDetailsModuleConfiguration *v3;
  id *v4;
  void *v5;
  GEOPlaceDetailsModuleConfiguration *v6;

  if (-[GEOModuleConfiguration type](self, "type") == 6)
  {
    v3 = [GEOPlaceDetailsModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDModuleConfigurationValue placeInfosModuleConfiguration](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOPlaceDetailsModuleConfiguration initWithPlaceInfoModuleConfiguration:](v3, "initWithPlaceInfoModuleConfiguration:", v5);

  }
  else
  {
    -[GEOModuleConfiguration _logNoModuleConfigMatchForType](self, "_logNoModuleConfigMatchForType");
    v6 = 0;
  }
  return v6;
}

- (GEOUnifiedActionButtonModuleConfiguration)unifiedActionConfig
{
  GEOUnifiedActionButtonModuleConfiguration *v3;
  id *v4;
  void *v5;
  GEOUnifiedActionButtonModuleConfiguration *v6;

  if (-[GEOModuleConfiguration type](self, "type") == 8)
  {
    v3 = [GEOUnifiedActionButtonModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDModuleConfigurationValue unifiedActionModuleConfiguration](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOUnifiedActionButtonModuleConfiguration initWithUnifiedActionModuleConfiguration:](v3, "initWithUnifiedActionModuleConfiguration:", v5);

  }
  else
  {
    -[GEOModuleConfiguration _logNoModuleConfigMatchForType](self, "_logNoModuleConfigMatchForType");
    v6 = 0;
  }
  return v6;
}

- (void)_logNoModuleConfigMatchForType
{
  NSObject *v3;
  unsigned int v4;
  const __CFString *v5;
  GEOPDModuleConfiguration *moduleConfig;
  int v7;
  const __CFString *v8;
  __int16 v9;
  GEOPDModuleConfiguration *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  GEOGetPlaceCardLayoutLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = -[GEOModuleConfiguration type](self, "type") - 1;
    if (v4 > 7)
      v5 = CFSTR("MODULE_CONFIG_TYPE_UNKNOWN");
    else
      v5 = off_1E1C09D38[v4];
    moduleConfig = self->_moduleConfig;
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = moduleConfig;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Did not have a valid configuration for type %@. Associated module config is %@", (uint8_t *)&v7, 0x16u);
  }

}

+ (id)moduleConfigurationForURL:(id)a3
{
  id v3;
  GEOPDWebModuleConfiguration *v4;
  GEOPDModuleConfiguration *v5;
  id *p_isa;
  GEOPDModuleConfigurationValue *v7;
  void *v8;
  GEOModuleConfiguration *v9;

  v3 = a3;
  v4 = objc_alloc_init(GEOPDWebModuleConfiguration);
  -[GEOPDWebModuleConfiguration setUrl:]((uint64_t)v4, v3);

  v5 = objc_alloc_init(GEOPDModuleConfiguration);
  p_isa = (id *)&v5->super.super.isa;
  if (v5)
  {
    *(_BYTE *)&v5->_flags |= 1u;
    v5->_moduleConfigurationType = 4;
  }
  v7 = objc_alloc_init(GEOPDModuleConfigurationValue);
  -[GEOPDModuleConfiguration setModuleConfigurationValue:]((uint64_t)p_isa, v7);

  -[GEOPDModuleConfiguration moduleConfigurationValue](p_isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDModuleConfigurationValue setWebModuleConfiguration:]((uint64_t)v8, v4);

  v9 = -[GEOModuleConfiguration initWithModuleConfiguration:]([GEOModuleConfiguration alloc], "initWithModuleConfiguration:", p_isa);
  return v9;
}

- (id)description
{
  return -[GEOPDModuleConfiguration description](self->_moduleConfig, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleConfig, 0);
}

@end
