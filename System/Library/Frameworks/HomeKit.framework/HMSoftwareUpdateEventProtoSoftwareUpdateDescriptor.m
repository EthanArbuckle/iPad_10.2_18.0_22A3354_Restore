@implementation HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor

- (void)setStatus:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasServerAssetURL
{
  return self->_serverAssetURL != 0;
}

- (BOOL)hasServerAssetAlgorithm
{
  return self->_serverAssetAlgorithm != 0;
}

- (BOOL)hasServerAssetMeasurement
{
  return self->_serverAssetMeasurement != 0;
}

- (void)setMajorVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_majorVersion = a3;
}

- (void)setHasMajorVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMajorVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMinorVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_minorVersion = a3;
}

- (void)setHasMinorVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinorVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setUpdateVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_updateVersion = a3;
}

- (void)setHasUpdateVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUpdateVersion
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (void)setDownloadSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_downloadSize = a3;
}

- (void)setHasDownloadSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDownloadSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasHumanReadableUpdateName
{
  return self->_humanReadableUpdateName != 0;
}

- (void)setRampEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_rampEnabled = a3;
}

- (void)setHasRampEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRampEnabled
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
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
  v8.super_class = (Class)HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor;
  -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *serverAssetURL;
  NSString *serverAssetAlgorithm;
  NSData *serverAssetMeasurement;
  char has;
  void *v9;
  NSString *buildVersion;
  void *v11;
  NSString *humanReadableUpdateName;
  char v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_status);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("status"));

  }
  serverAssetURL = self->_serverAssetURL;
  if (serverAssetURL)
    objc_msgSend(v3, "setObject:forKey:", serverAssetURL, CFSTR("serverAssetURL"));
  serverAssetAlgorithm = self->_serverAssetAlgorithm;
  if (serverAssetAlgorithm)
    objc_msgSend(v3, "setObject:forKey:", serverAssetAlgorithm, CFSTR("serverAssetAlgorithm"));
  serverAssetMeasurement = self->_serverAssetMeasurement;
  if (serverAssetMeasurement)
    objc_msgSend(v3, "setObject:forKey:", serverAssetMeasurement, CFSTR("serverAssetMeasurement"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_majorVersion);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("majorVersion"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minorVersion);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("minorVersion"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_updateVersion);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("updateVersion"));

  }
LABEL_13:
  buildVersion = self->_buildVersion;
  if (buildVersion)
    objc_msgSend(v3, "setObject:forKey:", buildVersion, CFSTR("buildVersion"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_downloadSize);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("downloadSize"));

  }
  humanReadableUpdateName = self->_humanReadableUpdateName;
  if (humanReadableUpdateName)
    objc_msgSend(v3, "setObject:forKey:", humanReadableUpdateName, CFSTR("humanReadableUpdateName"));
  v13 = (char)self->_has;
  if ((v13 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_rampEnabled);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("rampEnabled"));

    v13 = (char)self->_has;
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_errorCode);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("errorCode"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMSoftwareUpdateEventProtoSoftwareUpdateDescriptorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_serverAssetURL)
    PBDataWriterWriteStringField();
  if (self->_serverAssetAlgorithm)
    PBDataWriterWriteStringField();
  if (self->_serverAssetMeasurement)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_12:
    PBDataWriterWriteInt64Field();
LABEL_13:
  if (self->_buildVersion)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_humanReadableUpdateName)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[5] = self->_status;
    *((_BYTE *)v4 + 100) |= 0x10u;
  }
  v7 = v4;
  if (self->_serverAssetURL)
  {
    objc_msgSend(v4, "setServerAssetURL:");
    v4 = v7;
  }
  if (self->_serverAssetAlgorithm)
  {
    objc_msgSend(v7, "setServerAssetAlgorithm:");
    v4 = v7;
  }
  if (self->_serverAssetMeasurement)
  {
    objc_msgSend(v7, "setServerAssetMeasurement:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_majorVersion;
    *((_BYTE *)v4 + 100) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  v4[4] = self->_minorVersion;
  *((_BYTE *)v4 + 100) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    v4[6] = self->_updateVersion;
    *((_BYTE *)v4 + 100) |= 0x20u;
  }
LABEL_13:
  if (self->_buildVersion)
  {
    objc_msgSend(v7, "setBuildVersion:");
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_downloadSize;
    *((_BYTE *)v4 + 100) |= 1u;
  }
  if (self->_humanReadableUpdateName)
  {
    objc_msgSend(v7, "setHumanReadableUpdateName:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_BYTE *)v4 + 96) = self->_rampEnabled;
    *((_BYTE *)v4 + 100) |= 0x40u;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 100) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char has;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_status;
    *(_BYTE *)(v5 + 100) |= 0x10u;
  }
  v7 = -[NSString copyWithZone:](self->_serverAssetURL, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v7;

  v9 = -[NSString copyWithZone:](self->_serverAssetAlgorithm, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v9;

  v11 = -[NSData copyWithZone:](self->_serverAssetMeasurement, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v11;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_majorVersion;
    *(_BYTE *)(v6 + 100) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 32) = self->_minorVersion;
  *(_BYTE *)(v6 + 100) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *(_QWORD *)(v6 + 48) = self->_updateVersion;
    *(_BYTE *)(v6 + 100) |= 0x20u;
  }
LABEL_7:
  v14 = -[NSString copyWithZone:](self->_buildVersion, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_downloadSize;
    *(_BYTE *)(v6 + 100) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_humanReadableUpdateName, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v16;

  v18 = (char)self->_has;
  if ((v18 & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 96) = self->_rampEnabled;
    *(_BYTE *)(v6 + 100) |= 0x40u;
    v18 = (char)self->_has;
  }
  if ((v18 & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_errorCode;
    *(_BYTE *)(v6 + 100) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *serverAssetURL;
  NSString *serverAssetAlgorithm;
  NSData *serverAssetMeasurement;
  char has;
  char v9;
  NSString *buildVersion;
  NSString *humanReadableUpdateName;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_51;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x10) == 0 || self->_status != *((_QWORD *)v4 + 5))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_51;
  }
  serverAssetURL = self->_serverAssetURL;
  if ((unint64_t)serverAssetURL | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](serverAssetURL, "isEqual:"))
  {
    goto LABEL_51;
  }
  serverAssetAlgorithm = self->_serverAssetAlgorithm;
  if ((unint64_t)serverAssetAlgorithm | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](serverAssetAlgorithm, "isEqual:"))
      goto LABEL_51;
  }
  serverAssetMeasurement = self->_serverAssetMeasurement;
  if ((unint64_t)serverAssetMeasurement | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](serverAssetMeasurement, "isEqual:"))
      goto LABEL_51;
  }
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 100);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 4) == 0 || self->_majorVersion != *((_QWORD *)v4 + 3))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 8) == 0 || self->_minorVersion != *((_QWORD *)v4 + 4))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 100) & 8) != 0)
  {
    goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x20) == 0 || self->_updateVersion != *((_QWORD *)v4 + 6))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x20) != 0)
  {
    goto LABEL_51;
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](buildVersion, "isEqual:"))
      goto LABEL_51;
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 100);
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_downloadSize != *((_QWORD *)v4 + 1))
      goto LABEL_51;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_51;
  }
  humanReadableUpdateName = self->_humanReadableUpdateName;
  if ((unint64_t)humanReadableUpdateName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](humanReadableUpdateName, "isEqual:"))
      goto LABEL_51;
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 100);
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) != 0)
    {
      if (self->_rampEnabled)
      {
        if (!*((_BYTE *)v4 + 96))
          goto LABEL_51;
        goto LABEL_47;
      }
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_47;
    }
