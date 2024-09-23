@implementation GEOResourceManifestConfiguration

- (BOOL)isDefaultConfiguration
{
  return !self->_tileGroupIdentifier
      && !self->_os
      && !self->_osVersion
      && !self->_osBuild
      && !self->_countryCode
      && !self->_hardwareIdentifier
      && !self->_applicationIdentifier
      && !self->_applicationVersion
      && !self->_environment
      && !self->_dataDirectory
      && !self->_tileSetOverrides
      && self->_urlTemplate == 0;
}

- (id)dataDirectoryFor:(unint64_t)a3
{
  NSString *v5;
  NSString *dataDirectory;
  void *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (-[GEOResourceManifestConfiguration isDefaultConfiguration](self, "isDefaultConfiguration"))
  {
    +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", a3);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v5;
    return v7;
  }
  dataDirectory = self->_dataDirectory;
  if (dataDirectory)
  {
    v5 = dataDirectory;
    goto LABEL_5;
  }
  -[GEOResourceManifestConfiguration directorySuffix](self, "directorySuffix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v10)
  {
    objc_msgSend(v11, "stringByAppendingPathComponent:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }

  return v7;
}

+ (id)defaultConfiguration
{
  return objc_alloc_init(GEOResourceManifestConfiguration);
}

- (GEOResourceManifestConfiguration)init
{
  GEOResourceManifestConfiguration *v2;
  GEOResourceManifestConfiguration *v3;
  void *v4;
  double v5;
  int v6;
  GEOResourceManifestConfiguration *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOResourceManifestConfiguration;
  v2 = -[GEOResourceManifestConfiguration init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_tileGroupIdentifier = 0;
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceScreenScale");
    if (v5 <= 1.0)
      v6 = 1;
    else
      v6 = 2;
    if (v5 > 2.0)
      v6 = 3;
    v3->_defaultScale = v6;

    v7 = v3;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString **v5;
  NSString *os;
  NSString *osVersion;
  NSString *osBuild;
  NSString *countryCode;
  NSString *hardwareIdentifier;
  NSString *applicationIdentifier;
  NSString *applicationVersion;
  NSString *environment;
  NSString *dataDirectory;
  NSArray *tileSetOverrides;
  NSString *urlTemplate;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NSString **)v4;
    if (self->_tileGroupIdentifier != *((_DWORD *)v5 + 2))
      goto LABEL_27;
    os = self->_os;
    if (os != v5[2] && !-[NSString isEqualToString:](os, "isEqualToString:"))
      goto LABEL_27;
    osVersion = self->_osVersion;
    if (osVersion != v5[3] && !-[NSString isEqualToString:](osVersion, "isEqualToString:"))
      goto LABEL_27;
    osBuild = self->_osBuild;
    if (osBuild != v5[4] && !-[NSString isEqualToString:](osBuild, "isEqualToString:"))
      goto LABEL_27;
    countryCode = self->_countryCode;
    if (countryCode != v5[5] && !-[NSString isEqualToString:](countryCode, "isEqualToString:"))
      goto LABEL_27;
    if (((hardwareIdentifier = self->_hardwareIdentifier, hardwareIdentifier == v5[6])
       || -[NSString isEqualToString:](hardwareIdentifier, "isEqualToString:"))
      && ((applicationIdentifier = self->_applicationIdentifier, applicationIdentifier == v5[7])
       || -[NSString isEqualToString:](applicationIdentifier, "isEqualToString:"))
      && ((applicationVersion = self->_applicationVersion, applicationVersion == v5[8])
       || -[NSString isEqualToString:](applicationVersion, "isEqualToString:"))
      && ((environment = self->_environment, environment == v5[9])
       || -[NSString isEqualToString:](environment, "isEqualToString:"))
      && ((dataDirectory = self->_dataDirectory, dataDirectory == v5[10])
       || -[NSString isEqualToString:](dataDirectory, "isEqualToString:"))
      && ((tileSetOverrides = self->_tileSetOverrides, tileSetOverrides == (NSArray *)v5[12])
       || -[NSArray isEqualToArray:](tileSetOverrides, "isEqualToArray:"))
      && ((urlTemplate = self->_urlTemplate, urlTemplate == v5[13])
       || -[NSString isEqualToString:](urlTemplate, "isEqualToString:")))
    {
      v17 = 1;
    }
    else
    {
LABEL_27:
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTemplate, 0);
  objc_storeStrong((id *)&self->_tileSetOverrides, 0);
  objc_storeStrong((id *)&self->_dataDirectory, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_os, 0);
}

- (int)defaultScale
{
  return self->_defaultScale;
}

- (unsigned)tileGroupIdentifier
{
  return self->_tileGroupIdentifier;
}

- (NSString)urlTemplate
{
  NSString *urlTemplate;

  urlTemplate = self->_urlTemplate;
  if (urlTemplate)
    return urlTemplate;
  _GEOGetURLWithSource(1, 0, 1, 0);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)os
{
  NSString *os;

  os = self->_os;
  if (os)
    return os;
  else
    return (NSString *)CFSTR("ios");
}

- (NSString)osVersion
{
  NSString *osVersion;
  NSString *v3;
  void *v4;

  osVersion = self->_osVersion;
  if (osVersion)
  {
    v3 = osVersion;
  }
  else
  {
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "osVersion");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)osBuild
{
  NSString *osBuild;
  NSString *v3;
  void *v4;

  osBuild = self->_osBuild;
  if (osBuild)
  {
    v3 = osBuild;
  }
  else
  {
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buildVersion");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)manifestDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManifestConfiguration os](self, "os");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("os"));

  -[GEOResourceManifestConfiguration osVersion](self, "osVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("os_version"));

  -[GEOResourceManifestConfiguration osBuild](self, "osBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("os_build"));

  -[GEOResourceManifestConfiguration countryCode](self, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("country_code"));

  -[GEOResourceManifestConfiguration hardwareIdentifier](self, "hardwareIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hardware"));

  -[GEOResourceManifestConfiguration applicationIdentifier](self, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("application"));

  -[GEOResourceManifestConfiguration applicationVersion](self, "applicationVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("application_version"));

  return v3;
}

- (NSString)hardwareIdentifier
{
  NSString *hardwareIdentifier;
  NSString *v3;
  void *v4;

  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
  {
    v3 = hardwareIdentifier;
  }
  else
  {
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hardwareIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)environment
{
  NSString *environment;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  environment = self->_environment;
  if (environment)
  {
    v3 = environment;
  }
  else
  {
    _getValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1EDF4E858, 1, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("GEOResourceManifestEnvironment"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      _getValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88, 1, 0, 0, 0);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v3 = v7;

  }
  return v3;
}

- (NSString)countryCode
{
  NSString *countryCode;
  __CFString *v3;
  void *v4;
  uint64_t v5;

  countryCode = self->_countryCode;
  if (countryCode)
  {
    v3 = countryCode;
  }
  else
  {
    +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCode");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
      v3 = (__CFString *)v5;
    else
      v3 = CFSTR("unknown");
  }
  return (NSString *)v3;
}

- (NSString)applicationVersion
{
  if (self->_applicationVersion)
    return self->_applicationVersion;
  else
    return (NSString *)CFSTR("1");
}

- (NSString)applicationIdentifier
{
  if (self->_applicationIdentifier)
    return self->_applicationIdentifier;
  else
    return (NSString *)CFSTR("geod");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (GEOResourceManifestConfiguration)configurationWithPairedDevice:(id)a3
{
  id v3;
  GEOResourceManifestConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  int v17;
  uint64_t v18;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(GEOResourceManifestConfiguration);
    getNRDevicePropertySystemVersion();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForProperty:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceManifestConfiguration setOsVersion:](v4, "setOsVersion:", v6);

    getNRDevicePropertySystemBuildVersion();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForProperty:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceManifestConfiguration setOsBuild:](v4, "setOsBuild:", v8);

    getNRDevicePropertyProductType();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForProperty:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceManifestConfiguration setHardwareIdentifier:](v4, "setHardwareIdentifier:", v10);

    +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceManifestConfiguration directorySuffix](v4, "directorySuffix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceManifestConfiguration setDataDirectory:](v4, "setDataDirectory:", v13);

    -[GEOResourceManifestConfiguration setOs:](v4, "setOs:", CFSTR("watchos"));
    getNRDevicePropertyScreenScale();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForProperty:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    if (v16 <= 1.0)
      v17 = 1;
    else
      v17 = 2;
    if (v16 > 2.0)
      v17 = 3;
    v4->_defaultScale = v17;

    v18 = geoNRWatchOSVersionForRemoteDevice(v3);
    if ((geoNRVersionIsGreaterThanOrEqual(v18, 327680) & 1) == 0)
      v4->_requiresLegacyFormat = 1;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (GEOResourceManifestConfiguration)initWithCoder:(id)a3
{
  id v4;
  GEOResourceManifestConfiguration *v5;
  uint64_t v6;
  NSString *os;
  uint64_t v8;
  NSString *osVersion;
  uint64_t v10;
  NSString *osBuild;
  uint64_t v12;
  NSString *countryCode;
  uint64_t v14;
  NSString *hardwareIdentifier;
  uint64_t v16;
  NSString *applicationIdentifier;
  uint64_t v18;
  NSString *applicationVersion;
  uint64_t v20;
  NSString *environment;
  uint64_t v22;
  NSString *dataDirectory;
  void *v24;
  double v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *tileSetOverrides;
  uint64_t v32;
  NSString *urlTemplate;
  GEOResourceManifestConfiguration *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)GEOResourceManifestConfiguration;
  v5 = -[GEOResourceManifestConfiguration init](&v36, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("tgi")))
      v5->_tileGroupIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("tgi"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("os"));
    v6 = objc_claimAutoreleasedReturnValue();
    os = v5->_os;
    v5->_os = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osv"));
    v8 = objc_claimAutoreleasedReturnValue();
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osb"));
    v10 = objc_claimAutoreleasedReturnValue();
    osBuild = v5->_osBuild;
    v5->_osBuild = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cc"));
    v12 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hw"));
    v14 = objc_claimAutoreleasedReturnValue();
    hardwareIdentifier = v5->_hardwareIdentifier;
    v5->_hardwareIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("app"));
    v16 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appv"));
    v18 = objc_claimAutoreleasedReturnValue();
    applicationVersion = v5->_applicationVersion;
    v5->_applicationVersion = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("env"));
    v20 = objc_claimAutoreleasedReturnValue();
    environment = v5->_environment;
    v5->_environment = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("datadir"));
    v22 = objc_claimAutoreleasedReturnValue();
    dataDirectory = v5->_dataDirectory;
    v5->_dataDirectory = (NSString *)v22;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mnscl")))
    {
      v5->_defaultScale = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mnscl"));
    }
    else
    {
      +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "deviceScreenScale");
      if (v25 <= 1.0)
        v26 = 1;
      else
        v26 = 2;
      if (v25 > 2.0)
        v26 = 3;
      v5->_defaultScale = v26;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rlf")))
      v5->_requiresLegacyFormat = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("rlf"));
    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("tileSetOverrides"));
    v30 = objc_claimAutoreleasedReturnValue();
    tileSetOverrides = v5->_tileSetOverrides;
    v5->_tileSetOverrides = (NSArray *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlTemplate"));
    v32 = objc_claimAutoreleasedReturnValue();
    urlTemplate = v5->_urlTemplate;
    v5->_urlTemplate = (NSString *)v32;

    v34 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t tileGroupIdentifier;
  NSString *os;
  NSString *osVersion;
  NSString *osBuild;
  NSString *countryCode;
  NSString *hardwareIdentifier;
  NSString *applicationIdentifier;
  NSString *applicationVersion;
  NSString *environment;
  NSString *dataDirectory;
  NSArray *tileSetOverrides;
  NSString *urlTemplate;
  void *v17;
  id v18;

  v4 = a3;
  tileGroupIdentifier = self->_tileGroupIdentifier;
  v18 = v4;
  if ((_DWORD)tileGroupIdentifier)
  {
    objc_msgSend(v4, "encodeInt32:forKey:", tileGroupIdentifier, CFSTR("tgi"));
    v4 = v18;
  }
  os = self->_os;
  if (os)
  {
    objc_msgSend(v18, "encodeObject:forKey:", os, CFSTR("os"));
    v4 = v18;
  }
  osVersion = self->_osVersion;
  if (osVersion)
  {
    objc_msgSend(v18, "encodeObject:forKey:", osVersion, CFSTR("osv"));
    v4 = v18;
  }
  osBuild = self->_osBuild;
  if (osBuild)
  {
    objc_msgSend(v18, "encodeObject:forKey:", osBuild, CFSTR("osb"));
    v4 = v18;
  }
  countryCode = self->_countryCode;
  if (countryCode)
  {
    objc_msgSend(v18, "encodeObject:forKey:", countryCode, CFSTR("cc"));
    v4 = v18;
  }
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
  {
    objc_msgSend(v18, "encodeObject:forKey:", hardwareIdentifier, CFSTR("hw"));
    v4 = v18;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
  {
    objc_msgSend(v18, "encodeObject:forKey:", applicationIdentifier, CFSTR("app"));
    v4 = v18;
  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion)
  {
    objc_msgSend(v18, "encodeObject:forKey:", applicationVersion, CFSTR("appv"));
    v4 = v18;
  }
  environment = self->_environment;
  if (environment)
  {
    objc_msgSend(v18, "encodeObject:forKey:", environment, CFSTR("env"));
    v4 = v18;
  }
  dataDirectory = self->_dataDirectory;
  if (dataDirectory)
  {
    objc_msgSend(v18, "encodeObject:forKey:", dataDirectory, CFSTR("datadir"));
    v4 = v18;
  }
  objc_msgSend(v4, "encodeInt32:forKey:", self->_defaultScale, CFSTR("mnscl"));
  if (self->_requiresLegacyFormat)
    objc_msgSend(v18, "encodeBool:forKey:", 1, CFSTR("rlf"));
  tileSetOverrides = self->_tileSetOverrides;
  if (tileSetOverrides)
    objc_msgSend(v18, "encodeObject:forKey:", tileSetOverrides, CFSTR("tileSetOverrides"));
  urlTemplate = self->_urlTemplate;
  v17 = v18;
  if (urlTemplate)
  {
    objc_msgSend(v18, "encodeObject:forKey:", urlTemplate, CFSTR("urlTemplate"));
    v17 = v18;
  }

}

- (id)_directorySuffixParameters
{
  void *v3;
  void *v4;
  NSString *os;
  NSString *osVersion;
  NSString *osBuild;
  NSString *countryCode;
  NSString *hardwareIdentifier;
  NSString *applicationIdentifier;
  NSString *applicationVersion;
  NSString *environment;
  NSString *dataDirectory;
  void *v14;
  NSArray *tileSetOverrides;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSString *urlTemplate;
  void *v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_tileGroupIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("tgi"));

  }
  os = self->_os;
  if (os)
    objc_msgSend(v3, "setObject:forKey:", os, CFSTR("os"));
  osVersion = self->_osVersion;
  if (osVersion)
    objc_msgSend(v3, "setObject:forKey:", osVersion, CFSTR("osv"));
  osBuild = self->_osBuild;
  if (osBuild)
    objc_msgSend(v3, "setObject:forKey:", osBuild, CFSTR("osb"));
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v3, "setObject:forKey:", countryCode, CFSTR("cc"));
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
    objc_msgSend(v3, "setObject:forKey:", hardwareIdentifier, CFSTR("hw"));
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", applicationIdentifier, CFSTR("app"));
  applicationVersion = self->_applicationVersion;
  if (applicationVersion)
    objc_msgSend(v3, "setObject:forKey:", applicationVersion, CFSTR("appv"));
  environment = self->_environment;
  if (environment)
    objc_msgSend(v3, "setObject:forKey:", environment, CFSTR("env"));
  dataDirectory = self->_dataDirectory;
  if (dataDirectory)
    objc_msgSend(v3, "setObject:forKey:", dataDirectory, CFSTR("datadir"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_defaultScale);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("mnscl"));

  if (self->_requiresLegacyFormat)
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("rlf"));
  tileSetOverrides = self->_tileSetOverrides;
  if (tileSetOverrides)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = tileSetOverrides;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v16);
          v19 ^= objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "hash", (_QWORD)v28);
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v18);
    }
    else
    {
      v19 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("tso"));

  }
  urlTemplate = self->_urlTemplate;
  if (urlTemplate)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSString hash](urlTemplate, "hash"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("urltmp"));

  }
  if (objc_msgSend(v3, "count", (_QWORD)v28))
    v25 = v3;
  else
    v25 = 0;
  v26 = v25;

  return v26;
}

