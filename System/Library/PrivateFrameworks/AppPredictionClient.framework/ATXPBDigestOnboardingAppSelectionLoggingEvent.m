@implementation ATXPBDigestOnboardingAppSelectionLoggingEvent

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setAvgNumBasicNotifications:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_avgNumBasicNotifications = a3;
}

- (void)setHasAvgNumBasicNotifications:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvgNumBasicNotifications
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setAvgNumMessageNotifications:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_avgNumMessageNotifications = a3;
}

- (void)setHasAvgNumMessageNotifications:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAvgNumMessageNotifications
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAvgNumTimeSensitiveNonMessageNotifications:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_avgNumTimeSensitiveNonMessageNotifications = a3;
}

- (void)setHasAvgNumTimeSensitiveNonMessageNotifications:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAvgNumTimeSensitiveNonMessageNotifications
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRank:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRank
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAddedToDigest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_addedToDigest = a3;
}

- (void)setHasAddedToDigest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAddedToDigest
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setWasShownInDigestOnboarding:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_wasShownInDigestOnboarding = a3;
}

- (void)setHasWasShownInDigestOnboarding:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWasShownInDigestOnboarding
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
  v8.super_class = (Class)ATXPBDigestOnboardingAppSelectionLoggingEvent;
  -[ATXPBDigestOnboardingAppSelectionLoggingEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBDigestOnboardingAppSelectionLoggingEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionUUID;
  NSString *bundleId;
  char has;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sessionUUID = self->_sessionUUID;
  if (sessionUUID)
    objc_msgSend(v3, "setObject:forKey:", sessionUUID, CFSTR("sessionUUID"));
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v4, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_avgNumBasicNotifications);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("avgNumBasicNotifications"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_avgNumMessageNotifications);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("avgNumMessageNotifications"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_avgNumTimeSensitiveNonMessageNotifications);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("avgNumTimeSensitiveNonMessageNotifications"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_addedToDigest);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("addedToDigest"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v4;
    goto LABEL_11;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rank);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("rank"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_17;
LABEL_10:
  if ((has & 0x20) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wasShownInDigestOnboarding);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("wasShownInDigestOnboarding"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBDigestOnboardingAppSelectionLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sessionUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
LABEL_17:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_17;
LABEL_10:
  if ((has & 0x20) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_12:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sessionUUID)
  {
    objc_msgSend(v4, "setSessionUUID:");
    v4 = v6;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v6, "setBundleId:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_avgNumBasicNotifications;
    *((_BYTE *)v4 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 3) = self->_avgNumMessageNotifications;
  *((_BYTE *)v4 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 4) = self->_avgNumTimeSensitiveNonMessageNotifications;
  *((_BYTE *)v4 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
LABEL_17:
    *((_BYTE *)v4 + 48) = self->_addedToDigest;
    *((_BYTE *)v4 + 52) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_16:
  *((_DWORD *)v4 + 8) = self->_rank;
  *((_BYTE *)v4 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_17;
LABEL_10:
  if ((has & 0x20) != 0)
  {
LABEL_11:
    *((_BYTE *)v4 + 49) = self->_wasShownInDigestOnboarding;
    *((_BYTE *)v4 + 52) |= 0x20u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sessionUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_avgNumBasicNotifications;
    *(_BYTE *)(v5 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 12) = self->_avgNumMessageNotifications;
  *(_BYTE *)(v5 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(_DWORD *)(v5 + 16) = self->_avgNumTimeSensitiveNonMessageNotifications;
  *(_BYTE *)(v5 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    *(_BYTE *)(v5 + 48) = self->_addedToDigest;
    *(_BYTE *)(v5 + 52) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return (id)v5;
    goto LABEL_7;
  }
LABEL_12:
  *(_DWORD *)(v5 + 32) = self->_rank;
  *(_BYTE *)(v5 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *(_BYTE *)(v5 + 49) = self->_wasShownInDigestOnboarding;
    *(_BYTE *)(v5 + 52) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sessionUUID;
  NSString *bundleId;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:"))
      goto LABEL_36;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_avgNumBasicNotifications != *((_DWORD *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_avgNumMessageNotifications != *((_DWORD *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_avgNumTimeSensitiveNonMessageNotifications != *((_DWORD *)v4 + 4))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_rank != *((_DWORD *)v4 + 8))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) == 0)
      goto LABEL_36;
    if (self->_addedToDigest)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_36;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_36;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  v7 = (*((_BYTE *)v4 + 52) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x20) != 0)
    {
      if (self->_wasShownInDigestOnboarding)
      {
        if (!*((_BYTE *)v4 + 49))
          goto LABEL_36;
      }
      else if (*((_BYTE *)v4 + 49))
      {
        goto LABEL_36;
      }
      v7 = 1;
      goto LABEL_37;
    }
LABEL_36:
    v7 = 0;
  }
LABEL_37:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_sessionUUID, "hash");
  v4 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_avgNumBasicNotifications;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_avgNumMessageNotifications;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_avgNumTimeSensitiveNonMessageNotifications;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_rank;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_11:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v9 = 2654435761 * self->_addedToDigest;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v10 = 2654435761 * self->_wasShownInDigestOnboarding;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXPBDigestOnboardingAppSelectionLoggingEvent setSessionUUID:](self, "setSessionUUID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXPBDigestOnboardingAppSelectionLoggingEvent setBundleId:](self, "setBundleId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) != 0)
  {
    self->_avgNumBasicNotifications = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_avgNumMessageNotifications = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  self->_avgNumTimeSensitiveNonMessageNotifications = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
LABEL_17:
    self->_addedToDigest = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 52) & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_16:
  self->_rank = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 0x10) != 0)
    goto LABEL_17;
LABEL_10:
  if ((v5 & 0x20) != 0)
  {
LABEL_11:
    self->_wasShownInDigestOnboarding = *((_BYTE *)v4 + 49);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_12:

}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (unsigned)avgNumBasicNotifications
{
  return self->_avgNumBasicNotifications;
}

- (unsigned)avgNumMessageNotifications
{
  return self->_avgNumMessageNotifications;
}

- (unsigned)avgNumTimeSensitiveNonMessageNotifications
{
  return self->_avgNumTimeSensitiveNonMessageNotifications;
}

- (unsigned)rank
{
  return self->_rank;
}

- (BOOL)addedToDigest
{
  return self->_addedToDigest;
}

- (BOOL)wasShownInDigestOnboarding
{
  return self->_wasShownInDigestOnboarding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