LABEL_51:
    v12 = 0;
    goto LABEL_52;
  }
  if ((v9 & 0x40) != 0)
    goto LABEL_51;
LABEL_47:
  v12 = (v9 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_errorCode != *((_QWORD *)v4 + 2))
      goto LABEL_51;
    v12 = 1;
  }
LABEL_52:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v14;
  uint64_t v15;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v15 = 2654435761 * self->_status;
  else
    v15 = 0;
  v14 = -[NSString hash](self->_serverAssetURL, "hash");
  v3 = -[NSString hash](self->_serverAssetAlgorithm, "hash");
  v4 = -[NSData hash](self->_serverAssetMeasurement, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v5 = 2654435761 * self->_majorVersion;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_minorVersion;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_updateVersion;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
LABEL_11:
  v8 = -[NSString hash](self->_buildVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_downloadSize;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_humanReadableUpdateName, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v11 = 2654435761 * self->_rampEnabled;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_16;
LABEL_18:
    v12 = 0;
    return v14 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_18;
LABEL_16:
  v12 = 2654435761 * self->_errorCode;
  return v14 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  if ((*((_BYTE *)v4 + 100) & 0x10) != 0)
  {
    self->_status = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 11))
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setServerAssetURL:](self, "setServerAssetURL:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setServerAssetAlgorithm:](self, "setServerAssetAlgorithm:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setServerAssetMeasurement:](self, "setServerAssetMeasurement:");
    v4 = v7;
  }
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 4) != 0)
  {
    self->_majorVersion = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 100);
    if ((v5 & 8) == 0)
    {
LABEL_11:
      if ((v5 & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 100) & 8) == 0)
  {
    goto LABEL_11;
  }
  self->_minorVersion = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 100) & 0x20) != 0)
  {
LABEL_12:
    self->_updateVersion = *((_QWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 7))
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setBuildVersion:](self, "setBuildVersion:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    self->_downloadSize = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setHumanReadableUpdateName:](self, "setHumanReadableUpdateName:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 100);
  if ((v6 & 0x40) != 0)
  {
    self->_rampEnabled = *((_BYTE *)v4 + 96);
    *(_BYTE *)&self->_has |= 0x40u;
    v6 = *((_BYTE *)v4 + 100);
  }
  if ((v6 & 2) != 0)
  {
    self->_errorCode = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (int64_t)status
{
  return self->_status;
}

- (NSString)serverAssetURL
{
  return self->_serverAssetURL;
}

- (void)setServerAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_serverAssetURL, a3);
}

- (NSString)serverAssetAlgorithm
{
  return self->_serverAssetAlgorithm;
}

- (void)setServerAssetAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_serverAssetAlgorithm, a3);
}

- (NSData)serverAssetMeasurement
{
  return self->_serverAssetMeasurement;
}

- (void)setServerAssetMeasurement:(id)a3
{
  objc_storeStrong((id *)&self->_serverAssetMeasurement, a3);
}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (int64_t)updateVersion
{
  return self->_updateVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (int64_t)downloadSize
{
  return self->_downloadSize;
}

- (NSString)humanReadableUpdateName
{
  return self->_humanReadableUpdateName;
}

- (void)setHumanReadableUpdateName:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableUpdateName, a3);
}

- (BOOL)rampEnabled
{
  return self->_rampEnabled;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverAssetURL, 0);
  objc_storeStrong((id *)&self->_serverAssetMeasurement, 0);
  objc_storeStrong((id *)&self->_serverAssetAlgorithm, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
