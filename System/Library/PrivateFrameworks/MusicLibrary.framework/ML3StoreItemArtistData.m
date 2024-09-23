@implementation ML3StoreItemArtistData

- (ML3StoreItemArtistData)initWithTrackImportItem:(id)a3
{
  id v4;
  ML3StoreItemArtistData *v5;
  uint64_t v6;
  NSDictionary *trackItemImportProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemArtistData;
  v5 = -[ML3StoreItemArtistData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    trackItemImportProperties = v5->_trackItemImportProperties;
    v5->_trackItemImportProperties = (NSDictionary *)v6;

  }
  return v5;
}

- (NSDictionary)parsedStoreArtistItemImportProperties
{
  NSDictionary *parsedStoreArtistImportProperties;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  NSDictionary *v23;
  NSDictionary *v24;
  NSObject *v25;
  NSDictionary *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  NSDictionary *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  parsedStoreArtistImportProperties = self->_parsedStoreArtistImportProperties;
  if (!parsedStoreArtistImportProperties)
  {
    if (self->_trackItemImportProperties)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB2E0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, &unk_1E5BAB2E0);

      }
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB2F8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "longLongValue"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, &unk_1E5BAB2F8);

      }
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB310);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, &unk_1E5BAB328);

      }
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB340);
      v11 = objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, &unk_1E5BAB358);
      v30 = (void *)v11;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB370);
      v12 = objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, &unk_1E5BAB388);
      v29 = (void *)v12;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB3A0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "longLongValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, &unk_1E5BAB3A0);

      }
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB3B8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v15, "longLongValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, &unk_1E5BAB3B8);

      }
      v33 = v5;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB3D0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, &unk_1E5BAB3E8);
      v32 = v7;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB400);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, &unk_1E5BAB418);
      v31 = v9;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB430, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, &unk_1E5BAB448);
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB460);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, &unk_1E5BAB478);
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB490);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v21, "longLongValue"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, &unk_1E5BAB4A8);

      }
      v23 = (NSDictionary *)objc_msgSend(v4, "copy");
      v24 = self->_parsedStoreArtistImportProperties;
      self->_parsedStoreArtistImportProperties = v23;

      v25 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_parsedStoreArtistImportProperties;
        *(_DWORD *)buf = 138543362;
        v35 = v26;
        _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "parsedStoreArtistItemImportProperties=%{public}@", buf, 0xCu);
      }

      parsedStoreArtistImportProperties = self->_parsedStoreArtistImportProperties;
    }
    else
    {
      parsedStoreArtistImportProperties = 0;
    }
  }
  return (NSDictionary *)(id)-[NSDictionary copy](parsedStoreArtistImportProperties, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackItemImportProperties, 0);
  objc_storeStrong((id *)&self->_parsedStoreArtistImportProperties, 0);
}

@end
