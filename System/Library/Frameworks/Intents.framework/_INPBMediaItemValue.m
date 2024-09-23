@implementation _INPBMediaItemValue

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBMediaItemValue *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v5 = -[_INPBMediaItemValue init](+[_INPBMediaItemValue allocWithZone:](_INPBMediaItemValue, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_artist, "copyWithZone:", a3);
  -[_INPBMediaItemValue setArtist:](v5, "setArtist:", v6);

  v7 = -[_INPBImageValue copyWithZone:](self->_artwork, "copyWithZone:", a3);
  -[_INPBMediaItemValue setArtwork:](v5, "setArtwork:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_assetInfo, "copyWithZone:", a3);
  -[_INPBMediaItemValue setAssetInfo:](v5, "setAssetInfo:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBMediaItemValue setIdentifier:](v5, "setIdentifier:", v9);

  v10 = (void *)-[NSArray copyWithZone:](self->_namedEntities, "copyWithZone:", a3);
  -[_INPBMediaItemValue setNamedEntities:](v5, "setNamedEntities:", v10);

  v11 = -[_INPBPrivateMediaItemValueData copyWithZone:](self->_privateMediaItemValueData, "copyWithZone:", a3);
  -[_INPBMediaItemValue setPrivateMediaItemValueData:](v5, "setPrivateMediaItemValueData:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  -[_INPBMediaItemValue setTitle:](v5, "setTitle:", v12);

  v13 = (void *)-[NSArray copyWithZone:](self->_topics, "copyWithZone:", a3);
  -[_INPBMediaItemValue setTopics:](v5, "setTopics:", v13);

  if (-[_INPBMediaItemValue hasType](self, "hasType"))
    -[_INPBMediaItemValue setType:](v5, "setType:", -[_INPBMediaItemValue type](self, "type"));
  v14 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBMediaItemValue setValueMetadata:](v5, "setValueMetadata:", v14);

  return v5;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)namedEntities
{
  return self->_namedEntities;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)type
{
  return self->_type;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (NSString)title
{
  return self->_title;
}

- (_INPBPrivateMediaItemValueData)privateMediaItemValueData
{
  return self->_privateMediaItemValueData;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBImageValue)artwork
{
  return self->_artwork;
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (void)setType:(int)a3
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
    self->_type = a3;
  }
}

- (void)setTopics:(id)a3
{
  NSArray *v4;
  NSArray *topics;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  topics = self->_topics;
  self->_topics = v4;

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setPrivateMediaItemValueData:(id)a3
{
  objc_storeStrong((id *)&self->_privateMediaItemValueData, a3);
}

- (void)setNamedEntities:(id)a3
{
  NSArray *v4;
  NSArray *namedEntities;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  namedEntities = self->_namedEntities;
  self->_namedEntities = v4;

}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)setArtist:(id)a3
{
  NSString *v4;
  NSString *artist;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  artist = self->_artist;
  self->_artist = v4;

}

- (unint64_t)topicsCount
{
  return -[NSArray count](self->_topics, "count");
}

- (unint64_t)namedEntitiesCount
{
  return -[NSArray count](self->_namedEntities, "count");
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (void)setAssetInfo:(id)a3
{
  NSString *v4;
  NSString *assetInfo;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  assetInfo = self->_assetInfo;
  self->_assetInfo = v4;

}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_artist, "hash");
  v4 = -[_INPBImageValue hash](self->_artwork, "hash");
  v5 = -[NSString hash](self->_assetInfo, "hash");
  v6 = -[NSString hash](self->_identifier, "hash");
  v7 = -[NSArray hash](self->_namedEntities, "hash");
  v8 = -[_INPBPrivateMediaItemValueData hash](self->_privateMediaItemValueData, "hash");
  v9 = -[NSString hash](self->_title, "hash");
  v10 = -[NSArray hash](self->_topics, "hash");
  if (-[_INPBMediaItemValue hasType](self, "hasType"))
    v11 = 2654435761 * self->_type;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_privateMediaItemValueData, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_artist, 0);
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (BOOL)hasAssetInfo
{
  return self->_assetInfo != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)clearNamedEntities
{
  -[NSArray removeAllObjects](self->_namedEntities, "removeAllObjects");
}

- (void)addNamedEntities:(id)a3
{
  id v4;
  NSArray *namedEntities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  namedEntities = self->_namedEntities;
  v8 = v4;
  if (!namedEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_namedEntities;
    self->_namedEntities = v6;

    v4 = v8;
    namedEntities = self->_namedEntities;
  }
  -[NSArray addObject:](namedEntities, "addObject:", v4);

}

- (id)namedEntitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_namedEntities, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasPrivateMediaItemValueData
{
  return self->_privateMediaItemValueData != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)clearTopics
{
  -[NSArray removeAllObjects](self->_topics, "removeAllObjects");
}

- (void)addTopics:(id)a3
{
  id v4;
  NSArray *topics;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  topics = self->_topics;
  v8 = v4;
  if (!topics)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_topics;
    self->_topics = v6;

    v4 = v8;
    topics = self->_topics;
  }
  -[NSArray addObject:](topics, "addObject:", v4);

}

