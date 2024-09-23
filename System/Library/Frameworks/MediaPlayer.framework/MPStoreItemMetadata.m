@implementation MPStoreItemMetadata

- (unint64_t)cloudID
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("sagaId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)cloudAlbumID
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("libraryAlbumId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (id)artistStoreID
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("artistId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("artistId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSArray)formerStoreAdamIDs
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("formerIds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v13 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (_NSIsNSNumber())
            {
              v10 = v9;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
              v10 = (id)objc_claimAutoreleasedReturnValue();
            }
            v11 = v10;
            objc_msgSend(v3, "addObject:", v10);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    v2 = v13;
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSString)versionHash
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("versionHash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (int64_t)purchasedAdamID
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("purchasedAdamId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3
{
  return -[MPStoreItemMetadata initWithStorePlatformDictionary:expirationDate:](self, "initWithStorePlatformDictionary:expirationDate:", a3, 0);
}

- (id)_fetchValueFromStoreMusicAPIDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSDictionary valueForKeyPath:](self->_storeMusicAPIDictionary, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSDictionary objectForKey:](self->_storeMusicAPIDictionary, "objectForKey:", CFSTR("attributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSDictionary()
      || (objc_msgSend(v6, "valueForKeyPath:", v4), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[NSDictionary objectForKey:](self->_storeMusicAPIDictionary, "objectForKey:", CFSTR("relationships"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        objc_msgSend(v7, "valueForKeyPath:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
  }

  return v5;
}

- (NSString)name
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("title"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("itemName"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("name"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)shortEditorNotes
{
  void *v3;
  uint64_t v4;

  -[MPStoreItemMetadata editorNotesWithStyle:](self, "editorNotesWithStyle:", CFSTR("short"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[MPStoreItemMetadata editorNotesWithStyle:](self, "editorNotesWithStyle:", CFSTR("standard"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (NSString)editorNotes
{
  void *v3;
  uint64_t v4;

  -[MPStoreItemMetadata editorNotesWithStyle:](self, "editorNotesWithStyle:", CFSTR("standard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[MPStoreItemMetadata editorNotesWithStyle:](self, "editorNotesWithStyle:", CFSTR("short"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (id)editorNotesWithStyle:(id)a3
{
  id v4;
  NSDictionary *storePlatformDictionary;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (!v4)
  {
    v9 = 0;
    goto LABEL_20;
  }
  storePlatformDictionary = self->_storePlatformDictionary;
  if (storePlatformDictionary)
  {
    -[NSDictionary objectForKey:](storePlatformDictionary, "objectForKey:", CFSTR("itunesNotes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("editorialNotes"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;

    if (_NSIsNSDictionary())
    {
      objc_msgSend(v10, "objectForKey:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v11 = _NSIsNSString();

      if (v11)
      {
        if (v9)
          goto LABEL_20;
        goto LABEL_13;
      }
      v10 = v9;
    }

  }
LABEL_13:
  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("editorialNotes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v12, "objectForKey:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v9 = v13;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
    v13 = v12;
  }

LABEL_20:
  return v9;
}

- (NSString)shortName
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("shortName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSString)iTunesBrandType
{
  void *v2;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("iTunesBrandType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isExplicitContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("contentRatingsBySystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSDictionary())
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("value"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "integerValue") > 499;

    }
    else
    {
      v7 = 0;
    }

    LOBYTE(v9) = v7;
  }
  else
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("explicit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(v8, "BOOLValue");
    else
      v9 = 0;
    if (self->_storeMusicAPIDictionary)
    {
      -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("contentRating"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        v9 |= objc_msgSend(v10, "isEqualToString:", CFSTR("explicit"));

    }
  }

  return v9;
}

- (BOOL)isMasteredForiTunes
{
  void *v3;
  char v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isMasteredForItunes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("isMasteredForItunes"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("isMasteredForItunes"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v3 = (void *)MEMORY[0x1E0C9AAA0];
  }
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isVerifiedPerson
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isVerified"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v2 = (void *)MEMORY[0x1E0C9AAA0];
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isPrivatePerson
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isPrivate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v2 = (void *)MEMORY[0x1E0C9AAA0];
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isOnboardedPerson
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isOnboarded"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && _NSIsNSNumber())
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (NSString)handle
{
  void *v2;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("handle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)hasCredits
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("hasCredits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)radioStationTypeID
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("radioStationTypeId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)radioStationSubtype
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("streamingRadioSubType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_storeMusicAPIDictionary, "objectForKey:", CFSTR("streamingRadioSubType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)radioStationProviderName
{
  void *v2;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("stationProviderName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSArray)radioStationEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  MPRadioStationEvent *v14;
  MPRadioStationEvent *v15;
  id v16;
  void *v18;
  id obj;
  void *v20;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MPStoreItemMetadata _musicAPIDateFormatter](self, "_musicAPIDateFormatter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("relationships"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSDictionary() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("events"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSDictionary() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("data"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSArray() & 1) != 0)
      {
        v18 = v4;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        obj = v6;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v24;
          v10 = MEMORY[0x1E0C809B0];
          do
          {
            for (i = 0; i != v8; ++i)
            {
              v12 = v3;
              if (*(_QWORD *)v24 != v9)
                objc_enumerationMutation(obj);
              v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              v14 = [MPRadioStationEvent alloc];
              v21[0] = v10;
              v21[1] = 3221225472;
              v21[2] = __41__MPStoreItemMetadata_radioStationEvents__block_invoke;
              v21[3] = &unk_1E31536F0;
              v21[4] = v13;
              v22 = v20;
              v15 = -[MPRadioStationEvent initWithBlock:](v14, "initWithBlock:", v21);
              v3 = v12;
              objc_msgSend(v12, "addObject:", v15);

            }
            v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v8);
        }

        v16 = (id)objc_msgSend(v3, "copy");
        v4 = v18;
      }
      else
      {
        v16 = v3;
      }

    }
    else
    {
      v16 = v3;
    }

  }
  else
  {
    v16 = v3;
  }

  return (NSArray *)v16;
}

- (id)_musicAPIDateFormatter
{
  if (_musicAPIDateFormatter_sOnceToken != -1)
    dispatch_once(&_musicAPIDateFormatter_sOnceToken, &__block_literal_global_400);
  return (id)_musicAPIDateFormatter_sMusicAPIDateFormatter;
}

- (BOOL)isExpired
{
  void *v2;
  id v3;
  BOOL v4;

  -[MPStoreItemMetadata expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v4 = objc_msgSend(v2, "compare:", v3) == -1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSDate)expirationDate
{
  NSDate *expirationDate;

  expirationDate = self->_expirationDate;
  if (expirationDate)
    return expirationDate;
  -[MPStoreItemMetadata expirationDate](self->_parentStoreItemMetadata, "expirationDate");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)metadataByAppendingMetadata:(id)a3
{
  id v4;
  MPStoreItemMetadata *v5;
  MPStoreItemMetadata *v6;
  MPStoreItemMetadata *v7;
  MPStoreItemMetadata *v8;
  MPStoreItemMetadata *parentStoreItemMetadata;
  MPStoreItemMetadata *v10;
  MPStoreItemMetadata *v11;
  NSArray *v12;
  char v13;
  NSDictionary *v14;
  NSDictionary *storePlatformDictionary;
  NSDictionary *v16;
  NSDictionary *v17;
  NSDictionary *v18;
  NSDictionary *downloadAssetDictionary;
  NSDictionary *v20;
  NSDictionary *v21;
  uint64_t v22;
  NSDate *v23;
  NSDate *v24;
  NSDate *v25;
  NSDate *v26;
  NSDate *expirationDate;
  MPStoreItemMetadata *v29;

  v4 = a3;
  v5 = self;
  if (v4)
  {
    v6 = (MPStoreItemMetadata *)v4;
    v7 = v6;
    if (v5->_downloadAssetDictionary && !v6->_downloadAssetDictionary)
    {

      v8 = v5;
    }
    else
    {
      v8 = v6;
      v7 = v5;
    }
    parentStoreItemMetadata = v8->_parentStoreItemMetadata;
    if (!parentStoreItemMetadata)
      parentStoreItemMetadata = v7->_parentStoreItemMetadata;
    v10 = parentStoreItemMetadata;
    v11 = v8;
    if (v8->_hasOverrideChildStorePlatformDictionaries || (v11 = v7, v7->_hasOverrideChildStorePlatformDictionaries))
    {
      v12 = v11->_overrideChildStorePlatformDictionaries;
      v13 = 1;
    }
    else
    {
      v13 = 0;
      v12 = 0;
    }
    v14 = v7->_storePlatformDictionary;
    storePlatformDictionary = v8->_storePlatformDictionary;
    v29 = v10;
    if (v14)
    {
      v16 = v14;
      if (storePlatformDictionary)
      {
        v17 = (NSDictionary *)-[NSDictionary mutableCopy](v14, "mutableCopy");

        -[NSDictionary addEntriesFromDictionary:](v17, "addEntriesFromDictionary:", v8->_storePlatformDictionary);
        v16 = v17;
      }
    }
    else
    {
      v16 = storePlatformDictionary;
    }
    v18 = v7->_downloadAssetDictionary;
    downloadAssetDictionary = v8->_downloadAssetDictionary;
    if (v18)
    {
      v20 = v18;
      if (downloadAssetDictionary)
      {
        v21 = (NSDictionary *)-[NSDictionary mutableCopy](v18, "mutableCopy");

        -[NSDictionary addEntriesFromDictionary:](v21, "addEntriesFromDictionary:", v8->_downloadAssetDictionary);
        v20 = v21;
      }
    }
    else
    {
      v20 = downloadAssetDictionary;
    }
    v22 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDownloadAssetDictionary:", v20);
    v5 = (MPStoreItemMetadata *)v22;
    if (v22)
    {
      *(_BYTE *)(v22 + 40) = v13;
      objc_storeStrong((id *)(v22 + 56), v12);
      objc_storeStrong((id *)&v5->_parentStoreItemMetadata, parentStoreItemMetadata);
      objc_storeStrong((id *)&v5->_storePlatformDictionary, v16);
      v23 = v8->_expirationDate;
      v24 = v7->_expirationDate;
      v25 = v24;
      if (v23 && v24)
      {
        -[NSDate earlierDate:](v23, "earlierDate:", v24);
        v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      else if (v23)
      {
        v26 = v23;
      }
      else
      {
        v26 = v24;
      }
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = v26;

    }
  }

  return v5;
}

- (MPStoreItemMetadata)initWithDownloadAssetDictionary:(id)a3
{
  id v4;
  MPStoreItemMetadata *v5;
  uint64_t v6;
  NSDictionary *downloadAssetDictionary;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPStoreItemMetadata;
  v5 = -[MPStoreItemMetadata init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    downloadAssetDictionary = v5->_downloadAssetDictionary;
    v5->_downloadAssetDictionary = (NSDictionary *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("metadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
      objc_storeStrong((id *)&v5->_downloadMetadataDictionary, v8);

  }
  return v5;
}

- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  MPStoreItemMetadata *v8;
  uint64_t v9;
  NSDate *expirationDate;
  uint64_t v11;
  NSDictionary *storePlatformDictionary;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPStoreItemMetadata;
  v8 = -[MPStoreItemMetadata init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v9;

    v11 = objc_msgSend(v6, "copy");
    storePlatformDictionary = v8->_storePlatformDictionary;
    v8->_storePlatformDictionary = (NSDictionary *)v11;

  }
  return v8;
}

- (id)artworkRequestTokenForEditorialArtworkKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("editorialArtwork"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v5, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC070]), "initWithArtworkResponseDictionary:", v6);
        if (v7)
        {
          +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:](MPStoreArtworkRequestToken, "tokenWithImageArtworkInfo:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setSourceEditorialArtworkKind:", v4);
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MPStoreArtworkRequestToken)artworkRequestToken
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!self->_storePlatformDictionary
    || (-[MPStoreItemMetadata artworkRequestTokenForStorePlatformDictionary:](self, "artworkRequestTokenForStorePlatformDictionary:"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[MPStoreItemMetadata artworkRequestTokenForStorePlatformDictionary:](self, "artworkRequestTokenForStorePlatformDictionary:", self->_downloadAssetDictionary);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[NSDictionary objectForKey:](self->_downloadAssetDictionary, "objectForKey:", CFSTR("artworkURL"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString()
        && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v6 = (void *)v5;
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC070]), "initWithArtworkURL:", v5);
        +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:](MPStoreArtworkRequestToken, "tokenWithImageArtworkInfo:", v7);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (v3)
          return (MPStoreArtworkRequestToken *)v3;
      }
      else
      {

      }
      -[MPStoreItemMetadata artworkRequestTokenForStoreMusicAPIDictionary](self, "artworkRequestTokenForStoreMusicAPIDictionary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        -[MPStoreItemMetadata artworkRequestToken](self->_parentStoreItemMetadata, "artworkRequestToken");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return (MPStoreArtworkRequestToken *)v3;
}

- (id)artworkRequestTokenForStorePlatformDictionary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("artwork"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "artworkRequestTokenForStorePlatformArtworkValue:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)artworkRequestTokenForStorePlatformArtworkValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (_NSIsNSArray())
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDC070]), "initWithArtworkResponseArray:", v3);
  }
  else
  {
    if (!_NSIsNSDictionary())
    {
      v5 = 0;
      goto LABEL_8;
    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDC070]), "initWithArtworkResponseDictionary:", v3);
  }
  v5 = (void *)v4;
  if (!v4)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:](MPStoreArtworkRequestToken, "tokenWithImageArtworkInfo:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v6;
}

- (int64_t)trackCount
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("trackCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("trackCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = v4;
    }
    else
    {
      -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("children"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("trackCount"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  v7 = objc_msgSend(v3, "integerValue");

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentStoreItemMetadata, 0);
  objc_storeStrong((id *)&self->_storePlatformDictionary, 0);
  objc_storeStrong((id *)&self->_overrideChildStorePlatformDictionaries, 0);
  objc_storeStrong((id *)&self->_hasSubscriptionOffer, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_storeMusicAPIDictionary, 0);
  objc_storeStrong((id *)&self->_downloadMetadataDictionary, 0);
  objc_storeStrong((id *)&self->_downloadAssetDictionary, 0);
}

- (int64_t)subscriptionAdamID
{
  void *v3;
  int64_t v4;
  void *v5;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("subscribedAdamID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "longLongValue");
  }
  else if (-[MPStoreItemMetadata hasSubscriptionOffer](self, "hasSubscriptionOffer"))
  {
    -[MPStoreItemMetadata storeID](self, "storeID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v5);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)itemKind
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("kind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("kind"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("music-video")) & 1) != 0)
    {
      v4 = CFSTR("musicVideo");
    }
    else
    {
      if (v3)
        goto LABEL_11;
      -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("playParams"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_NSIsNSDictionary()
        || (objc_msgSend(v3, "objectForKey:", CFSTR("kind")), (v5 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("kind"));
        v5 = objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("type"));
          v5 = objc_claimAutoreleasedReturnValue();
        }
      }
      v4 = (const __CFString *)v5;
    }

    v3 = (void *)v4;
  }
LABEL_11:
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)artistUploadedContentType
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("aucType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("aucType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)cacheableItemIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[MPStoreItemMetadata cloudUniversalLibraryID](self, "cloudUniversalLibraryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MPStoreItemMetadataStringNormalizeStoreIDValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[MPStoreItemMetadata storeID](self, "storeID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MPStoreItemMetadataStringNormalizeStoreIDValue(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v5 = v7;
    }
    else
    {
      -[MPStoreItemMetadata socialProfileID](self, "socialProfileID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MPStoreItemMetadataStringNormalizeStoreIDValue(v8);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (v5)
        v9 = v5;

    }
  }

  return (NSString *)v5;
}

- (id)storeID
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("itemId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("id"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("playParams"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSDictionary())
        {
          objc_msgSend(v4, "objectForKey:", CFSTR("id"));
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v3 = 0;
        }

      }
    }
  }
  return v3;
}

- (NSString)cloudUniversalLibraryID
{
  void *v3;
  void *v4;
  id v5;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("libraryTrackId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("libraryPlaylistId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_NSIsNSString() & 1) != 0)
    {
      v3 = v4;
    }
    else
    {
      -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("id"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!_NSIsNSString())
      {
        v5 = 0;
        goto LABEL_6;
      }
    }
  }
  v5 = v3;
  v3 = v5;
LABEL_6:

  return (NSString *)v5;
}

- (NSArray)childStoreItemMetadatas
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  MPStoreItemMetadata *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MPStoreItemMetadata childrenStoreIDs](self, "childrenStoreIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("relationships.tracks.data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        -[MPStoreItemMetadata childStorePlatformDictionaryForStoreID:](self, "childStorePlatformDictionaryForStoreID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = [MPStoreItemMetadata alloc];
          if (v4)
            v13 = -[MPStoreItemMetadata initWithStoreMusicAPIDictionary:parentStoreItemMetadata:](v12, "initWithStoreMusicAPIDictionary:parentStoreItemMetadata:", v11, self);
          else
            v13 = -[MPStoreItemMetadata initWithStorePlatformDictionary:parentStoreItemMetadata:](v12, "initWithStorePlatformDictionary:parentStoreItemMetadata:", v11, self);
          v14 = (void *)v13;
          if (v13)
          {
            if (!v8)
              v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
            objc_msgSend(v8, "addObject:", v14);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return (NSArray *)v8;
}

- (NSArray)childrenStoreIDs
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_hasOverrideChildStorePlatformDictionaries)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v3 = self->_overrideChildStorePlatformDictionaries;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "objectForKey:", CFSTR("id"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            if (!v6)
              v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v6, "addObject:", v9);
          }

        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }
LABEL_29:

    return (NSArray *)v6;
  }
  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("childrenIds"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSArray() & 1) == 0)
  {

LABEL_19:
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("relationships.tracks.data"));
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v3, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = v3;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("id"), (_QWORD)v18);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v16);

          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v13);
      }

    }
    v6 = (id)objc_msgSend(v10, "copy", (_QWORD)v18);

    goto LABEL_29;
  }
  if (!v6)
    goto LABEL_19;
  return (NSArray *)v6;
}

- (NSDictionary)importableStorePlatformDictionary
{
  void *v2;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (self->_storeMusicAPIDictionary)
  {
    v2 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    -[MPStoreItemMetadata effectiveStorePlatformDictionary](self, "effectiveStorePlatformDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v5;
    if (self->_parentStoreItemMetadata)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[MPStoreItemMetadata effectiveStorePlatformDictionary](self->_parentStoreItemMetadata, "effectiveStorePlatformDictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("artwork"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)objc_msgSend(v2, "mutableCopy");
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("artwork"));
          v10 = objc_msgSend(v9, "copy");

          v2 = (void *)v10;
        }

      }
    }
  }
  return (NSDictionary *)v2;
}

- (NSDictionary)effectiveStorePlatformDictionary
{
  NSDictionary *storePlatformDictionary;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  int64_t v29;
  void *v30;
  int64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  int64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int64_t v53;
  void *v54;
  int64_t v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  int64_t v85;
  void *v86;
  int64_t v87;
  void *v88;
  int64_t v89;
  void *v90;
  int64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  int64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  _BYTE v159[128];
  const __CFString *v160;
  void *v161;
  const __CFString *v162;
  void *v163;
  const __CFString *v164;
  uint64_t v165;
  _BYTE v166[128];
  const __CFString *v167;
  _QWORD v168[3];

  v168[1] = *MEMORY[0x1E0C80C00];
  storePlatformDictionary = self->_storePlatformDictionary;
  if (storePlatformDictionary)
    return storePlatformDictionary;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  -[MPStoreItemMetadata artworkRequestToken](self, "artworkRequestToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageArtworkInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseDictionary");
  v8 = objc_claimAutoreleasedReturnValue();

  if (_NSIsNSDictionary())
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("artwork"));
  -[MPStoreItemMetadata artistName](self, "artistName");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("artistName"));
  -[MPStoreItemMetadata artistStoreID](self, "artistStoreID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("artistId"));
  -[MPStoreItemMetadata artistUploadedContentType](self, "artistUploadedContentType");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("aucType"));
  -[MPStoreItemMetadata artworkTrackIDs](self, "artworkTrackIDs");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("artworkTrackIds"));
  -[MPStoreItemMetadata audioTraits](self, "audioTraits");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("audioTraits"));
  -[MPStoreItemMetadata childrenStoreIDs](self, "childrenStoreIDs");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("childrenIds"));
  v145 = v5;
  -[MPStoreItemMetadata collectionName](self, "collectionName");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v145, "setObject:forKey:", v15, CFSTR("collectionName"));
  v132 = (void *)v14;
  v133 = (void *)v13;
  v134 = (void *)v12;
  -[MPStoreItemMetadata collectionStoreID](self, "collectionStoreID");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v145, "setObject:forKey:", v16, CFSTR("collectionId"));
  v130 = (void *)v16;
  -[MPStoreItemMetadata composerName](self, "composerName");
  v17 = objc_claimAutoreleasedReturnValue();
  v129 = (void *)v17;
  if (v17)
  {
    v167 = CFSTR("name");
    v168[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, &v167, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setObject:forKey:", v18, CFSTR("composer"));

  }
  -[MPStoreItemMetadata copyrightText](self, "copyrightText");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v145, "setObject:forKey:", v19, CFSTR("copyright"));
  -[MPStoreItemMetadata curatorID](self, "curatorID");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v145, "setObject:forKey:", v20, CFSTR("curatorId"));
  v127 = (void *)v20;
  -[MPStoreItemMetadata curatorName](self, "curatorName");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v145, "setObject:forKey:", v21, CFSTR("curatorName"));
  v126 = (void *)v21;
  -[MPStoreItemMetadata curatorHandle](self, "curatorHandle");
  v138 = (void *)v8;
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v145, "setObject:forKey:", v22, CFSTR("username"));
  -[MPStoreItemMetadata descriptionTextWithStyle:](self, "descriptionTextWithStyle:", CFSTR("short"));
  v23 = objc_claimAutoreleasedReturnValue();
  -[MPStoreItemMetadata descriptionTextWithStyle:](self, "descriptionTextWithStyle:", CFSTR("standard"));
  v24 = objc_claimAutoreleasedReturnValue();
  v144 = (void *)v23;
  v25 = v23 | v24;
  v26 = (void *)v24;
  v128 = (void *)v19;
  if (v25)
  {
    v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = v27;
    if (v144)
      objc_msgSend(v27, "setObject:forKey:", v144, CFSTR("short"));
    if (v26)
      objc_msgSend(v28, "setObject:forKey:", v26, CFSTR("standard"));
    objc_msgSend(v145, "setObject:forKey:", v28, CFSTR("description"));

  }
  v29 = -[MPStoreItemMetadata discCount](self, "discCount");
  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setObject:forKey:", v30, CFSTR("discCount"));

  }
  v31 = -[MPStoreItemMetadata discNumber](self, "discNumber");
  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setObject:forKey:", v32, CFSTR("discNumber"));

  }
  -[MPStoreItemMetadata editorNotesWithStyle:](self, "editorNotesWithStyle:", CFSTR("short"));
  v33 = objc_claimAutoreleasedReturnValue();
  -[MPStoreItemMetadata editorNotesWithStyle:](self, "editorNotesWithStyle:", CFSTR("standard"));
  v139 = objc_claimAutoreleasedReturnValue();
  v143 = (void *)v33;
  if (v33 | v139)
  {
    v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v35 = v34;
    if (v143)
      objc_msgSend(v34, "setObject:forKey:", v143, CFSTR("short"));
    if (v139)
      objc_msgSend(v35, "setObject:forKey:", v139, CFSTR("standard"));
    objc_msgSend(v145, "setObject:forKey:", v35, CFSTR("itunesNotes"));

  }
  if (-[MPStoreItemMetadata hasArtistBiography](self, "hasArtistBiography"))
    objc_msgSend(v145, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasArtistBio"));
  if (-[MPStoreItemMetadata hasLyrics](self, "hasLyrics"))
    objc_msgSend(v145, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasLyrics"));
  if (-[MPStoreItemMetadata hasTimeSyncedLyrics](self, "hasTimeSyncedLyrics"))
    objc_msgSend(v145, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasTimeSyncedLyrics"));
  v135 = (void *)v11;
  v136 = (void *)v10;
  v137 = (void *)v9;
  if (-[MPStoreItemMetadata hasSocialPosts](self, "hasSocialPosts"))
    objc_msgSend(v145, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasSocialPosts"));
  -[MPStoreItemMetadata genreNames](self, "genreNames");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = (void *)v15;
  v36 = v145;
  v124 = v26;
  v125 = (void *)v22;
  if (objc_msgSend(v142, "count"))
  {
    objc_msgSend(v145, "setObject:forKey:", v142, CFSTR("genreNames"));
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    v37 = v142;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v154, v166, 16);
    if (!v38)
    {
      v40 = v37;
      goto LABEL_68;
    }
    v39 = v38;
    v40 = 0;
    v41 = *(_QWORD *)v155;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v155 != v41)
          objc_enumerationMutation(v37);
        v43 = *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * i);
        v164 = CFSTR("name");
        v165 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v40)
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v37, "count"));
        objc_msgSend(v40, "addObject:", v44);

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v154, v166, 16);
    }
    while (v39);

    v36 = v145;
    if (v40)
    {
      objc_msgSend(v145, "setObject:forKey:", v40, CFSTR("genres"));
LABEL_68:

    }
  }
  if (-[MPStoreItemMetadata isBeats1](self, "isBeats1"))
    objc_msgSend(v36, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isBeats1"));
  v45 = -[MPStoreItemMetadata explicitRating](self, "explicitRating");
  if (v45)
    goto LABEL_74;
  if (-[MPStoreItemMetadata isExplicitContent](self, "isExplicitContent"))
  {
    v45 = 500;
LABEL_74:
    v162 = CFSTR("riaa");
    v160 = CFSTR("value");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v48, CFSTR("contentRatingsBySystem"));

  }
  if (-[MPStoreItemMetadata isCompilation](self, "isCompilation"))
    objc_msgSend(v36, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isCompilation"));
  if (-[MPStoreItemMetadata isMasteredForiTunes](self, "isMasteredForiTunes"))
    objc_msgSend(v36, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isMasteredForItunes"));
  if (-[MPStoreItemMetadata isPreorder](self, "isPreorder"))
    objc_msgSend(v36, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isPreorder"));
  -[MPStoreItemMetadata itemKind](self, "itemKind");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
    objc_msgSend(v36, "setObject:forKey:", v49, CFSTR("kind"));
  -[MPStoreItemMetadata playlistType](self, "playlistType");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
    objc_msgSend(v36, "setObject:forKey:", v50, CFSTR("playlistType"));
  -[MPStoreItemMetadata personalMixSortKey](self, "personalMixSortKey");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
    objc_msgSend(v36, "setObject:forKey:", v51, CFSTR("personalMixSortKey"));
  -[MPStoreItemMetadata movementName](self, "movementName");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
    objc_msgSend(v36, "setObject:forKey:", v52, CFSTR("movementName"));
  v53 = -[MPStoreItemMetadata movementCount](self, "movementCount");
  if (v53)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v54, CFSTR("movementCount"));

  }
  v55 = -[MPStoreItemMetadata movementNumber](self, "movementNumber");
  if (v55)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v56, CFSTR("movementNumber"));

  }
  -[MPStoreItemMetadata movieClips](self, "movieClips");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (void *)v50;
  v123 = (void *)v49;
  v120 = (void *)v52;
  v121 = (void *)v51;
  if (objc_msgSend(v141, "count"))
  {
    v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v58 = v141;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v150, v159, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v151;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v151 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * j), "lookupDictionary");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v63);

        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v150, v159, 16);
      }
      while (v60);
    }

    objc_msgSend(v36, "setObject:forKey:", v57, CFSTR("movieClips"));
  }
  -[MPStoreItemMetadata name](self, "name");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
    objc_msgSend(v36, "setObject:forKey:", v64, CFSTR("name"));
  -[MPStoreItemMetadata offers](self, "offers");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)v64;
  if (objc_msgSend(v140, "count"))
  {
    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v66 = v140;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v146, v158, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v147;
      do
      {
        for (k = 0; k != v68; ++k)
        {
          if (*(_QWORD *)v147 != v69)
            objc_enumerationMutation(v66);
          objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * k), "lookupDictionary");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if (v71)
            objc_msgSend(v65, "addObject:", v71);

        }
        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v146, v158, 16);
      }
      while (v68);
    }

    objc_msgSend(v36, "setObject:forKey:", v65, CFSTR("offers"));
  }
  -[MPStoreItemMetadata playlistIdentifiers](self, "playlistIdentifiers");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
    objc_msgSend(v36, "setObject:forKey:", v72, CFSTR("playlistIds"));
  -[MPStoreItemMetadata popularity](self, "popularity");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
    objc_msgSend(v36, "setObject:forKey:", v73, CFSTR("popularity"));
  -[MPStoreItemMetadata releaseDate](self, "releaseDate");
  v74 = objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    -[MPStoreItemMetadata _storePlatformReleaseDateFormatter](self, "_storePlatformReleaseDateFormatter");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "stringFromDate:", v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76)
      objc_msgSend(v36, "setObject:forKey:", v76, CFSTR("releaseDate"));

  }
  -[MPStoreItemMetadata lastModifiedDate](self, "lastModifiedDate");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    -[MPStoreItemMetadata _storePlatformLastModifiedDateFormatter](self, "_storePlatformLastModifiedDateFormatter");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "stringFromDate:", v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v79)
      objc_msgSend(v36, "setObject:forKey:", v79, CFSTR("lastModifiedDate"));

  }
  v112 = (void *)v73;
  -[MPStoreItemMetadata shortName](self, "shortName");
  v80 = objc_claimAutoreleasedReturnValue();
  if (v80)
    objc_msgSend(v36, "setObject:forKey:", v80, CFSTR("shortName"));
  -[MPStoreItemMetadata shouldBookmarkPlayPosition](self, "shouldBookmarkPlayPosition");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
    objc_msgSend(v36, "setObject:forKey:", v81, CFSTR("shouldBookmarkPlayPosition"));
  if (-[MPStoreItemMetadata showComposer](self, "showComposer"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v82, CFSTR("showComposer"));

  }
  -[MPStoreItemMetadata storeID](self, "storeID");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
    objc_msgSend(v36, "setObject:forKey:", v83, CFSTR("id"));
  -[MPStoreItemMetadata socialProfileID](self, "socialProfileID");
  v84 = objc_claimAutoreleasedReturnValue();
  if (v84)
    objc_msgSend(v36, "setObject:forKey:", v84, CFSTR("socialProfileId"));
  v113 = (void *)v84;
  v85 = -[MPStoreItemMetadata trackCount](self, "trackCount");
  v114 = (void *)v83;
  if (v85)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v86, CFSTR("trackCount"));

  }
  v87 = -[MPStoreItemMetadata trackNumber](self, "trackNumber");
  if (v87)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v88, CFSTR("trackNumber"));

  }
  v89 = -[MPStoreItemMetadata seasonNumber](self, "seasonNumber");
  if (v89)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v90, CFSTR("seasonNumber"));

  }
  v91 = -[MPStoreItemMetadata episodeCount](self, "episodeCount");
  if (v91)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v92, CFSTR("episodeCount"));

  }
  -[MPStoreItemMetadata versionHash](self, "versionHash");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
    objc_msgSend(v36, "setObject:forKey:", v93, CFSTR("versionHash"));
  v117 = (void *)v74;
  -[MPStoreItemMetadata workName](self, "workName");
  v94 = objc_claimAutoreleasedReturnValue();
  if (v94)
    objc_msgSend(v36, "setObject:forKey:", v94, CFSTR("workName"));
  v116 = (void *)v77;
  -[MPStoreItemMetadata iTunesBrandType](self, "iTunesBrandType");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
    objc_msgSend(v36, "setObject:forKey:", v95, CFSTR("iTunesBrandType"));
  -[MPStoreItemMetadata handle](self, "handle");
  v96 = objc_claimAutoreleasedReturnValue();
  if (v96)
    objc_msgSend(v36, "setObject:forKey:", v96, CFSTR("handle"));
  -[MPStoreItemMetadata nameRaw](self, "nameRaw");
  v97 = objc_claimAutoreleasedReturnValue();
  if (v97)
    objc_msgSend(v36, "setObject:forKey:", v97, CFSTR("nameRaw"));
  if (-[MPStoreItemMetadata isPrivatePerson](self, "isPrivatePerson"))
    objc_msgSend(v36, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isPrivate"));
  if (-[MPStoreItemMetadata isVerifiedPerson](self, "isVerifiedPerson"))
    objc_msgSend(v36, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isVerified"));
  v111 = (void *)v93;
  if (-[MPStoreItemMetadata isOnboardedPerson](self, "isOnboardedPerson"))
    objc_msgSend(v36, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isOnboarded"));
  v115 = (void *)v80;
  -[MPStoreItemMetadata shortURL](self, "shortURL");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "absoluteString");
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (v99)
    objc_msgSend(v145, "setObject:forKey:", v99, CFSTR("shortUrl"));
  -[MPStoreItemMetadata URL](self, "URL");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "absoluteString");
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (v101)
    objc_msgSend(v145, "setObject:forKey:", v101, CFSTR("url"));
  v118 = (void *)v72;
  -[MPStoreItemMetadata videoSubtype](self, "videoSubtype");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (v102)
    objc_msgSend(v145, "setObject:forKey:", v102, CFSTR("videoSubType"));
  v110 = (void *)v97;
  v103 = -[MPStoreItemMetadata radioStationTypeID](self, "radioStationTypeID");
  if (v103)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setObject:forKey:", v104, CFSTR("radioStationTypeId"));

  }
  v105 = (void *)v96;
  -[MPStoreItemMetadata radioStationSubtype](self, "radioStationSubtype");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106)
    objc_msgSend(v145, "setObject:forKey:", v106, CFSTR("streamingRadioSubType"));
  v107 = (void *)v94;
  if (-[MPStoreItemMetadata isChart](self, "isChart"))
    objc_msgSend(v145, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isChart"));
  -[MPStoreItemMetadata radioStationProviderName](self, "radioStationProviderName");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
    objc_msgSend(v145, "setObject:forKey:", v108, CFSTR("stationProviderName"));
  v109 = v145;

  return (NSDictionary *)v109;
}

