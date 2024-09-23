@implementation GEOCustomEnvironmentInfo

- (GEOCustomEnvironmentInfo)initWithName:(id)a3 displayName:(id)a4 dictionaryRepresentation:(id)a5
{
  id v8;
  GEOCustomEnvironmentInfo *v9;
  void *v10;
  uint64_t v11;
  NSString *uuid;
  uint64_t v13;
  NSMapTable *overrideURLs;
  uint64_t i;
  BOOL v16;
  void *v17;
  void *v18;
  NSMapTable *v19;
  void *v20;
  GEOCustomEnvironmentInfo *v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)GEOCustomEnvironmentInfo;
  v9 = -[GEOEnvironmentInfo initWithName:displayName:dictionaryRepresentation:](&v23, sel_initWithName_displayName_dictionaryRepresentation_, a3, a4, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uuid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    uuid = v9->_uuid;
    v9->_uuid = (NSString *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 66);
    overrideURLs = v9->_overrideURLs;
    v9->_overrideURLs = (NSMapTable *)v13;

    for (i = 0; i != 66; ++i)
    {
      v25 = 0u;
      v26 = 0u;
      v24 = 0u;
      _recordForType(i, (uint64_t)&v24);
      if (DWORD2(v24))
        v16 = (_QWORD)v25 == 0;
      else
        v16 = 1;
      if (!v16)
      {
        GEODefaultsKeyStringForConfigKey(SDWORD2(v24), v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = v9->_overrideURLs;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](v19, "setObject:forKey:", v18, v20);

        }
      }
    }
    v21 = v9;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  double v7;
  int v8;
  uint64_t v9;
  NSMapTable *overrideURLs;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOEnvironmentInfo name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("GEOResourceManifestEnvironment"));

  -[GEOEnvironmentInfo displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("displayName"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_uuid, CFSTR("uuid"));
  for (i = 0; i != 66; ++i)
  {
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    *(_QWORD *)&v7 = _recordForType(i, (uint64_t)&v15).n128_u64[0];
    v8 = DWORD2(v15);
    v9 = v16;
    overrideURLs = self->_overrideURLs;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](overrideURLs, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      GEODefaultsKeyStringForConfigKey(v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

    }
  }
  return v3;
}

- (void)save
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CustomEnvironments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("uuid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", self->_uuid))
        break;

      if (++v6 >= (unint64_t)objc_msgSend(v14, "count"))
        goto LABEL_5;
    }
    objc_msgSend(v14, "removeObjectAtIndex:", v6);
    -[GEOCustomEnvironmentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertObject:atIndex:", v9, v6);

  }
  else
  {
LABEL_5:
    -[GEOCustomEnvironmentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v7);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v14, CFSTR("CustomEnvironments"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronize");

  if (-[GEOCustomEnvironmentInfo isActive](self, "isActive"))
  {
    -[GEOCustomEnvironmentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _setValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1EDF4E858, v12, 1, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("GEOCountryConfigurationProvidersDidChangeNotification"), self, 0);

  }
}

- (void)delete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[GEOCustomEnvironmentInfo isActive](self, "isActive"))
  {
    _setValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1EDF4E858, 0, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("GEOCountryConfigurationProvidersDidChangeNotification"), self, 0);

  }
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("CustomEnvironments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uuid"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", self->_uuid))
        break;

      if (++v7 >= (unint64_t)objc_msgSend(v11, "count"))
        goto LABEL_9;
    }
    objc_msgSend(v11, "removeObjectAtIndex:", v7);

  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("CustomEnvironments"));

}

- (void)updateWithURLs:(id)a3
{
  NSMapTable *v4;
  NSMapTable *overrideURLs;

  v4 = (NSMapTable *)objc_msgSend(a3, "copy");
  overrideURLs = self->_overrideURLs;
  self->_overrideURLs = v4;

  -[GEOCustomEnvironmentInfo save](self, "save");
}

- (id)overrideURLs
{
  return self->_overrideURLs;
}

- (void)makeActive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[GEOEnvironmentInfo urlDictionary](self, "urlDictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  _setValue(GeoServicesConfig_DisableUpdatingActiveTileGroup, (uint64_t)off_1EDF4D548, 0, 0, 1);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("GEOVoltaireResourceManifestURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    _getValue(GeoServicesConfig_CustomEnvironmentURLFormat, (uint64_t)off_1EDF4CC28, 1, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      _setValue(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), v4, 1, 1);

      goto LABEL_6;
    }
  }
  _setValue(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), 0, 0, 1);
LABEL_6:
  _setValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88, 0, 0, 1);
  -[GEOCustomEnvironmentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _setValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1EDF4E858, v6, 1, 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("GEOCountryConfigurationProvidersDidChangeNotification"), self, 0);

  -[GEOEnvironmentInfo _performActivation](self, "_performActivation");
}

- (BOOL)isActive
{
  void *v3;
  void *v4;

  _getValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1EDF4E858, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isEqualToString:", self->_uuid);

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_overrideURLs, 0);
}

@end
