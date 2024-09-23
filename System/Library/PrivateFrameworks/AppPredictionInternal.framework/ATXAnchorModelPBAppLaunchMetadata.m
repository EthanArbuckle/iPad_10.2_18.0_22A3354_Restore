@implementation ATXAnchorModelPBAppLaunchMetadata

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasAppLaunchHistory
{
  return self->_appLaunchHistory != 0;
}

- (void)setAppInstalledInLast48Hours:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_appInstalledInLast48Hours = a3;
}

- (void)setHasAppInstalledInLast48Hours:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAppInstalledInLast48Hours
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRelativeTimeSinceAnchorInSeconds:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_relativeTimeSinceAnchorInSeconds = a3;
}

- (void)setHasRelativeTimeSinceAnchorInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRelativeTimeSinceAnchorInSeconds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setGenreId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_genreId = a3;
}

- (void)setHasGenreId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenreId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setApp2VecCluster:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_app2VecCluster = a3;
}

- (void)setHasApp2VecCluster:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasApp2VecCluster
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
  v8.super_class = (Class)ATXAnchorModelPBAppLaunchMetadata;
  -[ATXAnchorModelPBAppLaunchMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPBAppLaunchMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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
  ATXAnchorModelPBLaunchHistoryMetadata *appLaunchHistory;
  void *v7;
  char has;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  appLaunchHistory = self->_appLaunchHistory;
  if (appLaunchHistory)
  {
    -[ATXAnchorModelPBLaunchHistoryMetadata dictionaryRepresentation](appLaunchHistory, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("appLaunchHistory"));

  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appInstalledInLast48Hours);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("appInstalledInLast48Hours"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_genreId);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("genreId"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_relativeTimeSinceAnchorInSeconds);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("relativeTimeSinceAnchorInSeconds"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 1) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_app2VecCluster);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("app2VecCluster"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBAppLaunchMetadataReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_appLaunchHistory)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
LABEL_13:
      PBDataWriterWriteInt64Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 1) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_10:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v6;
  }
  if (self->_appLaunchHistory)
  {
    objc_msgSend(v6, "setAppLaunchHistory:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 44) = self->_appInstalledInLast48Hours;
    *((_BYTE *)v4 + 48) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
LABEL_13:
      *((_QWORD *)v4 + 2) = self->_genreId;
      *((_BYTE *)v4 + 48) |= 2u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 10) = self->_relativeTimeSinceAnchorInSeconds;
  *((_BYTE *)v4 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 1) != 0)
  {
LABEL_9:
    *((_QWORD *)v4 + 1) = self->_app2VecCluster;
    *((_BYTE *)v4 + 48) |= 1u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[ATXAnchorModelPBLaunchHistoryMetadata copyWithZone:](self->_appLaunchHistory, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 44) = self->_appInstalledInLast48Hours;
    *(_BYTE *)(v5 + 48) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 16) = self->_genreId;
      *(_BYTE *)(v5 + 48) |= 2u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_relativeTimeSinceAnchorInSeconds;
  *(_BYTE *)(v5 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 8) = self->_app2VecCluster;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  ATXAnchorModelPBLaunchHistoryMetadata *appLaunchHistory;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_28;
  }
  appLaunchHistory = self->_appLaunchHistory;
  if ((unint64_t)appLaunchHistory | *((_QWORD *)v4 + 3))
  {
    if (!-[ATXAnchorModelPBLaunchHistoryMetadata isEqual:](appLaunchHistory, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) != 0)
    {
      if (self->_appInstalledInLast48Hours)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_28;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_14;
    }
LABEL_28:
    v7 = 0;
    goto LABEL_29;
  }
  if ((*((_BYTE *)v4 + 48) & 8) != 0)
    goto LABEL_28;
LABEL_14:
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_relativeTimeSinceAnchorInSeconds != *((_DWORD *)v4 + 10))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_genreId != *((_QWORD *)v4 + 2))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_28;
  }
  v7 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_app2VecCluster != *((_QWORD *)v4 + 1))
      goto LABEL_28;
    v7 = 1;
  }
LABEL_29:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_bundleId, "hash");
  v4 = -[ATXAnchorModelPBLaunchHistoryMetadata hash](self->_appLaunchHistory, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v5 = 2654435761 * self->_appInstalledInLast48Hours;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_relativeTimeSinceAnchorInSeconds;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v7 = 2654435761 * self->_genreId;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v8 = 2654435761 * self->_app2VecCluster;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ATXAnchorModelPBLaunchHistoryMetadata *appLaunchHistory;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXAnchorModelPBAppLaunchMetadata setBundleId:](self, "setBundleId:");
    v4 = v8;
  }
  appLaunchHistory = self->_appLaunchHistory;
  v6 = *((_QWORD *)v4 + 3);
  if (appLaunchHistory)
  {
    if (!v6)
      goto LABEL_9;
    -[ATXAnchorModelPBLaunchHistoryMetadata mergeFrom:](appLaunchHistory, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[ATXAnchorModelPBAppLaunchMetadata setAppLaunchHistory:](self, "setAppLaunchHistory:");
  }
  v4 = v8;
LABEL_9:
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 8) != 0)
  {
    self->_appInstalledInLast48Hours = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_has |= 8u;
    v7 = *((_BYTE *)v4 + 48);
    if ((v7 & 4) == 0)
    {
LABEL_11:
      if ((v7 & 2) == 0)
        goto LABEL_12;
LABEL_17:
      self->_genreId = *((_QWORD *)v4 + 2);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 48) & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 4) == 0)
  {
    goto LABEL_11;
  }
  self->_relativeTimeSinceAnchorInSeconds = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 4u;
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 2) != 0)
    goto LABEL_17;
LABEL_12:
  if ((v7 & 1) != 0)
  {
LABEL_13:
    self->_app2VecCluster = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_14:

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (ATXAnchorModelPBLaunchHistoryMetadata)appLaunchHistory
{
  return self->_appLaunchHistory;
}

- (void)setAppLaunchHistory:(id)a3
{
  objc_storeStrong((id *)&self->_appLaunchHistory, a3);
}

- (BOOL)appInstalledInLast48Hours
{
  return self->_appInstalledInLast48Hours;
}

- (int)relativeTimeSinceAnchorInSeconds
{
  return self->_relativeTimeSinceAnchorInSeconds;
}

- (int64_t)genreId
{
  return self->_genreId;
}

- (int64_t)app2VecCluster
{
  return self->_app2VecCluster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_appLaunchHistory, 0);
}

@end
