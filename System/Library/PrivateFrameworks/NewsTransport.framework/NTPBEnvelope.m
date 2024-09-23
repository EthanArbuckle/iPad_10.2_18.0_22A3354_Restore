@implementation NTPBEnvelope

- (void)setContentTypeMinorVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contentTypeMinorVersion = a3;
}

- (void)setHasContentTypeMinorVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentTypeMinorVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setContentTypePatchVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_contentTypePatchVersion = a3;
}

- (void)setHasContentTypePatchVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContentTypePatchVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
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
  v8.super_class = (Class)NTPBEnvelope;
  -[NTPBEnvelope description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBEnvelope dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSData *content;
  char has;
  void *v8;
  void *v9;
  NSData *identifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_contentTypeVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("content_type_version"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_contentType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("content_type"));

  content = self->_content;
  if (content)
    objc_msgSend(v3, "setObject:forKey:", content, CFSTR("content"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_contentTypeMinorVersion);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("content_type_minor_version"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_contentTypePatchVersion);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("content_type_patch_version"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEnvelopeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v5 = v6;
  if (self->_identifier)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 28) = self->_contentTypeVersion;
  *(_DWORD *)(v5 + 16) = self->_contentType;
  v6 = -[NSData copyWithZone:](self->_content, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_contentTypeMinorVersion;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_contentTypePatchVersion;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v9 = -[NSData copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *content;
  NSData *identifier;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if (self->_contentTypeVersion != *((_DWORD *)v4 + 7))
    goto LABEL_18;
  if (self->_contentType != *((_DWORD *)v4 + 4))
    goto LABEL_18;
  content = self->_content;
  if ((unint64_t)content | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](content, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_contentTypeMinorVersion != *((_DWORD *)v4 + 5))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_18:
    v7 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_contentTypePatchVersion != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_18;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
    v7 = -[NSData isEqual:](identifier, "isEqual:");
  else
    v7 = 1;
LABEL_19:

  return v7;
}

- (unint64_t)hash
{
  uint64_t contentTypeVersion;
  uint64_t contentType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  contentTypeVersion = self->_contentTypeVersion;
  contentType = self->_contentType;
  v5 = -[NSData hash](self->_content, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_contentTypeMinorVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return (2654435761 * contentType) ^ (2654435761 * contentTypeVersion) ^ v5 ^ v6 ^ v7 ^ -[NSData hash](self->_identifier, "hash");
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_contentTypePatchVersion;
  return (2654435761 * contentType) ^ (2654435761 * contentTypeVersion) ^ v5 ^ v6 ^ v7 ^ -[NSData hash](self->_identifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  char v5;
  _DWORD *v6;

  v4 = a3;
  self->_contentTypeVersion = v4[7];
  self->_contentType = v4[4];
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBEnvelope setContent:](self, "setContent:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_contentTypeMinorVersion = v4[5];
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_contentTypePatchVersion = v4[6];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBEnvelope setIdentifier:](self, "setIdentifier:");
    v4 = v6;
  }

}

- (int)contentTypeVersion
{
  return self->_contentTypeVersion;
}

- (void)setContentTypeVersion:(int)a3
{
  self->_contentTypeVersion = a3;
}

- (int)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int)a3
{
  self->_contentType = a3;
}

- (NSData)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (int)contentTypeMinorVersion
{
  return self->_contentTypeMinorVersion;
}

- (int)contentTypePatchVersion
{
  return self->_contentTypePatchVersion;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