- (unint64_t)hash
{
  uint64_t tileGroupIdentifier;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;

  tileGroupIdentifier = self->_tileGroupIdentifier;
  v4 = -[NSString hash](self->_os, "hash") ^ tileGroupIdentifier;
  v5 = -[NSString hash](self->_osVersion, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_osBuild, "hash");
  v7 = -[NSString hash](self->_countryCode, "hash");
  v8 = v7 ^ -[NSString hash](self->_hardwareIdentifier, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_applicationIdentifier, "hash");
  v10 = -[NSString hash](self->_applicationVersion, "hash");
  v11 = v10 ^ -[NSString hash](self->_environment, "hash");
  v12 = v11 ^ -[NSString hash](self->_dataDirectory, "hash");
  v13 = v9 ^ v12 ^ -[NSArray hash](self->_tileSetOverrides, "hash");
  return v13 ^ -[NSString hash](self->_urlTemplate, "hash");
}

- (NSString)directorySuffix
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[GEOResourceManifestConfiguration _directorySuffixParameters](self, "_directorySuffixParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_460);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 1;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("datadir")) & 1) == 0
            && (objc_msgSend(v12, "isEqualToString:", CFSTR("mnscl")) & 1) == 0)
          {
            if ((v9 & 1) == 0)
              objc_msgSend(v5, "appendFormat:", CFSTR("."));
            objc_msgSend(v2, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "appendFormat:", CFSTR("%@_%@"), v12, v13, (_QWORD)v15);

            v9 = 0;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

uint64_t __51__GEOResourceManifestConfiguration_directorySuffix__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setDataDirectory:(id)a3
{
  NSString *v4;
  NSString *dataDirectory;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  dataDirectory = self->_dataDirectory;
  self->_dataDirectory = v4;

}

- (void)setTileSetOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_tileSetOverrides, a3);
}

