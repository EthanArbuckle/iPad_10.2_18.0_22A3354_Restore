@implementation GEOMetroRegionLookup

- (id)lookupRegionWithLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE3CBB8], "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[GEOMetroRegionLookup _lookupRegionWithLocation:countryCode:](self, "_lookupRegionWithLocation:countryCode:", v4, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("UNKNOWN");
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

  }
  else
  {
    GEOGetMetroRegionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23CBB4000, v11, OS_LOG_TYPE_INFO, "Could not determine country code", v13, 2u);
    }

    v10 = CFSTR("UNKNOWN");
  }

  return v10;
}

- (id)lookupRegionWithLocation:(id)a3 countryCodeHint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  __CFString *v12;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    -[GEOMetroRegionLookup _lookupRegionWithLocation:countryCode:](self, "_lookupRegionWithLocation:countryCode:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[GEOMetroRegionLookup lookupRegionWithLocation:](self, "lookupRegionWithLocation:", v6);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

  }
  else
  {
    GEOGetMetroRegionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_23CBB4000, v11, OS_LOG_TYPE_INFO, "Country code not provided", v14, 2u);
    }

    v12 = CFSTR("UNKNOWN");
  }

  return v12;
}

- (id)_lookupRegionWithLocation:(id)a3 countryCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  GEOMetroRegionData *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[GEOMetroRegionAssetProvider sharedProvider](GEOMetroRegionAssetProvider, "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlForInstalledCountryCode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  GEOGetMetroRegionLog();
  v9 = (GEOMetroRegionData *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(&v9->super, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_23CBB4000, &v9->super, OS_LOG_TYPE_INFO, "MA-URL for country code '%@' is '%@'", (uint8_t *)&v15, 0x16u);
    }

    v9 = -[GEOMetroRegionData initWithFileURL:]([GEOMetroRegionData alloc], "initWithFileURL:", v8);
    v11 = objc_alloc_init(MEMORY[0x24BE3CC20]);
    v12 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v11, "setLatLng:", v12);

    -[GEOMetroRegionData metroNameForLocation:](v9, "metroNameForLocation:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v10)
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_23CBB4000, &v9->super, OS_LOG_TYPE_INFO, "MA-URL unavailable for country code '%@'", (uint8_t *)&v15, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

@end
