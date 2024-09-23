@implementation NTPBShareSheetExposure

- (int)contentType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_contentType;
  else
    return 0;
}

- (void)setContentType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)contentTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD50B20[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsContentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTICLE_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEED_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDF_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUE_CONTENT_TYPE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (int)shareSheetExposureLocation
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_shareSheetExposureLocation;
  else
    return 0;
}

- (void)setShareSheetExposureLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shareSheetExposureLocation = a3;
}

- (void)setHasShareSheetExposureLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShareSheetExposureLocation
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
  v8.super_class = (Class)NTPBShareSheetExposure;
  -[NTPBShareSheetExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBShareSheetExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t contentType;
  __CFString *v5;
  NSString *contentId;
  NSString *referencedArticleId;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    contentType = self->_contentType;
    if (contentType >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_contentType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CD50B20[contentType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("content_type"));

  }
  contentId = self->_contentId;
  if (contentId)
    objc_msgSend(v3, "setObject:forKey:", contentId, CFSTR("content_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v3, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_shareSheetExposureLocation);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("share_sheet_exposure_location"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBShareSheetExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_contentId)
    PBDataWriterWriteStringField();
  if (self->_referencedArticleId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_contentType;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_contentId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  v9 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_shareSheetExposureLocation;
    *(_BYTE *)(v6 + 36) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *contentId;
  NSString *referencedArticleId;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_contentType != *((_DWORD *)v4 + 4))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](contentId, "isEqual:"))
    goto LABEL_15;
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_15;
  }
  v7 = (*((_BYTE *)v4 + 36) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_shareSheetExposureLocation != *((_DWORD *)v4 + 8))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_contentType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_contentId, "hash");
  v5 = -[NSString hash](self->_referencedArticleId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_shareSheetExposureLocation;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[9] & 1) != 0)
  {
    self->_contentType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBShareSheetExposure setContentId:](self, "setContentId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBShareSheetExposure setReferencedArticleId:](self, "setReferencedArticleId:");
    v4 = v5;
  }
  if ((v4[9] & 2) != 0)
  {
    self->_shareSheetExposureLocation = v4[8];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
  objc_storeStrong((id *)&self->_contentId, a3);
}

- (NSString)referencedArticleId
{
  return self->_referencedArticleId;
}

- (void)setReferencedArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_referencedArticleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
}

@end
