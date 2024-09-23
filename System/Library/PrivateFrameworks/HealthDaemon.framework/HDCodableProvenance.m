@implementation HDCodableProvenance

- (void)setOriginBuild:(id)a3
{
  objc_storeStrong((id *)&self->_originBuild, a3);
}

- (void)setOriginProductType:(id)a3
{
  objc_storeStrong((id *)&self->_originProductType, a3);
}

- (void)setTimeZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneName, a3);
}

- (void)setSourceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUUID, a3);
}

- (void)setSourceVersion:(id)a3
{
  objc_storeStrong((id *)&self->_sourceVersion, a3);
}

- (void)setDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUID, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_originBuild)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_sourceUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_deviceUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_sourceVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_originProductType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_timeZoneName)
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
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_16:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_17:
  if (self->_contributorUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_originProductType, 0);
  objc_storeStrong((id *)&self->_originBuild, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_contributorUUID, 0);
}

- (id)decodedSourceUUID
{
  void *v2;

  if (self->_sourceUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)decodedDeviceUUID
{
  void *v2;

  if (self->_deviceUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSString)originProductType
{
  return self->_originProductType;
}

- (BOOL)hasOriginMajorVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (NSString)originBuild
{
  return self->_originBuild;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (BOOL)hasOriginBuild
{
  return self->_originBuild != 0;
}

- (BOOL)hasSourceUUID
{
  return self->_sourceUUID != 0;
}

- (BOOL)hasDeviceUUID
{
  return self->_deviceUUID != 0;
}

- (BOOL)hasSourceVersion
{
  return self->_sourceVersion != 0;
}

- (BOOL)hasOriginProductType
{
  return self->_originProductType != 0;
}

- (BOOL)hasTimeZoneName
{
  return self->_timeZoneName != 0;
}

- (void)setOriginMajorVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_originMajorVersion = a3;
}

- (void)setHasOriginMajorVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setOriginMinorVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_originMinorVersion = a3;
}

- (void)setHasOriginMinorVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOriginMinorVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setOriginPatchVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_originPatchVersion = a3;
}

- (void)setHasOriginPatchVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOriginPatchVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasContributorUUID
{
  return self->_contributorUUID != 0;
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
  v8.super_class = (Class)HDCodableProvenance;
  -[HDCodableProvenance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableProvenance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *originBuild;
  NSData *sourceUUID;
  NSData *deviceUUID;
  NSString *sourceVersion;
  NSString *originProductType;
  NSString *timeZoneName;
  char has;
  void *v12;
  NSData *contributorUUID;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  originBuild = self->_originBuild;
  if (originBuild)
    objc_msgSend(v3, "setObject:forKey:", originBuild, CFSTR("originBuild"));
  sourceUUID = self->_sourceUUID;
  if (sourceUUID)
    objc_msgSend(v4, "setObject:forKey:", sourceUUID, CFSTR("sourceUUID"));
  deviceUUID = self->_deviceUUID;
  if (deviceUUID)
    objc_msgSend(v4, "setObject:forKey:", deviceUUID, CFSTR("deviceUUID"));
  sourceVersion = self->_sourceVersion;
  if (sourceVersion)
    objc_msgSend(v4, "setObject:forKey:", sourceVersion, CFSTR("sourceVersion"));
  originProductType = self->_originProductType;
  if (originProductType)
    objc_msgSend(v4, "setObject:forKey:", originProductType, CFSTR("originProductType"));
  timeZoneName = self->_timeZoneName;
  if (timeZoneName)
    objc_msgSend(v4, "setObject:forKey:", timeZoneName, CFSTR("timeZoneName"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_originMajorVersion);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("originMajorVersion"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_originMinorVersion);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("originMinorVersion"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_originPatchVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("originPatchVersion"));

  }
LABEL_17:
  contributorUUID = self->_contributorUUID;
  if (contributorUUID)
    objc_msgSend(v4, "setObject:forKey:", contributorUUID, CFSTR("contributorUUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableProvenanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_originBuild)
  {
    objc_msgSend(v4, "setOriginBuild:");
    v4 = v6;
  }
  if (self->_sourceUUID)
  {
    objc_msgSend(v6, "setSourceUUID:");
    v4 = v6;
  }
  if (self->_deviceUUID)
  {
    objc_msgSend(v6, "setDeviceUUID:");
    v4 = v6;
  }
  if (self->_sourceVersion)
  {
    objc_msgSend(v6, "setSourceVersion:");
    v4 = v6;
  }
  if (self->_originProductType)
  {
    objc_msgSend(v6, "setOriginProductType:");
    v4 = v6;
  }
  if (self->_timeZoneName)
  {
    objc_msgSend(v6, "setTimeZoneName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_originMajorVersion;
    *((_BYTE *)v4 + 80) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 9) = self->_originMinorVersion;
  *((_BYTE *)v4 + 80) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 10) = self->_originPatchVersion;
    *((_BYTE *)v4 + 80) |= 4u;
  }
LABEL_17:
  if (self->_contributorUUID)
  {
    objc_msgSend(v6, "setContributorUUID:");
    v4 = v6;
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
  char has;
  uint64_t v19;
  void *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_originBuild, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSData copyWithZone:](self->_sourceUUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSData copyWithZone:](self->_deviceUUID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_sourceVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[NSString copyWithZone:](self->_originProductType, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_timeZoneName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 36) = self->_originMinorVersion;
    *(_BYTE *)(v5 + 80) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_originMajorVersion;
  *(_BYTE *)(v5 + 80) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_originPatchVersion;
    *(_BYTE *)(v5 + 80) |= 4u;
  }
LABEL_5:
  v19 = -[NSData copyWithZone:](self->_contributorUUID, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *originBuild;
  NSData *sourceUUID;
  NSData *deviceUUID;
  NSString *sourceVersion;
  NSString *originProductType;
  NSString *timeZoneName;
  NSData *contributorUUID;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  originBuild = self->_originBuild;
  if ((unint64_t)originBuild | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](originBuild, "isEqual:"))
      goto LABEL_31;
  }
  sourceUUID = self->_sourceUUID;
  if ((unint64_t)sourceUUID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](sourceUUID, "isEqual:"))
      goto LABEL_31;
  }
  deviceUUID = self->_deviceUUID;
  if ((unint64_t)deviceUUID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](deviceUUID, "isEqual:"))
      goto LABEL_31;
  }
  sourceVersion = self->_sourceVersion;
  if ((unint64_t)sourceVersion | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](sourceVersion, "isEqual:"))
      goto LABEL_31;
  }
  originProductType = self->_originProductType;
  if ((unint64_t)originProductType | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](originProductType, "isEqual:"))
      goto LABEL_31;
  }
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](timeZoneName, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_originMajorVersion != *((_DWORD *)v4 + 8))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_31:
    v12 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_originMinorVersion != *((_DWORD *)v4 + 9))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_originPatchVersion != *((_DWORD *)v4 + 10))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_31;
  }
  contributorUUID = self->_contributorUUID;
  if ((unint64_t)contributorUUID | *((_QWORD *)v4 + 1))
    v12 = -[NSData isEqual:](contributorUUID, "isEqual:");
  else
    v12 = 1;
