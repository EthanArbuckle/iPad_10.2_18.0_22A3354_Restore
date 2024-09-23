@implementation _INPBSearchForMediaIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setMediaItems:(id)a3
{
  NSArray *v4;
  NSArray *mediaItems;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  mediaItems = self->_mediaItems;
  self->_mediaItems = v4;

}

- (void)clearMediaItems
{
  -[NSArray removeAllObjects](self->_mediaItems, "removeAllObjects");
}

- (void)addMediaItems:(id)a3
{
  id v4;
  NSArray *mediaItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  mediaItems = self->_mediaItems;
  v8 = v4;
  if (!mediaItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mediaItems;
    self->_mediaItems = v6;

    v4 = v8;
    mediaItems = self->_mediaItems;
  }
  -[NSArray addObject:](mediaItems, "addObject:", v4);

}

- (unint64_t)mediaItemsCount
{
  return -[NSArray count](self->_mediaItems, "count");
}

- (id)mediaItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_mediaItems, "objectAtIndexedSubscript:", a3);
}

- (void)setMediaSearch:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSearch, a3);
}

- (BOOL)hasMediaSearch
{
  return self->_mediaSearch != 0;
}

- (void)setPrivateSearchForMediaIntentData:(id)a3
{
  objc_storeStrong((id *)&self->_privateSearchForMediaIntentData, a3);
}

- (BOOL)hasPrivateSearchForMediaIntentData
{
  return self->_privateSearchForMediaIntentData != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForMediaIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBSearchForMediaIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSearchForMediaIntent intentMetadata](self, "intentMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_mediaItems;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  -[_INPBSearchForMediaIntent mediaSearch](self, "mediaSearch", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBSearchForMediaIntent mediaSearch](self, "mediaSearch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMediaIntent privateSearchForMediaIntentData](self, "privateSearchForMediaIntentData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBSearchForMediaIntent privateSearchForMediaIntentData](self, "privateSearchForMediaIntentData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBSearchForMediaIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchForMediaIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForMediaIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchForMediaIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchForMediaIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBSearchForMediaIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchForMediaIntent *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = -[_INPBSearchForMediaIntent init](+[_INPBSearchForMediaIntent allocWithZone:](_INPBSearchForMediaIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSearchForMediaIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_mediaItems, "copyWithZone:", a3);
  -[_INPBSearchForMediaIntent setMediaItems:](v5, "setMediaItems:", v7);

  v8 = -[_INPBMediaSearch copyWithZone:](self->_mediaSearch, "copyWithZone:", a3);
  -[_INPBSearchForMediaIntent setMediaSearch:](v5, "setMediaSearch:", v8);

  v9 = -[_INPBPrivateSearchForMediaIntentData copyWithZone:](self->_privateSearchForMediaIntentData, "copyWithZone:", a3);
  -[_INPBSearchForMediaIntent setPrivateSearchForMediaIntentData:](v5, "setPrivateSearchForMediaIntentData:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBSearchForMediaIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSearchForMediaIntent intentMetadata](self, "intentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchForMediaIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSearchForMediaIntent mediaItems](self, "mediaItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSearchForMediaIntent mediaItems](self, "mediaItems");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSearchForMediaIntent mediaItems](self, "mediaItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSearchForMediaIntent mediaSearch](self, "mediaSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSearchForMediaIntent mediaSearch](self, "mediaSearch");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBSearchForMediaIntent mediaSearch](self, "mediaSearch");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaSearch");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSearchForMediaIntent privateSearchForMediaIntentData](self, "privateSearchForMediaIntentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateSearchForMediaIntentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSearchForMediaIntent privateSearchForMediaIntentData](self, "privateSearchForMediaIntentData");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBSearchForMediaIntent privateSearchForMediaIntentData](self, "privateSearchForMediaIntentData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateSearchForMediaIntentData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v4 = -[NSArray hash](self->_mediaItems, "hash") ^ v3;
  v5 = -[_INPBMediaSearch hash](self->_mediaSearch, "hash");
  return v4 ^ v5 ^ -[_INPBPrivateSearchForMediaIntentData hash](self->_privateSearchForMediaIntentData, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSearchForMediaIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  if (-[NSArray count](self->_mediaItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_mediaItems;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "dictionaryRepresentation", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("mediaItems"));
  }
  -[_INPBSearchForMediaIntent mediaSearch](self, "mediaSearch", (_QWORD)v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("mediaSearch"));

  -[_INPBSearchForMediaIntent privateSearchForMediaIntentData](self, "privateSearchForMediaIntentData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("privateSearchForMediaIntentData"));

  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (_INPBMediaSearch)mediaSearch
{
  return self->_mediaSearch;
}

- (_INPBPrivateSearchForMediaIntentData)privateSearchForMediaIntentData
{
  return self->_privateSearchForMediaIntentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateSearchForMediaIntentData, 0);
  objc_storeStrong((id *)&self->_mediaSearch, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (Class)mediaItemsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