- (double)duration
{
  MPStoreItemMetadata *v2;
  NSDictionary *storePlatformDictionary;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  char *v22;
  MPStoreItemMetadata *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v2 = self;
  v36 = *MEMORY[0x1E0C80C00];
  storePlatformDictionary = self->_storePlatformDictionary;
  if (storePlatformDictionary)
  {
    -[NSDictionary objectForKey:](storePlatformDictionary, "objectForKey:", CFSTR("durationInMillis"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      -[MPStoreItemMetadata offers](v2, "offers");
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (!v5)
        goto LABEL_26;
      v6 = v5;
      v22 = sel_doubleValue;
      v23 = v2;
      v24 = v4;
      v7 = 0;
      v8 = *(_QWORD *)v31;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "assets", v22, v23, v24);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v27 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "duration");
                if (v16 <= 2.22044605e-16)
                  v16 = -0.0;
                else
                  ++v7;
                v9 = v9 + v16;
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v13);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v6);
      v2 = v23;
      v4 = v24;
      if (v7)
      {
        v17 = v9 / (double)v7;
      }
      else
      {
LABEL_26:
        -[NSDictionary objectForKey:](v2->_storePlatformDictionary, "objectForKey:", CFSTR("duration"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0.0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v19, "doubleValue");
          v17 = v20;
        }

      }
      goto LABEL_30;
    }
