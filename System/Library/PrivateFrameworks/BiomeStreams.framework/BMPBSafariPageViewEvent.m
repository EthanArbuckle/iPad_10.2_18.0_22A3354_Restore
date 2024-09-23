@implementation BMPBSafariPageViewEvent

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setContentIsReaderText:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_contentIsReaderText = a3;
}

- (void)setHasContentIsReaderText:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContentIsReaderText
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (BOOL)hasContentProtection
{
  return self->_contentProtection != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BMPBSafariPageViewEvent;
  -[BMPBSafariPageViewEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSafariPageViewEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueId;
  NSString *domainId;
  void *v7;
  NSString *title;
  NSString *content;
  void *v10;
  NSString *url;
  NSString *contentProtection;
  NSString *personaId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId)
    objc_msgSend(v3, "setObject:forKey:", uniqueId, CFSTR("uniqueId"));
  domainId = self->_domainId;
  if (domainId)
    objc_msgSend(v4, "setObject:forKey:", domainId, CFSTR("domainId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("absoluteTimestamp"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  content = self->_content;
  if (content)
    objc_msgSend(v4, "setObject:forKey:", content, CFSTR("content"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_contentIsReaderText);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("contentIsReaderText"));

  }
  url = self->_url;
  if (url)
    objc_msgSend(v4, "setObject:forKey:", url, CFSTR("url"));
  contentProtection = self->_contentProtection;
  if (contentProtection)
    objc_msgSend(v4, "setObject:forKey:", contentProtection, CFSTR("contentProtection"));
  personaId = self->_personaId;
  if (personaId)
    objc_msgSend(v4, "setObject:forKey:", personaId, CFSTR("personaId"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSafariPageViewEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uniqueId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_domainId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_content)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_url)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_contentProtection)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_personaId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    v4 = v5;
  }
  if (self->_domainId)
  {
    objc_msgSend(v5, "setDomainId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 76) |= 1u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_content)
  {
    objc_msgSend(v5, "setContent:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 72) = self->_contentIsReaderText;
    *((_BYTE *)v4 + 76) |= 2u;
  }
  if (self->_url)
  {
    objc_msgSend(v5, "setUrl:");
    v4 = v5;
  }
  if (self->_contentProtection)
  {
    objc_msgSend(v5, "setContentProtection:");
    v4 = v5;
  }
  if (self->_personaId)
  {
    objc_msgSend(v5, "setPersonaId:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_domainId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_content, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_contentIsReaderText;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v14 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_contentProtection, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[NSString copyWithZone:](self->_personaId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueId;
  NSString *domainId;
  NSString *title;
  NSString *content;
  NSString *url;
  NSString *contentProtection;
  NSString *personaId;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:"))
      goto LABEL_29;
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_29;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](title, "isEqual:"))
    goto LABEL_29;
  content = self->_content;
  if ((unint64_t)content | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](content, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) != 0)
    {
      if (self->_contentIsReaderText)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_29;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_23;
    }
LABEL_29:
    v12 = 0;
    goto LABEL_30;
  }
  if ((*((_BYTE *)v4 + 76) & 2) != 0)
    goto LABEL_29;
LABEL_23:
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](url, "isEqual:"))
    goto LABEL_29;
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:"))
      goto LABEL_29;
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((_QWORD *)v4 + 5))
    v12 = -[NSString isEqual:](personaId, "isEqual:");
  else
    v12 = 1;
LABEL_30:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  double absoluteTimestamp;
  double v7;
  long double v8;
  double v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;

  v3 = -[NSString hash](self->_uniqueId, "hash");
  v4 = -[NSString hash](self->_domainId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v7 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v7 = self->_absoluteTimestamp;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = -[NSString hash](self->_title, "hash");
  v11 = -[NSString hash](self->_content, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v12 = 2654435761 * self->_contentIsReaderText;
  else
    v12 = 0;
  v13 = v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ -[NSString hash](self->_url, "hash");
  v14 = -[NSString hash](self->_contentProtection, "hash");
  return v13 ^ v14 ^ -[NSString hash](self->_personaId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[BMPBSafariPageViewEvent setUniqueId:](self, "setUniqueId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBSafariPageViewEvent setDomainId:](self, "setDomainId:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBSafariPageViewEvent setTitle:](self, "setTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBSafariPageViewEvent setContent:](self, "setContent:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    self->_contentIsReaderText = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[BMPBSafariPageViewEvent setUrl:](self, "setUrl:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBSafariPageViewEvent setContentProtection:](self, "setContentProtection:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BMPBSafariPageViewEvent setPersonaId:](self, "setPersonaId:");
    v4 = v5;
  }

}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueId, a3);
}

- (NSString)domainId
{
  return self->_domainId;
}

- (void)setDomainId:(id)a3
{
  objc_storeStrong((id *)&self->_domainId, a3);
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (BOOL)contentIsReaderText
{
  return self->_contentIsReaderText;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setContentProtection:(id)a3
{
  objc_storeStrong((id *)&self->_contentProtection, a3);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPersonaId:(id)a3
{
  objc_storeStrong((id *)&self->_personaId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
