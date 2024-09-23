@implementation NTPBTocCellExposureArticleElement

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (int)articleType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_articleType;
  else
    return 0;
}

- (void)setArticleType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasArticleType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD4E580[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArticleType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEBVIEW_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLINT_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AD_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXTERNAL_WEBLINK_ARTICLE_TYPE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NTPBTocCellExposureArticleElement;
  -[NTPBTocCellExposureArticleElement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTocCellExposureArticleElement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleId;
  uint64_t articleType;
  __CFString *v7;
  NSString *sourceChannelId;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_24CD4E580[articleType];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("article_type"));

  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v4, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("publisher_article_version_int64"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTocCellExposureArticleElementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_articleType;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_publisherArticleVersionInt64;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleId;
  char has;
  NSString *sourceChannelId;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_16;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_articleType != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
    {
LABEL_16:
      v8 = 0;
      goto LABEL_17;
    }
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 1))
      goto LABEL_16;
    v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_articleId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_articleType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_publisherArticleVersionInt64;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBTocCellExposureArticleElement setArticleId:](self, "setArticleId:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    self->_articleType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBTocCellExposureArticleElement setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_publisherArticleVersionInt64 = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (int64_t)publisherArticleVersionInt64
{
  return self->_publisherArticleVersionInt64;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