LABEL_25:
    objc_msgSend(v4, "doubleValue");
    v17 = v18 / 1000.0;
    goto LABEL_30;
  }
  -[NSDictionary objectForKey:](v2->_downloadMetadataDictionary, "objectForKey:", CFSTR("duration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](v2, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("durationInMillis"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    goto LABEL_25;
LABEL_30:

  return v17;
}

- (BOOL)isStoreRedownloadable
{
  void *v3;
  char v4;
  void *v5;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    -[MPStoreItemMetadata itemKind](self, "itemKind");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((MPStoreItemMetadataItemKindIsArtistUploadedContent(v5) & 1) != 0)
      v4 = 1;
    else
      v4 = -[MPStoreItemMetadata hasSubscriptionOffer](self, "hasSubscriptionOffer");

  }
  return v4;
}

- (BOOL)hasSubscriptionOffer
{
  NSNumber *hasSubscriptionOffer;
  void *v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;

  hasSubscriptionOffer = self->_hasSubscriptionOffer;
  if (!hasSubscriptionOffer)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[MPStoreItemMetadata offers](self, "offers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MPStoreItemMetadataSubscriptionOfferInOffers(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInt:", v6 != 0);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_hasSubscriptionOffer;
    self->_hasSubscriptionOffer = v7;

    hasSubscriptionOffer = self->_hasSubscriptionOffer;
  }
  return -[NSNumber BOOLValue](hasSubscriptionOffer, "BOOLValue");
}

