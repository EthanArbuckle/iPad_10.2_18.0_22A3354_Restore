@implementation MPStoreItemMovieClipAsset

- (MPStoreItemMovieClipAsset)initWithLookupDictionary:(id)a3
{
  id v5;
  MPStoreItemMovieClipAsset *v6;
  MPStoreItemMovieClipAsset *v7;

  v5 = a3;
  v6 = -[MPStoreItemMovieClipAsset init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lookupDictionary, a3);

  return v7;
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

- (NSString)flavor
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("flavor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSURL)hlsURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("hlsUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)url
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSDictionary)lookupDictionary
{
  return self->_lookupDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupDictionary, 0);
}

@end
