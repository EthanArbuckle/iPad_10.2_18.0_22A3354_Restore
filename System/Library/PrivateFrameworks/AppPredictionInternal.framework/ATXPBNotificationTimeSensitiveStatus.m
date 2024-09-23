@implementation ATXPBNotificationTimeSensitiveStatus

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setIsTimeSensitiveNotification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isTimeSensitiveNotification = a3;
}

- (void)setHasIsTimeSensitiveNotification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsTimeSensitiveNotification
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsTimeSensitiveAndEngagedNotification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isTimeSensitiveAndEngagedNotification = a3;
}

- (void)setHasIsTimeSensitiveAndEngagedNotification:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsTimeSensitiveAndEngagedNotification
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBNotificationTimeSensitiveStatus;
  -[ATXPBNotificationTimeSensitiveStatus description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBNotificationTimeSensitiveStatus dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleId;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTimeSensitiveNotification);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("isTimeSensitiveNotification"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTimeSensitiveAndEngagedNotification);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("isTimeSensitiveAndEngagedNotification"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBNotificationTimeSensitiveStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  if (self->_bundleId)
  {
    v6 = v4;
    objc_msgSend(v4, "setBundleId:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[17] = self->_isTimeSensitiveNotification;
    v4[20] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[16] = self->_isTimeSensitiveAndEngagedNotification;
    v4[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 17) = self->_isTimeSensitiveNotification;
    *(_BYTE *)(v5 + 20) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_isTimeSensitiveAndEngagedNotification;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_14;
    if (self->_isTimeSensitiveNotification)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      if (self->_isTimeSensitiveAndEngagedNotification)
      {
        if (!*((_BYTE *)v4 + 16))
          goto LABEL_14;
      }
      else if (*((_BYTE *)v4 + 16))
      {
        goto LABEL_14;
      }
      v6 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v6 = 0;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_isTimeSensitiveNotification;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_isTimeSensitiveAndEngagedNotification;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[ATXPBNotificationTimeSensitiveStatus setBundleId:](self, "setBundleId:");
    v4 = v6;
  }
  v5 = v4[20];
  if ((v5 & 2) != 0)
  {
    self->_isTimeSensitiveNotification = v4[17];
    *(_BYTE *)&self->_has |= 2u;
    v5 = v4[20];
  }
  if (v5)
  {
    self->_isTimeSensitiveAndEngagedNotification = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (BOOL)isTimeSensitiveNotification
{
  return self->_isTimeSensitiveNotification;
}

- (BOOL)isTimeSensitiveAndEngagedNotification
{
  return self->_isTimeSensitiveAndEngagedNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
