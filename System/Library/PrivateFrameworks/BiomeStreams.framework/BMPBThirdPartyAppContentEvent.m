@implementation BMPBThirdPartyAppContentEvent

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
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

- (BOOL)hasDesc
{
  return self->_desc != 0;
}

- (BOOL)hasComment
{
  return self->_comment != 0;
}

- (BOOL)hasContent
{
  return self->_content != 0;
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
  v8.super_class = (Class)BMPBThirdPartyAppContentEvent;
  -[BMPBThirdPartyAppContentEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBThirdPartyAppContentEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *bundleId;
  void *v8;
  NSString *title;
  NSString *desc;
  NSString *comment;
  NSString *content;
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
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v4, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("absoluteTimestamp"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  desc = self->_desc;
  if (desc)
    objc_msgSend(v4, "setObject:forKey:", desc, CFSTR("desc"));
  comment = self->_comment;
  if (comment)
    objc_msgSend(v4, "setObject:forKey:", comment, CFSTR("comment"));
  content = self->_content;
  if (content)
    objc_msgSend(v4, "setObject:forKey:", content, CFSTR("content"));
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
  return BMPBThirdPartyAppContentEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_bundleId)
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
  if (self->_desc)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_comment)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_content)
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
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 88) |= 1u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_desc)
  {
    objc_msgSend(v5, "setDesc:");
    v4 = v5;
  }
  if (self->_comment)
  {
    objc_msgSend(v5, "setComment:");
    v4 = v5;
  }
  if (self->_content)
  {
    objc_msgSend(v5, "setContent:");
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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[NSString copyWithZone:](self->_domainId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v14 = -[NSString copyWithZone:](self->_desc, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_comment, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[NSString copyWithZone:](self->_content, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  v20 = -[NSString copyWithZone:](self->_contentProtection, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v20;

  v22 = -[NSString copyWithZone:](self->_personaId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v22;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueId;
  NSString *domainId;
  NSString *bundleId;
  NSString *title;
  NSString *desc;
  NSString *comment;
  NSString *content;
  NSString *contentProtection;
  NSString *personaId;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:"))
      goto LABEL_25;
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:"))
      goto LABEL_25;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_25:
    v14 = 0;
    goto LABEL_26;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](title, "isEqual:"))
    goto LABEL_25;
  desc = self->_desc;
  if ((unint64_t)desc | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](desc, "isEqual:"))
      goto LABEL_25;
  }
  comment = self->_comment;
  if ((unint64_t)comment | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](comment, "isEqual:"))
      goto LABEL_25;
  }
  content = self->_content;
  if ((unint64_t)content | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](content, "isEqual:"))
      goto LABEL_25;
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:"))
      goto LABEL_25;
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((_QWORD *)v4 + 8))
    v14 = -[NSString isEqual:](personaId, "isEqual:");
  else
    v14 = 1;
LABEL_26:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  double absoluteTimestamp;
  double v8;
  long double v9;
  double v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;

  v3 = -[NSString hash](self->_uniqueId, "hash");
  v4 = -[NSString hash](self->_domainId, "hash");
  v5 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v8 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v8 = self->_absoluteTimestamp;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  v11 = v4 ^ v3 ^ v5 ^ v6;
  v12 = -[NSString hash](self->_title, "hash");
  v13 = v12 ^ -[NSString hash](self->_desc, "hash");
  v14 = v11 ^ v13 ^ -[NSString hash](self->_comment, "hash");
  v15 = -[NSString hash](self->_content, "hash");
  v16 = v15 ^ -[NSString hash](self->_contentProtection, "hash");
  return v14 ^ v16 ^ -[NSString hash](self->_personaId, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 10))
  {
    -[BMPBThirdPartyAppContentEvent setUniqueId:](self, "setUniqueId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[BMPBThirdPartyAppContentEvent setDomainId:](self, "setDomainId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBThirdPartyAppContentEvent setBundleId:](self, "setBundleId:");
    v4 = v5;
  }
  if (((_BYTE)v4[11] & 1) != 0)
  {
    self->_absoluteTimestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[BMPBThirdPartyAppContentEvent setTitle:](self, "setTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBThirdPartyAppContentEvent setDesc:](self, "setDesc:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBThirdPartyAppContentEvent setComment:](self, "setComment:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBThirdPartyAppContentEvent setContent:](self, "setContent:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BMPBThirdPartyAppContentEvent setContentProtection:](self, "setContentProtection:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[BMPBThirdPartyAppContentEvent setPersonaId:](self, "setPersonaId:");
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

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
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

- (NSString)desc
{
  return self->_desc;
}

- (void)setDesc:(id)a3
{
  objc_storeStrong((id *)&self->_desc, a3);
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_storeStrong((id *)&self->_comment, a3);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
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
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
