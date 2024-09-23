@implementation _INPBAddMediaIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setMediaDestination:(id)a3
{
  objc_storeStrong((id *)&self->_mediaDestination, a3);
}

- (BOOL)hasMediaDestination
{
  return self->_mediaDestination != 0;
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

- (void)setPrivateAddMediaIntentData:(id)a3
{
  objc_storeStrong((id *)&self->_privateAddMediaIntentData, a3);
}

- (BOOL)hasPrivateAddMediaIntentData
{
  return self->_privateAddMediaIntentData != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAddMediaIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
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
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBAddMediaIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBAddMediaIntent intentMetadata](self, "intentMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBAddMediaIntent mediaDestination](self, "mediaDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBAddMediaIntent mediaDestination](self, "mediaDestination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_mediaItems;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[_INPBAddMediaIntent mediaSearch](self, "mediaSearch", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBAddMediaIntent mediaSearch](self, "mediaSearch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBAddMediaIntent privateAddMediaIntentData](self, "privateAddMediaIntentData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBAddMediaIntent privateAddMediaIntentData](self, "privateAddMediaIntentData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBAddMediaIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAddMediaIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAddMediaIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAddMediaIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAddMediaIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBAddMediaIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAddMediaIntent *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = -[_INPBAddMediaIntent init](+[_INPBAddMediaIntent allocWithZone:](_INPBAddMediaIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBAddMediaIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBMediaDestination copyWithZone:](self->_mediaDestination, "copyWithZone:", a3);
  -[_INPBAddMediaIntent setMediaDestination:](v5, "setMediaDestination:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_mediaItems, "copyWithZone:", a3);
  -[_INPBAddMediaIntent setMediaItems:](v5, "setMediaItems:", v8);

  v9 = -[_INPBMediaSearch copyWithZone:](self->_mediaSearch, "copyWithZone:", a3);
  -[_INPBAddMediaIntent setMediaSearch:](v5, "setMediaSearch:", v9);

  v10 = -[_INPBPrivateAddMediaIntentData copyWithZone:](self->_privateAddMediaIntentData, "copyWithZone:", a3);
  -[_INPBAddMediaIntent setPrivateAddMediaIntentData:](v5, "setPrivateAddMediaIntentData:", v10);

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
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_INPBAddMediaIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBAddMediaIntent intentMetadata](self, "intentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAddMediaIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBAddMediaIntent mediaDestination](self, "mediaDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBAddMediaIntent mediaDestination](self, "mediaDestination");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBAddMediaIntent mediaDestination](self, "mediaDestination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaDestination");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBAddMediaIntent mediaItems](self, "mediaItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBAddMediaIntent mediaItems](self, "mediaItems");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBAddMediaIntent mediaItems](self, "mediaItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBAddMediaIntent mediaSearch](self, "mediaSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBAddMediaIntent mediaSearch](self, "mediaSearch");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBAddMediaIntent mediaSearch](self, "mediaSearch");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaSearch");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBAddMediaIntent privateAddMediaIntentData](self, "privateAddMediaIntentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateAddMediaIntentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBAddMediaIntent privateAddMediaIntentData](self, "privateAddMediaIntentData");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBAddMediaIntent privateAddMediaIntentData](self, "privateAddMediaIntentData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateAddMediaIntentData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v4 = -[_INPBMediaDestination hash](self->_mediaDestination, "hash") ^ v3;
  v5 = -[NSArray hash](self->_mediaItems, "hash");
  v6 = v4 ^ v5 ^ -[_INPBMediaSearch hash](self->_mediaSearch, "hash");
  return v6 ^ -[_INPBPrivateAddMediaIntentData hash](self->_privateAddMediaIntentData, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
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
  -[_INPBAddMediaIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  -[_INPBAddMediaIntent mediaDestination](self, "mediaDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mediaDestination"));

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
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "dictionaryRepresentation", (_QWORD)v20);
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
  -[_INPBAddMediaIntent mediaSearch](self, "mediaSearch", (_QWORD)v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("mediaSearch"));

  -[_INPBAddMediaIntent privateAddMediaIntentData](self, "privateAddMediaIntentData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("privateAddMediaIntentData"));

  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBMediaDestination)mediaDestination
{
  return self->_mediaDestination;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (_INPBMediaSearch)mediaSearch
{
  return self->_mediaSearch;
}

- (_INPBPrivateAddMediaIntentData)privateAddMediaIntentData
{
  return self->_privateAddMediaIntentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateAddMediaIntentData, 0);
  objc_storeStrong((id *)&self->_mediaSearch, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_mediaDestination, 0);
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
