@implementation GEOThirdPartyLink

+ (id)thirdPartyLinkFromProto:(id)a3
{
  id *v3;
  id *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  GEOThirdPartyLink *v9;
  void *v10;
  GEOThirdPartyLink *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (id *)a3;
  v4 = v3;
  if (v3)
  {
    -[GEOPDThirdPartyLink _readAdamId]((uint64_t)v3);
    v5 = v4[3] != 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)MEMORY[0x1E0C99E98];
  -[GEOPDThirdPartyLink url](v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v8)
  {
    v9 = [GEOThirdPartyLink alloc];
    -[GEOPDThirdPartyLink adamId](v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[GEOThirdPartyLink initWithAdamID:url:](v9, "initWithAdamID:url:", v10, v8);

  }
  else
  {
    GEOGetCuratedCollectionsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (v5)
        v13 = "YES";
      else
        v13 = "NO";
      -[GEOPDThirdPartyLink url](v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315394;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Third party link could not be initialized because some data is missing.\nLink hasAdamID: %s, url: %@", (uint8_t *)&v16, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

- (GEOThirdPartyLink)initWithAdamID:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  GEOThirdPartyLink *v8;
  uint64_t v9;
  NSString *adamID;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOThirdPartyLink;
  v8 = -[GEOThirdPartyLink init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    adamID = v8->_adamID;
    v8->_adamID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_url, a4);
  }

  return v8;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
