@implementation CAFNowPlayingSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CAFNowPlayingSnapshot artworkData](self, "artworkData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("kCAFCarNowPlayingArtworkKey"));

  -[CAFNowPlayingSnapshot titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("kCAFCarNowPlayingTitlesKey"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[CAFNowPlayingSnapshot mediaSourceType](self, "mediaSourceType"), CFSTR("kCAFCarNowPlayingSourceTypeKey"));
  -[CAFNowPlayingSnapshot currentMediaSourceIdentifier](self, "currentMediaSourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("kCAFCarNowPlayingMediaSourceIdentifierKey"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[CAFNowPlayingSnapshot lastArtworkToken](self, "lastArtworkToken"), CFSTR("kCAFCarNowPlayingLastArtworkToken"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[CAFNowPlayingSnapshot lastMediaItemImageToken](self, "lastMediaItemImageToken"), CFSTR("kCAFCarNowPlayingLastMediaItemImageToken"));

}

- (CAFNowPlayingSnapshot)initWithCoder:(id)a3
{
  id v4;
  CAFNowPlayingSnapshot *v5;
  uint64_t v6;
  NSData *artworkData;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *titles;
  uint64_t v13;
  NSString *currentMediaSourceIdentifier;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAFNowPlayingSnapshot;
  v5 = -[CAFNowPlayingSnapshot init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCAFCarNowPlayingArtworkKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    artworkData = v5->_artworkData;
    v5->_artworkData = (NSData *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kCAFCarNowPlayingTitlesKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    titles = v5->_titles;
    v5->_titles = (NSArray *)v11;

    v5->_mediaSourceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCAFCarNowPlayingSourceTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCAFCarNowPlayingMediaSourceIdentifierKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    currentMediaSourceIdentifier = v5->_currentMediaSourceIdentifier;
    v5->_currentMediaSourceIdentifier = (NSString *)v13;

    v5->_lastArtworkToken = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCAFCarNowPlayingLastArtworkToken"));
    v5->_lastMediaItemImageToken = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCAFCarNowPlayingLastMediaItemImageToken"));
  }

  return v5;
}

- (CAFNowPlayingSnapshot)initWithTitles:(id)a3 artworkData:(id)a4 mediaSourceType:(unsigned __int8)a5 mediaSourceIdentifier:(id)a6 artworkToken:(int64_t)a7 mediaItemImageToken:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  CAFNowPlayingSnapshot *v18;
  CAFNowPlayingSnapshot *v19;
  objc_super v21;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CAFNowPlayingSnapshot;
  v18 = -[CAFNowPlayingSnapshot init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_titles, a3);
    objc_storeStrong((id *)&v19->_artworkData, a4);
    v19->_mediaSourceType = a5;
    objc_storeStrong((id *)&v19->_currentMediaSourceIdentifier, a6);
    v19->_lastArtworkToken = a7;
    v19->_lastMediaItemImageToken = a8;
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)CAFNowPlayingSnapshot;
  -[CAFNowPlayingSnapshot description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFNowPlayingSnapshot currentMediaSourceIdentifier](self, "currentMediaSourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[CAFNowPlayingSnapshot mediaSourceType](self, "mediaSourceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFNowPlayingSnapshot titles](self, "titles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAFNowPlayingSnapshot lastArtworkToken](self, "lastArtworkToken");
  v9 = -[CAFNowPlayingSnapshot lastMediaItemImageToken](self, "lastMediaItemImageToken");
  -[CAFNowPlayingSnapshot artworkData](self, "artworkData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: source %@ (%@) titles %@, artwork tokens (%lu,%lu), artwork %@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "titles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlayingSnapshot titles](self, "titles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToArray:", v6))
    {
      objc_msgSend(v4, "artworkData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFNowPlayingSnapshot artworkData](self, "artworkData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToData:", v8)
        && (v9 = objc_msgSend(v4, "mediaSourceType"),
            v9 == -[CAFNowPlayingSnapshot mediaSourceType](self, "mediaSourceType")))
      {
        objc_msgSend(v4, "currentMediaSourceIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFNowPlayingSnapshot currentMediaSourceIdentifier](self, "currentMediaSourceIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11)
          && (v12 = objc_msgSend(v4, "lastArtworkToken"),
              v12 == -[CAFNowPlayingSnapshot lastArtworkToken](self, "lastArtworkToken")))
        {
          v13 = objc_msgSend(v4, "lastMediaItemImageToken");
          v14 = v13 == -[CAFNowPlayingSnapshot lastMediaItemImageToken](self, "lastMediaItemImageToken");
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAFNowPlayingSnapshot *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CAFNowPlayingSnapshot *v9;

  v4 = [CAFNowPlayingSnapshot alloc];
  -[CAFNowPlayingSnapshot titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFNowPlayingSnapshot artworkData](self, "artworkData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAFNowPlayingSnapshot mediaSourceType](self, "mediaSourceType");
  -[CAFNowPlayingSnapshot currentMediaSourceIdentifier](self, "currentMediaSourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CAFNowPlayingSnapshot initWithTitles:artworkData:mediaSourceType:mediaSourceIdentifier:artworkToken:mediaItemImageToken:](v4, "initWithTitles:artworkData:mediaSourceType:mediaSourceIdentifier:artworkToken:mediaItemImageToken:", v5, v6, v7, v8, -[CAFNowPlayingSnapshot lastArtworkToken](self, "lastArtworkToken"), -[CAFNowPlayingSnapshot lastMediaItemImageToken](self, "lastMediaItemImageToken"));

  return v9;
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (NSArray)titles
{
  return self->_titles;
}

- (unsigned)mediaSourceType
{
  return self->_mediaSourceType;
}

- (NSString)currentMediaSourceIdentifier
{
  return self->_currentMediaSourceIdentifier;
}

- (int64_t)lastArtworkToken
{
  return self->_lastArtworkToken;
}

- (int64_t)lastMediaItemImageToken
{
  return self->_lastMediaItemImageToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMediaSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);
}

@end
