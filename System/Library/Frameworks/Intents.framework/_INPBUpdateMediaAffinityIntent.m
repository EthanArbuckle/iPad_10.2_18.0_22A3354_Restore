@implementation _INPBUpdateMediaAffinityIntent

- (void)setAffinityType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_affinityType = a3;
  }
}

- (BOOL)hasAffinityType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAffinityType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)affinityTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2293250[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAffinityType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_AFFINITY_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIKE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DISLIKE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

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

- (void)setPrivateUpdateMediaAffinityIntentData:(id)a3
{
  objc_storeStrong((id *)&self->_privateUpdateMediaAffinityIntentData, a3);
}

- (BOOL)hasPrivateUpdateMediaAffinityIntentData
{
  return self->_privateUpdateMediaAffinityIntentData != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUpdateMediaAffinityIntentReadFrom(self, (uint64_t)a3);
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
  if (-[_INPBUpdateMediaAffinityIntent hasAffinityType](self, "hasAffinityType"))
    PBDataWriterWriteInt32Field();
  -[_INPBUpdateMediaAffinityIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBUpdateMediaAffinityIntent intentMetadata](self, "intentMetadata");
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

  -[_INPBUpdateMediaAffinityIntent mediaSearch](self, "mediaSearch", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBUpdateMediaAffinityIntent mediaSearch](self, "mediaSearch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBUpdateMediaAffinityIntent privateUpdateMediaAffinityIntentData](self, "privateUpdateMediaAffinityIntentData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBUpdateMediaAffinityIntent privateUpdateMediaAffinityIntentData](self, "privateUpdateMediaAffinityIntentData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBUpdateMediaAffinityIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBUpdateMediaAffinityIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBUpdateMediaAffinityIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBUpdateMediaAffinityIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBUpdateMediaAffinityIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBUpdateMediaAffinityIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBUpdateMediaAffinityIntent *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = -[_INPBUpdateMediaAffinityIntent init](+[_INPBUpdateMediaAffinityIntent allocWithZone:](_INPBUpdateMediaAffinityIntent, "allocWithZone:"), "init");
  if (-[_INPBUpdateMediaAffinityIntent hasAffinityType](self, "hasAffinityType"))
    -[_INPBUpdateMediaAffinityIntent setAffinityType:](v5, "setAffinityType:", -[_INPBUpdateMediaAffinityIntent affinityType](self, "affinityType"));
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBUpdateMediaAffinityIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_mediaItems, "copyWithZone:", a3);
  -[_INPBUpdateMediaAffinityIntent setMediaItems:](v5, "setMediaItems:", v7);

  v8 = -[_INPBMediaSearch copyWithZone:](self->_mediaSearch, "copyWithZone:", a3);
  -[_INPBUpdateMediaAffinityIntent setMediaSearch:](v5, "setMediaSearch:", v8);

  v9 = -[_INPBPrivateUpdateMediaAffinityIntentData copyWithZone:](self->_privateUpdateMediaAffinityIntentData, "copyWithZone:", a3);
  -[_INPBUpdateMediaAffinityIntent setPrivateUpdateMediaAffinityIntentData:](v5, "setPrivateUpdateMediaAffinityIntentData:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int affinityType;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  v5 = -[_INPBUpdateMediaAffinityIntent hasAffinityType](self, "hasAffinityType");
  if (v5 != objc_msgSend(v4, "hasAffinityType"))
    goto LABEL_26;
  if (-[_INPBUpdateMediaAffinityIntent hasAffinityType](self, "hasAffinityType"))
  {
    if (objc_msgSend(v4, "hasAffinityType"))
    {
      affinityType = self->_affinityType;
      if (affinityType != objc_msgSend(v4, "affinityType"))
        goto LABEL_26;
    }
  }
  -[_INPBUpdateMediaAffinityIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBUpdateMediaAffinityIntent intentMetadata](self, "intentMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBUpdateMediaAffinityIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBUpdateMediaAffinityIntent mediaItems](self, "mediaItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBUpdateMediaAffinityIntent mediaItems](self, "mediaItems");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBUpdateMediaAffinityIntent mediaItems](self, "mediaItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBUpdateMediaAffinityIntent mediaSearch](self, "mediaSearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSearch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBUpdateMediaAffinityIntent mediaSearch](self, "mediaSearch");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBUpdateMediaAffinityIntent mediaSearch](self, "mediaSearch");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaSearch");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBUpdateMediaAffinityIntent privateUpdateMediaAffinityIntentData](self, "privateUpdateMediaAffinityIntentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateUpdateMediaAffinityIntentData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBUpdateMediaAffinityIntent privateUpdateMediaAffinityIntentData](self, "privateUpdateMediaAffinityIntentData");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {

LABEL_29:
      v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    -[_INPBUpdateMediaAffinityIntent privateUpdateMediaAffinityIntentData](self, "privateUpdateMediaAffinityIntentData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateUpdateMediaAffinityIntentData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if ((v28 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if (-[_INPBUpdateMediaAffinityIntent hasAffinityType](self, "hasAffinityType"))
    v3 = 2654435761 * self->_affinityType;
  else
    v3 = 0;
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  v5 = -[NSArray hash](self->_mediaItems, "hash");
  v6 = v4 ^ v5 ^ -[_INPBMediaSearch hash](self->_mediaSearch, "hash");
  return v6 ^ -[_INPBPrivateUpdateMediaAffinityIntentData hash](self->_privateUpdateMediaAffinityIntentData, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBUpdateMediaAffinityIntent hasAffinityType](self, "hasAffinityType"))
  {
    v4 = -[_INPBUpdateMediaAffinityIntent affinityType](self, "affinityType");
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2293250[v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("affinityType"));

  }
  -[_INPBUpdateMediaAffinityIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  if (-[NSArray count](self->_mediaItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = self->_mediaItems;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mediaItems"));
  }
  -[_INPBUpdateMediaAffinityIntent mediaSearch](self, "mediaSearch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("mediaSearch"));

  -[_INPBUpdateMediaAffinityIntent privateUpdateMediaAffinityIntentData](self, "privateUpdateMediaAffinityIntentData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("privateUpdateMediaAffinityIntentData"));

  return v3;
}

- (int)affinityType
{
  return self->_affinityType;
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

- (_INPBPrivateUpdateMediaAffinityIntentData)privateUpdateMediaAffinityIntentData
{
  return self->_privateUpdateMediaAffinityIntentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateUpdateMediaAffinityIntentData, 0);
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