- (id)topicsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_topics, "objectAtIndexedSubscript:", a3);
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 0x15)
    return off_1E2292638[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SONG")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALBUM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTIST")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENRE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLAYLIST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST_SHOW")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST_EPISODE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST_PLAYLIST")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUSIC_STATION")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_BOOK")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOVIE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV_SHOW")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV_SHOW_EPISODE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUSIC_VIDEO")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST_STATION")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RADIO_STATION")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATION")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUSIC")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGORITHMIC_RADIO_STATION")) & 1) != 0)
  {
    v4 = 19;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS")))
  {
    v4 = 20;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMediaItemValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBMediaItemValue artist](self, "artist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBMediaItemValue artwork](self, "artwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBMediaItemValue artwork](self, "artwork");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMediaItemValue assetInfo](self, "assetInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_INPBMediaItemValue identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = self->_namedEntities;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }

  -[_INPBMediaItemValue privateMediaItemValueData](self, "privateMediaItemValueData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBMediaItemValue privateMediaItemValueData](self, "privateMediaItemValueData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMediaItemValue title](self, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_topics;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  if (-[_INPBMediaItemValue hasType](self, "hasType", v25))
    PBDataWriterWriteInt32Field();
  -[_INPBMediaItemValue valueMetadata](self, "valueMetadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[_INPBMediaItemValue valueMetadata](self, "valueMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBMediaItemValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBMediaItemValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBMediaItemValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBMediaItemValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBMediaItemValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBMediaItemValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

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
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  int type;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  BOOL v54;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_51;
  -[_INPBMediaItemValue artist](self, "artist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBMediaItemValue artist](self, "artist");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBMediaItemValue artist](self, "artist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_51;
  }
  else
  {

  }
  -[_INPBMediaItemValue artwork](self, "artwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBMediaItemValue artwork](self, "artwork");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBMediaItemValue artwork](self, "artwork");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artwork");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_51;
  }
  else
  {

  }
  -[_INPBMediaItemValue assetInfo](self, "assetInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBMediaItemValue assetInfo](self, "assetInfo");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBMediaItemValue assetInfo](self, "assetInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_51;
  }
  else
  {

  }
  -[_INPBMediaItemValue identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBMediaItemValue identifier](self, "identifier");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBMediaItemValue identifier](self, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_51;
  }
  else
  {

  }
  -[_INPBMediaItemValue namedEntities](self, "namedEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namedEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBMediaItemValue namedEntities](self, "namedEntities");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBMediaItemValue namedEntities](self, "namedEntities");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "namedEntities");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_51;
  }
  else
  {

  }
  -[_INPBMediaItemValue privateMediaItemValueData](self, "privateMediaItemValueData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateMediaItemValueData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBMediaItemValue privateMediaItemValueData](self, "privateMediaItemValueData");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBMediaItemValue privateMediaItemValueData](self, "privateMediaItemValueData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateMediaItemValueData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_51;
  }
  else
  {

  }
  -[_INPBMediaItemValue title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBMediaItemValue title](self, "title");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBMediaItemValue title](self, "title");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_51;
  }
  else
  {

  }
  -[_INPBMediaItemValue topics](self, "topics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBMediaItemValue topics](self, "topics");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBMediaItemValue topics](self, "topics");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topics");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_51;
  }
  else
  {

  }
  v47 = -[_INPBMediaItemValue hasType](self, "hasType");
  if (v47 != objc_msgSend(v4, "hasType"))
    goto LABEL_51;
  if (-[_INPBMediaItemValue hasType](self, "hasType"))
  {
    if (objc_msgSend(v4, "hasType"))
    {
      type = self->_type;
      if (type != objc_msgSend(v4, "type"))
        goto LABEL_51;
    }
  }
  -[_INPBMediaItemValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBMediaItemValue valueMetadata](self, "valueMetadata");
    v49 = objc_claimAutoreleasedReturnValue();
    if (!v49)
    {

LABEL_54:
      v54 = 1;
      goto LABEL_52;
    }
    v50 = (void *)v49;
    -[_INPBMediaItemValue valueMetadata](self, "valueMetadata");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if ((v53 & 1) != 0)
      goto LABEL_54;
  }
  else
  {
LABEL_50:

  }
LABEL_51:
  v54 = 0;
LABEL_52:

  return v54;
}

- (id)dictionaryRepresentation
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
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_artist)
  {
    -[_INPBMediaItemValue artist](self, "artist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("artist"));

  }
  -[_INPBMediaItemValue artwork](self, "artwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("artwork"));

  if (self->_assetInfo)
  {
    -[_INPBMediaItemValue assetInfo](self, "assetInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assetInfo"));

  }
  if (self->_identifier)
  {
    -[_INPBMediaItemValue identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("identifier"));

  }
  if (-[NSArray count](self->_namedEntities, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = self->_namedEntities;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v40;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v17), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("namedEntities"));
  }
  -[_INPBMediaItemValue privateMediaItemValueData](self, "privateMediaItemValueData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("privateMediaItemValueData"));

  if (self->_title)
  {
    -[_INPBMediaItemValue title](self, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("title"));

  }
  if (-[NSArray count](self->_topics, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = self->_topics;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v36;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v28), "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

          ++v28;
        }
        while (v26 != v28);
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v26);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("topics"));
  }
  if (-[_INPBMediaItemValue hasType](self, "hasType"))
  {
    v30 = -[_INPBMediaItemValue type](self, "type");
    if (v30 >= 0x15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E2292638[v30];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("type"));

  }
  -[_INPBMediaItemValue valueMetadata](self, "valueMetadata");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dictionaryRepresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("valueMetadata"));

  return v3;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

+ (Class)namedEntitiesType
{
  return (Class)objc_opt_class();
}

+ (Class)topicsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