- (NSArray)tileSetOverrides
{
  NSArray *tileSetOverrides;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _GEOResourceManifestTileSetOverride *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  tileSetOverrides = self->_tileSetOverrides;
  if (tileSetOverrides)
    return tileSetOverrides;
  _getValue(GeoServicesConfig_ActiveTileGroupOverrides, (uint64_t)off_1EDF4D538, 1, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v5;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKey:", CFSTR("style"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "intValue");

          objc_msgSend(v10, "objectForKey:", CFSTR("size"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "intValue");

          objc_msgSend(v10, "objectForKey:", CFSTR("scale"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "intValue");

          objc_msgSend(v10, "objectForKey:", CFSTR("version"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", CFSTR("baseURL"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", CFSTR("localizationURL"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[_GEOResourceManifestTileSetOverride initWithStyle:size:scale:]([_GEOResourceManifestTileSetOverride alloc], "initWithStyle:size:scale:", v12, v14, v16);
          -[_GEOResourceManifestTileSetOverride setVersion:](v20, "setVersion:", v17);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_GEOResourceManifestTileSetOverride setBaseURL:](v20, "setBaseURL:", v21);

          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_GEOResourceManifestTileSetOverride setLocalizationURL:](v20, "setLocalizationURL:", v22);

          objc_msgSend(v25, "addObject:", v20);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v7);
    }

    v5 = v23;
  }
  else
  {
    v25 = (id)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v25;
}

- (void)setTileGroupIdentifier:(unsigned int)a3
{
  self->_tileGroupIdentifier = a3;
}

- (void)setOs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setOsBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHardwareIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setApplicationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setUrlTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)requiresLegacyFormat
{
  return self->_requiresLegacyFormat;
}

@end
