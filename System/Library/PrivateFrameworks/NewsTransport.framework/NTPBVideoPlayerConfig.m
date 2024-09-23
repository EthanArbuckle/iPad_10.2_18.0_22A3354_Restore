@implementation NTPBVideoPlayerConfig

- (BOOL)hasDiscoverMoreVideosTitle
{
  return self->_discoverMoreVideosTitle != 0;
}

- (BOOL)hasDiscoverMoreVideosSubtitle
{
  return self->_discoverMoreVideosSubtitle != 0;
}

- (BOOL)hasDiscoverMoreVideosUrl
{
  return self->_discoverMoreVideosUrl != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBVideoPlayerConfig;
  -[NTPBVideoPlayerConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBVideoPlayerConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *discoverMoreVideosTitle;
  NSString *discoverMoreVideosSubtitle;
  NSString *discoverMoreVideosUrl;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  discoverMoreVideosTitle = self->_discoverMoreVideosTitle;
  if (discoverMoreVideosTitle)
    objc_msgSend(v3, "setObject:forKey:", discoverMoreVideosTitle, CFSTR("discover_more_videos_title"));
  discoverMoreVideosSubtitle = self->_discoverMoreVideosSubtitle;
  if (discoverMoreVideosSubtitle)
    objc_msgSend(v4, "setObject:forKey:", discoverMoreVideosSubtitle, CFSTR("discover_more_videos_subtitle"));
  discoverMoreVideosUrl = self->_discoverMoreVideosUrl;
  if (discoverMoreVideosUrl)
    objc_msgSend(v4, "setObject:forKey:", discoverMoreVideosUrl, CFSTR("discover_more_videos_url"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBVideoPlayerConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_discoverMoreVideosTitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_discoverMoreVideosSubtitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_discoverMoreVideosUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_discoverMoreVideosTitle, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_discoverMoreVideosSubtitle, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_discoverMoreVideosUrl, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *discoverMoreVideosTitle;
  NSString *discoverMoreVideosSubtitle;
  NSString *discoverMoreVideosUrl;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((discoverMoreVideosTitle = self->_discoverMoreVideosTitle, !((unint64_t)discoverMoreVideosTitle | v4[2]))
     || -[NSString isEqual:](discoverMoreVideosTitle, "isEqual:"))
    && ((discoverMoreVideosSubtitle = self->_discoverMoreVideosSubtitle,
         !((unint64_t)discoverMoreVideosSubtitle | v4[1]))
     || -[NSString isEqual:](discoverMoreVideosSubtitle, "isEqual:")))
  {
    discoverMoreVideosUrl = self->_discoverMoreVideosUrl;
    if ((unint64_t)discoverMoreVideosUrl | v4[3])
      v8 = -[NSString isEqual:](discoverMoreVideosUrl, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_discoverMoreVideosTitle, "hash");
  v4 = -[NSString hash](self->_discoverMoreVideosSubtitle, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_discoverMoreVideosUrl, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[NTPBVideoPlayerConfig setDiscoverMoreVideosTitle:](self, "setDiscoverMoreVideosTitle:");
  if (v4[1])
    -[NTPBVideoPlayerConfig setDiscoverMoreVideosSubtitle:](self, "setDiscoverMoreVideosSubtitle:");
  if (v4[3])
    -[NTPBVideoPlayerConfig setDiscoverMoreVideosUrl:](self, "setDiscoverMoreVideosUrl:");

}

- (NSString)discoverMoreVideosTitle
{
  return self->_discoverMoreVideosTitle;
}

- (void)setDiscoverMoreVideosTitle:(id)a3
{
  objc_storeStrong((id *)&self->_discoverMoreVideosTitle, a3);
}

- (NSString)discoverMoreVideosSubtitle
{
  return self->_discoverMoreVideosSubtitle;
}

- (void)setDiscoverMoreVideosSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_discoverMoreVideosSubtitle, a3);
}

- (NSString)discoverMoreVideosUrl
{
  return self->_discoverMoreVideosUrl;
}

- (void)setDiscoverMoreVideosUrl:(id)a3
{
  objc_storeStrong((id *)&self->_discoverMoreVideosUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverMoreVideosUrl, 0);
  objc_storeStrong((id *)&self->_discoverMoreVideosTitle, 0);
  objc_storeStrong((id *)&self->_discoverMoreVideosSubtitle, 0);
}

@end
