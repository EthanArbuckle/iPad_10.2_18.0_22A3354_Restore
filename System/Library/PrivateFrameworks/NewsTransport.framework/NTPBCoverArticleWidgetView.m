@implementation NTPBCoverArticleWidgetView

- (BOOL)hasCoverArticleWidgetViewingSessionId
{
  return self->_coverArticleWidgetViewingSessionId != 0;
}

- (void)setCoverArticleWidgetArticleCount:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_coverArticleWidgetArticleCount = a3;
}

- (void)setHasCoverArticleWidgetArticleCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoverArticleWidgetArticleCount
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
  v8.super_class = (Class)NTPBCoverArticleWidgetView;
  -[NTPBCoverArticleWidgetView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBCoverArticleWidgetView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *coverArticleWidgetViewingSessionId;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  coverArticleWidgetViewingSessionId = self->_coverArticleWidgetViewingSessionId;
  if (coverArticleWidgetViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", coverArticleWidgetViewingSessionId, CFSTR("cover_article_widget_viewing_session_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_coverArticleWidgetArticleCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("cover_article_widget_article_count"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCoverArticleWidgetViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_coverArticleWidgetViewingSessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_coverArticleWidgetViewingSessionId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_coverArticleWidgetArticleCount;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *coverArticleWidgetViewingSessionId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  coverArticleWidgetViewingSessionId = self->_coverArticleWidgetViewingSessionId;
  if ((unint64_t)coverArticleWidgetViewingSessionId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](coverArticleWidgetViewingSessionId, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_coverArticleWidgetArticleCount == *((_DWORD *)v4 + 2))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_coverArticleWidgetViewingSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_coverArticleWidgetArticleCount;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[NTPBCoverArticleWidgetView setCoverArticleWidgetViewingSessionId:](self, "setCoverArticleWidgetViewingSessionId:");
    v4 = v5;
  }
  if ((v4[6] & 1) != 0)
  {
    self->_coverArticleWidgetArticleCount = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)coverArticleWidgetViewingSessionId
{
  return self->_coverArticleWidgetViewingSessionId;
}

- (void)setCoverArticleWidgetViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_coverArticleWidgetViewingSessionId, a3);
}

- (int)coverArticleWidgetArticleCount
{
  return self->_coverArticleWidgetArticleCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverArticleWidgetViewingSessionId, 0);
}

@end
