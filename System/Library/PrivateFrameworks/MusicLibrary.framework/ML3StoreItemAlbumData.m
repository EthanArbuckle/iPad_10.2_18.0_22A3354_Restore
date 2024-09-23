@implementation ML3StoreItemAlbumData

- (ML3StoreItemAlbumData)initWithTrackImportItem:(id)a3
{
  id v4;
  ML3StoreItemAlbumData *v5;
  uint64_t v6;
  NSDictionary *trackItemImportProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemAlbumData;
  v5 = -[ML3StoreItemAlbumData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    trackItemImportProperties = v5->_trackItemImportProperties;
    v5->_trackItemImportProperties = (NSDictionary *)v6;

  }
  return v5;
}

- (id)parsedStoreAlbumImportProperties
{
  NSDictionary *parsedStoreAlbumImportProperties;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
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
  void *v24;
  NSDictionary *v25;
  NSDictionary *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  parsedStoreAlbumImportProperties = self->_parsedStoreAlbumImportProperties;
  if (!parsedStoreAlbumImportProperties)
  {
    if (self->_trackItemImportProperties)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB010);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, &unk_1E5BAB010);

      }
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB028);
      v7 = objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, &unk_1E5BAB040);
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB058);
      v8 = objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, &unk_1E5BAB070);
      v31 = (void *)v7;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB088);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, &unk_1E5BAB0A0);

      }
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB0B8);
      v11 = objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, &unk_1E5BAB0D0);
      v29 = (void *)v11;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB0E8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "longLongValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, &unk_1E5BAB100);

      }
      v32 = v5;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB118);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "longLongValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, &unk_1E5BAB130);

      }
      v28 = v14;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB148);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "longLongValue"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, &unk_1E5BAB160);

      }
      v30 = (void *)v8;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB178);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, &unk_1E5BAB190);
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB1A8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v19, "longLongValue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, &unk_1E5BAB1C0);

      }
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB1D8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSNumber())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, &unk_1E5BAB1D8);
      v22 = v9;
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB1F0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, &unk_1E5BAB1F0);
      -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1E5BAB208);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, &unk_1E5BAB208);
      v25 = (NSDictionary *)objc_msgSend(v4, "copy");
      v26 = self->_parsedStoreAlbumImportProperties;
      self->_parsedStoreAlbumImportProperties = v25;

      parsedStoreAlbumImportProperties = self->_parsedStoreAlbumImportProperties;
    }
    else
    {
      parsedStoreAlbumImportProperties = 0;
    }
  }
  return parsedStoreAlbumImportProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedStoreAlbumImportProperties, 0);
  objc_storeStrong((id *)&self->_trackItemImportProperties, 0);
}

@end
