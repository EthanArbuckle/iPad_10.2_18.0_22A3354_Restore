@implementation SHMatchedMediaItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHMatchedMediaItem)initWithMatchedMediaItemDictionary:(id)a3
{
  return -[SHMatchedMediaItem initWithMatchedMediaItemDictionary:syncedLyrics:](self, "initWithMatchedMediaItemDictionary:syncedLyrics:", a3, 0);
}

- (SHMatchedMediaItem)initWithMatchedMediaItemDictionary:(id)a3 syncedLyrics:(id)a4
{
  id v7;
  SHMatchedMediaItem *v8;
  SHMatchedMediaItem *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SHMatchedMediaItem;
  v8 = -[SHMediaItem initWithProperties:](&v11, sel_initWithProperties_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_syncedLyrics, a4);

  return v9;
}

- (SHMatchedMediaItem)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SHMatchedMediaItem *v9;
  objc_super v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("SHMatchedMediaItemSyncedLyrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)SHMatchedMediaItem;
  v9 = -[SHMediaItem initWithCoder:](&v11, sel_initWithCoder_, v5);

  if (v9)
    objc_storeStrong((id *)&v9->_syncedLyrics, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHMatchedMediaItem;
  v4 = a3;
  -[SHMediaItem encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[SHMatchedMediaItem syncedLyrics](self, "syncedLyrics", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SHMatchedMediaItemSyncedLyrics"));

}

- (NSTimeInterval)matchOffset
{
  void *v2;
  double v3;
  double v4;

  -[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_matchOffset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (float)speedSkew
{
  void *v2;
  float v3;
  float v4;

  -[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_speedSkew"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (float)frequencySkew
{
  void *v2;
  float v3;
  float v4;

  -[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_frequencySkew"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (int64_t)matchScore
{
  void *v2;
  int64_t v3;

  -[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_score"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)syncedLyricsSnippet
{
  return (NSString *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_syncedLyricsSnippet"));
}

- (NSDate)audioStartDate
{
  return (NSDate *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_audioStartDate"));
}

- (NSTimeInterval)predictedCurrentMatchOffset
{
  double v3;
  double v4;
  void *v5;
  double v6;
  NSTimeInterval v7;

  -[SHMatchedMediaItem matchOffset](self, "matchOffset");
  v4 = v3;
  -[SHMatchedMediaItem audioStartDate](self, "audioStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v4 - v6;

  return v7;
}

- (NSArray)signatureAlignments
{
  return (NSArray *)-[SHMediaItem validValueForProperty:](self, "validValueForProperty:", CFSTR("sh_signatureAlignments"));
}

- (id)creationDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SHMatchedMediaItem;
  -[SHMediaItem creationDate](&v8, sel_creationDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SHMatchedMediaItem audioStartDate](self, "audioStartDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[SHMediaItem shazamID](self, "shazamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shazamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    sub_218C1A2F4(self, "objectForKeyedSubscript:", CFSTR("sh_score"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sh_score"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SHSyncedLyrics)syncedLyrics
{
  return self->_syncedLyrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedLyrics, 0);
}

@end
