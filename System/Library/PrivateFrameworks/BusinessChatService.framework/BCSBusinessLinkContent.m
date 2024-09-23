@implementation BCSBusinessLinkContent

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (void)setIsDefault:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isDefault = a3;
}

- (void)setHasIsDefault:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDefault
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
  v8.super_class = (Class)BCSBusinessLinkContent;
  -[BCSBusinessLinkContent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessLinkContent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *language;
  NSString *title;
  NSString *subtitle;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v4, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDefault);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("is_default"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCSBusinessLinkContentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_language)
  {
    objc_msgSend(v4, "setLanguage:");
    v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v5, "setSubtitle:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_isDefault;
    v4[36] |= 1u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_isDefault;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *language;
  NSString *title;
  NSString *subtitle;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
      goto LABEL_10;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_10;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:"))
      goto LABEL_10;
  }
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      v8 = 0;
      goto LABEL_11;
    }
    if (self->_isDefault)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_10;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_10;
    }
    v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_language, "hash");
  v4 = -[NSString hash](self->_title, "hash");
  v5 = -[NSString hash](self->_subtitle, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_isDefault;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[BCSBusinessLinkContent setLanguage:](self, "setLanguage:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BCSBusinessLinkContent setTitle:](self, "setTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BCSBusinessLinkContent setSubtitle:](self, "setSubtitle:");
    v4 = v5;
  }
  if (v4[36])
  {
    self->_isDefault = v4[32];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
