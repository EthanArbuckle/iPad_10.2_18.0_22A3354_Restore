@implementation GKApplicationProxy

- (NSString)bundleVersion
{
  return (NSString *)-[LSApplicationProxy bundleVersion](self->_lsProxy, "bundleVersion");
}

- (NSString)bundleShortVersion
{
  return (NSString *)-[LSApplicationProxy shortVersionString](self->_lsProxy, "shortVersionString");
}

- (NSNumber)adamID
{
  void *v2;
  void *v3;

  -[GKApplicationProxy metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("itemId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)externalVersion
{
  void *v2;
  void *v3;

  -[GKApplicationProxy metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("softwareVersionExternalIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSBundle)bundle
{
  void *v3;
  void *v4;

  if (-[LSApplicationProxy foundBackingBundle](self->_lsProxy, "foundBackingBundle"))
  {
    -[GKApplicationProxy bundleURL](self, "bundleURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return (NSBundle *)v4;
}

- (NSDictionary)metadata
{
  NSDictionary *metadata;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;

  metadata = self->_metadata;
  if (!metadata)
  {
    -[LSApplicationProxy bundleURL](self->_lsProxy, "bundleURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("iTunesMetadata.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v6);
      v8 = self->_metadata;
      self->_metadata = v7;

    }
    metadata = self->_metadata;
  }
  return metadata;
}

- (id)bundleURL
{
  return (id)-[LSApplicationProxy bundleURL](self->_lsProxy, "bundleURL");
}

- (GKApplicationProxy)initWithBundleID:(id)a3
{
  void *v4;
  GKApplicationProxy *v5;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GKApplicationProxy initWithProxy:](self, "initWithProxy:", v4);

  return v5;
}

- (GKApplicationProxy)initWithProxy:(id)a3
{
  id v4;
  GKApplicationProxy *v5;
  GKApplicationProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKApplicationProxy;
  v5 = -[GKApplicationProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[GKApplicationProxy setLsProxy:](v5, "setLsProxy:", v4);

  return v6;
}

- (void)setLsProxy:(id)a3
{
  objc_storeStrong((id *)&self->_lsProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_lsProxy, 0);
}

+ (id)metadataForBundleURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("iTunesMetadata.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)bundleID
{
  return (NSString *)-[LSApplicationProxy applicationIdentifier](self->_lsProxy, "applicationIdentifier");
}

- (NSDate)purchaseDate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (purchaseDate_onceToken != -1)
    dispatch_once(&purchaseDate_onceToken, &__block_literal_global_44);
  -[GKApplicationProxy metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("purchaseDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.iTunesStore.downloadInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purchaseDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)purchaseDate_sDateFormatter, "dateFromString:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

    v4 = (void *)v6;
  }

  return (NSDate *)v4;
}

void __34__GKApplicationProxy_purchaseDate__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)purchaseDate_sDateFormatter;
  purchaseDate_sDateFormatter = (uint64_t)v0;

  objc_msgSend((id)purchaseDate_sDateFormatter, "setLocale:", v4);
  objc_msgSend((id)purchaseDate_sDateFormatter, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"));
  v2 = (void *)purchaseDate_sDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

- (BOOL)isRestricted
{
  void *v2;
  char v3;

  -[LSApplicationProxy appState](self->_lsProxy, "appState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestricted");

  return v3;
}

- (BOOL)isGameCenterEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[GKApplicationProxy metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("gameCenterEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isInstalled
{
  int v3;

  v3 = -[LSApplicationProxy foundBackingBundle](self->_lsProxy, "foundBackingBundle");
  if (v3)
    LOBYTE(v3) = -[LSApplicationProxy installType](self->_lsProxy, "installType") == 0;
  return v3;
}

- (LSApplicationProxy)lsProxy
{
  return self->_lsProxy;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

@end