- (NSArray)offers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MPStoreItemOffer *v11;
  MPStoreItemOffer *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("offers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("offers"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (_NSIsNSArray())
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
          if (_NSIsNSDictionary())
          {
            v11 = [MPStoreItemOffer alloc];
            v12 = -[MPStoreItemOffer initWithLookupDictionary:](v11, "initWithLookupDictionary:", v10, (_QWORD)v14);
            if (v12)
              objc_msgSend(v4, "addObject:", v12);

          }
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

  return (NSArray *)v4;
}

- (NSDate)releaseDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("releaseDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString()
    && (-[MPStoreItemMetadata _storePlatformReleaseDateFormatter](self, "_storePlatformReleaseDateFormatter"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "dateFromString:", v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    v6 = v3;
  }
  else
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("releaseDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSString())
    {
      -[MPStoreItemMetadata _musicAPIDateFormatter](self, "_musicAPIDateFormatter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateFromString:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        -[MPStoreItemMetadata _storePlatformReleaseDateFormatter](self, "_storePlatformReleaseDateFormatter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dateFromString:", v6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v5 = 0;
    }
  }

  return (NSDate *)v5;
}

- (id)_storePlatformReleaseDateFormatter
{
  if (_storePlatformReleaseDateFormatter_sOnceToken != -1)
    dispatch_once(&_storePlatformReleaseDateFormatter_sOnceToken, &__block_literal_global_393);
  return (id)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter;
}

+ (id)storeServerCalendar
{
  if (storeServerCalendar_sOnceToken != -1)
    dispatch_once(&storeServerCalendar_sOnceToken, &__block_literal_global_1816);
  return (id)storeServerCalendar_sGMTCalendar;
}

- (NSString)videoSubtype
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("videoSubType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("videoSubType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)isCompilation
{
  void *v3;
  char v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isCompilation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("isCompilation"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v3 = (void *)MEMORY[0x1E0C9AAA0];
  }
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)collectionName
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("collectionName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("playlistName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSURL)classicalURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("classicalUrl"));
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

- (NSString)artistName
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("artistName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("artistName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("artistName"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (id)collectionStoreID
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("collectionId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("playlistId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

- (BOOL)hasTimeSyncedLyrics
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("hasTimeSyncedLyrics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)hasLyrics
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("hasLyrics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (NSArray)genreNames
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("genreNames"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v35 != v7)
            objc_enumerationMutation(v4);
          if (!_NSIsNSString())
          {

            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  if (v3)
    return (NSArray *)v3;
LABEL_14:
  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("genres"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v11)
    {
      v12 = v11;
      v3 = 0;
      v13 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if (_NSIsNSDictionary())
          {
            objc_msgSend(v15, "objectForKey:", CFSTR("name"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (_NSIsNSString())
            {
              if (!v3)
                v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v3, "addObject:", v16);
            }

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v12);

      if (v3)
        return (NSArray *)v3;
      goto LABEL_32;
    }

  }
LABEL_32:
  -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("genre"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) != 0)
  {
    v39 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if (v3)
      return (NSArray *)v3;
  }
  else
  {

  }
  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("genreNames"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v20)
    {
      v21 = v20;
      v3 = 0;
      v22 = *(_QWORD *)v27;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k);
          if (_NSIsNSString())
          {
            if (!v3)
              v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v3, "addObject:", v24, (_QWORD)v26);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v21);
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

void __57__MPStoreItemMetadata__storePlatformReleaseDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter;
  _storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter = (uint64_t)v0;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend((id)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter, "setLocale:", v2);
  objc_msgSend((id)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter, "setDateFormat:", CFSTR("YYYY-MM-dd"));

}

void __45__MPStoreItemMetadata__musicAPIDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_musicAPIDateFormatter_sMusicAPIDateFormatter;
  _musicAPIDateFormatter_sMusicAPIDateFormatter = v0;

}

void __42__MPStoreItemMetadata_storeServerCalendar__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)storeServerCalendar_sGMTCalendar;
  storeServerCalendar_sGMTCalendar = v1;

  v3 = (void *)storeServerCalendar_sGMTCalendar;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

}

- (BOOL)supportsSing
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("supportsSing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSURL)shortURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("shortUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString() && objc_msgSend(v2, "length"))
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

- (NSString)playlistType
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("playlistType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("playlistType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSDate)lastModifiedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("lastModifiedDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSString()
    || (-[MPStoreItemMetadata _storePlatformLastModifiedDateFormatter](self, "_storePlatformLastModifiedDateFormatter"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "dateFromString:", v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("lastModifiedDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      -[MPStoreItemMetadata _musicAPIDateFormatter](self, "_musicAPIDateFormatter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateFromString:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return (NSDate *)v5;
}

- (BOOL)isCollaborative
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("hasCollaboration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v2 = (void *)MEMORY[0x1E0C9AAA0];
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isChart
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isChart"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v2 = (void *)MEMORY[0x1E0C9AAA0];
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)curatorName
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("curatorName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("curatorName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (id)curatorID
{
  return -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("curatorId"));
}

- (NSString)curatorHandle
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("username"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("curatorSocialHandle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (id)avatarArtworkRequestToken
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("avatarArtwork"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("artwork")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend((id)objc_opt_class(), "artworkRequestTokenForStorePlatformArtworkValue:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSArray)audioTraits
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("audioTraits"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("audioTraits"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v3;
}

- (NSURL)URL
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("url"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (_NSIsNSString() && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (MPStoreItemMetadata)initWithStoreMusicAPIDictionary:(id)a3
{
  id v4;
  MPStoreItemMetadata *v5;
  uint64_t v6;
  NSDictionary *storeMusicAPIDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreItemMetadata;
  v5 = -[MPStoreItemMetadata init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    storeMusicAPIDictionary = v5->_storeMusicAPIDictionary;
    v5->_storeMusicAPIDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (MPStoreItemMetadata)initWithStoreMusicAPIDictionary:(id)a3 parentStoreItemMetadata:(id)a4
{
  id v7;
  MPStoreItemMetadata *v8;
  MPStoreItemMetadata *v9;

  v7 = a4;
  v8 = -[MPStoreItemMetadata initWithStoreMusicAPIDictionary:](self, "initWithStoreMusicAPIDictionary:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_parentStoreItemMetadata, a4);

  return v9;
}

- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4
{
  return -[MPStoreItemMetadata initWithStorePlatformDictionary:parentStoreItemMetadata:expirationDate:](self, "initWithStorePlatformDictionary:parentStoreItemMetadata:expirationDate:", a3, a4, 0);
}

- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4 expirationDate:(id)a5
{
  id v9;
  MPStoreItemMetadata *v10;
  MPStoreItemMetadata *v11;

  v9 = a4;
  v10 = -[MPStoreItemMetadata initWithStorePlatformDictionary:expirationDate:](self, "initWithStorePlatformDictionary:expirationDate:", a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_parentStoreItemMetadata, a4);

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[MPStoreItemMetadata offers](self, "offers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MPStoreItemMetadataSubscriptionOfferInOffers(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreItemMetadata storeID](self, "storeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreItemMetadata name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p storeID=%@ name=%@ subscriptionOffer=%@>"), v7, self, v8, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MPStoreItemMetadata)initWithCoder:(id)a3
{
  id v4;
  MPStoreItemMetadata *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *downloadAssetDictionary;
  NSDictionary *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *storeMusicAPIDictionary;
  uint64_t v20;
  NSDate *expirationDate;
  uint64_t v22;
  NSArray *overrideChildStorePlatformDictionaries;
  NSArray *v24;
  uint64_t v25;
  MPStoreItemMetadata *parentStoreItemMetadata;
  uint64_t v27;
  NSDictionary *storePlatformDictionary;
  NSDictionary *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MPStoreItemMetadata;
  v5 = -[MPStoreItemMetadata init](&v31, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("MPStoreItemMetadataDownloadAssetDictionary"));
    v14 = objc_claimAutoreleasedReturnValue();
    downloadAssetDictionary = v5->_downloadAssetDictionary;
    v5->_downloadAssetDictionary = (NSDictionary *)v14;

    if ((_NSIsNSDictionary() & 1) == 0)
    {
      v16 = v5->_downloadAssetDictionary;
      v5->_downloadAssetDictionary = 0;

    }
    -[NSDictionary objectForKey:](v5->_downloadAssetDictionary, "objectForKey:", CFSTR("metadata"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
      objc_storeStrong((id *)&v5->_downloadMetadataDictionary, v17);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("MPStoreItemMetadataMusicAPIDictionary"));
    v18 = objc_claimAutoreleasedReturnValue();
    storeMusicAPIDictionary = v5->_storeMusicAPIDictionary;
    v5->_storeMusicAPIDictionary = (NSDictionary *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPStoreItemMetadataExpirationDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v20;

    v5->_hasOverrideChildStorePlatformDictionaries = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPStoreItemMetadataHasOverrideChildStorePlatformDictionaries"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("MPStoreItemMetadataOverrideChildStorePlatformDictionaries"));
    v22 = objc_claimAutoreleasedReturnValue();
    overrideChildStorePlatformDictionaries = v5->_overrideChildStorePlatformDictionaries;
    v5->_overrideChildStorePlatformDictionaries = (NSArray *)v22;

    if ((_NSIsNSArray() & 1) == 0)
    {
      v24 = v5->_overrideChildStorePlatformDictionaries;
      v5->_overrideChildStorePlatformDictionaries = 0;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPStoreItemMetadataParentStoreItemMetadata"));
    v25 = objc_claimAutoreleasedReturnValue();
    parentStoreItemMetadata = v5->_parentStoreItemMetadata;
    v5->_parentStoreItemMetadata = (MPStoreItemMetadata *)v25;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("MPStoreItemMetadataStorePlatformDictionary"));
    v27 = objc_claimAutoreleasedReturnValue();
    storePlatformDictionary = v5->_storePlatformDictionary;
    v5->_storePlatformDictionary = (NSDictionary *)v27;

    if ((_NSIsNSDictionary() & 1) == 0)
    {
      v29 = v5->_storePlatformDictionary;
      v5->_storePlatformDictionary = 0;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *downloadAssetDictionary;
  id v5;

  downloadAssetDictionary = self->_downloadAssetDictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", downloadAssetDictionary, CFSTR("MPStoreItemMetadataDownloadAssetDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeMusicAPIDictionary, CFSTR("MPStoreItemMetadataMusicAPIDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("MPStoreItemMetadataExpirationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasOverrideChildStorePlatformDictionaries, CFSTR("MPStoreItemMetadataHasOverrideChildStorePlatformDictionaries"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_overrideChildStorePlatformDictionaries, CFSTR("MPStoreItemMetadataOverrideChildStorePlatformDictionaries"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parentStoreItemMetadata, CFSTR("MPStoreItemMetadataParentStoreItemMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storePlatformDictionary, CFSTR("MPStoreItemMetadataStorePlatformDictionary"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_downloadAssetDictionary);
    objc_storeStrong((id *)(v5 + 16), self->_downloadMetadataDictionary);
    objc_storeStrong((id *)(v5 + 24), self->_storeMusicAPIDictionary);
    objc_storeStrong((id *)(v5 + 32), self->_expirationDate);
    *(_BYTE *)(v5 + 40) = self->_hasOverrideChildStorePlatformDictionaries;
    objc_storeStrong((id *)(v5 + 56), self->_overrideChildStorePlatformDictionaries);
    objc_storeStrong((id *)(v5 + 72), self->_parentStoreItemMetadata);
    objc_storeStrong((id *)(v5 + 64), self->_storePlatformDictionary);
  }
  return (id)v5;
}

- (NSArray)artworkTrackIDs
{
  void *v2;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("artworkTrackIds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSArray() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSArray *)v2;
}

- (BOOL)isBeats1
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isBeats1"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)composerName
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("composer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSDictionary())
    goto LABEL_6;
  objc_msgSend(v3, "objectForKey:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

LABEL_6:
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("composerName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v4)
    goto LABEL_6;
LABEL_7:

  return (NSString *)v4;
}

- (NSString)copyrightText
{
  void *v3;
  uint64_t v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("copyright"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("copyright"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)descriptionText
{
  void *v3;
  uint64_t v4;

  -[MPStoreItemMetadata descriptionTextWithStyle:](self, "descriptionTextWithStyle:", CFSTR("standard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[MPStoreItemMetadata descriptionTextWithStyle:](self, "descriptionTextWithStyle:", CFSTR("short"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (int64_t)discCount
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("discCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("discCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = v4;
    }
    else
    {

      v3 = 0;
    }
  }
  v5 = objc_msgSend(v3, "integerValue");

  return v5;
}

- (int64_t)discNumber
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("discNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("discNumber"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("discNumber"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v3 = 0;
  }
  v6 = objc_msgSend(v3, "integerValue");

  return v6;
}

- (BOOL)hasArtistBiography
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("hasArtistBio"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)hasSocialPosts
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("hasSocialPosts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)explicitRating
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("contentRatingsBySystem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSDictionary())
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("value"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = objc_msgSend(v5, "integerValue");
      else
        v6 = 100;

    }
    else
    {
      v6 = 100;
    }

  }
  else
  {
    v6 = 100;
  }

  return v6;
}

- (BOOL)isPreorder
{
  void *v3;
  char v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isPreorder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("isPreorder"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v3 = (void *)MEMORY[0x1E0C9AAA0];
  }
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsVocalAttenuation
{
  void *v3;
  void *v4;
  char v5;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isVocalAttenuationAllowed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("isVocalAttenuationAllowed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v3 = v4;
  }
  v5 = objc_msgSend(v3, "BOOLValue");
LABEL_7:

  return v5;
}

- (NSString)personalMixSortKey
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("personalMixSortKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("personalMixSortKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (MPStoreArtworkRequestToken)latestAlbumArtworkRequestToken
{
  NSDictionary *storePlatformDictionary;
  void *v3;
  void *v4;

  storePlatformDictionary = self->_storePlatformDictionary;
  if (storePlatformDictionary)
  {
    -[NSDictionary objectForKey:](storePlatformDictionary, "objectForKey:", CFSTR("latestAlbumArtwork"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend((id)objc_opt_class(), "artworkRequestTokenForStorePlatformArtworkValue:", v3);
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
  return (MPStoreArtworkRequestToken *)v4;
}

- (int64_t)movementCount
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("movementCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("movementCount"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("movementCount"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v3 = 0;
  }
  v6 = objc_msgSend(v3, "integerValue");

  return v6;
}

- (NSString)movementName
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("movementName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("movementName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("movementName"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (int64_t)movementNumber
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("movementNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("movementNumber"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("movementNumber"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v3 = 0;
  }
  v6 = objc_msgSend(v3, "integerValue");

  return v6;
}

- (int64_t)movieClipsCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("movieClips"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
    v3 = objc_msgSend(v2, "count");
  else
    v3 = 0;

  return v3;
}

- (NSArray)movieClips
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  MPStoreItemMovieClip *v10;
  MPStoreItemMovieClip *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("movieClips"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v10 = [MPStoreItemMovieClip alloc];
            v11 = -[MPStoreItemMovieClip initWithLookupDictionary:](v10, "initWithLookupDictionary:", v9, (_QWORD)v13);
            if (v11)
            {
              if (!v6)
                v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
              objc_msgSend(v6, "addObject:", v11);
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (NSArray)playlistIdentifiers
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("playlistIds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = v2;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
          if (_NSIsNSString())
            objc_msgSend(v3, "addObject:", v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSNumber)popularity
{
  void *v3;
  id v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("popularity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0
    || !v3
    && (-[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("meta.popularity")), v3 = (void *)objc_claimAutoreleasedReturnValue(), _NSIsNSNumber()))
  {
    v4 = v3;
    v3 = v4;
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (NSNumber)shouldBookmarkPlayPosition
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("shouldBookmarkPlayPosition"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "BOOLValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

- (BOOL)shouldReportPlayEvents
{
  void *v3;
  char v4;
  void *v5;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("shouldReportPlayEvents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    -[MPStoreItemMetadata itemKind](self, "itemKind");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((MPStoreItemMetadataItemKindIsArtistUploadedContent(v5) & 1) != 0)
      v4 = 1;
    else
      v4 = -[MPStoreItemMetadata hasSubscriptionOffer](self, "hasSubscriptionOffer");

  }
  return v4;
}

- (BOOL)showComposer
{
  void *v3;
  char v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("showComposer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("showComposer"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v3 = (void *)MEMORY[0x1E0C9AAA0];
  }
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)socialProfileID
{
  return -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("socialProfileId"));
}

- (int64_t)trackNumber
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("trackNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("trackNumber"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("trackNumber"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v3 = 0;
  }
  v6 = objc_msgSend(v3, "integerValue");

  return v6;
}

- (int64_t)episodeCount
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("episodeCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("episodeCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = v4;
    }
    else
    {

      v3 = 0;
    }
  }
  v5 = objc_msgSend(v3, "integerValue");

  return v5;
}

- (int64_t)seasonNumber
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("seasonNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("seasonNumber"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = v4;
    }
    else
    {

      v3 = 0;
    }
  }
  v5 = objc_msgSend(v3, "integerValue");

  return v5;
}

- (NSString)workName
{
  void *v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("workName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_downloadMetadataDictionary, "objectForKey:", CFSTR("work"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("workName"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)nameRaw
{
  void *v2;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("nameRaw"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)radioStationIsSubscriptionOnly
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("isForAppleMusicSubscribersOnly"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isLive
{
  void *v2;
  char v3;

  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("isLive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v2 = (void *)MEMORY[0x1E0C9AAA0];
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSDate)startingAirDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("airTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("start"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreItemMetadata _storePlatformLastModifiedDateFormatter](self, "_storePlatformLastModifiedDateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v4;
    if (v6)
      goto LABEL_9;
  }
  else
  {
    v4 = 0;
  }
  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("airTime.start"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSString())
  {
    -[MPStoreItemMetadata _musicAPIDateFormatter](self, "_musicAPIDateFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromString:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[MPStoreItemMetadata _storePlatformReleaseDateFormatter](self, "_storePlatformReleaseDateFormatter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateFromString:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }
LABEL_9:

  return (NSDate *)v6;
}

- (NSDate)endingAirDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("airTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("end"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreItemMetadata _storePlatformLastModifiedDateFormatter](self, "_storePlatformLastModifiedDateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v4;
    if (v6)
      goto LABEL_9;
  }
  else
  {
    v4 = 0;
  }
  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("airTime.end"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSString())
  {
    -[MPStoreItemMetadata _musicAPIDateFormatter](self, "_musicAPIDateFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromString:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[MPStoreItemMetadata _storePlatformReleaseDateFormatter](self, "_storePlatformReleaseDateFormatter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateFromString:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }
LABEL_9:

  return (NSDate *)v6;
}

- (id)artworkRequestTokenForScreenshotArtwork
{
  void *v2;
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("screenshots"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC070]), "initWithArtworkResponseDictionary:", v2);
    if (v3)
    {
      +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:](MPStoreArtworkRequestToken, "tokenWithImageArtworkInfo:", v3);
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

  return v4;
}

- (id)artworkRequestTokenForUberArtworkKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("uber"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v5, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC070]), "initWithArtworkResponseDictionary:", v6);
        if (v7)
        {
          +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:](MPStoreArtworkRequestToken, "tokenWithImageArtworkInfo:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)artworkRequestTokenForStoreMusicAPIDictionary
{
  void *v2;
  void *v3;

  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("artwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "artworkRequestTokenForStorePlatformArtworkValue:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)stationGlyphRequestTokenForStoreMusicAPIDictionary
{
  void *v2;
  void *v3;

  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("stationGlyph"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "artworkRequestTokenForStorePlatformArtworkValue:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)stationGlyphRequestTokenForStorePlatformDictionary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("stationGlyph"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "artworkRequestTokenForStorePlatformArtworkValue:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)childStorePlatformDictionaryForArtworkTrackID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_8;
  }
  -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("artworkTracks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSDictionary())
    goto LABEL_5;
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSDictionary() & 1) == 0)
  {

LABEL_5:
    v6 = 0;
  }

LABEL_8:
  return v6;
}

- (id)childStorePlatformDictionaryForStoreID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (self->_hasOverrideChildStorePlatformDictionaries)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v5 = self->_overrideChildStorePlatformDictionaries;
      v6 = objc_msgSend((id)v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v23 != v8)
              objc_enumerationMutation((id)v5);
            v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v10, "objectForKey:", CFSTR("id"));
            v11 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "isEqual:", v4))
            {
              v12 = v10;
              goto LABEL_14;
            }

          }
          v7 = objc_msgSend((id)v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          if (v7)
            continue;
          break;
        }
      }
      v12 = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[NSDictionary objectForKey:](self->_storePlatformDictionary, "objectForKey:", CFSTR("children"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend((id)v5, "objectForKey:", v4);
      v12 = objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSDictionary() & 1) != 0)
        goto LABEL_19;

    }
    v12 = 0;
LABEL_19:
    if (!(v5 | v12))
    {
      -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("relationships.tracks.data"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSArray())
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v11 = v11;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("id"), (_QWORD)v18);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v17, "isEqual:", v4) && _NSIsNSDictionary())
              {
                v12 = v16;

                goto LABEL_35;
              }

            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_35:

        v5 = 0;
      }
      else
      {
        v5 = 0;
        v12 = 0;
      }
LABEL_14:

    }
    goto LABEL_20;
  }
  v12 = 0;
LABEL_21:

  return (id)v12;
}

- (id)descriptionTextWithStyle:(id)a3
{
  id v4;
  NSDictionary *storePlatformDictionary;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  if (!v4)
  {
    v8 = 0;
    goto LABEL_19;
  }
  storePlatformDictionary = self->_storePlatformDictionary;
  if (storePlatformDictionary)
  {
    -[NSDictionary objectForKey:](storePlatformDictionary, "objectForKey:", CFSTR("description"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v6, "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSString() & 1) != 0)
      {
        v8 = v7;

        if (v8)
          goto LABEL_19;
        goto LABEL_10;
      }

    }
  }
LABEL_10:
  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("description"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v9, "objectForKey:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v8 = v10;
    else
      v8 = 0;

  }
  else if (_NSIsNSString())
  {
    v10 = v9;
    v8 = v10;
  }
  else
  {
    v8 = 0;
    v10 = v9;
  }

LABEL_19:
  return v8;
}

- (NSString)shortDescriptionText
{
  void *v2;
  id v3;

  -[MPStoreItemMetadata _fetchValueFromStoreMusicAPIDictionary:](self, "_fetchValueFromStoreMusicAPIDictionary:", CFSTR("shortDescription"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (id)tvEpisodeArtworkRequestToken
{
  void *v2;

  -[MPStoreItemMetadata artworkRequestTokenForScreenshotArtwork](self, "artworkRequestTokenForScreenshotArtwork");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCropStyle:", *MEMORY[0x1E0DDBDB8]);
  return v2;
}

- (id)tvShowArtworkRequestToken
{
  void *v3;

  -[MPStoreItemMetadata artworkRequestTokenForEditorialArtworkKind:](self, "artworkRequestTokenForEditorialArtworkKind:", CFSTR("browseCover"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata artworkRequestTokenForEditorialArtworkKind:](self, "artworkRequestTokenForEditorialArtworkKind:", CFSTR("subscriptionCover"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setCropStyle:", *MEMORY[0x1E0DDBDB8]);
  return v3;
}

- (id)movieArtworkRequestToken
{
  void *v3;

  -[MPStoreItemMetadata artworkRequestTokenForEditorialArtworkKind:](self, "artworkRequestTokenForEditorialArtworkKind:", CFSTR("subscriptionCover"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata artworkRequestTokenForEditorialArtworkKind:](self, "artworkRequestTokenForEditorialArtworkKind:", CFSTR("fullscreenBackground"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setCropStyle:", *MEMORY[0x1E0DDBDB8]);
  return v3;
}

- (id)flowcaseEditorialArtworkRequestToken
{
  void *v3;

  -[MPStoreItemMetadata artworkRequestTokenForEditorialArtworkKind:](self, "artworkRequestTokenForEditorialArtworkKind:", CFSTR("subscriptionHero"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata artworkRequestTokenForEditorialArtworkKind:](self, "artworkRequestTokenForEditorialArtworkKind:", CFSTR("subscriptionCover"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[MPStoreItemMetadata artworkRequestTokenForUberArtworkKind:](self, "artworkRequestTokenForUberArtworkKind:", CFSTR("masterArt"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v3, "setCropStyle:", *MEMORY[0x1E0DDBDB8]);
  return v3;
}

- (id)brickEditorialArtworkRequestToken
{
  void *v3;

  -[MPStoreItemMetadata artworkRequestTokenForEditorialArtworkKind:](self, "artworkRequestTokenForEditorialArtworkKind:", CFSTR("subscriptionCover"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPStoreItemMetadata artworkRequestTokenForEditorialArtworkKind:](self, "artworkRequestTokenForEditorialArtworkKind:", CFSTR("subscriptionHero"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setCropStyle:", *MEMORY[0x1E0DDBDB0]);
  return v3;
}

- (MPStoreItemMetadata)metadataWithChildStorePlatformDictionaries:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = -[MPStoreItemMetadata copy](self, "copy");
  v7 = (void *)v6;
  if (v6)
  {
    *(_BYTE *)(v6 + 40) = 1;
    objc_storeStrong((id *)(v6 + 56), a3);
  }

  return (MPStoreItemMetadata *)v7;
}

- (MPStoreItemMetadata)metadataWithParentMetadata:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = -[MPStoreItemMetadata copy](self, "copy");
  v7 = (void *)v6;
  if (v6)
    objc_storeStrong((id *)(v6 + 72), a3);

  return (MPStoreItemMetadata *)v7;
}

- (id)_storePlatformLastModifiedDateFormatter
{
  if (_storePlatformLastModifiedDateFormatter_sOnceToken != -1)
    dispatch_once(&_storePlatformLastModifiedDateFormatter_sOnceToken, &__block_literal_global_402);
  return (id)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter;
}

- (MPStoreItemMetadata)parentStoreItemMetadata
{
  return self->_parentStoreItemMetadata;
}

void __62__MPStoreItemMetadata__storePlatformLastModifiedDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter;
  _storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter = (uint64_t)v0;

  objc_msgSend((id)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
  v2 = (void *)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  objc_msgSend((id)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter, "setLenient:", 1);
  v6 = (void *)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter;
  +[MPStoreItemMetadata storeServerCalendar](MPStoreItemMetadata, "storeServerCalendar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCalendar:", v7);

}

void __41__MPStoreItemMetadata_radioStationEvents__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("title"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v4);

    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "objectForKey:", CFSTR("startTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStartTime:", v7);

    v8 = *(void **)(a1 + 40);
    objc_msgSend(v3, "objectForKey:", CFSTR("endTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEndTime:", v10);

    objc_msgSend(v3, "objectForKey:", CFSTR("description"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("standard"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDescriptionText:", v12);

    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasMetadataForRequestReason:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 IsContainerKind;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      -[MPStoreItemMetadata childrenStoreIDs](self, "childrenStoreIDs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        -[MPStoreItemMetadata childrenStoreIDs](self, "childrenStoreIDs");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v5, "count") != 0;
LABEL_29:

        goto LABEL_30;
      }
LABEL_24:
      v8 = 0;
LABEL_30:

      return v8;
    }
    if (a3 == 1)
    {
      -[MPStoreItemMetadata artworkRequestToken](self, "artworkRequestToken");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        -[MPStoreItemMetadata name](self, "name");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          -[MPStoreItemMetadata offers](self, "offers");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            -[MPStoreItemMetadata URL](self, "URL");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v7 != 0;

          }
          else
          {
            v8 = 0;
          }

        }
        else
        {
          v8 = 0;
        }
        goto LABEL_29;
      }
      goto LABEL_24;
    }
    return 1;
  }
  -[MPStoreItemMetadata artworkRequestToken](self, "artworkRequestToken");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    return 0;
  v10 = (void *)v9;
  -[MPStoreItemMetadata name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    return 0;
  -[MPStoreItemMetadata itemKind](self, "itemKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IsContainerKind = MPStoreItemMetadataItemKindIsContainerKind(v12);

  if (!IsContainerKind)
    return 1;
  -[MPStoreItemMetadata childrenStoreIDs](self, "childrenStoreIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          -[MPStoreItemMetadata childStorePlatformDictionaryForStoreID:](self, "childStorePlatformDictionaryForStoreID:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            v21 = 0;
            goto LABEL_33;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v17)
          continue;
        break;
      }
    }
    v21 = 1;
LABEL_33:

  }
  else
  {
    v21 = 0;
  }

  return v21 != 0;
}

@end
