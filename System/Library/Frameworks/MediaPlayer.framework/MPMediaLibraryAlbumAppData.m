@implementation MPMediaLibraryAlbumAppData

- (MPMediaLibraryAlbumAppData)init
{
  MPMediaLibraryAlbumAppData *v2;
  MPMediaLibraryAlbumAppData *v3;
  NSDictionary *appDataDict;
  uint64_t v5;
  NSMutableDictionary *dirtyPopularityDict;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPMediaLibraryAlbumAppData;
  v2 = -[MPMediaLibraryAlbumAppData init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    appDataDict = v2->_appDataDict;
    v2->_appDataDict = 0;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    dirtyPopularityDict = v3->_dirtyPopularityDict;
    v3->_dirtyPopularityDict = (NSMutableDictionary *)v5;

  }
  return v3;
}

- (MPMediaLibraryAlbumAppData)initWithAppDataDictionary:(id)a3
{
  id v5;
  MPMediaLibraryAlbumAppData *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = -[MPMediaLibraryAlbumAppData init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("appDataDictionaryVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "intValue") == 2)
      objc_storeStrong((id *)&v6->_appDataDict, a3);

  }
  return v6;
}

- (void)setSongPopularity:(id)a3 forIdentifierSet:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "universalStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "adamID");

  if (!v8)
  {
    objc_msgSend(v6, "universalStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "purchasedAdamID");

    if (!v8)
    {
      objc_msgSend(v6, "universalStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "subscriptionAdamID");

    }
  }
  -[MPMediaLibraryAlbumAppData setSongPopularity:forAdamID:](self, "setSongPopularity:forAdamID:", v11, v8);

}

- (id)songPopularityForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryAlbumAppData songPopularityForAdamID:](self, "songPopularityForAdamID:", objc_msgSend(v5, "adamID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "universalStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryAlbumAppData songPopularityForAdamID:](self, "songPopularityForAdamID:", objc_msgSend(v7, "purchasedAdamID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v4, "universalStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaLibraryAlbumAppData songPopularityForAdamID:](self, "songPopularityForAdamID:", objc_msgSend(v8, "subscriptionAdamID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (void)setSongPopularity:(id)a3 forAdamID:(int64_t)a4
{
  void *v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = a3;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%lld"), a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_dirtyPopularityDict, "setObject:forKey:", v7, v8);

  }
}

- (id)songPopularityForAdamID:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_dirtyPopularityDict, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NSDictionary objectForKey:](self->_appDataDict, "objectForKey:", CFSTR("popularityDictionary"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)createAppDataDictionary
{
  NSDictionary *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *dirtyPopularityDict;
  NSDictionary *appDataDict;
  NSDictionary *v10;

  if (-[NSMutableDictionary count](self->_dirtyPopularityDict, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", &unk_1E31E47C8, CFSTR("appDataDictionaryVersion"));
    -[NSDictionary objectForKey:](self->_appDataDict, "objectForKey:", CFSTR("popularityDictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
      v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", self->_dirtyPopularityDict);
    }
    else
    {
      v5 = self->_dirtyPopularityDict;
    }
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v5, CFSTR("popularityDictionary"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    dirtyPopularityDict = self->_dirtyPopularityDict;
    self->_dirtyPopularityDict = v7;

    appDataDict = self->_appDataDict;
    self->_appDataDict = v3;
    v10 = v3;

    v6 = self->_appDataDict;
  }
  else
  {
    v6 = self->_appDataDict;
  }
  return v6;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyPopularityDict, 0);
  objc_storeStrong((id *)&self->_appDataDict, 0);
}

@end
