@implementation SGM2MaybeInformationShown

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("MaybeShown");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)extracted
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_extracted;
  else
    return 0;
}

- (void)setExtracted:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_extracted = a3;
}

- (void)setHasExtracted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExtracted
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)extractedAsString:(int)a3
{
  if (a3 < 4)
    return off_1E4760410[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsExtracted:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerExtractionTypeSig")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerExtractionTypePhrase")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerExtractionTypeSigPhrase")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerExtractionTypeOther")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setExtractionModelVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_extractionModelVersion = a3;
}

- (void)setHasExtractionModelVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExtractionModelVersion
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SGM2MaybeInformationShown;
  -[SGM2MaybeInformationShown description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2MaybeInformationShown dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  char has;
  uint64_t extracted;
  __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    extracted = self->_extracted;
    if (extracted >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_extracted);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4760410[extracted];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("extracted"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_extractionModelVersion);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("extractionModelVersion"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2MaybeInformationShownReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_key)
  {
    v6 = v4;
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_extracted;
    *((_BYTE *)v4 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 3) = self->_extractionModelVersion;
    *((_BYTE *)v4 + 24) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_extracted;
    *(_BYTE *)(v5 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_extractionModelVersion;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_extracted != *((_DWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_extractionModelVersion != *((_DWORD *)v4 + 3))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_extracted;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_extractionModelVersion;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[SGM2MaybeInformationShown setKey:](self, "setKey:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 1) != 0)
  {
    self->_extracted = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_extractionModelVersion = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (unsigned)extractionModelVersion
{
  return self->_extractionModelVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
