@implementation SHMediaItem

+ (SHMediaItem)mediaItemWithProperties:(NSDictionary *)properties
{
  NSDictionary *v3;
  SHMediaItem *v4;

  v3 = properties;
  v4 = -[SHMediaItem initWithProperties:]([SHMediaItem alloc], "initWithProperties:", v3);

  return v4;
}

- (SHMediaItem)initWithProperties:(id)a3
{
  id v5;
  SHMediaItem *v6;
  SHMediaItem *v7;
  uint64_t v8;
  NSUUID *underlyingIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHMediaItem;
  v6 = -[SHMediaItem init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_properties, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    underlyingIdentifier = v7->_underlyingIdentifier;
    v7->_underlyingIdentifier = (NSUUID *)v8;

  }
  return v7;
}

- (id)valueForProperty:(SHMediaItemProperty)property
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = property;
  -[SHMediaItem properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectForKeyedSubscript:(SHMediaItemProperty)key
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = key;
  -[SHMediaItem properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHMediaItem *v5;
  void *v6;
  void *v7;
  SHMediaItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = [SHMediaItem alloc];
  -[SHMediaItem properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[SHMediaItem initWithProperties:](v5, "initWithProperties:", v7);

  -[SHMediaItem _rawResponseSongs](self, "_rawResponseSongs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  -[SHMediaItem set_rawResponseSongs:](v8, "set_rawResponseSongs:", v10);

  -[SHMediaItem underlyingIdentifier](self, "underlyingIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  -[SHMediaItem setUnderlyingIdentifier:](v8, "setUnderlyingIdentifier:", v12);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SHMediaItem properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("properties"));

  -[SHMediaItem _rawResponseSongs](self, "_rawResponseSongs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SHMediaItemRawResponseDictionary"));

  -[SHMediaItem underlyingIdentifier](self, "underlyingIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("underlyingIdentifier"));

}

- (SHMediaItem)initWithCoder:(id)a3
{
  id v4;
  SHMediaItem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *properties;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSUUID *v17;
  NSUUID *underlyingIdentifier;
  objc_super v20;
  _QWORD v21[4];
  _QWORD v22[12];

  v22[11] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SHMediaItem;
  v5 = -[SHMediaItem init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCEF0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    v22[4] = objc_opt_class();
    v22[5] = objc_opt_class();
    v22[6] = objc_opt_class();
    v22[7] = objc_opt_class();
    v22[8] = objc_opt_class();
    v22[9] = objc_opt_class();
    v22[10] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addObject:", objc_opt_class());
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("properties"));
    v9 = objc_claimAutoreleasedReturnValue();
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("SHMediaItemRawResponseDictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->__rawResponseSongs, v14);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("underlyingIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v17 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    underlyingIdentifier = v5->_underlyingIdentifier;
    v5->_underlyingIdentifier = v17;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SHMediaItem *v4;
  BOOL v5;

  v4 = (SHMediaItem *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[SHMediaItem isEqualMediaItem:](self, "isEqualMediaItem:", v4);
  }

  return v5;
}

- (BOOL)isEqualMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SHMediaItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SHMediaItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[SHMediaItem properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)shazamID
{
  return (NSString *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_shazamID"));
}

- (NSString)title
{
  return (NSString *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_title"));
}

- (NSString)subtitle
{
  return (NSString *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_subtitle"));
}

- (NSString)artist
{
  return (NSString *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_artist"));
}

- (NSURL)webURL
{
  return (NSURL *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_webURL"));
}

- (NSURL)artworkURL
{
  return (NSURL *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_artworkURL"));
}

- (NSURL)appleMusicURL
{
  return (NSURL *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_appleMusicURL"));
}

- (NSString)appleMusicID
{
  return (NSString *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_appleMusicID"));
}

- (NSURL)videoURL
{
  return (NSURL *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_videoURL"));
}

- (BOOL)explicitContent
{
  void *v2;
  char v3;

  -[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_explicitContent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSDate)releaseDate
{
  return (NSDate *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_releaseDate"));
}

- (NSArray)genres
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_genres"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (NSString)isrc
{
  return (NSString *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_isrc"));
}

- (NSString)albumName
{
  return (NSString *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_albumName"));
}

- (NSString)lyricsSnippet
{
  return (NSString *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_lyricsSnippet"));
}

- (int64_t)shazamCount
{
  void *v2;
  int64_t v3;

  -[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_shazamCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSArray)staticLyricLines
{
  return (NSArray *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_staticLyricLines"));
}

- (NSArray)timeRanges
{
  return (NSArray *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_timeRanges"));
}

- (NSArray)frequencySkewRanges
{
  return (NSArray *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_frequencySkewRanges"));
}

- (NSDate)creationDate
{
  return (NSDate *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_creationDate"));
}

- (NSUUID)identifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SHMediaItem underlyingIdentifier](self, "underlyingIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSUUID *)v6;
}

- (NSString)providerIdentifier
{
  return (NSString *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_providerIdentifier"));
}

- (CLLocation)matchLocation
{
  return (CLLocation *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_matchLocation"));
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (id)validValueForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  -[SHMediaItem properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && +[SHMediaItemPropertyUtilities isShazamKitDefinedMediaItemProperty:](SHMediaItemPropertyUtilities, "isShazamKitDefinedMediaItemProperty:", v4))
  {
    v7 = 0;
  }
  else
  {
    if (v6)
    {
      if (+[SHMediaItemPropertyUtilities isShazamKitDefinedMediaItemProperty:](SHMediaItemPropertyUtilities, "isShazamKitDefinedMediaItemProperty:", v4))
      {
        +[SHMediaItemPropertyUtilities typeForShazamKitProperty:](SHMediaItemPropertyUtilities, "typeForShazamKitProperty:", v4);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x24BDBCE88];
          v10 = *MEMORY[0x24BDBCAB0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Value for %@ is not of the correct type: %@"), v4, v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
          v12 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v12);
        }
      }
    }
    v7 = v6;
  }

  return v7;
}

- (NSString)fuzzyRepresentation
{
  NSString *fuzzyRepresentation;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  NSString *v16;

  fuzzyRepresentation = self->_fuzzyRepresentation;
  if (!fuzzyRepresentation)
  {
    -[SHMediaItem title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("(["));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5);

    objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invertedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHMediaItem title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", &stru_24D9B9A60);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = self->_fuzzyRepresentation;
      self->_fuzzyRepresentation = v13;
    }
    else
    {
      objc_msgSend(v9, "substringToIndex:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsSeparatedByCharactersInSet:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", &stru_24D9B9A60);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      v16 = self->_fuzzyRepresentation;
      self->_fuzzyRepresentation = v15;

    }
    fuzzyRepresentation = self->_fuzzyRepresentation;
  }
  return fuzzyRepresentation;
}

- (BOOL)describesFrequencySkew:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SHMediaItem frequencySkewRanges](self, "frequencySkewRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SHMediaItem frequencySkewRanges](self, "frequencySkewRanges", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "contains:", a3) & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)describesOffset:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SHMediaItem timeRanges](self, "timeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[SHMediaItem timeRanges](self, "timeRanges", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      v10 = a3 + 0.01;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "contains:", v10) & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

+ (void)fetchMediaItemWithShazamID:(NSString *)shazamID completionHandler:(void *)completionHandler
{
  +[SHMediaItemDaemonConnection fetchMediaItemWithShazamID:completionHandler:](SHMediaItemDaemonConnection, "fetchMediaItemWithShazamID:completionHandler:", shazamID, completionHandler);
}

+ (void)fetchMediaItemsWithShazamIDs:(id)a3 completionHandler:(id)a4
{
  +[SHMediaItemDaemonConnection fetchMediaItemsWithShazamIDs:completionHandler:](SHMediaItemDaemonConnection, "fetchMediaItemsWithShazamIDs:completionHandler:", a3, a4);
}

+ (void)fetchHapticsWithMediaItems:(id)a3 completionHandler:(id)a4
{
  +[SHMediaItemDaemonConnection fetchHapticsWithMediaItems:completionHandler:](SHMediaItemDaemonConnection, "fetchHapticsWithMediaItems:completionHandler:", a3, a4);
}

+ (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4
{
  +[SHMediaItemDaemonConnection isHapticTrackAvailableForMediaItem:completionHandler:](SHMediaItemDaemonConnection, "isHapticTrackAvailableForMediaItem:completionHandler:", a3, a4);
}

- (NSUUID)underlyingIdentifier
{
  return self->_underlyingIdentifier;
}

- (void)setUnderlyingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingIdentifier, a3);
}

- (NSDictionary)_rawResponseSongs
{
  return self->__rawResponseSongs;
}

- (void)set_rawResponseSongs:(id)a3
{
  objc_storeStrong((id *)&self->__rawResponseSongs, a3);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->__rawResponseSongs, 0);
  objc_storeStrong((id *)&self->_underlyingIdentifier, 0);
  objc_storeStrong((id *)&self->_fuzzyRepresentation, 0);
}

@end
