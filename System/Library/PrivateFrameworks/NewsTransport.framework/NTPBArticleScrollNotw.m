@implementation NTPBArticleScrollNotw

- (void)setMaxScrollDepth:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxScrollDepth = a3;
}

- (void)setHasMaxScrollDepth:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxScrollDepth
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
  v8.super_class = (Class)NTPBArticleScrollNotw;
  -[NTPBArticleScrollNotw description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBArticleScrollNotw dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *windowId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v4 = self->_maxScrollDepth;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("max_scroll_depth"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  windowId = self->_windowId;
  if (windowId)
    objc_msgSend(v3, "setObject:forKey:", windowId, CFSTR("window_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleScrollNotwReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
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
  if (self->_windowId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)(v5 + 16) = self->_maxScrollDepth;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[NSString copyWithZone:](self->_windowId, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleId;
  NSString *sourceChannelId;
  NSString *windowId;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_maxScrollDepth != *((float *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_13;
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_13;
  }
  windowId = self->_windowId;
  if ((unint64_t)windowId | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](windowId, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  float maxScrollDepth;
  float v5;
  float v6;
  float v7;
  NSUInteger v8;
  NSUInteger v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    maxScrollDepth = self->_maxScrollDepth;
    v5 = -maxScrollDepth;
    if (maxScrollDepth >= 0.0)
      v5 = self->_maxScrollDepth;
    v6 = floorf(v5 + 0.5);
    v7 = (float)(v5 - v6) * 1.8447e19;
    v3 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabsf(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_articleId, "hash") ^ v3;
  v9 = -[NSString hash](self->_sourceChannelId, "hash");
  return v8 ^ v9 ^ -[NSString hash](self->_windowId, "hash");
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  float *v5;

  v4 = (float *)a3;
  if (((_BYTE)v4[10] & 1) != 0)
  {
    self->_maxScrollDepth = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBArticleScrollNotw setArticleId:](self, "setArticleId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBArticleScrollNotw setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBArticleScrollNotw setWindowId:](self, "setWindowId:");
    v4 = v5;
  }

}

- (float)maxScrollDepth
{
  return self->_maxScrollDepth;
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
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
