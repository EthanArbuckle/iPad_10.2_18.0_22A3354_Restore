@implementation ML3StoreItemAlbumArtistData

- (ML3StoreItemAlbumArtistData)initWithLookupItems:(id)a3
{
  id v4;
  ML3StoreItemAlbumArtistData *v5;
  uint64_t v6;
  NSArray *lookupItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemAlbumArtistData;
  v5 = -[ML3StoreItemAlbumArtistData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    lookupItems = v5->_lookupItems;
    v5->_lookupItems = (NSArray *)v6;

  }
  return v5;
}

- (ML3StoreItemAlbumArtistData)initWithTrackItemImportProperties:(id)a3
{
  id v4;
  ML3StoreItemAlbumArtistData *v5;
  uint64_t v6;
  NSDictionary *trackItemImportProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemAlbumArtistData;
  v5 = -[ML3StoreItemAlbumArtistData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    trackItemImportProperties = v5->_trackItemImportProperties;
    v5->_trackItemImportProperties = (NSDictionary *)v6;

  }
  return v5;
}

- (ML3StoreItemAlbumArtistData)initWithAlbumArtistData:(id)a3
{
  id v4;
  ML3StoreItemAlbumArtistData *v5;
  uint64_t v6;
  NSData *albumArtistData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemAlbumArtistData;
  v5 = -[ML3StoreItemAlbumArtistData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    albumArtistData = v5->_albumArtistData;
    v5->_albumArtistData = (NSData *)v6;

  }
  return v5;
}

- (unint64_t)albumArtistCount
{
  void *v2;
  unint64_t v3;

  -[ML3StoreItemAlbumArtistData parsedStoreAlbumArtistImportProperties](self, "parsedStoreAlbumArtistImportProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSData)albumArtistData
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[ML3StoreItemAlbumArtistData parsedStoreAlbumArtistImportProperties](self, "parsedStoreAlbumArtistImportProperties");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v7 = CFSTR("album_artists");
    v8[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

- (NSArray)parsedStoreAlbumArtistImportProperties
{
  NSArray *parsedStoreAlbumArtistImportProperties;
  NSArray *v4;
  NSArray *v5;

  parsedStoreAlbumArtistImportProperties = self->_parsedStoreAlbumArtistImportProperties;
  if (!parsedStoreAlbumArtistImportProperties)
  {
    if (self->_lookupItems)
    {
      -[ML3StoreItemAlbumArtistData _parsedStoreAlbumArtistItemsImportPropertiesFromLookupItems](self, "_parsedStoreAlbumArtistItemsImportPropertiesFromLookupItems");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else if (self->_trackItemImportProperties)
    {
      -[ML3StoreItemAlbumArtistData _parsedStoreAlbumArtistItemsImportPropertiesFromTrackImportItems](self, "_parsedStoreAlbumArtistItemsImportPropertiesFromTrackImportItems");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_albumArtistData)
      {
        parsedStoreAlbumArtistImportProperties = 0;
        return parsedStoreAlbumArtistImportProperties;
      }
      -[ML3StoreItemAlbumArtistData _parsedStoreAlbumArtistItemsImportPropertiesFromSerializedLookupItems](self, "_parsedStoreAlbumArtistItemsImportPropertiesFromSerializedLookupItems");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    v5 = self->_parsedStoreAlbumArtistImportProperties;
    self->_parsedStoreAlbumArtistImportProperties = v4;

    parsedStoreAlbumArtistImportProperties = self->_parsedStoreAlbumArtistImportProperties;
  }
  return parsedStoreAlbumArtistImportProperties;
}

- (id)_parsedStoreAlbumArtistItemsImportPropertiesFromLookupItems
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __int128 v26;
  ML3StoreItemAlbumArtistData *v27;
  ML3StoreItemAlbumArtistData *v28;
  NSArray *obj;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  ML3StoreItemAlbumArtistData *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (ML3StoreItemAlbumArtistData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = self;
  obj = self->_lookupItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0x1E0CB3000uLL;
    v8 = *(_QWORD *)v32;
    *(_QWORD *)&v5 = 134218240;
    v26 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "storeAdamID", v26);
        objc_msgSend(*(id *)(v7 + 2024), "numberWithLongLong:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v3, "containsObject:", v12);

        if (v13)
        {
          v14 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v36 = v27;
            v37 = 2048;
            v38 = v11;
            _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "ML3StoreItemAlbumArtistData=%p album artist with store identifier:%lld is already imported", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v10, "metadataDictionary");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("name"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (_NSIsNSString())
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, &unk_1E5BAB610);
          -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("nameSortValue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (_NSIsNSString())
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, &unk_1E5BAB628);
          if (v11)
          {
            objc_msgSend(*(id *)(v7 + 2024), "numberWithLongLong:", v11);
            v30 = v16;
            v18 = v3;
            v19 = v6;
            v20 = v8;
            v21 = v7;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, &unk_1E5BAB640);

            v7 = v21;
            v8 = v20;
            v6 = v19;
            v3 = v18;
            v16 = v30;
          }
          -[ML3StoreItemAlbumArtistData addObject:](v28, "addObject:", v15);
          objc_msgSend(*(id *)(v7 + 2024), "numberWithLongLong:", v11);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v23);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v6);
  }

  v24 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v28;
    _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_DEFAULT, "_parsedStoreAlbumArtistItemsImportPropertiesFromLookupItems=%{public}@", buf, 0xCu);
  }

  return v28;
}

- (id)_parsedStoreAlbumArtistItemsImportPropertiesFromTrackImportItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB658);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, &unk_1E5BAB658);

  }
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB670);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, &unk_1E5BAB670);

  }
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB688);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "longLongValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, &unk_1E5BAB640);

  }
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB6A0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, &unk_1E5BAB610);
  v27 = (void *)v10;
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB6B8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, &unk_1E5BAB628);
  v26 = (void *)v11;
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB6D0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "longLongValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, &unk_1E5BAB6D0);

  }
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB6E8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "longLongValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, &unk_1E5BAB6E8);

  }
  v29 = v4;
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB700);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, &unk_1E5BAB718);
  v28 = v6;
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB730);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, &unk_1E5BAB748);
  v25 = v12;
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB760);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, &unk_1E5BAB778);
  v19 = v8;
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB790);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, &unk_1E5BAB7A8);
  -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB7C0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v21, "longLongValue"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, &unk_1E5BAB7D8);

  }
  v30[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_parsedStoreAlbumArtistItemsImportPropertiesFromSerializedLookupItems
{
  void *v3;
  void *v4;
  NSData *albumArtistData;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  ML3StoreItemAlbumArtistData *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3710];
  MSVPropertyListDataClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  albumArtistData = self->_albumArtistData;
  v11 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v4, albumArtistData, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (!v6)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v13 = self;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "ML3StoreItemAlbumArtistData=%p Failed to decode album artist data. err=%{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("album_artists"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedStoreAlbumArtistImportProperties, 0);
  objc_storeStrong((id *)&self->_trackItemImportProperties, 0);
  objc_storeStrong((id *)&self->_albumArtistData, 0);
  objc_storeStrong((id *)&self->_lookupItems, 0);
}

@end
