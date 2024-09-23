@implementation EDPBInteractionEventHeader

- (int)messageFrameType
{
  return 4;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setUserId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userId = a3;
}

- (void)setHasUserId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDeviceId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deviceId = a3;
}

- (void)setHasDeviceId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)setTimezoneOffset:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timezoneOffset = a3;
}

- (void)setHasTimezoneOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimezoneOffset
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setUserSegment:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_userSegment = a3;
}

- (void)setHasUserSegment:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserSegment
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCategoryRootInstalled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_categoryRootInstalled = a3;
}

- (void)setHasCategoryRootInstalled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCategoryRootInstalled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)EDPBInteractionEventHeader;
  -[EDPBInteractionEventHeader description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventHeader dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  NSString *locale;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_userId);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("user_id"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_deviceId);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("device_id"));

  }
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKey:", locale, CFSTR("locale"));
  v9 = (char)self->_has;
  if ((v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_timezoneOffset);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timezone_offset"));

    v9 = (char)self->_has;
  }
  if ((v9 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_userSegment);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("user_segment"));

    v9 = (char)self->_has;
  }
  if ((v9 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_categoryRootInstalled);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("category_root_installed"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteSint64Field();
  if (self->_locale)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteSint32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 0x20) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[10] = self->_version;
    *((_BYTE *)v4 + 48) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v4 + 2) = self->_userId;
  *((_BYTE *)v4 + 48) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)v4 + 1) = self->_deviceId;
    *((_BYTE *)v4 + 48) |= 1u;
  }
LABEL_5:
  v7 = v4;
  if (self->_locale)
    objc_msgSend(v4, "setLocale:");
  v6 = (char)self->_has;
  if ((v6 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_16:
    v7[9] = self->_userSegment;
    *((_BYTE *)v7 + 48) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v7[8] = self->_timezoneOffset;
  *((_BYTE *)v7 + 48) |= 4u;
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
    goto LABEL_16;
LABEL_9:
  if ((v6 & 0x20) != 0)
  {
LABEL_10:
    *((_BYTE *)v7 + 44) = self->_categoryRootInstalled;
    *((_BYTE *)v7 + 48) |= 0x20u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_version;
    *(_BYTE *)(v5 + 48) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_userId;
  *(_BYTE *)(v5 + 48) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 8) = self->_deviceId;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  v10 = (char)self->_has;
  if ((v10 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
LABEL_14:
    *(_DWORD *)(v6 + 36) = self->_userSegment;
    *(_BYTE *)(v6 + 48) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return (id)v6;
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 32) = self->_timezoneOffset;
  *(_BYTE *)(v6 + 48) |= 4u;
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_14;
LABEL_7:
  if ((v10 & 0x20) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 44) = self->_categoryRootInstalled;
    *(_BYTE *)(v6 + 48) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *locale;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x10) == 0 || self->_version != *((_DWORD *)v4 + 10))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_userId != *((_QWORD *)v4 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_deviceId != *((_QWORD *)v4 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_32;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](locale, "isEqual:"))
      goto LABEL_32;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_timezoneOffset != *((_DWORD *)v4 + 8))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_userSegment != *((_DWORD *)v4 + 9))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_32;
  }
  v7 = (*((_BYTE *)v4 + 48) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x20) != 0)
    {
      if (self->_categoryRootInstalled)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_32;
      }
      else if (*((_BYTE *)v4 + 44))
      {
        goto LABEL_32;
      }
      v7 = 1;
      goto LABEL_33;
    }
LABEL_32:
    v7 = 0;
  }
LABEL_33:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_version;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_userId;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_deviceId;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_locale, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_10;
LABEL_13:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_11;
LABEL_14:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v6;
  }
  v7 = 2654435761 * self->_timezoneOffset;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_10:
  v8 = 2654435761 * self->_userSegment;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_11:
  v9 = 2654435761 * self->_categoryRootInstalled;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 0x10) != 0)
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_userId = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_4:
    self->_deviceId = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  v7 = v4;
  if (*((_QWORD *)v4 + 3))
    -[EDPBInteractionEventHeader setLocale:](self, "setLocale:");
  v6 = *((_BYTE *)v7 + 48);
  if ((v6 & 4) == 0)
  {
    if ((*((_BYTE *)v7 + 48) & 8) == 0)
      goto LABEL_9;
LABEL_16:
    self->_userSegment = *((_DWORD *)v7 + 9);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v7 + 48) & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_timezoneOffset = *((_DWORD *)v7 + 8);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v7 + 48);
  if ((v6 & 8) != 0)
    goto LABEL_16;
LABEL_9:
  if ((v6 & 0x20) != 0)
  {
LABEL_10:
    self->_categoryRootInstalled = *((_BYTE *)v7 + 44);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_11:

}

- (unsigned)version
{
  return self->_version;
}

- (int64_t)userId
{
  return self->_userId;
}

- (int64_t)deviceId
{
  return self->_deviceId;
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (int)timezoneOffset
{
  return self->_timezoneOffset;
}

- (unsigned)userSegment
{
  return self->_userSegment;
}

- (BOOL)categoryRootInstalled
{
  return self->_categoryRootInstalled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
