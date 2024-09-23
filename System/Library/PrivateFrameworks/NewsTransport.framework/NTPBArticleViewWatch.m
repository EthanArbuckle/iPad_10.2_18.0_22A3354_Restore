@implementation NTPBArticleViewWatch

- (int)articleHostViewTypeWatch
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_articleHostViewTypeWatch;
  else
    return 0;
}

- (void)setArticleHostViewTypeWatch:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_articleHostViewTypeWatch = a3;
}

- (void)setHasArticleHostViewTypeWatch:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleHostViewTypeWatch
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasArticleViewingSessionIdWatch
{
  return self->_articleViewingSessionIdWatch != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setDidScroll:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_didScroll = a3;
}

- (void)setHasDidScroll:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDidScroll
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)NTPBArticleViewWatch;
  -[NTPBArticleViewWatch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBArticleViewWatch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleViewingSessionIdWatch;
  NSString *articleId;
  NSString *sourceChannelId;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_articleHostViewTypeWatch);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("article_host_view_type_watch"));

  }
  articleViewingSessionIdWatch = self->_articleViewingSessionIdWatch;
  if (articleViewingSessionIdWatch)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionIdWatch, CFSTR("article_viewing_session_id_watch"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didScroll);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("did_scroll"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleViewWatchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_articleViewingSessionIdWatch)
    PBDataWriterWriteStringField();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_articleHostViewTypeWatch;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_articleViewingSessionIdWatch, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 40) = self->_didScroll;
    *(_BYTE *)(v6 + 44) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleViewingSessionIdWatch;
  NSString *articleId;
  NSString *sourceChannelId;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_articleHostViewTypeWatch != *((_DWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_15;
  }
  articleViewingSessionIdWatch = self->_articleViewingSessionIdWatch;
  if ((unint64_t)articleViewingSessionIdWatch | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](articleViewingSessionIdWatch, "isEqual:"))
  {
    goto LABEL_15;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_15;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_15;
  }
  v8 = (*((_BYTE *)v4 + 44) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0)
    {
LABEL_15:
      v8 = 0;
      goto LABEL_16;
    }
    if (self->_didScroll)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_15;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_15;
    }
    v8 = 1;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_articleHostViewTypeWatch;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_articleViewingSessionIdWatch, "hash");
  v5 = -[NSString hash](self->_articleId, "hash");
  v6 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_didScroll;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_articleHostViewTypeWatch = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBArticleViewWatch setArticleViewingSessionIdWatch:](self, "setArticleViewingSessionIdWatch:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBArticleViewWatch setArticleId:](self, "setArticleId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBArticleViewWatch setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    self->_didScroll = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)articleViewingSessionIdWatch
{
  return self->_articleViewingSessionIdWatch;
}

- (void)setArticleViewingSessionIdWatch:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionIdWatch, a3);
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

- (BOOL)didScroll
{
  return self->_didScroll;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionIdWatch, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
