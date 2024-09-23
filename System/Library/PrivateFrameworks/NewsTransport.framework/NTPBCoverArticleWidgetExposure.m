@implementation NTPBCoverArticleWidgetExposure

- (BOOL)hasCoverArticleWidgetExposureSessionId
{
  return self->_coverArticleWidgetExposureSessionId != 0;
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

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
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
  v8.super_class = (Class)NTPBCoverArticleWidgetExposure;
  -[NTPBCoverArticleWidgetExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBCoverArticleWidgetExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *coverArticleWidgetExposureSessionId;
  void *v6;
  NSData *feedViewExposureId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  coverArticleWidgetExposureSessionId = self->_coverArticleWidgetExposureSessionId;
  if (coverArticleWidgetExposureSessionId)
    objc_msgSend(v3, "setObject:forKey:", coverArticleWidgetExposureSessionId, CFSTR("cover_article_widget_exposure_session_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_coverArticleWidgetArticleCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("cover_article_widget_article_count"));

  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v4, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCoverArticleWidgetExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_coverArticleWidgetExposureSessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_feedViewExposureId)
  {
    PBDataWriterWriteDataField();
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
  v6 = -[NSData copyWithZone:](self->_coverArticleWidgetExposureSessionId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_coverArticleWidgetArticleCount;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *coverArticleWidgetExposureSessionId;
  NSData *feedViewExposureId;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  coverArticleWidgetExposureSessionId = self->_coverArticleWidgetExposureSessionId;
  if ((unint64_t)coverArticleWidgetExposureSessionId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](coverArticleWidgetExposureSessionId, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_coverArticleWidgetArticleCount != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 3))
    v7 = -[NSData isEqual:](feedViewExposureId, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_coverArticleWidgetExposureSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_coverArticleWidgetArticleCount;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSData hash](self->_feedViewExposureId, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBCoverArticleWidgetExposure setCoverArticleWidgetExposureSessionId:](self, "setCoverArticleWidgetExposureSessionId:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_coverArticleWidgetArticleCount = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBCoverArticleWidgetExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
    v4 = v5;
  }

}

- (NSData)coverArticleWidgetExposureSessionId
{
  return self->_coverArticleWidgetExposureSessionId;
}

- (void)setCoverArticleWidgetExposureSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_coverArticleWidgetExposureSessionId, a3);
}

- (int)coverArticleWidgetArticleCount
{
  return self->_coverArticleWidgetArticleCount;
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_coverArticleWidgetExposureSessionId, 0);
}

@end
