@implementation GEODefaultEnvironmentInfo

- (GEODefaultEnvironmentInfo)init
{
  GEODefaultEnvironmentInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSString *name;
  uint64_t v13;
  NSString *displayName;
  NSString *actualName;
  GEODefaultEnvironmentInfo *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GEODefaultEnvironmentInfo;
  v2 = -[GEODefaultEnvironmentInfo init](&v18, sel_init);
  if (v2)
  {
    +[GEONetworkDefaults sharedNetworkDefaults](GEONetworkDefaults, "sharedNetworkDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("CountryProviders"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", CFSTR("GEOResourceManifestEnvironment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
    {
      +[GEONetworkDefaults sharedNetworkDefaults](GEONetworkDefaults, "sharedNetworkDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKey:", CFSTR("GEOResourceManifestEnvironment"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v10, "length"))
      {
        v11 = CFSTR("prod");
        goto LABEL_6;
      }
      v8 = v10;
    }
    v11 = v8;
    v10 = (void *)v11;
LABEL_6:

    name = v2->super._name;
    v2->super._name = 0;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Default (%@)"), v11);
    displayName = v2->super._displayName;
    v2->super._displayName = (NSString *)v13;

    actualName = v2->super._actualName;
    v2->super._actualName = &v11->isa;

    v16 = v2;
  }

  return v2;
}

- (void)makeActive
{
  uint64_t i;
  BOOL v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  _setValue(GeoServicesConfig_DisableUpdatingActiveTileGroup, (uint64_t)off_1EDF4D548, 0, 0, 1);
  _setValue(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), 0, 0, 1);
  _setValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88, 0, 0, 1);
  _setValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1EDF4E858, 0, 0, 1);
  for (i = 0; i != 66; ++i)
  {
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
    _recordForType(i, (uint64_t)&v6);
    if (DWORD2(v6))
      v4 = (_QWORD)v7 == 0;
    else
      v4 = 1;
    if (!v4)
      _setValue(SDWORD2(v6), v7, 0, 0, 0);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("GEOCountryConfigurationProvidersDidChangeNotification"), self, 0);

  -[GEOEnvironmentInfo _performActivation](self, "_performActivation");
}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;
  void *v4;
  BOOL v5;
  uint64_t v7;

  _getValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1EDF4E858, 1, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v7 = 0;
    _getValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88, 1, 0, &v7, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = v7 == 4;
    else
      v5 = 1;
    v3 = v5;

  }
  return v3;
}

- (id)_manifestURLString
{
  GEOResourceManifestConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(GEOResourceManifestConfiguration);
  -[GEOResourceManifestConfiguration setEnvironment:](v3, "setEnvironment:", self->super._actualName);
  GEOURLDefaultResourceManifestURLTemplate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    GEOResourceManifestURLTokenQueryItems(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "_geo_URLWithString:tokenSubstitutions:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
