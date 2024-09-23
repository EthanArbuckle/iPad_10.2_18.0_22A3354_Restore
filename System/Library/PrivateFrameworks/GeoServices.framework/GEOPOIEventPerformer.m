@implementation GEOPOIEventPerformer

+ (id)poiEventPerformersForPerformers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOPOIEventPerformer *v11;
  GEOPOIEventPerformer *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v11 = [GEOPOIEventPerformer alloc];
          v12 = -[GEOPOIEventPerformer initWithPerformer:](v11, "initWithPerformer:", v10, (_QWORD)v14);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOPOIEventPerformer)initWithPerformer:(id)a3
{
  id *v4;
  GEOPOIEventPerformer *v5;
  void *v6;
  uint64_t v7;
  NSString *localizedName;
  uint64_t v9;
  NSString *iTunesIdentifier;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURL *iTunesURL;
  objc_super v16;

  v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOPOIEventPerformer;
  v5 = -[GEOPOIEventPerformer init](&v16, sel_init);
  if (v5)
  {
    -[GEOPDPerformer name](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v7;

    -[GEOPDPerformer itunesId](v4);
    v9 = objc_claimAutoreleasedReturnValue();
    iTunesIdentifier = v5->_iTunesIdentifier;
    v5->_iTunesIdentifier = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0C99E98];
    -[GEOPDPerformer itunesUrl](v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    iTunesURL = v5->_iTunesURL;
    v5->_iTunesURL = (NSURL *)v13;

  }
  return v5;
}

- (GEOPOIEventPerformer)initWithCoder:(id)a3
{
  id v4;
  GEOPOIEventPerformer *v5;
  uint64_t v6;
  NSString *localizedName;
  uint64_t v8;
  NSString *iTunesIdentifier;
  uint64_t v10;
  NSURL *iTunesURL;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPOIEventPerformer;
  v5 = -[GEOPOIEventPerformer init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPOIEventPerformerLocalizedNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPOIEventPerformeriTunesIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    iTunesIdentifier = v5->_iTunesIdentifier;
    v5->_iTunesIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPOIEventPerformeriTunesURLKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    iTunesURL = v5->_iTunesURL;
    v5->_iTunesURL = (NSURL *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedName;
  id v5;

  localizedName = self->_localizedName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedName, CFSTR("GEOPOIEventPerformerLocalizedNameKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iTunesIdentifier, CFSTR("GEOPOIEventPerformeriTunesIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iTunesURL, CFSTR("GEOPOIEventPerformeriTunesURLKey"));

}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (NSString)iTunesIdentifier
{
  return self->_iTunesIdentifier;
}

- (void)setITunesIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesIdentifier, a3);
}

- (NSURL)iTunesURL
{
  return self->_iTunesURL;
}

- (void)setITunesURL:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesURL, 0);
  objc_storeStrong((id *)&self->_iTunesIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