LABEL_32:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_originBuild, "hash");
  v4 = -[NSData hash](self->_sourceUUID, "hash");
  v5 = -[NSData hash](self->_deviceUUID, "hash");
  v6 = -[NSString hash](self->_sourceVersion, "hash");
  v7 = -[NSString hash](self->_originProductType, "hash");
  v8 = -[NSString hash](self->_timeZoneName, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSData hash](self->_contributorUUID, "hash");
  }
  v9 = 2654435761 * self->_originMajorVersion;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v10 = 2654435761 * self->_originMinorVersion;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v11 = 2654435761 * self->_originPatchVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSData hash](self->_contributorUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  int *v6;

  v4 = (int *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableProvenance setOriginBuild:](self, "setOriginBuild:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCodableProvenance setSourceUUID:](self, "setSourceUUID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCodableProvenance setDeviceUUID:](self, "setDeviceUUID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[HDCodableProvenance setSourceVersion:](self, "setSourceVersion:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableProvenance setOriginProductType:](self, "setOriginProductType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[HDCodableProvenance setTimeZoneName:](self, "setTimeZoneName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 1) != 0)
  {
    self->_originMajorVersion = v4[8];
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 80);
    if ((v5 & 2) == 0)
    {
LABEL_15:
      if ((v5 & 4) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((v4[20] & 2) == 0)
  {
    goto LABEL_15;
  }
  self->_originMinorVersion = v4[9];
  *(_BYTE *)&self->_has |= 2u;
  if ((v4[20] & 4) != 0)
  {
LABEL_16:
    self->_originPatchVersion = v4[10];
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_17:
  if (*((_QWORD *)v4 + 1))
  {
    -[HDCodableProvenance setContributorUUID:](self, "setContributorUUID:");
    v4 = v6;
  }

}

- (NSData)sourceUUID
{
  return self->_sourceUUID;
}

- (NSData)deviceUUID
{
  return self->_deviceUUID;
}

- (int)originMajorVersion
{
  return self->_originMajorVersion;
}

- (int)originMinorVersion
{
  return self->_originMinorVersion;
}

- (int)originPatchVersion
{
  return self->_originPatchVersion;
}

- (NSData)contributorUUID
{
  return self->_contributorUUID;
}

- (void)setContributorUUID:(id)a3
{
  objc_storeStrong((id *)&self->_contributorUUID, a3);
}

@end
