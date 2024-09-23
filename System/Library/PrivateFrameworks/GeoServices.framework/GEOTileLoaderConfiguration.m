@implementation GEOTileLoaderConfiguration

- (unint64_t)backpressureControlCountLimit
{
  return self->_backpressureControlCountLimit;
}

- (unint64_t)memoryCacheCountLimit
{
  return self->_memoryCacheCountLimit;
}

- (unint64_t)memoryCacheCostLimit
{
  return self->_memoryCacheCostLimit;
}

- (GEOResourceManifestConfiguration)manifestConfiguration
{
  return self->_manifestConfiguration;
}

- (Class)serverProxyClass
{
  return self->_serverProxyClass;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)diskCacheLocation
{
  return self->_diskCacheLocation;
}

- (NSString)diskCacheExternalLocation
{
  return self->_diskCacheExternalLocation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GEOTileLoaderConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[GEOTileLoaderConfiguration init](+[GEOTileLoaderConfiguration allocWithZone:](GEOTileLoaderConfiguration, "allocWithZone:", a3), "init");
  -[GEOTileLoaderConfiguration setServerProxyClass:](v4, "setServerProxyClass:", -[GEOTileLoaderConfiguration serverProxyClass](self, "serverProxyClass"));
  -[GEOTileLoaderConfiguration setMemoryCacheCountLimit:](v4, "setMemoryCacheCountLimit:", -[GEOTileLoaderConfiguration memoryCacheCountLimit](self, "memoryCacheCountLimit"));
  -[GEOTileLoaderConfiguration setMemoryCacheCostLimit:](v4, "setMemoryCacheCostLimit:", -[GEOTileLoaderConfiguration memoryCacheCostLimit](self, "memoryCacheCostLimit"));
  -[GEOTileLoaderConfiguration setBackpressureControlCountLimit:](v4, "setBackpressureControlCountLimit:", -[GEOTileLoaderConfiguration backpressureControlCountLimit](self, "backpressureControlCountLimit"));
  -[GEOTileLoaderConfiguration diskCacheLocation](self, "diskCacheLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileLoaderConfiguration setDiskCacheLocation:](v4, "setDiskCacheLocation:", v5);

  -[GEOTileLoaderConfiguration diskCacheExternalLocation](self, "diskCacheExternalLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileLoaderConfiguration setDiskCacheExternalLocation:](v4, "setDiskCacheExternalLocation:", v6);

  -[GEOTileLoaderConfiguration manifestConfiguration](self, "manifestConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileLoaderConfiguration setManifestConfiguration:](v4, "setManifestConfiguration:", v7);

  -[GEOTileLoaderConfiguration locale](self, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileLoaderConfiguration setLocale:](v4, "setLocale:", v8);

  return v4;
}

- (void)setServerProxyClass:(Class)a3
{
  self->_serverProxyClass = a3;
}

- (void)setMemoryCacheCountLimit:(unint64_t)a3
{
  self->_memoryCacheCountLimit = a3;
}

- (void)setMemoryCacheCostLimit:(unint64_t)a3
{
  self->_memoryCacheCostLimit = a3;
}

- (void)setDiskCacheLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setManifestConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_manifestConfiguration, a3);
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void)setDiskCacheExternalLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setBackpressureControlCountLimit:(unint64_t)a3
{
  self->_backpressureControlCountLimit = a3;
}

- (GEOTileLoaderConfiguration)init
{
  GEOTileLoaderConfiguration *v2;
  GEOResourceManifestConfiguration *v3;
  GEOResourceManifestConfiguration *manifestConfiguration;
  void *v5;
  uint64_t v6;
  NSString *diskCacheLocation;
  void *v8;
  uint64_t v9;
  NSString *diskCacheExternalLocation;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GEOTileLoaderConfiguration;
  v2 = -[GEOTileLoaderConfiguration init](&v12, sel_init);
  if (v2)
  {
    v2->_serverProxyClass = (Class)objc_opt_class();
    *(_OWORD *)&v2->_memoryCacheCountLimit = xmmword_189CC15D0;
    v2->_backpressureControlCountLimit = 50;
    v3 = objc_alloc_init(GEOResourceManifestConfiguration);
    manifestConfiguration = v2->_manifestConfiguration;
    v2->_manifestConfiguration = v3;

    +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    diskCacheLocation = v2->_diskCacheLocation;
    v2->_diskCacheLocation = (NSString *)v6;

    +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    diskCacheExternalLocation = v2->_diskCacheExternalLocation;
    v2->_diskCacheExternalLocation = (NSString *)v9;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_storeStrong((id *)&self->_diskCacheExternalLocation, 0);
  objc_storeStrong((id *)&self->_diskCacheLocation, 0);
}

@end
