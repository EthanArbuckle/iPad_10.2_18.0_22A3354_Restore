@implementation NTPBArticleViewNotw

- (int)articleViewType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_articleViewType;
  else
    return 0;
}

- (void)setArticleViewType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_articleViewType = a3;
}

- (void)setHasArticleViewType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleViewType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setMaxScrollDepth:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_maxScrollDepth = a3;
}

- (void)setHasMaxScrollDepth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxScrollDepth
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
}

- (BOOL)hasReferringSite
{
  return self->_referringSite != 0;
}

- (BOOL)hasWindowId
{
  return self->_windowId != 0;
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
  v8.super_class = (Class)NTPBArticleViewNotw;
  -[NTPBArticleViewNotw description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBArticleViewNotw dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *articleId;
  NSString *sourceChannelId;
  void *v8;
  NSString *referringUrl;
  NSString *referringSite;
  NSString *windowId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_articleViewType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("article_view_type"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(float *)&v4 = self->_maxScrollDepth;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("max_scroll_depth"));

  }
  referringUrl = self->_referringUrl;
  if (referringUrl)
    objc_msgSend(v3, "setObject:forKey:", referringUrl, CFSTR("referring_url"));
  referringSite = self->_referringSite;
  if (referringSite)
    objc_msgSend(v3, "setObject:forKey:", referringSite, CFSTR("referring_site"));
  windowId = self->_windowId;
  if (windowId)
    objc_msgSend(v3, "setObject:forKey:", windowId, CFSTR("window_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleViewNotwReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_referringUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_referringSite)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_windowId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_articleViewType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  v9 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(float *)(v6 + 20) = self->_maxScrollDepth;
    *(_BYTE *)(v6 + 56) |= 2u;
  }
  v11 = -[NSString copyWithZone:](self->_referringUrl, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_referringSite, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v13;

  v15 = -[NSString copyWithZone:](self->_windowId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v15;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleId;
  NSString *sourceChannelId;
  NSString *referringUrl;
  NSString *referringSite;
  NSString *windowId;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_articleViewType != *((_DWORD *)v4 + 4))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_22;
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_maxScrollDepth != *((float *)v4 + 5))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_22;
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](referringUrl, "isEqual:"))
  {
    goto LABEL_22;
  }
  referringSite = self->_referringSite;
  if ((unint64_t)referringSite | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](referringSite, "isEqual:"))
      goto LABEL_22;
  }
  windowId = self->_windowId;
  if ((unint64_t)windowId | *((_QWORD *)v4 + 6))
    v10 = -[NSString isEqual:](windowId, "isEqual:");
  else
    v10 = 1;
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  float maxScrollDepth;
  float v8;
  float v9;
  float v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_articleViewType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_articleId, "hash");
  v5 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    maxScrollDepth = self->_maxScrollDepth;
    v8 = -maxScrollDepth;
    if (maxScrollDepth >= 0.0)
      v8 = self->_maxScrollDepth;
    v9 = floorf(v8 + 0.5);
    v10 = (float)(v8 - v9) * 1.8447e19;
    v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  v11 = v4 ^ v3 ^ v5 ^ v6;
  v12 = -[NSString hash](self->_referringUrl, "hash");
  v13 = v12 ^ -[NSString hash](self->_referringSite, "hash");
  return v11 ^ v13 ^ -[NSString hash](self->_windowId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_articleViewType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBArticleViewNotw setArticleId:](self, "setArticleId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBArticleViewNotw setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    self->_maxScrollDepth = *((float *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBArticleViewNotw setReferringUrl:](self, "setReferringUrl:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBArticleViewNotw setReferringSite:](self, "setReferringSite:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBArticleViewNotw setWindowId:](self, "setWindowId:");
    v4 = v5;
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

- (float)maxScrollDepth
{
  return self->_maxScrollDepth;
}

- (NSString)referringUrl
{
  return self->_referringUrl;
}

- (void)setReferringUrl:(id)a3
{
  objc_storeStrong((id *)&self->_referringUrl, a3);
}

- (NSString)referringSite
{
  return self->_referringSite;
}

- (void)setReferringSite:(id)a3
{
  objc_storeStrong((id *)&self->_referringSite, a3);
}

- (NSString)windowId
{
  return self->_windowId;
}

- (void)setWindowId:(id)a3
{
  objc_storeStrong((id *)&self->_windowId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_referringUrl, 0);
  objc_storeStrong((id *)&self->_referringSite, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
