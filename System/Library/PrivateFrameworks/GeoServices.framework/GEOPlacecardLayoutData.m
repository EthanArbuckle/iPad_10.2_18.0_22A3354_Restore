@implementation GEOPlacecardLayoutData

- (GEOPlacecardLayoutData)initWithPlacecardLayoutData:(id)a3
{
  id v5;
  GEOPlacecardLayoutData *v6;
  GEOPlacecardLayoutData *v7;
  GEOPlacecardLayoutConfiguration *v8;
  void *v9;
  uint64_t v10;
  GEOPlacecardLayoutConfiguration *placecardLayoutConfiguration;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPlacecardLayoutData;
  v6 = -[GEOPlacecardLayoutData init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placecardLayoutData, a3);
    v8 = [GEOPlacecardLayoutConfiguration alloc];
    -[GEOPDPlacecardLayoutData layoutConfiguration]((id *)&v7->_placecardLayoutData->super.super.isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOPlacecardLayoutConfiguration initWithPlacecardLayoutConfiguration:moduleConfigurationProvider:](v8, "initWithPlacecardLayoutConfiguration:moduleConfigurationProvider:", v9, v7);
    placecardLayoutConfiguration = v7->_placecardLayoutConfiguration;
    v7->_placecardLayoutConfiguration = (GEOPlacecardLayoutConfiguration *)v10;

    GEOGetPlaceCardLayoutLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "Initializing GEOPlacecardLayoutData with layoutData: %@", buf, 0xCu);
    }

  }
  return v7;
}

- (id)moduleConfigurationForIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  GEOModuleConfiguration *v9;

  -[GEOPDPlacecardLayoutData moduleConfigurations]((id *)&self->_placecardLayoutData->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    -[GEOPDPlacecardLayoutData moduleConfigurations]((id *)&self->_placecardLayoutData->super.super.isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[GEOModuleConfiguration initWithModuleConfiguration:]([GEOModuleConfiguration alloc], "initWithModuleConfiguration:", v8);
  }
  return v9;
}

- (GEOModuleLayoutEntry)currentModuleLayoutEntry
{
  return -[GEOPlacecardLayoutConfiguration currentModuleLayoutEntry](self->_placecardLayoutConfiguration, "currentModuleLayoutEntry");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placecardLayoutConfiguration, 0);
  objc_storeStrong((id *)&self->_placecardLayoutData, 0);
}

@end
