@implementation MKPlaceActionEnvironment

- (MKPlaceActionEnvironment)initWithOptions:(id)a3
{
  id v4;
  MKPlaceActionEnvironment *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIView *sourceView;
  void *v11;
  uint64_t v12;
  GEOAPPlaceCardModule *analyticsModuleMetadata;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKPlaceActionEnvironment;
  v5 = -[MKPlaceActionEnvironment init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MKPlaceActionManagerIsQuickAction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MKPlaceActionManagerIsQuickAction"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isQuickAction = objc_msgSend(v7, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("view"));
      v9 = objc_claimAutoreleasedReturnValue();
      sourceView = v5->_sourceView;
      v5->_sourceView = (UIView *)v9;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MKPlaceActionManagerModuleMetadataKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MKPlaceActionManagerModuleMetadataKey"));
      v12 = objc_claimAutoreleasedReturnValue();
      analyticsModuleMetadata = v5->_analyticsModuleMetadata;
      v5->_analyticsModuleMetadata = (GEOAPPlaceCardModule *)v12;

    }
  }

  return v5;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (GEOAPPlaceCardModule)analyticsModuleMetadata
{
  return self->_analyticsModuleMetadata;
}

- (void)setAnalyticsModuleMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsModuleMetadata, a3);
}

- (BOOL)isQuickAction
{
  return self->_isQuickAction;
}

- (void)setIsQuickAction:(BOOL)a3
{
  self->_isQuickAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsModuleMetadata, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
